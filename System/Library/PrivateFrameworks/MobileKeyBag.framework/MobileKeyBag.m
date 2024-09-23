uint64_t MKBSetDeviceConfigurations(const __CFData *a1, const __CFDictionary *a2)
{
  uint64_t v3;

  handleToUse(a2);
  if (a1)
  {
    CFDataGetBytePtr(a1);
    CFDataGetLength(a1);
  }
  v3 = aks_set_configuration();
  return convertAKSErrorToMKB(v3);
}

uint64_t MKBUserUnlockedSinceBoot(int a1)
{
  uint64_t result;
  uint64_t lock_state;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (!a1 && gSystemUnlockedSinceBoot)
    return 1;
  lock_state = aks_get_lock_state();
  if (convertAKSErrorToMKB(lock_state))
  {
    debuglog("MKBUserUnlockedSinceBoot", CFSTR("MKBUserUnlockedSinceBoot for user(%d) fails with error(%d), returning 0"), v4, v5, v6, v7, v8, v9, a1);
    return 0;
  }
  else
  {
    result = 0;
    if (!a1)
      gSystemUnlockedSinceBoot = 0;
  }
  return result;
}

uint64_t MKBDeviceFormattedForContentProtection()
{
  statfs v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  memset(&v1, 0, 512);
  if (statfs("/var", &v1) >= 0)
    return (v1.f_flags >> 7) & 1;
  else
    return 4294967290;
}

__CFDictionary *MKBDeviceGetGracePeriod(const __CFDictionary *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const __CFDictionary *v8;
  __CFDictionary *dict;
  const void *Value;
  const void *v11;
  CFTypeID v12;
  char v14;

  v1 = MKBGetDeviceConfigurations(a1);
  if (v1)
  {
    v8 = (const __CFDictionary *)v1;
    dict = create_dict();
    Value = CFDictionaryGetValue(v8, CFSTR("GracePeriod"));
    if (Value)
    {
      v11 = Value;
      v12 = CFGetTypeID(Value);
      if (v12 == CFNumberGetTypeID())
        CFDictionarySetValue(dict, CFSTR("GracePeriod"), v11);
    }
    CFRelease(v8);
  }
  else
  {
    debuglog("MKBDeviceGetGracePeriod", CFSTR("MKBGetDeviceConfigurations failed to return a dictionary"), v2, v3, v4, v5, v6, v7, v14);
    return 0;
  }
  return dict;
}

uint64_t MKBGetDeviceConfigurations(const __CFDictionary *a1)
{
  uint64_t configuration;
  char v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  handleToUse(a1);
  configuration = aks_get_configuration();
  v2 = convertAKSErrorToMKB(configuration);
  debuglog("MKBGetDeviceConfigurations", CFSTR("aks_get_configuration result: %d\n"), v3, v4, v5, v6, v7, v8, v2);
  return 0;
}

void debuglog(const char *a1, const __CFString *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  const __CFString *v11;
  const __CFString *v12;
  uint8_t buf[4];
  char *v14;
  char __str[1024];
  char __dst[1024];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  memcpy(__dst, "Error creating CFString", sizeof(__dst));
  if (!a1)
    a1 = "";
  v11 = CFStringCreateWithFormatAndArguments(0, 0, a2, &a9);
  if (v11)
  {
    v12 = v11;
    CFStringGetCString(v11, __dst, 1024, 0x8000100u);
    CFRelease(v12);
  }
  snprintf(__str, 0x400uLL, "%s: %s", a1, __dst);
  if (_log_func)
  {
    _log_func(__str);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v14 = __str;
    _os_log_impl(&dword_1B3FF7000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s\n", buf, 0xCu);
  }
}

__CFDictionary *MKBUserTypeDeviceMode(uint64_t a1, CFErrorRef *a2)
{
  __CFDictionary *dict;
  int hostmultiuserconfig;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const __CFString *v18;
  CFIndex v19;
  char v21;
  uint32_t v22;

  v22 = 0;
  dict = create_dict();
  hostmultiuserconfig = get_hostmultiuserconfig(&v22);
  v11 = hostmultiuserconfig;
  if (hostmultiuserconfig)
  {
    debuglog("MKBUserTypeDeviceMode", CFSTR("Failed to get multiuser_config flags from kernel with error:%d"), v5, v6, v7, v8, v9, v10, hostmultiuserconfig);
    if (v11 == 2)
      v18 = CFSTR("FAILED to MKBUserTypeDeviceMode, EPERM");
    else
      v18 = CFSTR("FAILED to MKBUserTypeDeviceMode, EINVAL");
    if (v11 == 2)
      v19 = 1;
    else
      v19 = 22;
    debuglog("MKBUserTypeDeviceMode", v18, v12, v13, v14, v15, v16, v17, v21);
  }
  else
  {
    if ((v22 & 0x80000000) != 0)
    {
      CFDictionarySetValue(dict, kMKBDeviceModeKey, kMKBDeviceModeSharedIPad);
      CFDictionarySetValue(dict, kMKBUserTypeKey, kMKBUserTypeEphemeral);
      return dict;
    }
    v19 = 0;
  }
  CFDictionarySetValue(dict, kMKBDeviceModeKey, kMKBDeviceModeSingleUser);
  CFDictionarySetValue(dict, kMKBUserTypeKey, kMKBUserTypePermanent);
  if (a2 && v11)
    *a2 = CFErrorCreate(0, (CFErrorDomain)*MEMORY[0x1E0C9AFD0], v19, 0);
  return dict;
}

void __handleToUse_block_invoke()
{
  int hostmultiuserconfig;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint32_t v7;
  uint32_t v8;

  v8 = 0;
  hostmultiuserconfig = get_hostmultiuserconfig(&v8);
  if (hostmultiuserconfig)
  {
    debuglog("handleToUse_block_invoke", CFSTR("failed to determine whether we are multi-user: 0x%x"), v1, v2, v3, v4, v5, v6, hostmultiuserconfig);
  }
  else if ((v8 & 0x80000000) != 0)
  {
    handleToUse_handle = -3;
    v7 = v8 & 0x3FFFFFFF;
    if (v7 != voucher_get_current_persona())
      handleToUse_handle = 0;
  }
  else
  {
    handleToUse_handle = 0;
  }
}

uint64_t get_hostmultiuserconfig(uint32_t *a1)
{
  host_t v2;
  uint64_t result;
  uint32_t multiuser_flags;

  multiuser_flags = 0;
  v2 = MEMORY[0x1B5E33E20]();
  result = host_get_multiuser_config_flags(v2, &multiuser_flags);
  if (a1)
  {
    if (!(_DWORD)result)
      *a1 = multiuser_flags;
  }
  return result;
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  uint64_t v0;
  uint64_t lock_state;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (gUserUnlockedSinceBoot)
    return 1;
  handleToUse(0);
  lock_state = aks_get_lock_state();
  v2 = convertAKSErrorToMKB(lock_state);
  if ((_DWORD)v2)
  {
    v0 = v2;
    debuglog("MKBDeviceUnlockedSinceBoot", CFSTR("MKBDeviceUnlockedSinceBoot fails with error(%d) for handle(%d) with AKS error(%d)"), v3, v4, v5, v6, v7, v8, v2);
  }
  else
  {
    v0 = 0;
    gUserUnlockedSinceBoot = 0;
  }
  return v0;
}

__CFDictionary *MKBGetDeviceLockStateInfo(const __CFDictionary *a1)
{
  const __CFDictionary *Int;
  __CFDictionary *dict;
  __CFDictionary *v3;
  void *v4;
  const void *v5;
  CFTypeID v6;
  uint64_t v7;
  const void *v8;
  const void *v9;
  const void *Value;
  _QWORD v12[8];
  _OWORD v13[4];
  __int16 v14;
  uint64_t v15;

  Int = a1;
  v15 = *MEMORY[0x1E0C80C00];
  v14 = 0;
  memset(v13, 0, sizeof(v13));
  if (_get_device_lock_state(a1, (uint64_t)v13))
    return 0;
  dict = create_dict();
  v3 = dict;
  if (dict)
  {
    set_longlongvalue_for_key(dict, CFSTR("ls"), DWORD1(v13[0]));
    set_longlongvalue_for_key(v3, CFSTR("state"), LODWORD(v13[0]));
    if (handleToUse(Int))
    {
      if (Int)
      {
        if (CFDictionaryContainsKey(Int, kMKBUserSessionIDKey))
          Int = (const __CFDictionary *)_getInt(Int, kMKBUserSessionIDKey);
        else
          Int = 0;
      }
      +[MKBKeyStoreDevice sharedService](MKBKeyStoreDevice, "sharedService");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "getLockStateForUser:", Int);
      v5 = (const void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        v6 = CFGetTypeID(v5);
        if (v6 == CFDictionaryGetTypeID())
        {
          v7 = 0;
          v12[0] = CFSTR("IsWipePending");
          v12[1] = CFSTR("sw");
          v12[2] = CFSTR("IsPermanentlyBlocked");
          v12[3] = CFSTR("pb");
          v12[4] = CFSTR("FailedPasscodeAttempts");
          v12[5] = CFSTR("fa");
          v12[6] = CFSTR("TimeUntilUnblockedSinceReferenceDate");
          v12[7] = CFSTR("boff");
          do
          {
            v8 = (const void *)v12[v7];
            if (CFDictionaryContainsKey((CFDictionaryRef)v5, v8))
            {
              v9 = (const void *)v12[v7 + 1];
              Value = CFDictionaryGetValue((CFDictionaryRef)v5, v8);
              CFDictionarySetValue(v3, v9, Value);
            }
            v7 += 2;
          }
          while (v7 != 8);
          CFRelease(v5);
        }
      }
    }
    else
    {
      set_longlongvalue_for_key(v3, CFSTR("boff"), *((uint64_t *)&v13[0] + 1));
      set_longlongvalue_for_key(v3, CFSTR("fa"), LODWORD(v13[1]));
      set_longlongvalue_for_key(v3, CFSTR("countdown"), *(uint64_t *)((char *)&v13[1] + 10));
    }
  }
  return v3;
}

void set_longlongvalue_for_key(__CFDictionary *a1, const void *a2, uint64_t a3)
{
  CFNumberRef v5;
  CFNumberRef v6;
  uint64_t valuePtr;

  valuePtr = a3;
  if (a1 && a2)
  {
    v5 = CFNumberCreate(0, kCFNumberLongLongType, &valuePtr);
    if (v5)
    {
      v6 = v5;
      CFDictionarySetValue(a1, a2, v5);
      CFRelease(v6);
    }
  }
}

uint64_t MKBGetDeviceLockState(const __CFDictionary *a1)
{
  uint64_t result;
  _OWORD v2[4];
  __int16 v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  memset(v2, 0, sizeof(v2));
  LODWORD(result) = _get_device_lock_state(a1, (uint64_t)v2);
  if ((_DWORD)result)
    return result;
  else
    return DWORD1(v2[0]);
}

uint64_t _get_device_lock_state(const __CFDictionary *a1, uint64_t a2)
{
  const __CFBoolean *Value;
  const __CFBoolean *v5;
  CFTypeID v6;
  _BOOL4 v7;
  const __CFNumber *v8;
  const __CFNumber *v9;
  CFTypeID v10;
  uint64_t device_state;
  int valuePtr;

  valuePtr = handleToUse(a1);
  if (!a2)
    return 0xFFFFFFFFLL;
  if (!a1)
  {
LABEL_13:
    device_state = aks_get_device_state();
    return convertAKSErrorToMKB(device_state);
  }
  Value = (const __CFBoolean *)CFDictionaryGetValue(a1, CFSTR("ExtendedDeviceLockState"));
  v7 = Value && (v5 = Value, v6 = CFGetTypeID(Value), v6 == CFBooleanGetTypeID()) && CFBooleanGetValue(v5) != 0;
  v8 = (const __CFNumber *)CFDictionaryGetValue(a1, kMKBUserSessionIDKey);
  if (v8)
  {
    v9 = v8;
    v10 = CFGetTypeID(v8);
    if (v10 == CFNumberGetTypeID())
    {
      if (CFNumberGetValue(v9, kCFNumberIntType, &valuePtr))
      {
        valuePtr = -valuePtr;
        goto LABEL_11;
      }
      return 0xFFFFFFFFLL;
    }
  }
LABEL_11:
  if (!v7)
    goto LABEL_13;
  device_state = aks_get_extended_device_state();
  return convertAKSErrorToMKB(device_state);
}

uint64_t handleToUse(const __CFDictionary *a1)
{
  int v2;

  v2 = 0;
  if (_get_userid_from_options(a1, &v2))
    return -v2;
  if (handleToUse_handleOnce != -1)
    dispatch_once(&handleToUse_handleOnce, &__block_literal_global_175);
  return handleToUse_handle;
}

uint64_t _get_userid_from_options(CFDictionaryRef theDict, _DWORD *a2)
{
  uint64_t result;
  const __CFNumber *v5;
  CFTypeID v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  int valuePtr;

  result = 0;
  if (theDict)
  {
    if (a2)
    {
      result = (uint64_t)CFDictionaryGetValue(theDict, CFSTR("DeviceHandle"));
      if (result)
      {
        v5 = (const __CFNumber *)result;
        v6 = CFGetTypeID((CFTypeRef)result);
        if (v6 == CFNumberGetTypeID())
        {
          valuePtr = 0;
          result = CFNumberGetValue(v5, kCFNumberIntType, &valuePtr);
          if ((_DWORD)result)
          {
            *a2 = valuePtr;
            return 1;
          }
        }
        else
        {
          debuglog("_get_userid_from_options", CFSTR("handle is of wrong type"), v7, v8, v9, v10, v11, v12, v13);
          return 0;
        }
      }
    }
  }
  return result;
}

uint64_t convertAKSErrorToMKB(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _DWORD v4[2];
  uint64_t v5;

  v1 = a1;
  v5 = *MEMORY[0x1E0C80C00];
  if ((int)a1 > -536363001)
  {
    switch(a1)
    {
      case 0xE007C00E:
        return 4294967283;
      case 0xE007C00F:
      case 0xE007C010:
      case 0xE007C011:
      case 0xE007C012:
      case 0xE007C016:
      case 0xE007C017:
        goto LABEL_20;
      case 0xE007C013:
        return 4294967276;
      case 0xE007C014:
        return 0;
      case 0xE007C015:
        return 4294967282;
      case 0xE007C018:
        return 4294967277;
      default:
        if ((_DWORD)a1 == -536363000)
          return 4294967282;
        if (!(_DWORD)a1)
          return v1;
        break;
    }
    goto LABEL_20;
  }
  v2 = 4294967294;
  if ((int)a1 <= -536870195)
  {
    switch((_DWORD)a1)
    {
      case 0xE00002C1:
        return v2;
      case 0xE00002C2:
        return 4294967279;
      case 0xE00002C9:
        return 4294967287;
    }
LABEL_20:
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v4[0] = 67109120;
      v4[1] = v1;
      _os_log_impl(&dword_1B3FF7000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Unexpected AppleKeyStore error: %d\n", (uint8_t *)v4, 8u);
    }
    return 0xFFFFFFFFLL;
  }
  if ((int)a1 > -536870175)
  {
    if ((_DWORD)a1 == -536870174)
      return v2;
    if ((_DWORD)a1 == -536870160)
      return 4294967288;
    goto LABEL_20;
  }
  if ((_DWORD)a1 == -536870194)
    return 4294967293;
  if ((_DWORD)a1 != -536870184)
    goto LABEL_20;
  return 4294967283;
}

CFMutableDictionaryRef create_dict()
{
  CFMutableDictionaryRef result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char vars0;

  result = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if (!result)
  {
    debuglog("create_dict", CFSTR("Out of Memory!!! Dying!...so...cold...."), v1, v2, v3, v4, v5, v6, vars0);
    exit(-1);
  }
  return result;
}

void aksNotificationCB(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  void (*v8)(void);
  char v9;

  if (!a1)
  {
    v9 = 0;
LABEL_8:
    debuglog("aksNotificationCB", CFSTR("invalid context %d %d"), a3, a4, a5, a6, a7, a8, v9);
    return;
  }
  if (*(_DWORD *)(a1 + 20) != 1918985081)
  {
    v9 = 1;
    goto LABEL_8;
  }
  if ((_DWORD)a3 == -469774321)
  {
    v8 = *(void (**)(void))(*(_QWORD *)(a1 + 8) + 16);
    goto LABEL_11;
  }
  if ((_DWORD)a3 == -469774323)
  {
    v8 = *(void (**)(void))(*(_QWORD *)(a1 + 8) + 16);
LABEL_11:
    v8();
  }
}

uint64_t storeBlastableBytes(unsigned int a1, const void *a2, size_t a3)
{
  mach_port_t v5;
  const __CFDictionary *v6;
  io_service_t MatchingService;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  io_object_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char outputStruct;
  uint64_t input;
  io_connect_t connect;

  connect = 0;
  input = a1;
  v5 = *MEMORY[0x1E0CBBAA8];
  v6 = IOServiceMatching("AppleEffaceableStorage");
  MatchingService = IOServiceGetMatchingService(v5, v6);
  v14 = MatchingService;
  if (MatchingService)
  {
    v15 = IOServiceOpen(MatchingService, *MEMORY[0x1E0C83DA0], 0, &connect);
    if ((_DWORD)v15)
    {
      v29 = v15;
      debuglog("storeBlastableBytes", CFSTR("Unable to open service: 0x%08x"), v16, v17, v18, v19, v20, v21, v15);
    }
    else
    {
      v22 = IOConnectCallMethod(connect, 6u, &input, 1u, a2, a3, 0, 0, 0, 0);
      v29 = v22;
      if ((_DWORD)v22)
        debuglog("storeBlastableBytes", CFSTR("Can't store blastable bytes: %08x"), v23, v24, v25, v26, v27, v28, v22);
    }
  }
  else
  {
    debuglog("storeBlastableBytes", CFSTR("Can't find EffaceableStorage kext!"), v8, v9, v10, v11, v12, v13, outputStruct);
    v29 = 3758097084;
  }
  if (connect)
    IOServiceClose(connect);
  if (v14)
    IOObjectRelease(v14);
  return v29;
}

uint64_t loadBlastableBytes(unsigned int a1, void *a2, size_t *a3)
{
  mach_port_t v5;
  const __CFDictionary *v6;
  io_service_t MatchingService;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  io_object_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char outputStruct;
  uint32_t outputCnt;
  uint64_t input;
  uint64_t output;
  io_connect_t connect;

  connect = 0;
  input = a1;
  output = 0;
  outputCnt = 1;
  v5 = *MEMORY[0x1E0CBBAA8];
  v6 = IOServiceMatching("AppleEffaceableStorage");
  MatchingService = IOServiceGetMatchingService(v5, v6);
  v14 = MatchingService;
  if (MatchingService)
  {
    v15 = IOServiceOpen(MatchingService, *MEMORY[0x1E0C83DA0], 0, &connect);
    if ((_DWORD)v15)
    {
      v29 = v15;
      debuglog("loadBlastableBytes", CFSTR("Unable to open service: 0x%08x"), v16, v17, v18, v19, v20, v21, v15);
    }
    else
    {
      v22 = IOConnectCallMethod(connect, 5u, &input, 1u, 0, 0, &output, &outputCnt, a2, a3);
      v29 = v22;
      if ((_DWORD)v22)
        debuglog("loadBlastableBytes", CFSTR("Can't load blastable bytes: %08x"), v23, v24, v25, v26, v27, v28, v22);
    }
  }
  else
  {
    debuglog("loadBlastableBytes", CFSTR("Can't find EffaceableStorage kext!"), v8, v9, v10, v11, v12, v13, outputStruct);
    v29 = 3758097084;
  }
  if (connect)
    IOServiceClose(connect);
  if (v14)
    IOObjectRelease(v14);
  return v29;
}

uint64_t effaceBlastableBytes(unsigned int a1)
{
  mach_port_t v2;
  const __CFDictionary *v3;
  io_service_t MatchingService;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  io_object_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char outputStruct;
  uint32_t outputCnt;
  uint64_t input;
  uint64_t output;
  io_connect_t connect;
  size_t v33;
  _BYTE v34[1024];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  bzero(v34, 0x400uLL);
  v33 = 1024;
  connect = 0;
  input = a1;
  output = 0;
  outputCnt = 1;
  v2 = *MEMORY[0x1E0CBBAA8];
  v3 = IOServiceMatching("AppleEffaceableStorage");
  MatchingService = IOServiceGetMatchingService(v2, v3);
  v11 = MatchingService;
  if (MatchingService)
  {
    v12 = IOServiceOpen(MatchingService, *MEMORY[0x1E0C83DA0], 0, &connect);
    if ((_DWORD)v12)
    {
      v19 = v12;
      debuglog("effaceBlastableBytes", CFSTR("Unable to open service: 0x%08x"), v13, v14, v15, v16, v17, v18, v12);
    }
    else
    {
      v19 = IOConnectCallMethod(connect, 5u, &input, 1u, 0, 0, &output, &outputCnt, v34, &v33);
      if (!(_DWORD)v19)
      {
        v20 = IOConnectCallMethod(connect, 7u, &input, 1u, 0, 0, &output, &outputCnt, 0, 0);
        v19 = v20;
        if ((_DWORD)v20)
          debuglog("effaceBlastableBytes", CFSTR("efface failed: 0x%x"), v21, v22, v23, v24, v25, v26, v20);
      }
    }
  }
  else
  {
    debuglog("effaceBlastableBytes", CFSTR("Can't find EffaceableStorage kext!"), v5, v6, v7, v8, v9, v10, outputStruct);
    v19 = 3758097084;
  }
  if (connect)
    IOServiceClose(connect);
  if (v11)
    IOObjectRelease(v11);
  return v19;
}

uint64_t libkeybaglog(uint64_t result, uint64_t a2)
{
  if (_logFunction)
    return _logFunction(result, a2);
  return result;
}

uint64_t _libkeybaglog(uint64_t result, uint64_t a2)
{
  uint64_t (*v2)(uint64_t, uint64_t);

  v2 = _logFunction;
  if (_logFunction)
  {
    if (_logFunction_v)
      v2 = (uint64_t (*)(uint64_t, uint64_t))_logFunction_v;
    return v2(result, a2);
  }
  return result;
}

uint64_t (*KBSetLogger(uint64_t (*result)(_QWORD, _QWORD)))(_QWORD, _QWORD)
{
  _logFunction = result;
  return result;
}

uint64_t KBSetLogger_v(uint64_t result)
{
  _logFunction_v = result;
  return result;
}

const __CFDictionary *HealthPlistGetBuild(const __CFDictionary *result)
{
  if (result)
    return (const __CFDictionary *)CFDictionaryGetValue(result, CFSTR("_DSEUN"));
  return result;
}

uint64_t HealthPlistSetBuild(CFMutableDictionaryRef theDict, void *value)
{
  uint64_t result;

  result = 0xFFFFFFFFLL;
  if (theDict)
  {
    if (value)
    {
      CFDictionarySetValue(theDict, CFSTR("_DSEUN"), value);
      return 0;
    }
  }
  return result;
}

const __CFDictionary *HealthPlistGetFailed(const __CFDictionary *result)
{
  const __CFNumber *v1;
  CFTypeID v2;
  uint64_t valuePtr;

  valuePtr = 0;
  if (result)
  {
    result = (const __CFDictionary *)CFDictionaryGetValue(result, CFSTR("_DFAIL"));
    if (result)
    {
      v1 = result;
      v2 = CFGetTypeID(result);
      if (v2 == CFNumberGetTypeID())
      {
        CFNumberGetValue(v1, kCFNumberSInt64Type, &valuePtr);
        return (const __CFDictionary *)valuePtr;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t HealthPlistSetFailed(__CFDictionary *a1, uint64_t a2)
{
  CFNumberRef v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v11;
  uint64_t valuePtr;

  valuePtr = a2;
  if (!a1)
    return 0xFFFFFFFFLL;
  v3 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberSInt64Type, &valuePtr);
  if (!v3)
  {
    debuglog("HealthPlistSetFailed", CFSTR("unable to allocate"), v4, v5, v6, v7, v8, v9, v11);
    return 0xFFFFFFFFLL;
  }
  CFDictionarySetValue(a1, CFSTR("_DFAIL"), v3);
  return 0;
}

uint64_t HealthPlistSetTTR(CFMutableDictionaryRef theDict, uint64_t a2)
{
  CFNumberRef v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  CFNumberRef v10;
  char v12;
  uint64_t valuePtr;

  valuePtr = a2;
  if (!theDict)
    return 0xFFFFFFFFLL;
  if (a2 < 1)
  {
    CFDictionaryRemoveValue(theDict, CFSTR("_DTTR"));
    return 0;
  }
  v3 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberSInt64Type, &valuePtr);
  if (!v3)
  {
    debuglog("HealthPlistSetTTR", CFSTR("unable to allocate"), v4, v5, v6, v7, v8, v9, v12);
    return 0xFFFFFFFFLL;
  }
  v10 = v3;
  CFDictionarySetValue(theDict, CFSTR("_DTTR"), v3);
  CFRelease(v10);
  return 0;
}

const __CFDictionary *HealthPlistGetTTR(const __CFDictionary *result)
{
  if (result)
    return (const __CFDictionary *)CFDictionaryGetValue(result, CFSTR("_DTTR"));
  return result;
}

uint64_t HealthPlistConsumeTTR(CFDictionaryRef theDict, _QWORD *a2)
{
  uint64_t result;
  const __CFNumber *Value;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t valuePtr;

  valuePtr = 0;
  result = 0xFFFFFFFFLL;
  if (theDict && a2)
  {
    Value = (const __CFNumber *)CFDictionaryGetValue(theDict, CFSTR("_DTTR"));
    if (Value)
    {
      if (CFNumberGetValue(Value, kCFNumberSInt64Type, &valuePtr))
      {
        CFDictionaryRemoveValue(theDict, CFSTR("_DTTR"));
        result = 0;
        *a2 = valuePtr;
        return result;
      }
      debuglog("HealthPlistConsumeTTR", CFSTR("invalid ttr format"), v6, v7, v8, v9, v10, v11, v12);
    }
    return 0xFFFFFFFFLL;
  }
  return result;
}

const __CFDictionary *HealthPlistGetVersion(const __CFDictionary *result)
{
  if (result)
    return (const __CFDictionary *)CFDictionaryGetValue(result, CFSTR("_DVERS"));
  return result;
}

uint64_t HealthPlistSetVersion(__CFDictionary *a1, int a2)
{
  CFNumberRef v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v11;
  int valuePtr;

  if (!a1)
    return 0xFFFFFFFFLL;
  valuePtr = a2;
  v3 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberSInt32Type, &valuePtr);
  if (v3)
  {
    CFDictionarySetValue(a1, CFSTR("_DVERS"), v3);
    return 0;
  }
  else
  {
    debuglog("HealthPlistSetVersion", CFSTR("cant allocate mem"), v4, v5, v6, v7, v8, v9, v11);
    return 0xFFFFFFFFLL;
  }
}

uint64_t HealthPlistSetCurrentVersion(__CFDictionary *a1)
{
  return HealthPlistSetVersion(a1, 7);
}

const __CFDictionary *HealthPlistGetTime(const __CFDictionary *result)
{
  const __CFNumber *v1;
  CFTypeID v2;
  uint64_t valuePtr;

  valuePtr = 0;
  if (result)
  {
    result = (const __CFDictionary *)CFDictionaryGetValue(result, CFSTR("_DTIME"));
    if (result)
    {
      v1 = result;
      v2 = CFGetTypeID(result);
      if (v2 == CFNumberGetTypeID())
      {
        CFNumberGetValue(v1, kCFNumberSInt64Type, &valuePtr);
        return (const __CFDictionary *)valuePtr;
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t HealthPlistSetTime(__CFDictionary *a1, uint64_t a2)
{
  CFNumberRef v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v11;
  uint64_t valuePtr;

  if (!a1)
    return 0xFFFFFFFFLL;
  valuePtr = a2;
  v3 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberSInt64Type, &valuePtr);
  if (v3)
  {
    CFDictionarySetValue(a1, CFSTR("_DTIME"), v3);
    return 0;
  }
  else
  {
    debuglog("HealthPlistSetTime", CFSTR("cant allocate mem"), v4, v5, v6, v7, v8, v9, v11);
    return 0xFFFFFFFFLL;
  }
}

const __CFDictionary *HealthPlistGetData(const __CFDictionary *result)
{
  if (result)
    return (const __CFDictionary *)CFDictionaryGetValue(result, CFSTR("_DDATA"));
  return result;
}

uint64_t HealthPlistSetData(__CFDictionary *a1, void *value)
{
  if (!a1)
    return 0xFFFFFFFFLL;
  CFDictionarySetValue(a1, CFSTR("_DDATA"), value);
  return 0;
}

uint64_t HealthPlistAddToData(const __CFDictionary *a1, uint64_t a2)
{
  const __CFAllocator *v3;
  CFNumberRef v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  CFNumberRef v11;
  __CFArray *Value;
  __CFArray *Mutable;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v21;
  uint64_t valuePtr;

  valuePtr = a2;
  if (!a1)
    return 0xFFFFFFFFLL;
  v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v4 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberSInt64Type, &valuePtr);
  if (!v4)
  {
    debuglog("HealthPlistAddToData", CFSTR("unable to allocate"), v5, v6, v7, v8, v9, v10, v21);
    return 0xFFFFFFFFLL;
  }
  v11 = v4;
  Value = (__CFArray *)CFDictionaryGetValue(a1, CFSTR("_DDATA"));
  if (Value)
  {
    Mutable = Value;
    CFRetain(Value);
  }
  else
  {
    Mutable = CFArrayCreateMutable(v3, 0, MEMORY[0x1E0C9B378]);
  }
  CFArrayAppendValue(Mutable, v11);
  if (CFArrayGetCount(Mutable) >= 15)
  {
    debuglog("HealthPlistAddToData", CFSTR("at capacity, forgetting oldest data entry"), v14, v15, v16, v17, v18, v19, v21);
    CFArrayRemoveValueAtIndex(Mutable, 0);
  }
  CFDictionarySetValue(a1, CFSTR("_DDATA"), Mutable);
  CFRelease(v11);
  if (Mutable)
    CFRelease(Mutable);
  return 0;
}

const char *_HealthPlistGetPlistPath()
{
  return "/var/root/.mkb_seshat_health";
}

const __CFDictionary *HealthPlistCopyOrCreateNew()
{
  const __CFDictionary *binary_dict;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const __CFDictionary *Mutable;
  const __CFNumber *Value;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const __CFNumber *v15;
  CFTypeID v16;
  const __CFNumber *v17;
  const __CFNumber *v18;
  CFTypeID v19;
  __CFArray *v20;
  CFMutableArrayRef MutableCopy;
  CFTypeID v22;
  CFIndex v23;
  const void *ValueAtIndex;
  CFTypeID v25;
  const __CFNumber *v26;
  const __CFNumber *v27;
  CFTypeID v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const void *v35;
  CFTypeID v36;
  const __CFNumber *v37;
  const __CFNumber *v38;
  CFTypeID v39;
  char v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  const __CFString *v54;
  const __CFString *v55;
  char v56;
  uint64_t v57;
  uint64_t v58;
  int valuePtr;

  binary_dict = (const __CFDictionary *)load_binary_dict("/var/root/.mkb_seshat_health");
  if (binary_dict)
  {
    Mutable = binary_dict;
    valuePtr = 0;
    Value = (const __CFNumber *)CFDictionaryGetValue(binary_dict, CFSTR("_DVERS"));
    if (!Value)
    {
      v54 = CFSTR("no version");
      goto LABEL_34;
    }
    v15 = Value;
    v16 = CFGetTypeID(Value);
    if (v16 == CFNumberGetTypeID())
    {
      v58 = 0;
      if (CFNumberGetValue(v15, kCFNumberSInt32Type, &valuePtr))
      {
        if (valuePtr != 7)
        {
          debuglog("validate_health_plist", CFSTR("non-current version %d"), v9, v10, v11, v12, v13, v14, valuePtr);
          goto LABEL_28;
        }
        v17 = (const __CFNumber *)CFDictionaryGetValue(Mutable, CFSTR("_DTIME"));
        if (v17)
        {
          v18 = v17;
          v19 = CFGetTypeID(v17);
          if (v19 != CFNumberGetTypeID())
          {
            v54 = CFSTR("time stamp is of wrong type");
            goto LABEL_34;
          }
          if (!CFNumberGetValue(v18, kCFNumberLongType, &v58))
          {
            v54 = CFSTR("invalid timestamp");
            goto LABEL_34;
          }
        }
        v20 = (__CFArray *)CFDictionaryGetValue(Mutable, CFSTR("_DDATA"));
        MutableCopy = v20;
        if (!v20)
        {
LABEL_17:
          v26 = (const __CFNumber *)CFDictionaryGetValue(Mutable, CFSTR("_DFAIL"));
          if (!v26)
            goto LABEL_20;
          v27 = v26;
          v57 = 0;
          v28 = CFGetTypeID(v26);
          if (v28 != CFNumberGetTypeID())
          {
            v55 = CFSTR("fail indicator is of wrong type");
            goto LABEL_47;
          }
          if (!CFNumberGetValue(v27, kCFNumberLongType, &v57))
          {
            v55 = CFSTR("invalid fail indicator");
          }
          else
          {
LABEL_20:
            v35 = CFDictionaryGetValue(Mutable, CFSTR("_DSEUN"));
            if (v35 && (v36 = CFGetTypeID(v35), v36 != CFStringGetTypeID()))
            {
              v55 = CFSTR("build is of wrong type");
            }
            else
            {
              v37 = (const __CFNumber *)CFDictionaryGetValue(Mutable, CFSTR("_DTTR"));
              if (!v37)
                goto LABEL_25;
              v38 = v37;
              v39 = CFGetTypeID(v37);
              if (v39 == CFNumberGetTypeID())
              {
                if (CFNumberGetValue(v38, kCFNumberSInt64Type, &v58))
                {
LABEL_25:
                  v40 = 1;
                  if (!MutableCopy)
                    goto LABEL_27;
                  goto LABEL_26;
                }
                v55 = CFSTR("invalid ttr timestamp");
              }
              else
              {
                v55 = CFSTR("ttr time stamp is of wrong type");
              }
            }
          }
LABEL_47:
          debuglog("validate_health_plist", v55, v29, v30, v31, v32, v33, v34, v56);
          v40 = 0;
          if (!MutableCopy)
          {
LABEL_27:
            if ((v40 & 1) != 0)
              goto LABEL_30;
            goto LABEL_28;
          }
LABEL_26:
          CFRelease(MutableCopy);
          goto LABEL_27;
        }
        v22 = CFGetTypeID(v20);
        if (v22 == CFArrayGetTypeID())
        {
          if (CFArrayGetCount(MutableCopy) >= 1)
          {
            v23 = 0;
            while (1)
            {
              ValueAtIndex = CFArrayGetValueAtIndex(MutableCopy, v23);
              if (!ValueAtIndex)
                break;
              v25 = CFGetTypeID(ValueAtIndex);
              if (v25 != CFNumberGetTypeID())
                break;
              if (CFArrayGetCount(MutableCopy) <= ++v23)
                goto LABEL_16;
            }
            v54 = CFSTR("data inconsistent");
            goto LABEL_34;
          }
LABEL_16:
          MutableCopy = CFArrayCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MutableCopy);
          CFDictionarySetValue(Mutable, CFSTR("_DDATA"), MutableCopy);
          goto LABEL_17;
        }
        v54 = CFSTR("data is of wrong type");
      }
      else
      {
        v54 = CFSTR("invalid version format");
      }
    }
    else
    {
      v54 = CFSTR("version is of wrong type");
    }
LABEL_34:
    debuglog("validate_health_plist", v54, v9, v10, v11, v12, v13, v14, v56);
LABEL_28:
    CFRelease(Mutable);
  }
  debuglog("HealthPlistCopyOrCreateNew", CFSTR("health plist doesnt exist or wrong version, creating new one"), v1, v2, v3, v4, v5, v6, v56);
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if (!Mutable)
  {
    debuglog("HealthPlistCopyOrCreateNew", CFSTR("Can't create dict"), v41, v42, v43, v44, v45, v46, v56);
    return Mutable;
  }
LABEL_30:
  if (HealthPlistSetVersion(Mutable, 7))
  {
    debuglog("HealthPlistCopyOrCreateNew", CFSTR("cant set version"), v47, v48, v49, v50, v51, v52, v56);
    CFRelease(Mutable);
    return 0;
  }
  return Mutable;
}

uint64_t HealthPlistSerialize(const void *a1)
{
  if (store_binary_dict(a1, "/var/root/.mkb_seshat_health"))
    return 0xFFFFFFFFLL;
  else
    return 0;
}

uint64_t HealthPlistTest()
{
  const __CFDictionary *New;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const __CFDictionary *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const __CFDictionary *v14;
  __CFDictionary *plist_with_version;
  const __CFDictionary *v16;
  __CFDictionary *v17;
  const __CFDictionary *v18;
  __CFDictionary *v19;
  const __CFDictionary *v20;
  const __CFNumber *Value;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const __CFNumber *v28;
  __CFDictionary *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const __CFDictionary *v36;
  __CFDictionary *v37;
  const __CFDictionary *v38;
  const __CFArray *v39;
  __CFDictionary *v40;
  uint64_t i;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  const __CFDictionary *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  const __CFArray *v55;
  const __CFArray *v56;
  __CFDictionary *v57;
  const __CFDictionary *v58;
  const __CFDictionary *Time;
  __CFDictionary *v60;
  const __CFDictionary *v61;
  const __CFString *v62;
  uint64_t v63;
  __CFDictionary *v64;
  const __CFDictionary *v65;
  __CFDictionary *v66;
  time_t v67;
  time_t v68;
  const __CFDictionary *v69;
  const __CFString *v71;
  const __CFString *v72;
  const __CFString *v73;
  const __CFString *v74;
  const __CFString *v75;
  uint64_t v76;
  int valuePtr;

  unlink("/var/root/.mkb_seshat_health");
  New = HealthPlistCopyOrCreateNew();
  if (!New)
    goto LABEL_88;
  v7 = New;
  if (CFDictionaryGetCount(New) != 1)
    goto LABEL_89;
  if (store_binary_dict(v7, "/var/root/.mkb_seshat_health"))
    goto LABEL_90;
  CFRelease(v7);
  v14 = HealthPlistCopyOrCreateNew();
  if (!v14)
  {
LABEL_88:
    v72 = CFSTR("failed to copy health plist");
LABEL_95:
    debuglog("HealthPlistTest", v72, v1, v2, v3, v4, v5, v6, v76);
    return 0xFFFFFFFFLL;
  }
  v7 = v14;
  if (CFDictionaryGetCount(v14) != 1)
  {
LABEL_89:
    debuglog("HealthPlistTest", CFSTR("unexpected contents"), v8, v9, v10, v11, v12, v13, v76);
    goto LABEL_90;
  }
  CFRelease(v7);
  plist_with_version = _create_plist_with_version(8);
  if (!plist_with_version)
  {
LABEL_94:
    v72 = CFSTR("cant create dict");
    goto LABEL_95;
  }
  v7 = plist_with_version;
  if (store_binary_dict(plist_with_version, "/var/root/.mkb_seshat_health"))
  {
LABEL_90:
    v28 = 0;
    goto LABEL_56;
  }
  CFRelease(v7);
  v16 = HealthPlistCopyOrCreateNew();
  if (!v16)
    goto LABEL_88;
  v7 = v16;
  if (CFDictionaryGetCount(v16) != 1)
    goto LABEL_89;
  CFRelease(v7);
  v17 = _create_plist_with_version(6);
  if (!v17)
    goto LABEL_94;
  v7 = v17;
  if (store_binary_dict(v17, "/var/root/.mkb_seshat_health"))
    goto LABEL_90;
  CFRelease(v7);
  v18 = HealthPlistCopyOrCreateNew();
  if (!v18)
    goto LABEL_88;
  v7 = v18;
  if (CFDictionaryGetCount(v18) != 1)
    goto LABEL_89;
  CFRelease(v7);
  v19 = _create_plist_with_version(7);
  if (!v19)
    goto LABEL_94;
  v7 = v19;
  if (store_binary_dict(v19, "/var/root/.mkb_seshat_health"))
    goto LABEL_90;
  CFRelease(v7);
  v20 = HealthPlistCopyOrCreateNew();
  if (!v20)
    goto LABEL_88;
  v7 = v20;
  if (CFDictionaryGetCount(v20) != 1)
    goto LABEL_89;
  Value = (const __CFNumber *)CFDictionaryGetValue(v7, CFSTR("_DVERS"));
  v28 = Value;
  if (!Value)
  {
    v73 = CFSTR("missing version");
    goto LABEL_110;
  }
  valuePtr = 0;
  if (!CFNumberGetValue(Value, kCFNumberSInt32Type, &valuePtr))
  {
    v73 = CFSTR("cant get version");
    goto LABEL_110;
  }
  if (valuePtr != 7)
  {
    v73 = CFSTR("version is invalid");
    goto LABEL_110;
  }
  CFRelease(v7);
  v29 = _create_plist_with_version(7);
  if (!v29)
    goto LABEL_96;
  v7 = v29;
  CFDictionarySetValue(v29, CFSTR("_DSEUN"), CFSTR("15A123"));
  if (store_binary_dict(v7, "/var/root/.mkb_seshat_health"))
    goto LABEL_56;
  CFRelease(v7);
  v36 = HealthPlistCopyOrCreateNew();
  if (!v36)
  {
LABEL_102:
    v75 = CFSTR("failed to copy health plist");
    goto LABEL_103;
  }
  v7 = v36;
  if (CFDictionaryGetCount(v36) != 2)
  {
    v73 = CFSTR("unexpected contents");
    goto LABEL_110;
  }
  CFRelease(v7);
  v37 = _create_plist_with_version(7);
  if (!v37)
  {
LABEL_96:
    v75 = CFSTR("cant create dict");
LABEL_103:
    debuglog("HealthPlistTest", v75, v30, v31, v32, v33, v34, v35, v76);
    v63 = 0xFFFFFFFFLL;
    goto LABEL_82;
  }
  v7 = v37;
  if (HealthPlistAddToData(v37, 1) || HealthPlistAddToData(v7, 2))
  {
LABEL_97:
    v73 = CFSTR("cant add");
    goto LABEL_110;
  }
  if (store_binary_dict(v7, "/var/root/.mkb_seshat_health"))
    goto LABEL_56;
  CFRelease(v7);
  v38 = HealthPlistCopyOrCreateNew();
  if (!v38)
    goto LABEL_102;
  v7 = v38;
  v39 = (const __CFArray *)CFDictionaryGetValue(v38, CFSTR("_DDATA"));
  if (!v39)
  {
LABEL_92:
    v73 = CFSTR("failed to get data");
LABEL_110:
    debuglog("HealthPlistTest", v73, v22, v23, v24, v25, v26, v27, v76);
    goto LABEL_56;
  }
  if (CFArrayGetCount(v39) != 2)
  {
LABEL_98:
    v73 = CFSTR("invalid count");
    goto LABEL_110;
  }
  CFRelease(v7);
  v40 = _create_plist_with_version(7);
  if (!v40)
    goto LABEL_96;
  v7 = v40;
  for (i = 0; i != 28; ++i)
  {
    if (HealthPlistAddToData(v7, i))
    {
      v71 = CFSTR("cant add");
LABEL_85:
      debuglog("HealthPlistTest", v71, v42, v43, v44, v45, v46, v47, v76);
LABEL_86:
      if (v7)
        goto LABEL_56;
LABEL_57:
      v63 = 0xFFFFFFFFLL;
      if (v28)
        goto LABEL_82;
      return v63;
    }
  }
  if (store_binary_dict(v7, "/var/root/.mkb_seshat_health"))
    goto LABEL_86;
  CFRelease(v7);
  v48 = HealthPlistCopyOrCreateNew();
  if (!v48)
    goto LABEL_93;
  v7 = v48;
  v55 = (const __CFArray *)CFDictionaryGetValue(v48, CFSTR("_DDATA"));
  if (!v55)
    goto LABEL_92;
  v56 = v55;
  if (CFArrayGetCount(v55) != 14)
    goto LABEL_98;
  if (HealthPlistAddToData(v7, 10))
    goto LABEL_97;
  if (CFArrayGetCount(v56) != 14)
    goto LABEL_98;
  CFRelease(v7);
  v57 = _create_plist_with_version(7);
  if (!v57)
    goto LABEL_99;
  v7 = v57;
  if (HealthPlistGetTime(v57))
  {
    v73 = CFSTR("no time");
    goto LABEL_110;
  }
  if (HealthPlistSetTime(v7, 123))
    goto LABEL_104;
  if (store_binary_dict(v7, "/var/root/.mkb_seshat_health"))
    goto LABEL_56;
  CFRelease(v7);
  v58 = HealthPlistCopyOrCreateNew();
  if (!v58)
  {
LABEL_93:
    v74 = CFSTR("failed to copy health plist");
LABEL_100:
    debuglog("HealthPlistTest", v74, v49, v50, v51, v52, v53, v54, v76);
    goto LABEL_57;
  }
  v7 = v58;
  Time = HealthPlistGetTime(v58);
  if (Time != (const __CFDictionary *)123)
    goto LABEL_91;
  if (HealthPlistSetTime(v7, 1123))
  {
LABEL_104:
    v73 = CFSTR("cant set time");
    goto LABEL_110;
  }
  Time = HealthPlistGetTime(v7);
  if (Time != (const __CFDictionary *)1123)
  {
LABEL_91:
    if (Time)
      goto LABEL_56;
    goto LABEL_92;
  }
  CFRelease(v7);
  v60 = _create_plist_with_version(7);
  if (!v60)
    goto LABEL_99;
  v7 = v60;
  if (CFDictionaryGetValue(v60, CFSTR("_DSEUN"))
    || (CFDictionarySetValue(v7, CFSTR("_DSEUN"), CFSTR("12A123")),
        CFDictionarySetValue(v7, CFSTR("_DSEUN"), CFSTR("12A124")),
        store_binary_dict(v7, "/var/root/.mkb_seshat_health")))
  {
LABEL_56:
    CFRelease(v7);
    goto LABEL_57;
  }
  CFRelease(v7);
  v61 = HealthPlistCopyOrCreateNew();
  if (!v61)
    goto LABEL_93;
  v7 = v61;
  v62 = (const __CFString *)CFDictionaryGetValue(v61, CFSTR("_DSEUN"));
  if (!v62 || CFStringCompare(v62, CFSTR("12A124"), 0))
    goto LABEL_56;
  CFRelease(v7);
  v64 = _create_plist_with_version(7);
  if (!v64)
  {
LABEL_99:
    v74 = CFSTR("cant create dict");
    goto LABEL_100;
  }
  v7 = v64;
  if (HealthPlistGetFailed(v64)
    || HealthPlistSetFailed(v7, -1)
    || HealthPlistGetFailed(v7) != (const __CFDictionary *)-1
    || store_binary_dict(v7, "/var/root/.mkb_seshat_health"))
  {
    goto LABEL_56;
  }
  CFRelease(v7);
  v65 = HealthPlistCopyOrCreateNew();
  if (!v65)
    goto LABEL_93;
  v7 = v65;
  if (HealthPlistGetFailed(v65) != (const __CFDictionary *)-1)
    goto LABEL_56;
  CFRelease(v7);
  v76 = 0;
  v66 = _create_plist_with_version(7);
  v7 = v66;
  if (!v66)
    goto LABEL_112;
  if (CFDictionaryGetValue(v66, CFSTR("_DTTR")))
    goto LABEL_101;
  CFDictionaryRemoveValue(v7, CFSTR("_DTTR"));
  if (CFDictionaryGetValue(v7, CFSTR("_DTTR")))
    goto LABEL_101;
  v67 = time(0);
  if (HealthPlistSetTTR(v7, v67))
    goto LABEL_111;
  if (!CFDictionaryGetValue(v7, CFSTR("_DTTR")))
    goto LABEL_101;
  if (HealthPlistConsumeTTR(v7, &v76))
  {
LABEL_113:
    v71 = CFSTR("failed to consume TTR entry");
    goto LABEL_85;
  }
  if (v76 < 1)
  {
LABEL_114:
    v71 = CFSTR("empty time");
    goto LABEL_85;
  }
  if (CFDictionaryGetValue(v7, CFSTR("_DTTR")))
  {
LABEL_101:
    v71 = CFSTR("unexpected TTR entry");
    goto LABEL_85;
  }
  v68 = time(0);
  if (HealthPlistSetTTR(v7, v68))
  {
LABEL_111:
    v71 = CFSTR("addition of TTR failed");
    goto LABEL_85;
  }
  if (store_binary_dict(v7, "/var/root/.mkb_seshat_health"))
    goto LABEL_86;
  CFRelease(v7);
  v69 = HealthPlistCopyOrCreateNew();
  v7 = v69;
  if (!v69)
  {
LABEL_112:
    v71 = CFSTR("cant create dict");
    goto LABEL_85;
  }
  if (!CFDictionaryGetValue(v69, CFSTR("_DTTR")))
  {
    v71 = CFSTR("no TTR entry");
    goto LABEL_85;
  }
  if (HealthPlistConsumeTTR(v7, &v76))
    goto LABEL_113;
  if (v76 < 1)
    goto LABEL_114;
  if (CFDictionaryGetValue(v7, CFSTR("_DTTR")))
    goto LABEL_101;
  CFRelease(v7);
  v63 = 0;
  if (!v28)
    return v63;
LABEL_82:
  CFRelease(v28);
  return v63;
}

__CFDictionary *_create_plist_with_version(int a1)
{
  __CFDictionary *New;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __CFDictionary *v9;
  char v11;

  unlink("/var/root/.mkb_seshat_health");
  New = HealthPlistCopyOrCreateNew();
  v9 = New;
  if (New)
  {
    if (HealthPlistSetVersion(New, a1))
    {
      CFRelease(v9);
      return 0;
    }
  }
  else
  {
    debuglog("_create_plist_with_version", CFSTR("failed to copy health plist"), v3, v4, v5, v6, v7, v8, v11);
  }
  return v9;
}

const __CFDictionary *KBLoadSystemKeyBag()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const __CFDictionary *v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  const __CFDictionary *v15;
  char __str[1025];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v15 = 0;
  snprintf(__str, 0x401uLL, "%s%s", "/private/var/", "keybags");
  v6 = 0;
  if (!KBLoadLoadKeyBagFile(__str, "systembag", (CFPropertyListRef *)&v15))
  {
    v6 = v15;
    if (v15)
    {
      if (!_getData(v15, CFSTR("KeyBagKeys")))
      {
        debuglog("KBLoadSystemKeyBag", CFSTR("Keybag %s doesn't actually contain keys"), v8, v9, v10, v11, v12, v13, (char)__str);
        CFRelease(v6);
        return 0;
      }
    }
    else
    {
      debuglog("KBLoadSystemKeyBag", CFSTR(" Empty Keybag returned from KBLoadLoadKeyBagFile"), v0, v1, v2, v3, v4, v5, v14);
    }
  }
  return v6;
}

uint64_t KBLoadLoadKeyBagFile(const char *a1, const char *a2, CFPropertyListRef *a3)
{
  const __CFDictionary *binary_dict;
  const __CFDictionary *v5;
  BOOL v6;
  int v7;
  uint64_t ObjectWithCrypto;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const void *v16;
  const void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  std::__fs::filesystem::path __str[42];
  char v26[1025];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  snprintf((char *)__str, 0x401uLL, "%s/%s.kb", a1, a2);
  binary_dict = (const __CFDictionary *)load_binary_dict((const char *)__str);
  v5 = binary_dict;
  if (binary_dict)
    v6 = CFDictionaryGetValue(binary_dict, CFSTR("KeybagxART")) != 0;
  else
    v6 = 0;
  v7 = MKBDeviceTreeContainsKey(":/defaults", CFSTR("no-effaceable-storage"));
  if (v6 || v7)
  {
    *a3 = 0;
    v16 = load_binary_dict((const char *)__str);
    *a3 = v16;
    if (!v16)
    {
      snprintf(v26, 0x401uLL, "%s.writing", (const char *)__str);
      v17 = load_binary_dict(v26);
      *a3 = v17;
      if (!v17)
      {
        v15 = 4294967289;
        debuglog("KBLoadLoadKeyBagFile", CFSTR("Unable to load keybag with No Crypto: %d"), v18, v19, v20, v21, v22, v23, -7);
        if (!v5)
          return v15;
        goto LABEL_13;
      }
    }
    v15 = 0;
  }
  else
  {
    ObjectWithCrypto = KBSecureLoadObjectWithCrypto(__str, a3);
    v15 = ObjectWithCrypto;
    if ((_DWORD)ObjectWithCrypto)
    {
      debuglog("KBLoadLoadKeyBagFile", CFSTR("Unable to load keybag with Crypto: %d"), v9, v10, v11, v12, v13, v14, ObjectWithCrypto);
      if (!v5)
        return v15;
      goto LABEL_13;
    }
  }
  if (v5)
LABEL_13:
    CFRelease(v5);
  return v15;
}

void KBCleanupSystemKeyBag(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int *v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char __str[1025];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  snprintf(__str, 0x401uLL, "%s%s/%s.kb", "/private/var/", "keybags", "systembag");
  if (unlink(__str))
  {
    if (*__error() != 2)
    {
      v15 = __error();
      v16 = strerror(*v15);
      debuglog("KBCleanupSystemKeyBag", CFSTR("Failed to delete System KeyBag plist: %s"), v17, v18, v19, v20, v21, v22, v16);
    }
  }
  else
  {
    debuglog("KBCleanupSystemKeyBag", CFSTR("Deleted System KeyBag plist"), v9, v10, v11, v12, v13, v14, a9);
  }
}

CFMutableDictionaryRef KBLoadUserKeybag(uint64_t a1)
{
  int KeyBagFile;
  const __CFDictionary *v3;
  const __CFAllocator *v4;
  CFStringRef v5;
  const __CFDictionary *v6;
  const __CFDictionary *Value;
  const __CFDictionary *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  CFMutableDictionaryRef MutableCopy;
  CFMutableDictionaryRef result;
  const __CFDictionary *v17;
  char __str[1025];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v17 = 0;
  snprintf(__str, 0x401uLL, "%s%s", "/private/var/", "keybags");
  KeyBagFile = KBLoadLoadKeyBagFile(__str, "userbag", (CFPropertyListRef *)&v17);
  v3 = v17;
  if (!KeyBagFile && v17)
  {
    v4 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v5 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, CFSTR("%d"), a1);
    if (!v5)
    {
      MutableCopy = 0;
      goto LABEL_10;
    }
    v6 = (const __CFDictionary *)v5;
    Value = (const __CFDictionary *)CFDictionaryGetValue(v3, v5);
    if (Value)
    {
      v8 = Value;
      if (_getData(Value, CFSTR("KeyBagKeys")))
      {
        MutableCopy = CFDictionaryCreateMutableCopy(v4, 0, v8);
LABEL_9:
        CFRelease(v3);
        v3 = v6;
LABEL_10:
        CFRelease(v3);
        return MutableCopy;
      }
      debuglog("KBLoadUserKeybag", CFSTR("Keybag %s doesn't actually contain keys"), v9, v10, v11, v12, v13, v14, (char)__str);
    }
    MutableCopy = 0;
    goto LABEL_9;
  }
  MutableCopy = 0;
  result = 0;
  if (v17)
    goto LABEL_10;
  return result;
}

uint64_t KBSavePublicBackupBag(const void *a1)
{
  __CFDictionary *v2;
  const __CFDictionary *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char __str[1025];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  snprintf(__str, 0x401uLL, "%s/%s", "/private/var/", "keybags");
  v2 = KBLoadSystemKeyBag();
  if (!v2)
    return 0;
  v3 = v2;
  if (a1)
    CFDictionarySetValue(v2, CFSTR("BackupKeyBagKeys"), a1);
  else
    CFDictionaryRemoveValue(v2, CFSTR("BackupKeyBagKeys"));
  if (KBSaveKeyBag(v3, __str, 1111574321, "systembag", 0, v4, v5, v6))
    v7 = 0xFFFFFFFFLL;
  else
    v7 = 0;
  CFRelease(v3);
  return v7;
}

uint64_t KBSaveKeyBag(const __CFDictionary *a1, const char *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8;
  unsigned int v10;
  unsigned int v13;
  char v14;
  uint64_t v15;
  std::error_code *v16;
  int v17;
  int *v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  int *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  int *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  const __SecRandom *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  CFDataRef v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  CFDataRef v61;
  CFDataRef v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  CFDataRef v69;
  const __CFData *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  const __CFData *v77;
  CCCryptorStatus v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  size_t Length;
  size_t OutputLength;
  __CFData *Mutable;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  __CFData *v94;
  _CCCryptor *v95;
  const UInt8 *BytePtr;
  UInt8 *MutableBytePtr;
  CCCryptorStatus v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  _CCCryptor *v105;
  UInt8 *v106;
  CFMutableDictionaryRef v107;
  __CFDictionary *v108;
  CFNumberRef v109;
  std::error_code *v110;
  int v111;
  unsigned int v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  int v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  int *v138;
  char v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  char v146;
  int *v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  int *v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  const char *v162;
  const __CFString *v163;
  int *v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  const __CFString *v171;
  int *v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  int *v179;
  const __CFString *v180;
  char v181;
  std::__fs::filesystem::path *p_from;
  char v183;
  size_t v184;
  size_t dataOutMoved;
  CCCryptorRef cryptorRef;
  int v187;
  CFTypeRef cf;
  unsigned int valuePtr;
  std::__fs::filesystem::path __str[42];
  _OWORD v191[3];
  int v192;
  int v193;
  __int128 v194;
  UInt8 v195[35];
  std::__fs::filesystem::path __from;
  uint64_t v197;
  CFRange v198;
  CFRange v199;

  v8 = a5;
  v10 = a3;
  v197 = *MEMORY[0x1E0C80C00];
  v13 = KBisxARTBasedKeyBag(-1, a1, a3, (uint64_t)a4, a5, a6, a7, a8);
  CFDictionarySetValue(a1, CFSTR("KeyBagVersion"), CFSTR("1"));
  if (v13)
    CFDictionarySetValue(a1, CFSTR("KeybagxART"), CFSTR("1"));
  if (mkdir(a2, 0x1C0u) && *__error() != 17)
  {
    v40 = __error();
    strerror(*v40);
    debuglog("KBSaveKeyBag", CFSTR("Can't create %s: %s"), v41, v42, v43, v44, v45, v46, (char)a2);
    return 0xFFFFFFFFLL;
  }
  snprintf((char *)__str, 0x401uLL, "%s/%s.kb", a2, a4);
  if (MKBDeviceTreeContainsKey(":/defaults", CFSTR("no-effaceable-storage")))
    v14 = 1;
  else
    v14 = v13;
  if ((v14 & 1) != 0)
  {
    if (v13 && !MKBDeviceTreeContainsKey(":/defaults", CFSTR("no-effaceable-storage")))
      effaceBlastableBytes(0x42414731u);
    bzero(&__from, 0x401uLL);
    v15 = 0xFFFFFFFFLL;
    v193 = -1;
    snprintf((char *)&__from, 0x401uLL, "%s.writing", (const char *)__str);
    if (!store_binary_dict_fd(a1, (const char *)&__from, &v193))
    {
      if (renamex_np((const char *)&__from, (const char *)__str, 2u) && (__error(), rename(&__from, __str, v16), v17))
      {
        v172 = __error();
        strerror(*v172);
        debuglog("KBSecureSaveObjectNoCrypto", CFSTR("could not rename %s to %s: %s (%d)"), v173, v174, v175, v176, v177, v178, (char)&__from);
      }
      else if (fcntl(v193, 51))
      {
        v155 = __error();
        strerror(*v155);
        debuglog("KBSecureSaveObjectNoCrypto", CFSTR("Unable to fsync %s: %s"), v156, v157, v158, v159, v160, v161, (char)&__from);
      }
      else
      {
        if (unlink((const char *)&__from))
        {
          v18 = __error();
          v19 = strerror(*v18);
          debuglog("KBSecureSaveObjectNoCrypto", CFSTR("unlink failed: %s"), v20, v21, v22, v23, v24, v25, v19);
        }
        v15 = 0;
      }
    }
    if (v193 != -1 && close(v193))
    {
      v26 = v193;
      v27 = __error();
      strerror(*v27);
      debuglog("KBSecureSaveObjectNoCrypto", CFSTR("failed to close(%d): %s"), v28, v29, v30, v31, v32, v33, v26);
    }
    return v15;
  }
  dataOutMoved = 0;
  cryptorRef = 0;
  v184 = 52;
  memset(v191, 0, sizeof(v191));
  v192 = 0;
  if (!v8)
  {
    v47 = (const __SecRandom *)*MEMORY[0x1E0CD7000];
    if (SecRandomCopyBytes((SecRandomRef)*MEMORY[0x1E0CD7000], 0x20uLL, (char *)&v191[1] + 4))
    {
      v180 = CFSTR("Can't create key");
    }
    else
    {
      if (!SecRandomCopyBytes(v47, 0x10uLL, (char *)v191 + 4))
      {
LABEL_28:
        v54 = CFDataCreate(0, (const UInt8 *)&v191[1] + 4, 32);
        if (v54)
        {
          v61 = v54;
          v62 = CFDataCreate(0, (const UInt8 *)v191 + 4, 16);
          if (v62)
          {
            v69 = v62;
            v70 = (const __CFData *)convertObjectToBinary(a1);
            if (!v70)
            {
              debuglog("KBSecureSaveObjectWithCrypto", CFSTR("Can't serialize object"), v71, v72, v73, v74, v75, v76, v181);
              v94 = 0;
              v15 = 4294967291;
LABEL_59:
              CFRelease(v61);
              CFRelease(v69);
              if (v94)
                CFRelease(v94);
              goto LABEL_61;
            }
            v77 = v70;
            v78 = CCCryptorCreate(0, 0, 1u, (char *)&v191[1] + 4, 0x20uLL, (char *)v191 + 4, &cryptorRef);
            if (v78)
            {
              debuglog("KBSecureSaveObjectWithCrypto", CFSTR("Can't create cryptor: %d"), v79, v80, v81, v82, v83, v84, v78);
              v94 = 0;
            }
            else
            {
              Length = CFDataGetLength(v77);
              OutputLength = CCCryptorGetOutputLength(cryptorRef, Length, 1);
              Mutable = CFDataCreateMutable(0, OutputLength);
              v94 = Mutable;
              if (!Mutable)
              {
                v162 = "KBSecureSaveObjectWithCrypto";
                v163 = CFSTR("Can't create crypt buffer");
LABEL_74:
                debuglog(v162, v163, v88, v89, v90, v91, v92, v93, v181);
                v15 = 4294967291;
                goto LABEL_58;
              }
              CFDataSetLength(Mutable, OutputLength);
              v95 = cryptorRef;
              BytePtr = CFDataGetBytePtr(v77);
              MutableBytePtr = CFDataGetMutableBytePtr(v94);
              v98 = CCCryptorUpdate(v95, BytePtr, Length, MutableBytePtr, OutputLength, &dataOutMoved);
              if (!v98)
              {
                v105 = cryptorRef;
                v106 = CFDataGetMutableBytePtr(v94);
                CCCryptorFinal(v105, &v106[dataOutMoved], OutputLength - dataOutMoved, &dataOutMoved);
                valuePtr = v10;
                cf = 0;
                v187 = -1;
                v107 = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
                if (v107)
                {
                  v108 = v107;
                  v109 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
                  if (!v109)
                    goto LABEL_81;
                  CFDictionaryAddValue(v108, CFSTR("_MKBIV"), v69);
                  CFDictionaryAddValue(v108, CFSTR("_MKBWIPEID"), v109);
                  CFDictionaryAddValue(v108, CFSTR("_MKBPAYLOAD"), v94);
                  snprintf((char *)&__from, 0x401uLL, "%s.writing", (const char *)__str);
                  if (store_binary_dict_fd(v108, (const char *)&__from, &v187))
                    goto LABEL_81;
                  if (renamex_np((const char *)&__from, (const char *)__str, 2u))
                  {
                    __error();
                    rename(&__from, __str, v110);
                    if (v111)
                    {
                      v179 = __error();
                      strerror(*v179);
                      p_from = &__from;
                      v171 = CFSTR("could not rename %s to %s: %s (%d)");
LABEL_80:
                      debuglog("KBSecureSaveObject", v171, v132, v133, v134, v135, v136, v137, (char)p_from);
                      goto LABEL_81;
                    }
                  }
                  if (fcntl(v187, 51))
                  {
                    v164 = __error();
                    strerror(*v164);
                    debuglog("KBSecureSaveObject", CFSTR("Unable to fsync %s: %s"), v165, v166, v167, v168, v169, v170, (char)&__from);
LABEL_81:
                    v15 = 0xFFFFFFFFLL;
LABEL_51:
                    if (v187 != -1 && close(v187))
                    {
                      v146 = v187;
                      v147 = __error();
                      strerror(*v147);
                      debuglog("KBSecureSaveObject", CFSTR("failed to close(%d): %s"), v148, v149, v150, v151, v152, v153, v146);
                    }
                    CFRelease(v108);
                    if (cf)
                      CFRelease(cf);
                    if (v109)
                      CFRelease(v109);
                    goto LABEL_58;
                  }
                  if ((v8 & 1) == 0)
                  {
                    v112 = valuePtr;
                    if (CFDataGetLength(v69) != 16 || CFDataGetLength(v61) != 32)
                    {
                      debuglog("storeWipeIDInfo", CFSTR("trying to store invalid iv or secret"), v113, v114, v115, v116, v117, v118, (char)p_from);
                      goto LABEL_46;
                    }
                    memset(v195, 0, 32);
                    v194 = 0u;
                    v193 = v112;
                    v198.location = 0;
                    v198.length = 16;
                    CFDataGetBytes(v69, v198, (UInt8 *)&v194);
                    v199.location = 0;
                    v199.length = 32;
                    CFDataGetBytes(v61, v199, v195);
                    v119 = storeBlastableBytes(v112, &v193, 0x34uLL);
                    if (v119)
                    {
                      debuglog("storeWipeIDInfo", CFSTR("Unable to save wipe info: %08x"), v120, v121, v122, v123, v124, v125, v119);
LABEL_46:
                      debuglog("KBSecureSaveObject", CFSTR("Oh no! Can't save wipe ID"), v126, v127, v128, v129, v130, v131, v183);
                    }
                  }
                  if (!KBSecureLoadObjectWithCrypto(__str, &cf))
                  {
                    if (unlink((const char *)&__from))
                    {
                      v138 = __error();
                      v139 = strerror(*v138);
                      debuglog("KBSecureSaveObject", CFSTR("unlink failed: %s"), v140, v141, v142, v143, v144, v145, v139);
                    }
                    v15 = 0;
                    goto LABEL_51;
                  }
                  v171 = CFSTR("failed to validate newly created bag -- should never happen");
                  goto LABEL_80;
                }
                v162 = "KBSecureSaveObject";
                v163 = CFSTR("Can't create dict");
                goto LABEL_74;
              }
              debuglog("KBSecureSaveObjectWithCrypto", CFSTR("Can't encrypt: %d"), v99, v100, v101, v102, v103, v104, v98);
            }
            v15 = 4294967289;
LABEL_58:
            CFRelease(v77);
            goto LABEL_59;
          }
          debuglog("KBSecureSaveObjectWithCrypto", CFSTR("Can't create iv data"), v63, v64, v65, v66, v67, v68, v181);
          CFRelease(v61);
        }
        else
        {
          debuglog("KBSecureSaveObjectWithCrypto", CFSTR("Can't create key data"), v55, v56, v57, v58, v59, v60, v181);
        }
        v15 = 4294967291;
        goto LABEL_61;
      }
      v180 = CFSTR("Can't create IV");
    }
    debuglog("KBSecureSaveObjectWithCrypto", v180, v48, v49, v50, v51, v52, v53, v181);
    goto LABEL_85;
  }
  if (!loadBlastableBytes(v10, v191, &v184))
    goto LABEL_28;
  debuglog("KBSecureSaveObjectWithCrypto", CFSTR("Unable to load wipe info:%08x"), v34, v35, v36, v37, v38, v39, v10);
LABEL_85:
  v15 = 0xFFFFFFFFLL;
LABEL_61:
  if (cryptorRef)
    CCCryptorRelease(cryptorRef);
  return v15;
}

uint64_t KBSaveSystemBagHandle(int a1, const char *a2, const void *a3, int a4, uint64_t a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const __CFString *v16;
  int v17;
  CFDataRef v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  CFDataRef v25;
  CFDataRef v26;
  __CFDictionary *dict;
  __CFDictionary *v28;
  const __CFDictionary *v29;
  const __CFDictionary *v30;
  const void *Value;
  const void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char v38;
  char v39;
  UInt8 bytes[4];
  UInt8 *v41[130];

  v41[129] = *(UInt8 **)MEMORY[0x1E0C80C00];
  if (MKBDeviceSupportsEnhancedAPFS() && a1)
    return 0;
  if ((_DWORD)a5)
    v16 = CFSTR("Saving SystemBag with NO EFFACEABLE ROLL");
  else
    v16 = CFSTR("Saving SystemBag with EFFACEABLE ROLL");
  debuglog("KBSaveSystemBagHandle", v16, v10, v11, v12, v13, v14, v15, v38);
  v17 = MKBDeviceSupportsEnhancedAPFS();
  if (a1 || !v17)
  {
    v41[0] = 0;
    *(_DWORD *)bytes = 0;
    if (!aks_save_bag())
    {
      v26 = CFDataCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v41[0], *(int *)bytes, (CFAllocatorRef)*MEMORY[0x1E0C9AE00]);
      if (v26)
      {
        v25 = v26;
        goto LABEL_14;
      }
    }
    return 0xFFFFFFFFLL;
  }
  *(_DWORD *)bytes = 1752065072;
  LODWORD(v41[0]) = -1;
  if (aks_load_bag())
    return 0xFFFFFFFFLL;
  aks_unload_bag();
  v18 = CFDataCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], bytes, 4);
  if (!v18)
    return 0xFFFFFFFFLL;
  v25 = v18;
  debuglog("KBSaveSystemBagHandle", CFSTR("Saving handle 0 with the magic handle"), v19, v20, v21, v22, v23, v24, v39);
LABEL_14:
  dict = create_dict();
  if (dict)
  {
    v28 = dict;
    CFDictionaryAddValue(dict, CFSTR("KeyBagKeys"), v25);
    if (a3)
      CFDictionaryAddValue(v28, CFSTR("OpaqueStuff"), a3);
    if (a4)
    {
      v29 = KBLoadSystemKeyBag();
      if (v29)
      {
        v30 = v29;
        Value = CFDictionaryGetValue(v29, CFSTR("BackupKeyBagKeys"));
        if (Value)
        {
          v32 = Value;
          CFRetain(Value);
          CFRelease(v30);
          CFDictionarySetValue(v28, CFSTR("BackupKeyBagKeys"), v32);
          v30 = (const __CFDictionary *)v32;
        }
        CFRelease(v30);
      }
    }
    snprintf((char *)v41, 0x401uLL, "%s/%s", a2, "keybags");
    if (KBSaveKeyBag(v28, (const char *)v41, 1111574321, "systembag", a5, v33, v34, v35))
      v36 = 0xFFFFFFFFLL;
    else
      v36 = 0;
    CFRelease(v28);
  }
  else
  {
    v36 = 0xFFFFFFFFLL;
  }
  CFRelease(v25);
  return v36;
}

uint64_t MKBDeviceSupportsEnhancedAPFS()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  size_t __len;
  char __big[1024];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if ((MKBDeviceSupportsEnhancedAPFS_once & 1) == 0)
  {
    v0 = MKBDeviceTreeContainsKey(":/filesystems", CFSTR("e-apfs"));
    __len = 1023;
    bzero(__big, 0x400uLL);
    if ((check_apfs_shared_datavolume_bootarg_init & 1) == 0)
    {
      if (!sysctlbyname("kern.bootargs", __big, &__len, 0, 0) && strnstr(__big, "-apfs_shared_datavolume", __len))
        check_apfs_shared_datavolume_bootarg_value = 1;
      check_apfs_shared_datavolume_bootarg_init = 1;
    }
    if (v0 == 1)
      v7 = 1;
    else
      v7 = check_apfs_shared_datavolume_bootarg_value;
    MKBDeviceSupportsEnhancedAPFS_answer = v7;
    debuglog("MKBDeviceSupportsEnhancedAPFS", CFSTR("dt = %d, bootarg = %d"), v1, v2, v3, v4, v5, v6, v0);
    MKBDeviceSupportsEnhancedAPFS_once = 1;
  }
  return MKBDeviceSupportsEnhancedAPFS_answer;
}

uint64_t KBSaveUserBagHandle(int a1, uint64_t a2, const void *a3, int a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const __CFString *v14;
  uint64_t KeyBagFile;
  const __CFAllocator *v16;
  CFStringRef v17;
  CFDataRef v18;
  CFDataRef v19;
  __CFDictionary *Mutable;
  __CFDictionary *v21;
  __CFDictionary *v22;
  CFAbsoluteTime Current;
  CFDateRef v24;
  double v25;
  CFDateRef v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const void *Value;
  uint64_t v31;
  CFMutableDictionaryRef theDict[3];
  char __str[1025];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  memset((char *)&theDict[1] + 4, 0, 12);
  theDict[0] = 0;
  if ((MKBDeviceSupportsEnhancedAPFS() & 1) != 0)
    return 0;
  if (a4)
    v14 = CFSTR("Saving UserBag for uid %d with NO EFFACEABLE ROLL");
  else
    v14 = CFSTR("Saving UserBag for uid %d with EFFACEABLE ROLL");
  debuglog("KBSaveUserBagHandle", v14, v8, v9, v10, v11, v12, v13, a2);
  snprintf(__str, 0x401uLL, "%s%s", "/private/var/", "keybags");
  KeyBagFile = KBLoadLoadKeyBagFile(__str, "userbag", (CFPropertyListRef *)theDict);
  v16 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  if (!(_DWORD)KeyBagFile
    || (theDict[0] = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0])) != 0)
  {
    v17 = CFStringCreateWithFormat(v16, 0, CFSTR("%d"), a2);
    if (v17)
    {
      if (a1 == -1)
      {
        v22 = theDict[0];
        CFDictionaryRemoveValue(theDict[0], v17);
        v19 = 0;
        v21 = 0;
        goto LABEL_16;
      }
      if (!aks_save_bag())
      {
        v18 = CFDataCreateWithBytesNoCopy(v16, (const UInt8 *)theDict[2], SHIDWORD(theDict[1]), v16);
        if (v18)
        {
          v19 = v18;
          Mutable = CFDictionaryCreateMutable(v16, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
          if (!Mutable)
          {
            v24 = 0;
            v26 = 0;
LABEL_32:
            CFRelease(v19);
LABEL_33:
            if (theDict[0])
            {
              CFRelease(theDict[0]);
              theDict[0] = 0;
            }
            if (v17)
              CFRelease(v17);
            if (v24)
              CFRelease(v24);
            if (v26)
              CFRelease(v26);
            return KeyBagFile;
          }
          v21 = Mutable;
          CFDictionarySetValue(Mutable, CFSTR("KeyBagKeys"), v19);
          if (a3)
            CFDictionarySetValue(v21, CFSTR("OpaqueStuff"), a3);
          v22 = theDict[0];
          CFDictionarySetValue(theDict[0], v17, v21);
LABEL_16:
          Current = CFAbsoluteTimeGetCurrent();
          v24 = CFDateCreate(v16, Current);
          if (CFDictionaryGetValue(v22, CFSTR("LastWipeKeyUpdateTimeStamp")))
          {
            v25 = MEMORY[0x1B5E33544]();
            v26 = CFDateCreate(v16, v25 + 86400.0);
            if (CFDateCompare(v26, v24, 0) != kCFCompareLessThan)
            {
              if ((a4 & 1) == 0)
                CFDictionarySetValue(v22, CFSTR("WipeKeyUpdatePending"), (const void *)*MEMORY[0x1E0C9AE50]);
              goto LABEL_23;
            }
            Value = CFDictionaryGetValue(v22, CFSTR("WipeKeyUpdatePending"));
            if (!CFEqual(Value, (CFTypeRef)*MEMORY[0x1E0C9AE50]) && (a4 & 1) != 0)
            {
LABEL_23:
              v31 = 1;
              goto LABEL_26;
            }
            CFDictionarySetValue(v22, CFSTR("LastWipeKeyUpdateTimeStamp"), v24);
            CFDictionarySetValue(v22, CFSTR("WipeKeyUpdatePending"), (const void *)*MEMORY[0x1E0C9AE40]);
          }
          else
          {
            CFDictionarySetValue(v22, CFSTR("WipeKeyUpdatePending"), (const void *)*MEMORY[0x1E0C9AE40]);
            CFDictionarySetValue(v22, CFSTR("LastWipeKeyUpdateTimeStamp"), v24);
            v26 = 0;
          }
          v31 = 0;
LABEL_26:
          if (KBSaveKeyBag(v22, __str, 1111574322, "userbag", v31, v27, v28, v29))
            KeyBagFile = KeyBagFile;
          else
            KeyBagFile = 0;
          if (v21)
            CFRelease(v21);
          if (!v19)
            goto LABEL_33;
          goto LABEL_32;
        }
      }
    }
    v24 = 0;
    v26 = 0;
    goto LABEL_33;
  }
  return KeyBagFile;
}

BOOL seshat_supports_upgraded_jcop_kud_policy(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t Data;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BOOL8 v22;
  char v24;
  char v25;
  CFDataRef theData;
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[2];
  char v30;

  v30 = 0;
  v29[0] = 0;
  v29[1] = 0;
  theData = 0;
  v27 = 0;
  v25 = -1;
  v28 = SeshatCreateSessionWithTimeoutVerbose(65000, &v30, (uint64_t)v29, a4, a5, a6, a7, a8);
  if (v28)
  {
    Data = SeshatGetData((id *)&v28, (CFTypeRef *)&theData, (uint64_t)&v25, (uint64_t)&v27, (uint64_t)&v27 + 4);
    if (Data == 0x900000000000)
    {
      v22 = CFDataGetLength(theData) > 10;
    }
    else
    {
      debuglog("seshat_supports_upgraded_jcop_kud_policy", CFSTR("getData() -> 0x%x:0x%x"), v9, v10, v11, v12, v13, v14, Data);
      v22 = 0;
    }
    if (v28)
      SeshatEndSession((id *)&v28, v15, v16, v17, v18, v19, v20, v21, v24);
  }
  else
  {
    v22 = 0;
  }
  if (theData)
    CFRelease(theData);
  return v22;
}

uint64_t seshat_migrate_slot_to_v2(int a1, int a2, CFDataRef theData, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t *a7, uint64_t a8)
{
  int reset_pubkey;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char Length;
  uint64_t v19;

  if (!theData)
  {
    Length = -1;
LABEL_7:
    debuglog("seshat_migrate_slot_to_v2", CFSTR("Invalid args %ld"), (uint64_t)theData, a4, a5, a6, (uint64_t)a7, a8, Length);
    v19 = 28;
    goto LABEL_9;
  }
  if (CFDataGetLength(theData) != 16)
  {
    Length = CFDataGetLength(theData);
    goto LABEL_7;
  }
  reset_pubkey = aks_se_get_reset_pubkey();
  if (reset_pubkey)
  {
    debuglog("seshat_migrate_slot_to_v2", CFSTR("failed to fetch pubkey 0x%x"), v11, v12, v13, v14, v15, v16, reset_pubkey);
    v19 = 21;
  }
  else
  {
    debuglog("seshat_migrate_slot_to_v2", CFSTR("invalid pubkey %zu"), v11, v12, v13, v14, v15, v16, 0);
    v19 = 22;
  }
LABEL_9:
  if (a7)
    *a7 = v19;
  free(0);
  return 0xFFFFFFFFLL;
}

uint64_t seshat_arm_nonce(uint64_t a1, uint64_t a2, unsigned int a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v12;
  char v13;

  v13 = 0;
  v12 = 0;
  SeshatCreateNonceBlob(a2, a3, (uint64_t)&v12);
  v3 = aks_se_set_nonce();
  v10 = 0;
  if (v3)
  {
    debuglog("seshat_arm_nonce", CFSTR("failed to set nonce 0x%x"), v4, v5, v6, v7, v8, v9, v3);
    return 0xFFFFFFFFLL;
  }
  return v10;
}

uint64_t seshat_get_reset_sig(uint64_t a1, CFDataRef *a2, CFDataRef *a3)
{
  uint64_t reset_sig;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  CFDataRef v12;
  CFDataRef v13;
  uint64_t v14;

  if (!a2)
    return 0xFFFFFFFFLL;
  reset_sig = aks_se_get_reset_sig();
  if ((_DWORD)reset_sig)
  {
    v14 = reset_sig;
    debuglog("seshat_get_reset_sig", CFSTR("failed to get sig %x"), v6, v7, v8, v9, v10, v11, reset_sig);
    return v14;
  }
  v12 = CFDataCreate(0, 0, 0);
  *a2 = v12;
  if (v12 && (!a3 || (v13 = CFDataCreate(0, 0, 0), (*a3 = v13) != 0)))
    return 0;
  else
    return 0xFFFFFFFFLL;
}

const void *KBSystemKeyBagCopyOpaqueStuff()
{
  const __CFDictionary *v0;
  const __CFDictionary *v1;
  const void *Value;
  const void *v3;

  v0 = KBLoadSystemKeyBag();
  if (!v0)
    return 0;
  v1 = v0;
  Value = CFDictionaryGetValue(v0, CFSTR("OpaqueStuff"));
  v3 = Value;
  if (Value)
    CFRetain(Value);
  CFRelease(v1);
  return v3;
}

uint64_t seshat_is_supported()
{
  const __CFBoolean *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const __CFBoolean *v8;
  BOOL v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const __CFString *v18;
  char v19;

  v0 = (const __CFBoolean *)MGCopyAnswer();
  v1 = MGCopyAnswer();
  v8 = (const __CFBoolean *)v1;
  if (v0)
    v9 = v1 == 0;
  else
    v9 = 1;
  if (!v9)
  {
    if (CFBooleanGetValue(v0))
    {
      if (CFBooleanGetValue(v8))
      {
        v16 = SeshatAvailable();
        goto LABEL_8;
      }
      v18 = CFSTR("seshat_support: cond 2 not satisfied");
    }
    else
    {
      v18 = CFSTR("seshat_support: cond 1 not satisfied");
    }
    debuglog("seshat_is_supported", v18, v10, v11, v12, v13, v14, v15, v19);
  }
  v16 = 0;
LABEL_8:
  if ((seshat_is_supported_once & 1) == 0)
  {
    debuglog("seshat_is_supported", CFSTR("result: %d"), v2, v3, v4, v5, v6, v7, v16);
    seshat_is_supported_once = 1;
  }
  if (v0)
    CFRelease(v0);
  if (v8)
    CFRelease(v8);
  return v16;
}

void seshat_sep_rm_init()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const __CFString *v6;
  uint64_t is_supported;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BOOL4 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;

  if (aks_se_support_in_rm_is_set())
  {
    v6 = CFSTR("cant fetch state");
LABEL_3:
    debuglog("seshat_sep_rm_init", v6, v0, v1, v2, v3, v4, v5, v30);
    return;
  }
  is_supported = seshat_is_supported();
  if ((_DWORD)is_supported)
  {
    v15 = seshat_supports_upgraded_jcop_kud_policy(is_supported, v8, v9, v10, v11, v12, v13, v14);
    v22 = v15;
    if (v15)
      aks_set_jcop_supports_updated_kud_policy();
    debuglog("seshat_sep_rm_init", CFSTR("JCOP kud support: %d, %d"), v16, v17, v18, v19, v20, v21, v22);
    v23 = SeshatAvailableinRestrictedMode();
    debuglog("seshat_sep_rm_init", CFSTR("SERM support: %d"), v24, v25, v26, v27, v28, v29, v23);
    if (aks_se_support_in_rm())
    {
      v6 = CFSTR("failed to indicate se rm support (expected on devices where feature is disabled)");
      goto LABEL_3;
    }
  }
}

void __spoils<X1,X2,X3,X4,X5,X6,X7,X8,X9,X10,X11,X12,X13,X14,X15,X16,X17,Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7,Q16,Q17,Q18,Q19,Q20,Q21,Q22,Q23,Q24,Q25,Q26,Q27,Q28,Q29,Q30,Q31> seshat_augment_preflight_result(uint64_t a1, char a2)
{
  const __CFDictionary *New;
  const __CFDictionary *v4;
  const __CFDictionary *Data;
  const __CFArray *v6;
  CFTypeID v7;
  unsigned int v8;
  unsigned __int8 v9;
  unint64_t v10;
  uint64_t v11;
  unsigned int v12;
  unint64_t v13;

  v12 = 0;
  SeshatAugmentPreflightResult(&v13);
  BYTE6(v13) = ((v13 | ((unint64_t)(WORD2(v13) | (BYTE6(v13) << 16)) << 32)) & 0xFFF9FFFFFFFFFFFFLL | ((unint64_t)(a2 & 3) << 49)) >> 48;
  New = HealthPlistCopyOrCreateNew();
  if (New)
  {
    v4 = New;
    if (HealthPlistGetFailed(New))
      BYTE6(v13) = (v13 | ((unint64_t)(WORD2(v13) | (BYTE6(v13) << 16)) << 32) | 0x1000000000000) >> 48;
    Data = HealthPlistGetData(v4);
    if (Data)
    {
      v6 = Data;
      v7 = CFGetTypeID(Data);
      if (v7 == CFArrayGetTypeID())
      {
        v8 = seshat_count_failures(v6, &v12);
        v9 = -1;
        if (v8 <= 0xFE)
          v9 = seshat_count_failures(v6, &v12);
        v10 = (v13 | ((unint64_t)(WORD2(v13) | (BYTE6(v13) << 16)) << 32)) & 0xFFFF0000FFFFFFFFLL;
        if (v12 >= 0xFF)
          v11 = 255;
        else
          v11 = v12;
        WORD2(v13) = (v10 | ((unint64_t)v9 << 32) | (v11 << 40)) >> 32;
        BYTE6(v13) = (v10 | ((unint64_t)v9 << 32) | (v11 << 40)) >> 48;
      }
    }
    CFRelease(v4);
  }
}

uint64_t seshat_count_failures(CFArrayRef theArray, _DWORD *a2)
{
  int Count;
  CFIndex v5;
  uint64_t v6;
  const __CFNumber *ValueAtIndex;
  BOOL v8;
  uint64_t valuePtr;

  if (!theArray)
    return 0;
  if (a2)
  {
    if (CFArrayGetCount(theArray) < 0)
      Count = 0;
    else
      Count = CFArrayGetCount(theArray);
    *a2 = Count;
  }
  valuePtr = 0;
  if (CFArrayGetCount(theArray) < 1)
    return 0;
  v5 = 0;
  LODWORD(v6) = 0;
  do
  {
    ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(theArray, v5);
    if (CFNumberGetValue(ValueAtIndex, kCFNumberSInt64Type, &valuePtr))
      v8 = valuePtr == 0;
    else
      v8 = 1;
    if (v8)
      v6 = v6;
    else
      v6 = (v6 + 1);
    ++v5;
  }
  while (CFArrayGetCount(theArray) > v5);
  return v6;
}

void KBSeshatEffaceUnusedSlots(id *p_SessionWithTimeout, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  const __CFString *v15;
  char v16;
  uint64_t SessionWithTimeout;
  char v18;
  uint64_t v19;
  CFDataRef theData;
  unsigned __int8 v21;
  uint64_t v22;
  uint64_t v23;

  v21 = -18;
  v19 = 0;
  theData = 0;
  v18 = -1;
  SessionWithTimeout = 0;
  if ((seshat_is_supported() & 1) == 0)
  {
    v15 = CFSTR("unsupported");
    goto LABEL_25;
  }
  if (!p_SessionWithTimeout)
  {
    SessionWithTimeout = SeshatCreateSessionWithTimeout(65000, v4, v5, v6, v7, v8, v9, v10);
    if (!SessionWithTimeout)
    {
      v15 = CFSTR("CreateSession() failed");
      goto LABEL_25;
    }
    p_SessionWithTimeout = (id *)&SessionWithTimeout;
  }
  if (KBGetSEStuffForMementoPasscode(a2, 0, 0, &v21, 0, 0))
    v11 = 238;
  else
    v11 = v21;
  v22 = 0;
  v23 = 0;
  if (aks_memento_get_state() || (v23 & 0x400000000) == 0)
  {
    v12 = 238;
  }
  else
  {
    v12 = v22;
    v21 = v22;
  }
  if (SeshatGetData(p_SessionWithTimeout, (CFTypeRef *)&theData, (uint64_t)&v18, (uint64_t)&v19, (uint64_t)&v19 + 4) != 0x900000000000)
  {
    v15 = CFSTR("SeshatGetData() failed");
    goto LABEL_25;
  }
  v13 = 0;
  while (1)
  {
    if (CFDataGetBytePtr(theData)[v13] != 238)
    {
      if (v11 == (_DWORD)v13 || v12 == (_DWORD)v13)
      {
        debuglog("KBSeshatEffaceUnusedSlots", CFSTR("not effacing slot %d thats currently referenced by handle %d, (main:%d, memento:%d)"), v5, v6, v7, v8, v9, v10, v13);
        goto LABEL_19;
      }
      debuglog("KBSeshatEffaceUnusedSlots", CFSTR("effacing se slot %d"), v5, v6, v7, v8, v9, v10, v13);
      if (SeshatDeleteSlot(p_SessionWithTimeout, v13, (uint64_t)&v19 + 4) != 0x900000000000)
        break;
    }
LABEL_19:
    if (++v13 == 10)
      goto LABEL_20;
  }
  v16 = v13;
  v15 = CFSTR("SeshatDeleteSlot() failed %d");
LABEL_25:
  debuglog("KBSeshatEffaceUnusedSlots", v15, v5, v6, v7, v8, v9, v10, v16);
LABEL_20:
  if (theData)
  {
    CFRelease(theData);
    theData = 0;
  }
  if (SessionWithTimeout)
    SeshatEndSession((id *)&SessionWithTimeout, v14, v5, v6, v7, v8, v9, v10, v16);
}

uint64_t KBGetSEStuff(uint64_t a1, _BYTE *a2, uint64_t a3, _DWORD *a4)
{
  return KBGetSEStuffForMementoPasscode(a1, 0, 0, a2, a3, a4);
}

uint64_t KBGetMementoSESlot()
{
  aks_memento_get_state();
  return 0xFFFFFFFFLL;
}

uint64_t KBGetSEStuffForMementoPasscode(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4, uint64_t a5, _DWORD *a6)
{
  uint64_t reset_token_for_memento_secret;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v19;

  if (a3)
    reset_token_for_memento_secret = aks_se_get_reset_token_for_memento_secret();
  else
    reset_token_for_memento_secret = aks_se_get_reset_token();
  v17 = reset_token_for_memento_secret;
  if ((_DWORD)reset_token_for_memento_secret)
  {
    debuglog("KBGetSEStuffForMementoPasscode", CFSTR("aks_se_get_reset_token(memento:%d) -> 0x%x"), v11, v12, v13, v14, v15, v16, a3 != 0);
  }
  else
  {
    if (a4)
      *a4 = 0;
    if (a6)
      *a6 = 1;
    if (a5)
    {
      debuglog("KBGetSEStuffForMementoPasscode", CFSTR("no resetToken avaialble"), v11, v12, v13, v14, v15, v16, v19);
      return 4294967283;
    }
    else
    {
      return 0;
    }
  }
  return v17;
}

uint64_t getNVRam(char *cStr, _DWORD *a2, char **a3)
{
  const __CFString *v5;
  io_registry_entry_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  io_object_t v13;
  const __CFString *CFProperty;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const __CFString *v21;
  CFTypeID v22;
  uint64_t v23;
  CFTypeID v24;
  size_t Length;
  char *v26;
  char *v27;
  const UInt8 *BytePtr;
  char v30;
  char buffer[1024];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = CFStringCreateWithCString(0, cStr, 0x8000100u);
  v6 = IORegistryEntryFromPath(*MEMORY[0x1E0CBBAA8], "IODeviceTree:/options");
  if (v6)
  {
    v13 = v6;
    CFProperty = (const __CFString *)IORegistryEntryCreateCFProperty(v6, v5, 0, 0);
    if (CFProperty)
    {
      v21 = CFProperty;
      if (a2)
        *a2 = 1;
      if (a3)
      {
        v22 = CFGetTypeID(CFProperty);
        if (v22 == CFStringGetTypeID())
        {
          if (CFStringGetCString(v21, buffer, 1024, 0x8000100u))
            *a3 = strdup(buffer);
        }
        else
        {
          v24 = CFGetTypeID(v21);
          if (v24 == CFDataGetTypeID())
          {
            Length = CFDataGetLength((CFDataRef)v21);
            v26 = (char *)malloc_type_calloc(1uLL, Length + 1, 0xEFD9411AuLL);
            *a3 = v26;
            if (v26)
            {
              v27 = v26;
              BytePtr = CFDataGetBytePtr((CFDataRef)v21);
              memcpy(v27, BytePtr, Length);
            }
          }
          else
          {
            *a3 = 0;
          }
        }
      }
      CFRelease(v21);
    }
    else
    {
      debuglog("getNVRam", CFSTR("Could not create string for value"), v15, v16, v17, v18, v19, v20, v30);
      if (a2)
        *a2 = 0;
    }
    IOObjectRelease(v13);
    v23 = 0;
  }
  else
  {
    debuglog("getNVRam", CFSTR("Could not get options entry from the device tree"), v7, v8, v9, v10, v11, v12, v30);
    v23 = 0xFFFFFFFFLL;
  }
  CFRelease(v5);
  return v23;
}

uint64_t setNVRam(char *cStr, const char *a2)
{
  const __CFString *v3;
  io_registry_entry_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  io_registry_entry_t v11;
  CFStringRef v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  CFStringRef v19;
  kern_return_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v29;

  v3 = CFStringCreateWithCString(0, cStr, 0x8000100u);
  v4 = IORegistryEntryFromPath(*MEMORY[0x1E0CBBAA8], "IODeviceTree:/options");
  if (v4)
  {
    v11 = v4;
    v12 = CFStringCreateWithCString(0, a2, 0x8000100u);
    if (v12)
    {
      v19 = v12;
      v20 = IORegistryEntrySetCFProperty(v11, v3, v12);
      if (v20)
      {
        debuglog("setNVRam", CFSTR("Could not save value:%08x"), v21, v22, v23, v24, v25, v26, v20);
        v27 = 0xFFFFFFFFLL;
      }
      else
      {
        v27 = 0;
      }
      CFRelease(v19);
    }
    else
    {
      debuglog("setNVRam", CFSTR("Could not create string for value"), v13, v14, v15, v16, v17, v18, v29);
      v27 = 0xFFFFFFFFLL;
    }
    IOObjectRelease(v11);
  }
  else
  {
    debuglog("setNVRam", CFSTR("Could not get options entry from the device tree"), v5, v6, v7, v8, v9, v10, v29);
    v27 = 0xFFFFFFFFLL;
  }
  CFRelease(v3);
  return v27;
}

uint64_t removeNVRam(const char *a1)
{
  return setNVRam("IONVRAM-DELETE-PROPERTY", a1);
}

uint64_t is_user_primary(int a1, BOOL *a2)
{
  const __CFData *Value;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const __CFData *v11;
  CFTypeID v12;
  CFUUIDRef v13;
  const __CFData *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const __CFData *v21;
  CFTypeID v22;
  CFUUIDRef v23;
  BOOL v24;
  uint64_t v25;
  CFUUIDBytes v27;
  CFUUIDBytes v28;

  if (!MKBDeviceSupportsEnhancedAPFS())
  {
    v13 = 0;
    v23 = 0;
    v24 = a1 == 0;
LABEL_14:
    v25 = 0;
    *a2 = v24;
    goto LABEL_15;
  }
  if (!AKSIdentityGetPrimary() || aks_get_configuration())
    goto LABEL_21;
  Value = (const __CFData *)CFDictionaryGetValue(0, (const void *)*MEMORY[0x1E0CFD630]);
  if (!Value || (v11 = Value, v12 = CFGetTypeID(Value), v12 != CFDataGetTypeID()) || CFDataGetLength(v11) != 16)
  {
    debuglog("is_user_primary", CFSTR("no user uuid in the bag %d"), v5, v6, v7, v8, v9, v10, a1);
LABEL_21:
    v13 = 0;
    goto LABEL_23;
  }
  v27 = *(CFUUIDBytes *)CFDataGetBytePtr(v11);
  v13 = CFUUIDCreateFromUUIDBytes(0, v27);
  v14 = (const __CFData *)CFDictionaryGetValue(0, (const void *)*MEMORY[0x1E0CFD628]);
  if (v14)
  {
    v21 = v14;
    v22 = CFGetTypeID(v14);
    if (v22 == CFDataGetTypeID() && CFDataGetLength(v21) == 16)
    {
      v28 = *(CFUUIDBytes *)CFDataGetBytePtr(v21);
      v23 = CFUUIDCreateFromUUIDBytes(0, v28);
      if (CFEqual(v23, 0))
        v24 = CFEqual(v13, 0) != 0;
      else
        v24 = 0;
      goto LABEL_14;
    }
  }
  debuglog("is_user_primary", CFSTR("no group uuid in the bag %d"), v15, v16, v17, v18, v19, v20, a1);
LABEL_23:
  v23 = 0;
  v25 = 0xFFFFFFFFLL;
LABEL_15:
  if (v13)
    CFRelease(v13);
  if (v23)
    CFRelease(v23);
  return v25;
}

uint64_t get_se_recovery_count()
{
  int NVRam;
  char *v1;
  BOOL v2;
  uint64_t v3;
  char *__endptr;
  char *__str;
  int v7;

  v7 = 0;
  __str = 0;
  NVRam = getNVRam("seshat-count", &v7, &__str);
  v1 = __str;
  if (NVRam)
    v2 = 1;
  else
    v2 = __str == 0;
  if (v2
    || (__endptr = 0, *__error() = 0, LODWORD(v3) = strtol(__str, &__endptr, 10), v1 = __str, !*__str)
    || *__endptr)
  {
    v3 = 0;
    if (v1)
LABEL_8:
      free(v1);
  }
  else
  {
    if (*__error() == 34)
      v3 = 0;
    else
      v3 = v3;
    v1 = __str;
    if (__str)
      goto LABEL_8;
  }
  return v3;
}

uint64_t _se_unenrollment_condition(uint64_t a1, char a2)
{
  if ((a2 & 1) != 0 && !aks_memento_get_state())
    aks_get_lock_state();
  return 0;
}

uint64_t KBChangeSystemSecret(int a1, uint64_t a2, uint64_t a3, uint64_t a4, const __CFData *a5, uint64_t a6, const void *a7, unsigned int a8)
{
  uint64_t v15;
  int v16;
  _BOOL4 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int Debug;
  const __CFDictionary *New;
  const __CFDictionary *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _BOOL4 v40;
  unsigned int se_recovery_count;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  int v63;
  int v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  _BOOL4 v71;
  BOOL v72;
  BOOL v73;
  _BOOL4 v74;
  uint64_t v75;
  int lock_state;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  _BOOL4 v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  CFDataRef DerivedPasscode;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  unint64_t Data;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  unint64_t v118;
  _BOOL4 v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  int v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  const UInt8 *BytePtr;
  const UInt8 *v141;
  unsigned int AvailableSlot;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  int v149;
  uint64_t v150;
  int v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  int v158;
  const __CFString *v159;
  int v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  int v167;
  int v168;
  char v169;
  CFDataRef v170;
  unint64_t Slot;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  const void *v178;
  unint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  unint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  unint64_t v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  char Length;
  char v207;
  int v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  int v216;
  int v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  int v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  unint64_t v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  int v245;
  char v246;
  int v247;
  uint64_t v248;
  int v249;
  uint64_t v250;
  char v251;
  char v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t v256;
  uint64_t v257;
  uint64_t v258;
  uint64_t v259;
  uint64_t v260;
  uint64_t v261;
  uint64_t v262;
  uint64_t v263;
  uint64_t v264;
  uint64_t v265;
  int v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;
  uint64_t v270;
  uint64_t v271;
  uint64_t v272;
  const __CFString *v273;
  const __CFString *v275;
  const __CFString *v276;
  char v277;
  char v278;
  char v279;
  CFTypeRef cf;
  uint64_t v281;
  uint64_t v282;
  unsigned int v283;
  const void *v284;
  uint64_t v285;
  unsigned int v286;
  const __CFData *v288;
  BOOL v289;
  int v290;
  unsigned int v291;
  unint64_t v292;
  int v293;
  _QWORD v294[2];
  unsigned __int8 v295;
  int v296;
  unsigned __int8 v297;
  unsigned __int8 v298;
  uint64_t v299;
  const __CFData *v300;
  const __CFData *v301;
  CFDataRef v302;
  CFTypeRef v303;
  CFTypeRef v304;
  uint64_t v305;
  uint64_t v306;
  uint64_t v307;

  v15 = 0xFFFFFFFFLL;
  v291 = -1;
  if (!aks_get_system())
  {
    v284 = a7;
    v285 = a3;
    v288 = a5;
    v290 = 0;
    aks_get_lock_state();
    v286 = a8;
    v16 = _se_unenrollment_condition(v291, a8);
    v17 = 0;
    if (seshat_is_supported())
    {
      if (SeshatEnabled())
        v17 = !IsConfiguredMultiUser();
      else
        v17 = 0;
    }
    v289 = 0;
    Debug = SeshatGetDebug();
    if ((Debug & 0x20000) != 0)
      debuglog("KBChangeSystemSecret", CFSTR("disabled immediate enrollment"), v18, v19, v20, v21, v22, v23, v277);
    if (!v17)
    {
      v40 = 0;
      goto LABEL_26;
    }
    LODWORD(v294[0]) = 0;
    New = HealthPlistCopyOrCreateNew();
    v26 = New;
    if (New && HealthPlistGetData(New) && HealthPlistGetFailed(v26))
    {
      debuglog("seshat_preflight_for_passcode_change", CFSTR("health data contains failures"), v27, v28, v29, v30, v31, v32, v277);
      v64 = -1;
    }
    else
    {
      if (!MGGetBoolAnswer() || (SeshatGetDebug() & 0x800) != 0)
      {
        se_recovery_count = get_se_recovery_count();
        if (se_recovery_count >= 2)
        {
          debuglog("seshat_preflight_for_passcode_change", CFSTR("bad user experience = %u"), v42, v43, v44, v45, v46, v47, se_recovery_count);
          v64 = -1;
          if (!v26)
            goto LABEL_25;
          goto LABEL_24;
        }
      }
      else
      {
        v33 = get_se_recovery_count();
        debuglog("seshat_preflight_for_passcode_change", CFSTR("ignoring recovery count (%d)"), v34, v35, v36, v37, v38, v39, v33);
      }
      v48 = SeshatPreflightCheck(1, (uint64_t)&__block_literal_global, v294);
      seshat_augment_preflight_result(v48, 2);
      debuglog("seshat_preflight_for_passcode_change", CFSTR("Seshat preflight = %llx (%llx)"), v49, v50, v51, v52, v53, v54, v48);
      v306 = v48;
      analytics_send_preflight_result((unsigned int *)&v306, v55, v56, v57, v58, v59, v60, v61, v278);
      v63 = v48 != 14 && v48 != 0;
      v64 = v63 << 31 >> 31;
      if (!v26)
        goto LABEL_25;
    }
LABEL_24:
    CFRelease(v26);
LABEL_25:
    v40 = v64 == 0;
LABEL_26:
    if (is_user_primary(a1, &v289))
    {
      debuglog("KBChangeSystemSecret", CFSTR("unable to determine if handle:%d is pirmary"), v65, v66, v67, v68, v69, v70, a1);
      return 0xFFFFFFFFLL;
    }
    v71 = v289;
    debuglog("KBChangeSystemSecret", CFSTR("handle: %d, se-support: %d, primary-user: %d, no-passcode: %d, preflight: %d, se_bound: %d, se_unenroll:%d, dis-imm-enr: %d"), v65, v66, v67, v68, v69, v70, a1);
    if (!v17
      || (v288 ? (v72 = !v71) : (v72 = 1),
          !v72 ? (v73 = a6 == 0) : (v73 = 1),
          !v73 ? (v74 = v40) : (v74 = 0),
          (*(_QWORD *)&Debug & 0x20000) != 0 || ((!v74 | v16) & 1) != 0))
    {
      if (KBChangeSystemNonSeSecret(a1, a2, v285, a4, (uint64_t)v288, a6, a7, v286))
      {
        v273 = CFSTR("Failed to change non-se pw");
        goto LABEL_147;
      }
      return 0;
    }
    v75 = v291;
    v303 = 0;
    v304 = 0;
    v301 = 0;
    v302 = 0;
    v299 = 0;
    v300 = 0;
    v298 = -1;
    v297 = 0;
    v296 = -1;
    v295 = 0;
    v294[0] = 0;
    v294[1] = 0;
    v293 = 0;
    lock_state = aks_get_lock_state();
    v84 = (v293 & 0x2000) == 0 || lock_state != 0;
    v283 = KBisxARTBasedKeyBag(v75, 0, v77, v78, v79, v80, v81, v82);
    if (v283)
      v85 = "single";
    else
      v85 = "two";
    seshat_sep_rm_init();
    debuglog("KBChangeSystemSeSecret", CFSTR("changing SE bound passcode %s phase, memento_recovery: %s"), v86, v87, v88, v89, v90, v91, (char)v85);
    v305 = SeshatCreateSessionWithTimeoutVerbose(65000, &v295, (uint64_t)v294, v92, v93, v94, v95, v96);
    v281 = (int)a6;
    if (v305)
    {
      v282 = a6;
      DerivedPasscode = SeshatCreateDerivedPasscode(v288);
      if (!DerivedPasscode)
      {
        debuglog("KBChangeSystemSeSecret", CFSTR("failed to derive SE passcode"), v104, v105, v106, v107, v108, v109, v279);
        LODWORD(v118) = 0;
        v245 = 0;
        v248 = 0;
        cf = 0;
        v167 = -1;
        v246 = 1;
LABEL_185:
        v247 = 1;
        v249 = 1;
        goto LABEL_186;
      }
      v110 = (uint64_t)DerivedPasscode;
      Data = SeshatGetData((id *)&v305, (CFTypeRef *)&v300, (uint64_t)&v298, (uint64_t)&v299, (uint64_t)&v299 + 4);
      v118 = HIDWORD(Data);
      cf = (CFTypeRef)v110;
      if (Data == 0x900000000000)
      {
        if (v84)
        {
          v119 = 0;
          v120 = v285;
        }
        else
        {
          v120 = v285;
          if ((v286 & 1) != 0)
          {
            v306 = 0;
            v307 = 0;
            if (aks_memento_get_state() || (v307 & 0x400000000) == 0)
            {
              v159 = CFSTR("KBGetMementoSESlot() failed");
              goto LABEL_172;
            }
            v297 = v306;
          }
          else
          {
            v133 = KBGetSEStuffForMementoPasscode(v75, 0, 0, &v297, 0, 0);
            if (v133)
            {
              v167 = v133;
              v276 = CFSTR("KBGetSEStuff() failed");
              goto LABEL_182;
            }
          }
          BytePtr = CFDataGetBytePtr(v300);
          if (BytePtr[v297] == 238)
          {
            v119 = 0;
          }
          else
          {
            v141 = CFDataGetBytePtr(v300);
            v119 = (v141[v297] & 0x80u) != 0;
          }
        }
        AvailableSlot = SeshatNextAvailableSlot(v300);
        v149 = AvailableSlot;
        if (AvailableSlot >= 0xA)
        {
          debuglog("KBChangeSystemSeSecret", CFSTR("unexpected slot %d"), v143, v144, v145, v146, v147, v148, AvailableSlot);
          v245 = 0;
          v249 = 0;
          v167 = -1;
          v248 = 0x400000000000000;
          v246 = 1;
          LODWORD(v118) = 36864;
LABEL_157:
          v247 = 1;
LABEL_186:
          v178 = v284;
          goto LABEL_187;
        }
        if (!v84 && v119 && seshat_arm_nonce(v75, 0, HIDWORD(v299)))
        {
          v245 = 0;
          v248 = 0;
          v167 = -1000;
LABEL_184:
          v246 = 1;
          LODWORD(v118) = 36864;
          goto LABEL_185;
        }
        if ((v286 & 1) != 0)
        {
          v151 = aks_verify_password_memento();
          if (v151)
          {
            debuglog("KBChangeSystemSeSecret", CFSTR("cant verify old memento passcode 0x%x"), v152, v153, v154, v155, v156, v157, v151);
LABEL_173:
            v245 = 0;
            v248 = 0;
            v167 = -1;
            goto LABEL_184;
          }
        }
        else
        {
          v158 = aks_verify_password();
          if (v158)
          {
            v279 = v158;
            v159 = CFSTR("cant verify old passcode 0x%x");
            goto LABEL_172;
          }
        }
        if (v84)
          goto LABEL_78;
        if (v119)
        {
          if (seshat_get_reset_sig(v75, &v302, 0))
          {
            v159 = CFSTR("cant fetch sig");
LABEL_172:
            debuglog("KBChangeSystemSeSecret", v159, v127, v128, v129, v130, v131, v132, v279);
            goto LABEL_173;
          }
          goto LABEL_78;
        }
        if ((v286 & 1) != 0)
        {
          v160 = KBGetSEStuffForMementoPasscode(v75, v120, (int)a4, 0, (uint64_t)&v302, 0);
          if (v160)
          {
            v167 = v160;
            debuglog("KBChangeSystemSeSecret", CFSTR("KBGetSEStuffForMementoPasscode() -> 0x%x"), v161, v162, v163, v164, v165, v166, v160);
LABEL_183:
            v245 = 0;
            v248 = 0;
            goto LABEL_184;
          }
LABEL_78:
          v169 = v297;
          if (v84)
          {
            v169 = -18;
            v170 = 0;
          }
          else
          {
            v170 = v302;
          }
          Slot = SeshatAllocateSlot((id *)&v305, v149, v169, (uint64_t)v170, (CFTypeRef *)&v301, (uint64_t)&v299 + 4);
          v118 = HIDWORD(Slot);
          if (Slot == 0x900000000000)
          {
            v178 = v284;
            if (!v301)
            {
              v275 = CFSTR("no reset token returned");
              goto LABEL_175;
            }
            v179 = SeshatDerive((id *)&v305, v149, v110, &v304, (uint64_t)&v299 + 4, (uint64_t)v294);
            v118 = HIDWORD(v179);
            if (v179 == 0x900000000000)
            {
              v186 = SeshatDerive((id *)&v305, v149, v110, &v303, (uint64_t)&v299 + 4, (uint64_t)v294);
              v118 = HIDWORD(v186);
              if (v186 == 0x900000000000)
              {
                if (!CFEqual(v304, v303))
                {
                  debuglog("KBChangeSystemSeSecret", CFSTR("se-sec comparisson failed"), v193, v194, v195, v196, v197, v198, v279);
                  v245 = 0;
                  v246 = 0;
                  v249 = 0;
                  v167 = -1;
                  v248 = 0x900000000000000;
                  v247 = 1;
                  LODWORD(v118) = 36864;
LABEL_187:
                  v207 = v283;
                  goto LABEL_107;
                }
                v199 = SeshatResetCounter((id *)&v305, v149, (uint64_t)v301, (uint64_t)&v299 + 4, v195, v196, v197, v198);
                v118 = HIDWORD(v199);
                if (v199 == 0x900000000000)
                {
                  if (v304)
                  {
                    CFDataGetBytePtr((CFDataRef)v304);
                    if (v304)
                      CFDataGetLength((CFDataRef)v304);
                  }
                  Length = (char)v301;
                  if (v301)
                  {
                    CFDataGetBytePtr(v301);
                    Length = (char)v301;
                    if (v301)
                      Length = CFDataGetLength(v301);
                  }
                  v207 = v283;
                  v279 = Length;
                  v208 = aks_change_secret_opts();
                  if (v208)
                  {
                    debuglog("KBChangeSystemSeSecret", CFSTR("change passcode: %x"), v172, v173, v174, v175, v176, v177, v208);
                    v245 = 0;
                    v246 = 0;
                    v248 = 0;
                    v167 = -1;
                    v247 = 1;
                    LODWORD(v118) = 36864;
                    v249 = 1;
LABEL_107:
                    if (v300)
                      CFRelease(v300);
                    v250 = v305;
                    if (v305)
                      v251 = v246;
                    else
                      v251 = 1;
                    if ((v251 & 1) == 0)
                    {
                      KBSeshatEffaceUnusedSlots((id *)&v305, v75);
                      v250 = v305;
                    }
                    if (v250)
                      SeshatEndSession((id *)&v305, v150, v121, v122, v123, v124, v125, v126, v279);
                    if (v304)
                      CFRelease(v304);
                    if (v303)
                      CFRelease(v303);
                    if (cf)
                      CFRelease(cf);
                    if (v302)
                      CFRelease(v302);
                    if (v301)
                      CFRelease(v301);
                    if (v296 == -1)
                      v252 = 1;
                    else
                      v252 = v207;
                    if ((v252 & 1) == 0)
                      aks_unload_bag();
                    if (v245 && KBSaveSystemBagHandle(v75, "/private/var/", v178, 1, 1))
                      debuglog("KBChangeSystemSeSecret", CFSTR("welp, unable to persist old bag"), v121, v122, v123, v124, v125, v126, v279);
                    if (((v286 | v249) & 1) != 0)
                    {
LABEL_141:
                      if (v167)
                        goto LABEL_138;
                      return 0;
                    }
                    SeshatReportIfNeeded(v118, v150, v121, v122, v123, v124, v125, v126);
                    v292 = ((unint64_t)(unsigned __int16)v118 << 40) | ((unint64_t)v295 << 6) | v248 | 8;
                    analytics_send_seshat_recovery_required(&v292, v253, v254, v255, v256, v257, v258, v259, v279);
                    debuglog("KBChangeSystemSeSecret", CFSTR("SE failed, trying soft recovery (%d)"), v260, v261, v262, v263, v264, v265, v247);
                    if (v247)
                    {
                      v266 = aks_se_recover();
                      if (!v266)
                      {
                        KBSeshatEffaceUnusedSlots(0, v75);
                        if (KBChangeSystemNonSeSecret(v75, 0, v285, (int)a4, (uint64_t)v288, v281, v178, v286))
                        {
LABEL_138:
                          v273 = CFSTR("Failed to change pw");
LABEL_147:
                          debuglog("KBChangeSystemSecret", v273, v121, v122, v123, v124, v125, v126, v279);
                          return 0xFFFFFFFFLL;
                        }
                        return 0;
                      }
                      goto LABEL_140;
                    }
                    v266 = aks_se_recover();
                    if (v266)
                    {
LABEL_140:
                      debuglog("KBChangeSystemSeSecret", CFSTR("soft recovery failed 0x%x"), v267, v268, v269, v270, v271, v272, v266);
                      v167 = -1;
                      goto LABEL_141;
                    }
                    KBSeshatEffaceUnusedSlots(0, v75);
                    return 0;
                  }
                  if ((v283 & 1) != 0)
                  {
                    v296 = v75;
                    v215 = v281;
                    if (KBSaveSystemBagHandle(v75, "/private/var/", v284, 1, 0))
                      goto LABEL_166;
                    goto LABEL_101;
                  }
                  v215 = v281;
                  if (v296 != -1 && v296 != (_DWORD)v75)
                  {
                    v216 = KBSaveSystemBagHandle(v296, "/private/var/", v284, 1, 0);
                    v210 = v282;
                    if (v216)
                    {
LABEL_166:
                      debuglog("KBChangeSystemSeSecret", CFSTR("unable to save bag %d"), v209, v210, v211, v212, v213, v214, v296);
LABEL_176:
                      v245 = 0;
                      v246 = 0;
                      v248 = 0;
                      v167 = -1;
                      v247 = 1;
                      LODWORD(v118) = 36864;
LABEL_177:
                      v249 = 1;
                      goto LABEL_187;
                    }
                    v217 = aks_set_system_with_passcode();
                    if (v217)
                    {
                      debuglog("KBChangeSystemSeSecret", CFSTR("set-system failed %d"), v218, v219, v220, v221, v222, v223, v217);
                      v246 = 0;
                      v248 = 0;
                      v167 = -1;
                      v245 = 1;
                      LODWORD(v118) = 36864;
                      v247 = 1;
                      goto LABEL_177;
                    }
LABEL_101:
                    v224 = aks_change_secret_epilogue();
                    if (!v224)
                    {
                      v207 = v283;
                      if (v298 == 238
                        || (v231 = SeshatAuthorizeUpdate((id *)&v305, 1, v149, (uint64_t)v301, (uint64_t)&v299 + 4),
                            v118 = HIDWORD(v231),
                            v231 == 0x900000000000))
                      {
                        v306 = 0;
                        if (seshat_migrate_slot_to_v2(v75, v149, v301, (uint64_t)&v305, (uint64_t)v288, v215, &v306, v230))
                        {
                          v237 = v306;
                          seshat_augment_preflight_result(v306, 2);
                          v292 = v237;
                          analytics_send_preflight_result((unsigned int *)&v292, v238, v239, v240, v241, v242, v243, v244, v279);
                        }
                        v245 = 0;
                        v246 = 0;
                        v247 = 0;
                        v248 = 0;
                        v167 = 0;
                        v249 = 1;
                        LODWORD(v118) = 36864;
                      }
                      else
                      {
                        debuglog("KBChangeSystemSeSecret", CFSTR("AuthorizeUpdate() -> 0x%x:0x%x"), v232, v233, v234, v235, v236, v230, v231);
                        v245 = 0;
                        v246 = 0;
                        v247 = 0;
                        v249 = 0;
                        v167 = 0;
                        v248 = 0xA00000000000000;
                      }
                      goto LABEL_107;
                    }
                    v167 = v224;
                    debuglog("KBChangeSystemSeSecret", CFSTR("aks_change_secret_epilogue() failed %x"), v225, v226, v227, v228, v229, v230, v224);
                    v245 = 0;
                    v246 = 0;
                    v248 = 0;
                    v247 = 1;
                    LODWORD(v118) = 36864;
                    v249 = 1;
                    goto LABEL_187;
                  }
                  v279 = v296;
                  v275 = CFSTR("temp handle is invalid: %d");
LABEL_175:
                  debuglog("KBChangeSystemSeSecret", v275, v172, v173, v174, v175, v176, v177, v279);
                  goto LABEL_176;
                }
                debuglog("KBChangeSystemSeSecret", CFSTR("resetCounter() -> 0x%x:0x%x"), v200, v201, v202, v203, v204, v205, v199);
                v245 = 0;
                v246 = 0;
                v249 = 0;
                v167 = -1;
                v248 = 0x800000000000000;
LABEL_164:
                v247 = 1;
                goto LABEL_187;
              }
              debuglog("KBChangeSystemSeSecret", CFSTR("derive2() -> 0x%x:0x%x"), v187, v188, v189, v190, v191, v192, v186);
            }
            else
            {
              debuglog("KBChangeSystemSeSecret", CFSTR("derive() -> 0x%x:0x%x"), v180, v181, v182, v183, v184, v185, v179);
            }
            v245 = 0;
            v246 = 0;
            v249 = 0;
            v167 = -1;
            v248 = 0x700000000000000;
            goto LABEL_164;
          }
          debuglog("KBChangeSystemSeSecret", CFSTR("allocateSlot() -> 0x%x:0x%x"), v172, v173, v174, v175, v176, v177, Slot);
          v245 = 0;
          v249 = 0;
          v167 = -1;
          v248 = 0x600000000000000;
          goto LABEL_156;
        }
        v168 = KBGetSEStuffForMementoPasscode(v75, 0, 0, 0, (uint64_t)&v302, 0);
        if (!v168)
          goto LABEL_78;
        v167 = v168;
        v276 = CFSTR("KBGetSEStuff() failed -- unlock required to change passcode");
LABEL_182:
        debuglog("KBChangeSystemSeSecret", v276, v134, v135, v136, v137, v138, v139, v279);
        goto LABEL_183;
      }
      debuglog("KBChangeSystemSeSecret", CFSTR("SeshatGetData() failed"), v112, v113, v114, v115, v116, v117, v279);
      v245 = 0;
      v249 = 0;
      v167 = -1;
      v248 = 0x300000000000000;
    }
    else
    {
      debuglog("KBChangeSystemSeSecret", CFSTR("CreateSession() failed"), v97, v98, v99, v100, v101, v102, v279);
      LODWORD(v118) = 0;
      v245 = 0;
      v249 = 0;
      cf = 0;
      v167 = -1;
      v248 = 0x200000000000000;
    }
LABEL_156:
    v246 = 1;
    goto LABEL_157;
  }
  return v15;
}

uint64_t KBChangeSystemNonSeSecret(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, const void *a7, uint64_t a8)
{
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  const char *v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
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
  int v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  int v55;
  char v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char v64;
  int v65;

  v65 = -1;
  v11 = KBisxARTBasedKeyBag(a1, 0, a3, a4, a5, a6, (uint64_t)a7, a8);
  v18 = v11;
  v19 = "two";
  if (v11)
    v19 = "single";
  debuglog("KBChangeSystemNonSeSecret", CFSTR("changing non-SE passcode %s phase, (params:%d)"), v12, v13, v14, v15, v16, v17, (char)v19);
  v64 = 0;
  v20 = aks_change_secret_opts();
  if (v20)
  {
    debuglog("KBChangeSystemNonSeSecret", CFSTR("change-secret failed %x"), v21, v22, v23, v24, v25, v26, v20);
    goto LABEL_31;
  }
  if ((v18 & 1) == 0)
  {
    debuglog("KBChangeSystemNonSeSecret", CFSTR("temp handle is invalid: %d"), v21, v22, v23, v24, v25, v26, -1);
LABEL_31:
    v55 = 0;
    goto LABEL_32;
  }
  v65 = a1;
  if (a1)
  {
    v27 = KBSaveUserBagHandle(a1, a2, a7, 0);
    if ((_DWORD)v27)
    {
      v34 = v27;
      debuglog("KBChangeSystemNonSeSecret", CFSTR("unable to save bag %d"), v28, v29, v30, v31, v32, v33, a1);
LABEL_15:
      v55 = 0;
      goto LABEL_16;
    }
    goto LABEL_11;
  }
  if (KBSaveSystemBagHandle(0, "/private/var/", a7, 1, 0))
  {
    debuglog("KBChangeSystemNonSeSecret", CFSTR("unable to save bag %d"), v35, v36, v37, v38, v39, v40, a1);
    goto LABEL_31;
  }
LABEL_11:
  if ((v18 & 1) != 0 || (v41 = aks_set_system_with_passcode()) == 0)
  {
    v48 = aks_change_secret_epilogue();
    v34 = v48;
    if ((_DWORD)v48)
      debuglog("KBChangeSystemNonSeSecret", CFSTR("aks_change_secret_epilogue() failed %x"), v49, v50, v51, v52, v53, v54, v48);
    goto LABEL_15;
  }
  debuglog("KBChangeSystemNonSeSecret", CFSTR("set-system failed %d"), v42, v43, v44, v45, v46, v47, v41);
  v55 = 1;
LABEL_32:
  v34 = 0xFFFFFFFFLL;
LABEL_16:
  if (v65 == -1)
    v56 = 1;
  else
    v56 = v18;
  if ((v56 & 1) == 0)
    aks_unload_bag();
  if (v55)
  {
    if (!a1)
    {
      if (!KBSaveSystemBagHandle(0, "/private/var/", a7, 1, 1))
        return v34;
      goto LABEL_24;
    }
    if (KBSaveUserBagHandle(a1, a2, a7, 1))
LABEL_24:
      debuglog("KBChangeSystemNonSeSecret", CFSTR("welp, unable to persist old bag"), v57, v58, v59, v60, v61, v62, v64);
  }
  return v34;
}

uint64_t KBChangeSystemSecretWithEscrow(const __CFData *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, const void *a7)
{
  if (a1)
  {
    CFDataGetBytePtr(a1);
    CFDataGetLength(a1);
  }
  if (aks_recover_with_escrow_bag())
    return 0xFFFFFFFFLL;
  if ((MKBDeviceSupportsEnhancedAPFS() & 1) != 0)
    return 0;
  return KBSaveSystemBagHandle(0, "/private/var/", a7, 1, 0);
}

uint64_t MKBDeviceTreeContainsKey(const char *a1, const __CFString *a2)
{
  size_t v4;
  char *v5;
  char *v6;
  io_registry_entry_t v7;
  io_object_t v8;
  CFTypeRef CFProperty;
  uint64_t v10;

  if (!a1)
    return 0xFFFFFFFFLL;
  v4 = strlen(a1) + 13;
  v5 = (char *)malloc_type_malloc(v4, 0x5189311FuLL);
  if (!v5)
    return 4294967291;
  v6 = v5;
  snprintf(v5, v4, "%s%s", "IODeviceTree", a1);
  v7 = IORegistryEntryFromPath(*MEMORY[0x1E0CBBAA8], v6);
  if (v7)
  {
    v8 = v7;
    CFProperty = IORegistryEntryCreateCFProperty(v7, a2, (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
    if (CFProperty)
    {
      CFRelease(CFProperty);
      v10 = 1;
    }
    else
    {
      v10 = 0;
    }
    IOObjectRelease(v8);
  }
  else
  {
    v10 = 4294967288;
  }
  free(v6);
  return v10;
}

uint64_t MKBDeviceSupportsContentProtection()
{
  return MKBDeviceTreeContainsKey(":/defaults", CFSTR("content-protect"));
}

BOOL MKBDeviceSupportsEffaceableStorage()
{
  return MKBDeviceTreeContainsKey(":/defaults", CFSTR("no-effaceable-storage")) == 0;
}

uint64_t KBUpdateKeyBag(int a1, uint64_t a2)
{
  const __CFDictionary *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const __CFDictionary *v11;
  const void *Value;
  const void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v29;

  if (a1)
    v4 = KBLoadUserKeybag(-a1);
  else
    v4 = KBLoadSystemKeyBag();
  v11 = v4;
  if (v4)
  {
    Value = CFDictionaryGetValue(v4, CFSTR("OpaqueStuff"));
    v13 = Value;
    if (Value)
      CFRetain(Value);
    CFRelease(v11);
    debuglog("KBUpdateKeyBag", CFSTR("Got opaqueStuff from ondisk keybag"), v14, v15, v16, v17, v18, v19, v29);
    if (aks_get_system())
    {
      v27 = 0xFFFFFFFFLL;
      if (!v13)
        return v27;
      goto LABEL_13;
    }
    if (a1)
      v20 = KBSaveUserBagHandle(0, -a1, v13, a2);
    else
      v20 = KBSaveSystemBagHandle(0, "/private/var/", v13, 1, a2);
    v27 = v20;
    debuglog("KBUpdateKeyBag", CFSTR("Saved new keybag for handle %d with result %d"), v21, v22, v23, v24, v25, v26, a1);
    if (v13)
LABEL_13:
      CFRelease(v13);
  }
  else
  {
    debuglog("KBUpdateKeyBag", CFSTR("failed to open ondisk keybag, failing UpdateKeyBag"), v5, v6, v7, v8, v9, v10, v29);
    return 0xFFFFFFFFLL;
  }
  return v27;
}

void KBSetCookie(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, int a5)
{
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const __CFString *v24;
  int v25;
  const __CFString *v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  char v34;
  char v35;

  v9 = dlopen("/System/Library/PrivateFrameworks/APFS.framework/APFS", 2);
  if (!v9)
  {
    v24 = CFSTR("Failed to open APFS framework");
    goto LABEL_8;
  }
  v16 = dlsym(v9, "APFSVolumePayloadSet");
  if (!v16)
  {
    v24 = CFSTR("Failed to resolve gAPFSVolumePayloadSet");
LABEL_8:
    debuglog("KBSetCookie", v24, v10, v11, v12, v13, v14, v15, v34);
    v16 = 0;
    if (a5)
      goto LABEL_4;
    goto LABEL_9;
  }
  if (a5)
  {
LABEL_4:
    v17 = aks_copy_volume_cookie_persona();
    if (v17)
    {
      debuglog("KBSetCookie", CFSTR("Failed to get keybag persona Cookiefrom AKS:0x%x"), v18, v19, v20, v21, v22, v23, v17);
      goto LABEL_17;
    }
    v26 = CFSTR("Retrieved keybag persona Cookie from AKS, setting in APFS volume");
    goto LABEL_13;
  }
LABEL_9:
  v25 = aks_copy_volume_cookie();
  if (v25)
  {
    debuglog("KBSetCookie", CFSTR("Failed to get keybag Cookie from AKS:0x%x"), v18, v19, v20, v21, v22, v23, v25);
    goto LABEL_17;
  }
  v26 = CFSTR("Retrieved keybag Cookie from AKS, setting in APFS volume");
LABEL_13:
  debuglog("KBSetCookie", v26, v18, v19, v20, v21, v22, v23, v34);
  if (v16)
  {
    v27 = ((uint64_t (*)(uint64_t, _QWORD, _QWORD, _QWORD))v16)(a2, 0, 0, 0);
    if (v27)
      debuglog("KBSetCookie", CFSTR("APFSVolumePayloadSet failed with %d"), v28, v29, v30, v31, v32, v33, v27);
    else
      debuglog("KBSetCookie", CFSTR("APFSVolumePayloadSet succeeded"), v28, v29, v30, v31, v32, v33, v35);
  }
LABEL_17:
  if (a3)
  {
    if (a4)
    {
      *a3 = 0;
      *a4 = 0;
    }
  }
}

uint64_t KBMapVolume(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const __CFString *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  const __CFString *v53;
  void *v55;
  int v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char v63;
  size_t size;
  void *v65;

  size = 0;
  v65 = 0;
  v8 = dlopen("/System/Library/PrivateFrameworks/APFS.framework/APFS", 2);
  if (!v8)
  {
    v43 = CFSTR("Failed to open APFS framework");
    goto LABEL_11;
  }
  v15 = v8;
  v22 = dlsym(v8, "APFSVolumePayloadGet");
  if (!v22)
    debuglog("KBMapVolume", CFSTR("Failed to resolve gAPFSVolumePayloadGet"), v16, v17, v18, v19, v20, v21, v63);
  if (!dlsym(v15, "APFSVolumePayloadSet"))
    debuglog("KBMapVolume", CFSTR("Failed to resolve gAPFSVolumePayloadSet"), v23, v24, v25, v26, v27, v28, v63);
  if (v22)
  {
    v29 = ((uint64_t (*)(uint64_t, _QWORD, _QWORD, size_t *))v22)(a3, 0, 0, &size);
    if (v29)
    {
      v36 = v29;
      debuglog("KBMapVolume", CFSTR("APFSVolumePayloadGet failed with %d"), v30, v31, v32, v33, v34, v35, v29);
      if (v36 == 49154)
      {
        debuglog("KBMapVolume", CFSTR("Not cookie in this volume, attempting to write it"), v37, v38, v39, v40, v41, v42, v63);
        KBSetCookie(a1, a3, &v65, &size, a5);
      }
      goto LABEL_12;
    }
    debuglog("KBMapVolume", CFSTR("APFSVolumePayloadGet len reveived to be %zd"), v30, v31, v32, v33, v34, v35, size);
    v55 = malloc_type_malloc(size, 0x21D0A9C3uLL);
    v65 = v55;
    if (v55)
    {
      v56 = ((uint64_t (*)(uint64_t, _QWORD, void *, size_t *))v22)(a3, 0, v55, &size);
      if (v56)
        debuglog("KBMapVolume", CFSTR("Failed to  obtain cookie from the volume with error %d"), v57, v58, v59, v60, v61, v62, v56);
      else
        debuglog("KBMapVolume", CFSTR("Successfully obtained the cookie for the volume with length:%zd"), v57, v58, v59, v60, v61, v62, size);
      goto LABEL_12;
    }
    v43 = CFSTR("Failed to allocate Cookie malloc space");
LABEL_11:
    debuglog("KBMapVolume", v43, v9, v10, v11, v12, v13, v14, v63);
  }
LABEL_12:
  if (a5)
  {
    v44 = aks_set_keybag_for_volume_with_cookie_persona();
    v51 = v44;
    if ((_DWORD)v44)
    {
      debuglog("KBMapVolume", CFSTR("aks_set_keybag_for_volume_with_cookie_persona FAIL with 0x%x"), v45, v46, v47, v48, v49, v50, v44);
      goto LABEL_20;
    }
    v53 = CFSTR("aks_set_keybag_for_volume_with_cookie_persona SUCCESS");
  }
  else
  {
    v52 = aks_set_keybag_for_volume_with_cookie();
    v51 = v52;
    if ((_DWORD)v52)
    {
      debuglog("KBMapVolume", CFSTR("aks_set_keybag_for_volume_with_cookie FAIL with 0x%x"), v45, v46, v47, v48, v49, v50, v52);
      goto LABEL_20;
    }
    v53 = CFSTR("aks_set_keybag_for_volume_with_cookie SUCCESS");
  }
  debuglog("KBMapVolume", v53, v45, v46, v47, v48, v49, v50, v63);
LABEL_20:
  if (v65)
    free(v65);
  return v51;
}

uint64_t KBMapDeviceBag(const char *a1, int a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  _OWORD v48[65];
  _BYTE v49[4];
  statfs v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v45 = 0;
  v46 = 0;
  v47 = 0;
  memset(v48, 0, 512);
  memset(&v50, 0, 512);
  if (statfs(a1, &v50))
  {
    v10 = __error();
    v44 = strerror(*v10);
    debuglog("has_data_protection", CFSTR("Statfs failed due to:%s on  (%s)"), v11, v12, v13, v14, v15, v16, v44);
LABEL_5:
    debuglog("has_data_protection", CFSTR("mount point (%s) does not support Data Protection"), v17, v18, v19, v20, v21, v22, (char)a1);
    return 0;
  }
  if ((v50.f_flags & 0x80) == 0)
  {
    debuglog("has_data_protection", CFSTR("mount is with NO CPROTECT:0x%x on  (%s)"), v4, v5, v6, v7, v8, v9, v50.f_flags);
    goto LABEL_5;
  }
  LOWORD(v45) = 5;
  LODWORD(v46) = -2147188736;
  if (getattrlist(a1, &v45, v48, 0x41CuLL, 0))
  {
    __error();
    debuglog("KBMapDeviceBag", CFSTR("Could not get %s volume attributes (errno=%d)"), v30, v31, v32, v33, v34, v35, (char)a1);
    return 4294967290;
  }
  v36 = (char *)v48 + SDWORD1(v48[0]) + 4;
  if (v36 >= v49 || &v36[DWORD2(v48[0])] >= v49)
  {
    debuglog("KBMapDeviceBag", CFSTR("Attribute buffer too small. offset=%d, lenght=%u"), (uint64_t)v36, v25, v26, v27, v28, v29, SBYTE4(v48[0]));
    return 4294967290;
  }
  v37 = KBMapVolume(0, 0, (uint64_t)v36, (unint64_t)v48 | 0xC, a2);
  v23 = convertAKSErrorToMKB(v37);
  if ((_DWORD)v23)
    debuglog("KBMapDeviceBag", CFSTR("Could not map %s volume (ret=%d)"), v38, v39, v40, v41, v42, v43, (char)a1);
  return v23;
}

uint64_t KBSecureLoadObjectWithCrypto(const std::__fs::filesystem::path *a1, CFPropertyListRef *a2)
{
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  std::error_code *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  const __CFData *v19;
  const UInt8 *BytePtr;
  size_t Length;
  const UInt8 *v22;
  CCCryptorStatus v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const UInt8 *v30;
  size_t v31;
  UInt8 *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  UInt8 *v39;
  _CCCryptor *v40;
  size_t v41;
  size_t v42;
  CCCryptorStatus v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  _CCCryptor *v50;
  UInt8 *v51;
  CFIndex v52;
  CCCryptorStatus v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  int *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  char v75;
  size_t dataOutMoved;
  size_t v77;
  CCCryptorRef cryptorRef;
  CFDataRef theData;
  CFDataRef v80;
  const __CFData *v81;
  std::__fs::filesystem::path __str[42];
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  theData = 0;
  v80 = 0;
  v77 = 0;
  cryptorRef = 0;
  dataOutMoved = 0;
  *a2 = 0;
  bzero(__str, 0x401uLL);
  v81 = 0;
  v4 = validateSecureFile((const char *)a1, &v81, (CFTypeRef *)&v80, (CFTypeRef *)&theData);
  if (v4)
  {
    debuglog("KBSecureLoadObject", CFSTR("Failed to validate keybag file: %d, %d"), v5, v6, v7, v8, v9, v10, v4);
    snprintf((char *)__str, 0x401uLL, "%s.writing", (const char *)a1);
    v11 = validateSecureFile((const char *)__str, &v81, (CFTypeRef *)&v80, (CFTypeRef *)&theData);
    if (v11 || !v81)
    {
      debuglog("KBSecureLoadObject", CFSTR("Failed to validate keybag file: %d"), (uint64_t)v12, v13, v14, v15, v16, v17, v11);
    }
    else
    {
      rename(__str, a1, v12);
      if (!v18)
        goto LABEL_5;
      v68 = __error();
      strerror(*v68);
      debuglog("KBSecureLoadObject", CFSTR("could not rename %s to %s: %s"), v69, v70, v71, v72, v73, v74, (char)__str);
    }
    v60 = 4294967288;
    debuglog("KBSecureLoadObjectWithCrypto", CFSTR("Can't load secure keybag Object: %d"), v62, v63, v64, v65, v66, v67, -8);
    v19 = 0;
    goto LABEL_12;
  }
LABEL_5:
  v19 = v81;
  BytePtr = CFDataGetBytePtr(theData);
  Length = CFDataGetLength(theData);
  v22 = CFDataGetBytePtr(v80);
  v23 = CCCryptorCreate(1u, 0, 1u, BytePtr, Length, v22, &cryptorRef);
  if (v23)
  {
    debuglog("KBSecureLoadObjectWithCrypto", CFSTR("Can't create decryptor: %d"), v24, v25, v26, v27, v28, v29, v23);
    v60 = 4294967289;
    goto LABEL_12;
  }
  v30 = CFDataGetBytePtr(v19);
  v31 = CFDataGetLength(v19);
  v32 = (UInt8 *)malloc_type_malloc(v31, 0x47E4BB70uLL);
  if (!v32)
  {
    debuglog("KBSecureLoadObjectWithCrypto", CFSTR("Can't allocate decryption buffer"), v33, v34, v35, v36, v37, v38, v75);
    v60 = 4294967291;
    goto LABEL_12;
  }
  v39 = v32;
  v40 = cryptorRef;
  v41 = CFDataGetLength(v19);
  v42 = CFDataGetLength(v19);
  v43 = CCCryptorUpdate(v40, v30, v41, v39, v42, &dataOutMoved);
  if (v43)
  {
    debuglog("KBSecureLoadObjectWithCrypto", CFSTR("Unable to decrypt: %d"), v44, v45, v46, v47, v48, v49, v43);
  }
  else
  {
    v50 = cryptorRef;
    v51 = &v39[dataOutMoved];
    v52 = CFDataGetLength(v19);
    v53 = CCCryptorFinal(v50, v51, v52 - dataOutMoved, &v77);
    if (!v53)
    {
      v60 = 0;
      *a2 = convertBinaryToObject(v39, (v77 + dataOutMoved));
      goto LABEL_10;
    }
    debuglog("KBSecureLoadObjectWithCrypto", CFSTR("Unable to finalize: %d"), v54, v55, v56, v57, v58, v59, v53);
  }
  v60 = 4294967289;
LABEL_10:
  if (v39 != v30)
    free(v39);
LABEL_12:
  if (v80)
  {
    CFRelease(v80);
    v80 = 0;
  }
  if (theData)
  {
    CFRelease(theData);
    theData = 0;
  }
  if (v19)
    CFRelease(v19);
  CCCryptorRelease(cryptorRef);
  return v60;
}

uint64_t validateSecureFile(const char *a1, _QWORD *a2, CFTypeRef *a3, CFTypeRef *a4)
{
  char v7;
  const __CFDictionary *binary_dict;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const __CFDictionary *v15;
  const __CFNumber *Value;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const __CFNumber *v23;
  CFTypeID v24;
  const void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const void *v32;
  CFTypeID v33;
  const void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const void *v41;
  CFTypeID v42;
  unsigned int v43;
  int v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  CFDataRef v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  CFDataRef v58;
  CFDataRef v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  CFDataRef v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  CFTypeRef v73;
  uint64_t v74;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  char v82;
  unsigned int valuePtr;
  size_t v84;
  _OWORD v85[3];
  int v86;
  uint64_t v87;

  v7 = (char)a1;
  v87 = *MEMORY[0x1E0C80C00];
  binary_dict = (const __CFDictionary *)load_binary_dict(a1);
  if (!binary_dict)
  {
    debuglog("validateSecureFile", CFSTR("Unable to load %s"), v9, v10, v11, v12, v13, v14, v7);
    return 0xFFFFFFFFLL;
  }
  v15 = binary_dict;
  valuePtr = 0;
  Value = (const __CFNumber *)CFDictionaryGetValue(binary_dict, CFSTR("_MKBWIPEID"));
  if (!Value || (v23 = Value, v24 = CFGetTypeID(Value), v24 != CFNumberGetTypeID()))
  {
    debuglog("validateSecureFile", CFSTR("%s missing wipeID"), v17, v18, v19, v20, v21, v22, v7);
LABEL_35:
    CFRelease(v15);
    return 0xFFFFFFFFLL;
  }
  v25 = CFDictionaryGetValue(v15, CFSTR("_MKBIV"));
  if (!v25 || (v32 = v25, v33 = CFGetTypeID(v25), v33 != CFDataGetTypeID()))
  {
    debuglog("validateSecureFile", CFSTR("%s missing IV"), v26, v27, v28, v29, v30, v31, v7);
    goto LABEL_35;
  }
  v34 = CFDictionaryGetValue(v15, CFSTR("_MKBPAYLOAD"));
  if (!v34 || (v41 = v34, v42 = CFGetTypeID(v34), v42 != CFDataGetTypeID()))
  {
    debuglog("validateSecureFile", CFSTR("%s missing payload"), v35, v36, v37, v38, v39, v40, v7);
    goto LABEL_35;
  }
  CFNumberGetValue(v23, kCFNumberIntType, &valuePtr);
  v43 = valuePtr;
  v86 = 0;
  memset(v85, 0, sizeof(v85));
  v84 = 52;
  v44 = loadBlastableBytes(valuePtr, v85, &v84);
  if (v44)
  {
    debuglog("loadWipeIDInfo", CFSTR("Unable to load wipe info: %08x"), v45, v46, v47, v48, v49, v50, v44);
LABEL_34:
    debuglog("validateSecureFile", CFSTR("Can't load wipe info for ID:%08x"), v76, v77, v78, v79, v80, v81, valuePtr);
    goto LABEL_35;
  }
  if (LODWORD(v85[0]) != v43)
  {
    debuglog("loadWipeIDInfo", CFSTR("Wipe Info ID is wrong: %d"), v45, v46, v47, v48, v49, v50, v85[0]);
    goto LABEL_34;
  }
  v51 = CFDataCreate(0, (const UInt8 *)v85 + 4, 16);
  if (!v51)
  {
    debuglog("loadWipeIDInfo", CFSTR("Can't create iv data"), v52, v53, v54, v55, v56, v57, v82);
    goto LABEL_34;
  }
  v58 = v51;
  v59 = CFDataCreate(0, (const UInt8 *)&v85[1] + 4, 32);
  if (!v59)
  {
    debuglog("loadWipeIDInfo", CFSTR("Can't create key data"), v60, v61, v62, v63, v64, v65, v82);
    CFRelease(v58);
    goto LABEL_34;
  }
  v66 = v59;
  if (CFEqual(v32, v58))
  {
    if (a3)
      *a3 = CFRetain(v58);
    if (a4)
      *a4 = CFRetain(v66);
    if (!a2)
    {
      v74 = 0;
      goto LABEL_23;
    }
    v73 = CFRetain(v41);
    v74 = 0;
    goto LABEL_21;
  }
  debuglog("validateSecureFile", CFSTR("fileIV to wipeIV mismatch, no payload returned"), v67, v68, v69, v70, v71, v72, v82);
  CFShow(v32);
  CFShow(v58);
  v74 = 4294967287;
  if (a2)
  {
    v73 = 0;
LABEL_21:
    *a2 = v73;
  }
LABEL_23:
  CFRelease(v15);
  CFRelease(v58);
  CFRelease(v66);
  return v74;
}

const __CFData *KBisxARTBasedKeyBag(int a1, const __CFDictionary *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int lock_state;
  const __CFData *v9;
  const __CFData *Data;

  if (a1 != -1)
  {
    lock_state = aks_get_lock_state();
    if (!lock_state)
    {
      v9 = 0;
      goto LABEL_7;
    }
    debuglog("KBisxARTBasedKeyBag", CFSTR("get_lock_state() -> 0x%x"), a3, a4, a5, a6, a7, a8, lock_state);
LABEL_9:
    v9 = 0;
    goto LABEL_7;
  }
  if (!a2)
    goto LABEL_9;
  Data = (const __CFData *)_getData(a2, CFSTR("KeyBagKeys"));
  v9 = Data;
  if (Data)
  {
    CFDataGetBytePtr(Data);
    CFDataGetLength(v9);
    v9 = (const __CFData *)aks_bag_in_xart();
  }
LABEL_7:
  debuglog("KBisxARTBasedKeyBag", CFSTR("Result = %d"), a3, a4, a5, a6, a7, a8, (char)v9);
  return v9;
}

uint64_t seshat_preflight_condition_for_pw_change_block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v7;

  if (!aks_get_lock_state())
    return 1;
  debuglog("seshat_preflight_condition_for_pw_change_block_invoke", CFSTR("no lock state"), v0, v1, v2, v3, v4, v5, v7);
  return 0;
}

uint64_t (*MKBSetLogFunction(uint64_t (*a1)(_QWORD)))(_QWORD, _QWORD)
{
  _log_func = a1;
  return KBSetLogger((uint64_t (*)(_QWORD, _QWORD))debuglog);
}

uint64_t MKBLockDevice(CFDictionaryRef theDict)
{
  const __CFBoolean *Value;
  const __CFBoolean *v3;
  CFTypeID v4;
  uint64_t v5;

  if (theDict)
  {
    Value = (const __CFBoolean *)CFDictionaryGetValue(theDict, CFSTR("LockDeviceNow"));
    if (Value)
    {
      v3 = Value;
      v4 = CFGetTypeID(Value);
      if (v4 == CFBooleanGetTypeID())
        CFBooleanGetValue(v3);
    }
  }
  handleToUse(theDict);
  v5 = aks_lock_device();
  return convertAKSErrorToMKB(v5);
}

uint64_t MKBLockDeviceNow(const __CFDictionary *a1)
{
  uint64_t v1;

  handleToUse(a1);
  v1 = aks_lock_device();
  return convertAKSErrorToMKB(v1);
}

uint64_t MKBSeshatDebug(uint64_t a1)
{
  void *v2;

  +[MKBKeyStoreDevice sharedService](MKBKeyStoreDevice, "sharedService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "SeshatDebug:", a1);

  return 0;
}

uint64_t MKBUnlockDevice(const __CFData *a1, const __CFDictionary *a2)
{
  return MKBUnlockDeviceForACMRef(a1, a2, 0);
}

uint64_t MKBUnlockDeviceForACMRef(const __CFData *a1, const __CFDictionary *a2, const __CFData *a3)
{
  int v6;
  const __CFDictionary *v7;
  const void *Value;
  _BOOL8 v9;
  CFTypeID v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unsigned __int8 v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  NSObject *v31;
  void *v33;
  char v34;
  _QWORD block[4];
  int v36;

  v6 = handleToUse(a2);
  v7 = should_use_memento(a2);
  if (a2)
  {
    Value = CFDictionaryGetValue(a2, CFSTR("VerifyOnly"));
    v9 = (_BOOL8)Value;
    if (!Value)
      goto LABEL_5;
    v10 = CFGetTypeID(Value);
    if (v10 == CFBooleanGetTypeID())
    {
      v9 = CFBooleanGetValue((CFBooleanRef)v9) != 0;
      goto LABEL_5;
    }
    debuglog("verify_only_opt", CFSTR("key is of wrong type"), v11, v12, v13, v14, v15, v16, v34);
  }
  v9 = 0;
LABEL_5:
  v17 = ShouldSkipSE(a2);
  if (v6)
  {
    +[MKBKeyStoreDevice sharedService](MKBKeyStoreDevice, "sharedService");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "passcodeUnlockStart");

  }
  if ((_DWORD)v7)
  {
    if (a1)
    {
      CFDataGetBytePtr(a1);
      CFDataGetLength(a1);
      if (!a3)
      {
LABEL_18:
        v19 = aks_verify_password_memento();
        goto LABEL_22;
      }
    }
    else if (!a3)
    {
      goto LABEL_18;
    }
    CFDataGetBytePtr(a3);
    CFDataGetLength(a3);
    goto LABEL_18;
  }
  if (v9)
  {
    if (a1)
    {
      CFDataGetBytePtr(a1);
      CFDataGetLength(a1);
      if (!a3)
      {
LABEL_20:
        v19 = aks_verify_password();
        goto LABEL_22;
      }
    }
    else if (!a3)
    {
      goto LABEL_20;
    }
    CFDataGetBytePtr(a3);
    CFDataGetLength(a3);
    goto LABEL_20;
  }
  if (a1)
  {
    CFDataGetBytePtr(a1);
    CFDataGetLength(a1);
  }
  v19 = aks_unlock_device();
LABEL_22:
  v26 = v19;
  if (v6)
  {
    if (!(_DWORD)v19 || (_DWORD)v19 == -536362988)
    {
      +[MKBKeyStoreDevice sharedService](MKBKeyStoreDevice, "sharedService");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "passcodeUnlockSuccess");

      if ((_DWORD)v26 != -536362988)
      {
        if ((_DWORD)v26 != -536362987)
        {
LABEL_37:
          v29 = 0;
          if ((_DWORD)v26)
            goto LABEL_40;
          goto LABEL_38;
        }
LABEL_33:
        +[MKBKeyStoreDevice sharedService](MKBKeyStoreDevice, "sharedService");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v30, "SeshatUnlock:withMemento:verifyOnly:withACMRef:", a1, v7, v9, a3);

        v29 = 2;
        if ((_DWORD)v26)
          goto LABEL_40;
LABEL_38:
        v29 |= 1u;
        goto LABEL_39;
      }
      goto LABEL_35;
    }
    +[MKBKeyStoreDevice sharedService](MKBKeyStoreDevice, "sharedService");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "passcodeUnlockFailed");

  }
  if ((_DWORD)v26 == -536362987)
    goto LABEL_33;
  if ((_DWORD)v26 == -536362988)
  {
LABEL_35:
    v26 = 3758604308;
    if ((v17 & 1) != 0)
    {
      debuglog("MKBUnlockDeviceForACMRef", CFSTR("Skipping enrollment"), v20, v21, v22, v23, v24, v25, v34);
    }
    else
    {
      debuglog("MKBUnlockDeviceForACMRef", CFSTR("Prompted to SE enroll"), v20, v21, v22, v23, v24, v25, v34);
      +[MKBKeyStoreDevice sharedService](MKBKeyStoreDevice, "sharedService");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "SeshatEnroll:", a1);

    }
    v29 = 0;
    if (a1)
      goto LABEL_41;
    return convertAKSErrorToMKB(v26);
  }
  if ((_DWORD)v26 != -536870184)
    goto LABEL_37;
  MKBKeyBagChangeSystemGeneration((uint64_t)a1, 3);
  v29 = 1;
LABEL_39:
  v26 = 0;
LABEL_40:
  if (a1)
  {
LABEL_41:
    dispatch_get_global_queue(0, 0);
    v31 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __MKBUnlockDeviceForACMRef_block_invoke;
    block[3] = &__block_descriptor_36_e5_v8__0l;
    v36 = v29;
    dispatch_async(v31, block);

  }
  return convertAKSErrorToMKB(v26);
}

uint64_t MKBVerifyPasswordWithContext(const __CFDictionary *a1, const __CFData *a2, const __CFData *a3)
{
  unsigned int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;
  uint64_t v15;
  __CFDictionary *MutableCopy;
  uint64_t v17;
  char v18;

  v6 = should_use_memento(a1);
  v13 = v6;
  if (a3 && v6)
  {
    debuglog("MKBVerifyPasswordWithContext", CFSTR("memento verifiers and acm context are unsupported"), v7, v8, v9, v10, v11, v12, v18);
    return 4294967279;
  }
  handleToUse(a1);
  if (v13)
  {
    if (a2)
    {
      CFDataGetBytePtr(a2);
      CFDataGetLength(a2);
      if (!a3)
      {
LABEL_12:
        v15 = aks_verify_password_memento();
        goto LABEL_15;
      }
    }
    else if (!a3)
    {
      goto LABEL_12;
    }
    CFDataGetBytePtr(a3);
    CFDataGetLength(a3);
    goto LABEL_12;
  }
  if (!a2)
  {
    if (!a3)
      goto LABEL_14;
    goto LABEL_10;
  }
  CFDataGetBytePtr(a2);
  CFDataGetLength(a2);
  if (a3)
  {
LABEL_10:
    CFDataGetBytePtr(a3);
    CFDataGetLength(a3);
  }
LABEL_14:
  v15 = aks_verify_password();
LABEL_15:
  if ((_DWORD)v15 != -536362987)
    return convertAKSErrorToMKB(v15);
  MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, a1);
  CFDictionaryAddValue(MutableCopy, CFSTR("VerifyOnly"), (const void *)*MEMORY[0x1E0C9AE50]);
  v17 = MKBUnlockDeviceForACMRef(a2, MutableCopy, a3);
  CFRelease(MutableCopy);
  return v17;
}

const __CFDictionary *should_use_memento(const __CFDictionary *result)
{
  const __CFBoolean *v1;
  CFTypeID v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  if (result)
  {
    result = (const __CFDictionary *)CFDictionaryGetValue(result, CFSTR("UseMementoBlob"));
    if (result)
    {
      v1 = result;
      v2 = CFGetTypeID(result);
      if (v2 == CFBooleanGetTypeID())
      {
        return (const __CFDictionary *)(CFBooleanGetValue(v1) != 0);
      }
      else
      {
        debuglog("should_use_memento", CFSTR("key is of wrong type"), v3, v4, v5, v6, v7, v8, v9);
        return 0;
      }
    }
  }
  return result;
}

uint64_t MKBGetDeviceLockStateIndirect(const __CFDictionary *a1)
{
  uint64_t Int;
  _BOOL8 v3;
  void *v4;
  int v5;
  unsigned int v7;

  Int = 0xFFFFFFFFLL;
  v7 = -1;
  if (a1)
  {
    if (CFDictionaryContainsKey(a1, CFSTR("ExtendedDeviceLockState")))
      v3 = _getBool(a1, CFSTR("ExtendedDeviceLockState")) != 0;
    else
      v3 = 0;
    if (CFDictionaryContainsKey(a1, CFSTR("DeviceHandle")))
      Int = _getInt(a1, CFSTR("DeviceHandle"));
    if (CFDictionaryContainsKey(a1, kMKBUserSessionIDKey))
      Int = _getInt(a1, kMKBUserSessionIDKey);
  }
  else
  {
    v3 = 0;
  }
  +[MKBKeyStoreDevice sharedService](MKBKeyStoreDevice, "sharedService");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "getDeviceLockStateForUser:extendedState:withLockStateInfo:", Int, v3, &v7);

  if (v5)
    return v7;
  else
    return 0xFFFFFFFFLL;
}

uint64_t MKBSetSpacedRepetitionMode(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  +[MKBKeyStoreDevice sharedService](MKBKeyStoreDevice, "sharedService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "setSpacedRepetitionMode:", a1);

  return v3;
}

uint64_t MKBDeviceSetGracePeriod(const __CFData *a1, const __CFDictionary *a2)
{
  CFMutableDictionaryRef Mutable;
  __CFDictionary *v5;
  const void *Value;
  const void *v7;
  CFTypeID v8;
  uint64_t v9;
  char LongLongInt;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if (!Mutable)
    return 4294967291;
  v5 = Mutable;
  Value = CFDictionaryGetValue(a2, CFSTR("GracePeriod"));
  if (Value)
  {
    v7 = Value;
    v8 = CFGetTypeID(Value);
    if (v8 == CFNumberGetTypeID())
      CFDictionarySetValue(v5, CFSTR("GracePeriod"), v7);
  }
  v9 = MKBSetDeviceConfigurations(a1, v5);
  CFRelease(v5);
  LongLongInt = _getLongLongInt(a2, CFSTR("GracePeriod"));
  debuglog("MKBDeviceSetGracePeriod", CFSTR("MKBDeviceSetGracePeriod: To (%lld)AKS return Value is %d\n"), v11, v12, v13, v14, v15, v16, LongLongInt);
  return v9;
}

uint64_t MKBKeyBagKeyStashSupport(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  debuglog("MKBKeyBagKeyStashSupport", CFSTR("result = %d"), a3, a4, a5, a6, a7, a8, 0);
  return 0;
}

uint64_t MKBKeyBagKeyStashCreateWithOpts(const __CFDictionary *a1, uint64_t a2, const __CFData *a3, const __CFData *a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  int v15;
  _BOOL4 v16;
  unsigned int v17;
  uint64_t v18;
  const void *Value;
  const void *v20;
  CFTypeID v21;
  unsigned __int8 *BytePtr;
  CFIndex Length;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  CFIndex v29;
  const UInt8 *v30;
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
  uint64_t v43;
  void *v44;
  uint64_t v45;
  char v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  char v54;
  unsigned int v55;

  handleToUse(0);
  v14 = ShouldSkipSE(a1);
  v55 = 0;
  if ((_DWORD)a2 && (a3 != 0) == (a4 != 0))
  {
    debuglog("MKBKeyBagKeyStashCreateWithOpts", CFSTR("passcode and acm are mutually exclusive"), v8, v9, v10, v11, v12, v13, v54);
    v45 = 4294967279;
  }
  else
  {
    if (_get_userid_from_options(a1, &v55))
      v15 = 2;
    else
      v15 = 0;
    v16 = a3 != 0;
    v17 = v15 | v16;
    if (!a3)
      a3 = a4;
    if (v14)
      v18 = v17 | 4;
    else
      v18 = v17;
    if (a1)
    {
      Value = CFDictionaryGetValue(a1, CFSTR("Manifest"));
      if (Value)
      {
        v20 = Value;
        v21 = CFGetTypeID(Value);
        if (v21 != CFDataGetTypeID())
        {
          v47 = CFGetTypeID(v20);
          debuglog("MKBKeyBagKeyStashCreateWithOpts", CFSTR("manifest is of wrong type %lu"), v48, v49, v50, v51, v52, v53, v47);
          v45 = 0xFFFFFFFFLL;
          goto LABEL_19;
        }
        BytePtr = (unsigned __int8 *)CFDataGetBytePtr((CFDataRef)v20);
        Length = CFDataGetLength((CFDataRef)v20);
        log_blob((char)"first manifest", BytePtr, Length, v24, v25, v26, v27, v28);
        v29 = CFDataGetLength((CFDataRef)v20);
        v30 = CFDataGetBytePtr((CFDataRef)v20);
        if (!quick_der_check((uint64_t)v30, v29))
        {
          v45 = 4294967277;
          goto LABEL_19;
        }
        if (a3)
        {
          CFDataGetBytePtr(a3);
          CFDataGetLength(a3);
        }
        CFDataGetBytePtr((CFDataRef)v20);
        CFDataGetLength((CFDataRef)v20);
        v37 = aks_migrate_s_key();
        if ((_DWORD)v37)
        {
          v45 = v37;
          debuglog("MKBKeyBagKeyStashCreateWithOpts", CFSTR("failed to migrate skey, opts: %u"), v38, v39, v40, v41, v42, v43, v16);
          goto LABEL_19;
        }
      }
    }
    +[MKBKeyStoreDevice sharedService](MKBKeyStoreDevice, "sharedService");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = objc_msgSend(v44, "stashCreateWithSecret:withMode:withUID:WithFlags:", a3, a2, v55, v18);

  }
LABEL_19:
  debuglog("MKBKeyBagKeyStashCreateWithOpts", CFSTR("result = %d (stash_mode:%d, uid:%d, flags:0x%x)"), v31, v32, v33, v34, v35, v36, v45);
  return v45;
}

const __CFDictionary *ShouldSkipSE(const __CFDictionary *result)
{
  const __CFBoolean *v1;
  CFTypeID v2;

  if (result)
  {
    result = (const __CFDictionary *)CFDictionaryGetValue(result, CFSTR("SkipSE"));
    if (result)
    {
      v1 = result;
      v2 = CFGetTypeID(result);
      if (v2 == CFBooleanGetTypeID())
        return (const __CFDictionary *)(CFBooleanGetValue(v1) != 0);
      else
        return 0;
    }
  }
  return result;
}

void log_blob(char a1, unsigned __int8 *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8;
  uint64_t v10;
  uint64_t v11;
  unsigned __int8 *v12;
  char *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;

  v8 = a3;
  debuglog("log_blob", CFSTR("%s (%d):\n"), a3, a4, a5, a6, a7, a8, a1);
  if (v8 >= 1)
  {
    do
    {
      if (v8 >= 64)
        v10 = 64;
      else
        v10 = v8;
      v11 = v10;
      v12 = a2;
      v13 = (char *)&log_blob_buf;
      do
      {
        v14 = *v12++;
        snprintf(v13, 3uLL, "%02x", v14);
        v13 += 2;
        --v11;
      }
      while (v11);
      debuglog("log_blob", CFSTR("%d: %s\n"), v15, v16, v17, v18, v19, v20, v10);
      a2 += v10;
      v21 = __OFSUB__(v8, (_DWORD)v10);
      v8 -= v10;
    }
    while (!((v8 < 0) ^ v21 | (v8 == 0)));
  }
}

BOOL quick_der_check(uint64_t a1, uint64_t a2)
{
  unint64_t v2;
  unint64_t v3;
  BOOL v4;

  v2 = a1 + a2;
  ccder_decode_tag();
  v3 = ccder_decode_len();
  if (v3)
    v4 = v2 > v3;
  else
    v4 = 0;
  return v4 && v2 == v3;
}

uint64_t MKBKeyBagKeyStashCreateWithMode(uint64_t a1, const __CFData *a2)
{
  return MKBKeyBagKeyStashCreateWithOpts(0, a1, 0, a2);
}

uint64_t MKBKeyBagKeyStashCreate(const __CFData *a1)
{
  return MKBKeyBagKeyStashCreateWithOpts(0, 1, 0, a1);
}

uint64_t MKBKeyBagKeyStashCreateWithManifest(uint64_t a1, const __CFData *a2, const void *a3)
{
  __CFDictionary *Mutable;
  const __CFDictionary *v7;
  uint64_t v8;

  if (!a3)
    return 4294966296;
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if (!Mutable)
    return 4294966296;
  v7 = Mutable;
  CFDictionaryAddValue(Mutable, CFSTR("Manifest"), a3);
  v8 = MKBKeyBagKeyStashCreateWithOpts(v7, a1, 0, a2);
  CFRelease(v7);
  return v8;
}

uint64_t _MKBKeyBagKeyStashSetManifest(const void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  CFTypeID v9;
  CFIndex Length;
  const UInt8 *BytePtr;
  uint64_t v12;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  if (!a1)
    goto LABEL_7;
  v9 = CFGetTypeID(a1);
  if (v9 != CFDataGetTypeID())
  {
    v14 = CFGetTypeID(a1);
    debuglog("_MKBKeyBagKeyStashSetManifest", CFSTR("manifest is of wrong type %lu"), v15, v16, v17, v18, v19, v20, v14);
LABEL_7:
    v12 = 4294966296;
    goto LABEL_5;
  }
  Length = CFDataGetLength((CFDataRef)a1);
  BytePtr = CFDataGetBytePtr((CFDataRef)a1);
  if (quick_der_check((uint64_t)BytePtr, Length))
  {
    CFDataGetBytePtr((CFDataRef)a1);
    CFDataGetLength((CFDataRef)a1);
    v12 = aks_migrate_s_key();
  }
  else
  {
    v12 = 4294967277;
  }
LABEL_5:
  debuglog("_MKBKeyBagKeyStashSetManifest", CFSTR("result = %d"), a3, a4, a5, a6, a7, a8, v12);
  return v12;
}

uint64_t MKBKeyBagKeyStashSetManifest(const void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = handleToUse(0);
  return _MKBKeyBagKeyStashSetManifest(a1, v2, v3, v4, v5, v6, v7, v8);
}

uint64_t MKBKeyBagKeyStashEnableWithManifest(const void *a1)
{
  __CFDictionary *Mutable;
  const __CFDictionary *v3;
  uint64_t v4;

  if (!a1)
    return 4294966296;
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if (!Mutable)
    return 4294966296;
  v3 = Mutable;
  CFDictionaryAddValue(Mutable, CFSTR("Manifest"), a1);
  v4 = MKBKeyBagKeyStashEnableWithOpts(v3);
  CFRelease(v3);
  return v4;
}

uint64_t MKBKeyBagKeyStashEnableWithOpts(const __CFDictionary *a1)
{
  uint64_t v2;
  const void *Value;
  uint64_t v4;
  uint64_t v5;
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
  uint64_t v18;

  v2 = handleToUse(a1);
  if (!a1
    || (Value = CFDictionaryGetValue(a1, CFSTR("Manifest"))) == 0
    || (v10 = _MKBKeyBagKeyStashSetManifest(Value, v2, v4, v5, v6, v7, v8, v9), !(_DWORD)v10))
  {
    v17 = aks_stash_enable();
    v10 = convertAKSErrorToMKB(v17);
  }
  v18 = v10;
  debuglog("MKBKeyBagKeyStashEnableWithOpts", CFSTR("result = %d, (handle:%d)"), v11, v12, v13, v14, v15, v16, v10);
  return v18;
}

uint64_t MKBKeyBagKeyStashEnable()
{
  return MKBKeyBagKeyStashEnableWithOpts(0);
}

uint64_t MKBKeyBagKeyStashCommitWithOpts(const __CFDictionary *a1)
{
  int userid_from_options;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v13;

  v13 = 0;
  userid_from_options = _get_userid_from_options(a1, &v13);
  +[MKBKeyStoreDevice sharedService](MKBKeyStoreDevice, "sharedService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (userid_from_options)
    v4 = 2;
  else
    v4 = 0;
  v5 = objc_msgSend(v2, "stashCommit:WithFlags:", v13, v4);

  debuglog("MKBKeyBagKeyStashCommitWithOpts", CFSTR("result = %d, (uid:%u, flags:0x%x)"), v6, v7, v8, v9, v10, v11, v5);
  return v5;
}

uint64_t MKBKeyBagKeyStashCommit()
{
  return MKBKeyBagKeyStashCommitWithOpts(0);
}

uint64_t MKBKeyBagKeyStashDestroy()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  +[MKBKeyStoreDevice sharedService](MKBKeyStoreDevice, "sharedService");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "stashDestroy");

  debuglog("MKBKeyBagKeyStashDestroy", CFSTR("result = %d"), v2, v3, v4, v5, v6, v7, v1);
  return v1;
}

uint64_t MKBKeyBagKeyStashPersistWithOpts(const __CFDictionary *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  handleToUse(a1);
  v1 = aks_stash_persist();
  v2 = convertAKSErrorToMKB(v1);
  debuglog("MKBKeyBagKeyStashPersistWithOpts", CFSTR("result = %d, (handle:%d)"), v3, v4, v5, v6, v7, v8, v2);
  return v2;
}

uint64_t MKBKeyBagKeyStashPersist()
{
  return MKBKeyBagKeyStashPersistWithOpts(0);
}

__CFDictionary *MKBKeyBagKeyStashVerifyWithOpts(const __CFDictionary *a1)
{
  const void **v1;
  uint64_t v2;
  __CFDictionary *dict;
  const void *v4;
  void *v5;
  int v6;
  CFNumberRef v7;
  uint64_t lock_state;
  unsigned int v10;
  int v11;
  int valuePtr;

  v11 = 0;
  valuePtr = 2;
  v1 = (const void **)MEMORY[0x1E0C9AE40];
  v10 = 0;
  if (_get_userid_from_options(a1, &v10))
    v2 = 2;
  else
    v2 = 0;
  dict = create_dict();
  if (dict)
    valuePtr = 2;
  v4 = *v1;
  +[MKBKeyStoreDevice sharedService](MKBKeyStoreDevice, "sharedService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "stashVerifywithValidity:WithUID:WithFlags:", &valuePtr, v10, v2);

  if (v6)
    valuePtr = 2;
  v7 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberIntType, &valuePtr);
  CFDictionarySetValue(dict, CFSTR("StashBagValidOnDisk"), v7);
  CFRelease(v7);
  lock_state = aks_get_lock_state();
  if (!convertAKSErrorToMKB(lock_state) && (v11 & 0x400) != 0)
    v4 = (const void *)*MEMORY[0x1E0C9AE50];
  CFDictionarySetValue(dict, CFSTR("StashStagedManifest"), v4);
  CFRelease(v4);
  return dict;
}

__CFDictionary *MKBKeyBagKeyStashVerify()
{
  return MKBKeyBagKeyStashVerifyWithOpts(0);
}

uint64_t MKBKeyBagKeyStashLoadWithOpts(const __CFDictionary *a1)
{
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
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  char v17;

  handleToUse(a1);
  if (aks_get_current_sep_measurement())
  {
    debuglog("MKBKeyBagKeyStashLoadWithOpts", CFSTR("failed to fetch measurement\n"), v1, v2, v3, v4, v5, v6, v17);
  }
  else
  {
    log_blob((char)"sep measurement", 0, 0, v2, v3, v4, v5, v6);
    free(0);
  }
  v7 = aks_stash_load();
  if (v7)
    v14 = 4294967287;
  else
    v14 = 0;
  v15 = -9;
  if (!v7)
    v15 = 0;
  debuglog("MKBKeyBagKeyStashLoadWithOpts", CFSTR("result = %d, (handle: %d)"), v8, v9, v10, v11, v12, v13, v15);
  return v14;
}

uint64_t MKBKeyBagKeyStashLoad()
{
  return MKBKeyBagKeyStashLoadWithOpts(0);
}

uint64_t MKBKeyBagChangeSystemSecret(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;

  +[MKBKeyStoreDevice sharedService](MKBKeyStoreDevice, "sharedService");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "changeSystemSecretFromOldPasscode:ToNew:withOpaqueData:withParams:", a1, a2, a3, 0);

  return v7;
}

uint64_t MKBKeyBagChangeSystemSecretOpts(uint64_t a1, uint64_t a2, uint64_t a3, CFDictionaryRef theDict, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  const __CFBoolean *Value;
  const __CFBoolean *v13;
  CFTypeID v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const __CFBoolean *v21;
  const __CFBoolean *v22;
  CFTypeID v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  char v33;

  if (!theDict)
    goto LABEL_10;
  Value = (const __CFBoolean *)CFDictionaryGetValue(theDict, CFSTR("OverrideMemento"));
  v13 = Value;
  if (!Value)
    goto LABEL_5;
  v14 = CFGetTypeID(Value);
  if (v14 != CFBooleanGetTypeID())
  {
    debuglog("__options_to_change_secret_params", CFSTR("key is of wrong type"), v15, v16, v17, v18, v19, v20, v33);
LABEL_10:
    v13 = 0;
    goto LABEL_8;
  }
  v13 = (const __CFBoolean *)(2 * (CFBooleanGetValue(v13) != 0));
LABEL_5:
  v21 = (const __CFBoolean *)CFDictionaryGetValue(theDict, CFSTR("UseMementoBlob"));
  if (v21)
  {
    v22 = v21;
    v23 = CFGetTypeID(v21);
    if (v23 == CFBooleanGetTypeID())
      v13 = (const __CFBoolean *)(v13 | (CFBooleanGetValue(v22) != 0));
    else
      debuglog("__options_to_change_secret_params", CFSTR("key is of wrong type"), v24, v25, v26, v27, v28, v29, v33);
  }
LABEL_8:
  debuglog("MKBKeyBagChangeSystemSecretOpts", CFSTR("params = %d"), a3, (uint64_t)theDict, a5, a6, a7, a8, (char)v13);
  +[MKBKeyStoreDevice sharedService](MKBKeyStoreDevice, "sharedService");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "changeSystemSecretFromOldPasscode:ToNew:withOpaqueData:withParams:", a1, a2, a3, v13);

  return v31;
}

uint64_t MKBKeyBagEffaceMementoBlob(const __CFDictionary *a1)
{
  uint64_t v1;

  handleToUse(a1);
  v1 = aks_memento_efface_blob();
  return convertAKSErrorToMKB(v1);
}

unint64_t MKBKeyBagMementoIsSupported(const __CFDictionary *a1)
{
  const __CFDictionary *v1;
  const __CFDictionary *v2;
  const void *Value;
  unint64_t v4;
  CFTypeID v5;

  v1 = (const __CFDictionary *)MKBGetDeviceConfigurations(a1);
  if (!v1)
    return 0;
  v2 = v1;
  Value = CFDictionaryGetValue(v1, CFSTR("MementoSupported"));
  v4 = (unint64_t)Value;
  if (Value)
  {
    v5 = CFGetTypeID(Value);
    v4 = v5 == CFBooleanGetTypeID() && v4 == *MEMORY[0x1E0C9AE50];
  }
  CFRelease(v2);
  return v4;
}

uint64_t MKBKeyBagMementoGetBlobState(const __CFDictionary *a1, CFMutableDictionaryRef *a2)
{
  const __CFAllocator *v4;
  CFMutableDictionaryRef Mutable;
  CFMutableDictionaryRef v6;
  uint64_t state;
  CFNumberRef v8;
  CFNumberRef v9;
  CFNumberRef v10;
  CFNumberRef v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;

  v14 = 0;
  v15 = 0;
  v4 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if (!Mutable)
    return 0xFFFFFFFFLL;
  v6 = Mutable;
  handleToUse(a1);
  state = aks_memento_get_state();
  if ((_DWORD)state)
  {
    v12 = convertAKSErrorToMKB(state);
LABEL_15:
    CFRelease(v6);
    return v12;
  }
  v8 = CFNumberCreate(v4, kCFNumberSInt8Type, &v14);
  CFDictionarySetValue(v6, CFSTR("MementoBlobSeSlot"), v8);
  if (v8)
    CFRelease(v8);
  v9 = CFNumberCreate(v4, kCFNumberSInt32Type, (char *)&v14 + 4);
  CFDictionarySetValue(v6, CFSTR("MementoBlobFailedAttempts"), v9);
  if (v9)
    CFRelease(v9);
  v10 = CFNumberCreate(v4, kCFNumberSInt32Type, &v15);
  CFDictionarySetValue(v6, CFSTR("MementoBlobMaxUnlockAttempts"), v10);
  if (v10)
    CFRelease(v10);
  v11 = CFNumberCreate(v4, kCFNumberSInt32Type, (char *)&v15 + 4);
  CFDictionarySetValue(v6, CFSTR("MementoBlobState"), v11);
  if (v11)
    CFRelease(v11);
  v12 = 0;
  if (!a2)
    goto LABEL_15;
  *a2 = v6;
  return v12;
}

uint64_t MKBKeyBagCopySytemSecretBlob(uint64_t *a1)
{
  void *v2;
  uint64_t v3;

  +[MKBKeyStoreDevice sharedService](MKBKeyStoreDevice, "sharedService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "copySytemSecretBlob");

  if (a1)
    *a1 = v3;
  return 0;
}

uint64_t MKBKeyBagCopySystemOpaqueBlob(_QWORD *a1)
{
  const void *v2;

  v2 = KBSystemKeyBagCopyOpaqueStuff();
  if (a1)
    *a1 = v2;
  return 0;
}

uint64_t MKBKeyBagCleanupAfterMigration()
{
  const __CFDictionary *Value;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char vars0;

  Value = KBLoadSystemKeyBag();
  if (Value && (Value = (const __CFDictionary *)CFDictionaryGetValue(Value, CFSTR("KeybagxART"))) == 0)
  {
    debuglog("MKBKeyBagCleanupAfterMigration", CFSTR("System KeyBag plist still contains keys! Not xART based! Do not delete!"), v2, v3, v4, v5, v6, v7, vars0);
    return 0xFFFFFFFFLL;
  }
  else
  {
    KBCleanupSystemKeyBag((uint64_t)Value, v1, v2, v3, v4, v5, v6, v7, vars0);
    return 0;
  }
}

uint64_t MKBKeyBagSetSystemSecretBlob(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  +[MKBKeyStoreDevice sharedService](MKBKeyStoreDevice, "sharedService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "SetSystemSecretBlob:", a1);

  return v3;
}

uint64_t MKBAssertionGetTypeID()
{
  pthread_once(&MKBAssertionGetTypeID_typeIDInit, (void (*)(void))__MKBAssertionnRegisterClass);
  return __gMKBAssertionTypeID;
}

uint64_t __MKBAssertionnRegisterClass()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  __gMKBAssertionTypeID = result;
  return result;
}

_DWORD *MKBDeviceLockAssertion(const __CFDictionary *a1, CFErrorRef *a2)
{
  uint64_t Instance;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _DWORD *v11;
  int *v12;
  const void *Value;
  const void *v14;
  int v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const __CFNumber *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const __CFNumber *v30;
  CFTypeID v31;
  unsigned int v32;
  int v33;
  int v34;
  char v36;
  uint64_t valuePtr;

  valuePtr = 0;
  pthread_once(&MKBAssertionGetTypeID_typeIDInit, (void (*)(void))__MKBAssertionnRegisterClass);
  Instance = _CFRuntimeCreateInstance();
  v11 = (_DWORD *)Instance;
  if (!Instance
    || (*(_QWORD *)(Instance + 16) = 0,
        *(_QWORD *)(Instance + 24) = 0,
        v12 = (int *)(Instance + 16),
        *(_DWORD *)(Instance + 16) = 0,
        *(_DWORD *)(Instance + 24) = handleToUse(a1),
        Value = CFDictionaryGetValue(a1, CFSTR("MKBAssertionKey")),
        (v14 = Value) == 0))
  {
    v32 = 12;
    if (!a2)
      goto LABEL_35;
    goto LABEL_34;
  }
  if (CFEqual(Value, CFSTR("Other")))
  {
    v15 = 0;
    v16 = 0;
  }
  else if (CFEqual(v14, CFSTR("RemoteProfile")))
  {
    v15 = 1;
    v16 = 1;
  }
  else if (CFEqual(v14, CFSTR("SBTransient")))
  {
    v15 = 0;
    v16 = 2;
  }
  else if (CFEqual(v14, CFSTR("RestoreFromBackup")))
  {
    v15 = 0;
    v16 = 3;
  }
  else
  {
    if (!CFEqual(v14, CFSTR("TimeMachine")))
    {
      debuglog("MKBDeviceLockAssertion", CFSTR("Invalid assertion type"), v17, v18, v19, v20, v21, v22, v36);
      goto LABEL_18;
    }
    v15 = 0;
    v11[6] = -1;
    v16 = 4;
  }
  *v12 = v16;
  v23 = (const __CFNumber *)CFDictionaryGetValue(a1, CFSTR("MKBAssertionTimeout"));
  if (v23 && (v30 = v23, v31 = CFGetTypeID(v23), v31 == CFNumberGetTypeID()))
  {
    CFNumberGetValue(v30, kCFNumberLongLongType, &valuePtr);
  }
  else if (v15)
  {
    debuglog("MKBDeviceLockAssertion", CFSTR("Status missing from response"), v24, v25, v26, v27, v28, v29, v36);
    goto LABEL_18;
  }
  v33 = aks_assert_hold();
  v32 = 1;
  if (v33 <= -536870175)
  {
    if (v33 == -536870207)
      goto LABEL_33;
    if (v33 != -536870187)
      goto LABEL_18;
    goto LABEL_32;
  }
  if (v33 > -536362995)
  {
    if (v33 != -536362994)
    {
      if (!v33)
      {
        v11[5] = 1;
        v34 = v11[6];
        goto LABEL_38;
      }
      goto LABEL_18;
    }
LABEL_32:
    v32 = 16;
    goto LABEL_33;
  }
  if (v33 != -536870174)
  {
    if (v33 == -536363000)
    {
      v32 = 103;
      if (!a2)
        goto LABEL_35;
      goto LABEL_34;
    }
LABEL_18:
    v32 = 22;
    if (!a2)
      goto LABEL_35;
    goto LABEL_34;
  }
LABEL_33:
  if (a2)
LABEL_34:
    *a2 = CFErrorCreate(0, (CFErrorDomain)*MEMORY[0x1E0C9AFD0], v32, 0);
LABEL_35:
  if (v11)
  {
    CFRelease(v11);
    v11 = 0;
  }
  LOBYTE(v34) = -1;
LABEL_38:
  debuglog("MKBDeviceLockAssertion", CFSTR("handle:%d, asserttype:%d, timeout:%llu, result:%d, ioret: 0x%x, ret:%d"), v5, v6, v7, v8, v9, v10, v34);
  return v11;
}

uint64_t MKBDeviceLockAssertionPromote(uint64_t a1)
{
  uint64_t result;

  if (!a1)
    return 4294967279;
  result = aks_assert_promote();
  if ((int)result > -536870188)
  {
    switch((_DWORD)result)
    {
      case 0xE00002D5:
        return 4294967278;
      case 0:
        return result;
      case 0xE00002E2:
        return 4294967284;
    }
    return 0xFFFFFFFFLL;
  }
  if ((_DWORD)result == -536870207)
    return 4294967280;
  if ((_DWORD)result == -536870206)
    return 4294967279;
  return 0xFFFFFFFFLL;
}

const void *MKBDeviceLockAssertionConsume(const __CFDictionary *a1, CFErrorRef *a2)
{
  uint64_t Instance;
  const void *v5;
  _QWORD *v6;
  int v7;
  CFIndex v8;

  pthread_once(&MKBAssertionGetTypeID_typeIDInit, (void (*)(void))__MKBAssertionnRegisterClass);
  Instance = _CFRuntimeCreateInstance();
  if (Instance)
  {
    v5 = (const void *)Instance;
    *(_QWORD *)(Instance + 16) = 0;
    *(_QWORD *)(Instance + 24) = 0;
    v6 = (_QWORD *)(Instance + 16);
    *(_DWORD *)(Instance + 24) = handleToUse(a1);
    v7 = aks_assert_consume();
    v8 = 1;
    if (v7 <= -536870188)
    {
      if (v7 == -536870207)
        goto LABEL_11;
    }
    else
    {
      switch(v7)
      {
        case 0:
          *v6 = 0x100000000;
          return v5;
        case -536870174:
LABEL_11:
          CFRelease(v5);
          if (a2)
            goto LABEL_12;
          return 0;
        case -536870187:
          v8 = 16;
          goto LABEL_11;
      }
    }
    v8 = 22;
    goto LABEL_11;
  }
  v8 = 12;
  if (a2)
  {
LABEL_12:
    v5 = 0;
    *a2 = CFErrorCreate(0, (CFErrorDomain)*MEMORY[0x1E0C9AFD0], v8, 0);
    return v5;
  }
  return 0;
}

uint64_t MKBKeyBagUnload()
{
  return 4294967290;
}

uint64_t MKBKeyBagGetAKSHandle(uint64_t a1, _DWORD *a2)
{
  uint64_t result;

  result = 0xFFFFFFFFLL;
  if (a1)
  {
    if (a2)
    {
      result = 0;
      *a2 = *(_DWORD *)(a1 + 16);
    }
  }
  return result;
}

uint64_t MKBKeyBagHandleGetTypeID()
{
  if (MKBKeyBagHandleGetTypeID_onlyOnce != -1)
    dispatch_once(&MKBKeyBagHandleGetTypeID_onlyOnce, &__block_literal_global_0);
  return MKBKeyBagHandleGetTypeID___MKBKeyBagHandleTypeID;
}

uint64_t MKBKeyBagCreateEscrow(const __CFData *a1, uint64_t *a2)
{
  uint64_t escrow_bag;
  uint64_t v6;

  if (a1)
  {
    CFDataGetBytePtr(a1);
    CFDataGetLength(a1);
  }
  escrow_bag = aks_create_escrow_bag();
  if ((_DWORD)escrow_bag)
    return convertAKSErrorToMKB(escrow_bag);
  v6 = __kbHandleWithKernelHandle(0, 0);
  *a2 = v6;
  if (v6)
    return 0;
  else
    return 4294967291;
}

uint64_t __kbHandleWithKernelHandle(int a1, char a2)
{
  uint64_t result;

  if (MKBKeyBagHandleGetTypeID_onlyOnce != -1)
    dispatch_once(&MKBKeyBagHandleGetTypeID_onlyOnce, &__block_literal_global_0);
  result = _CFRuntimeCreateInstance();
  if (result)
  {
    *(_DWORD *)(result + 16) = a1;
    *(_BYTE *)(result + 20) = a2;
    *(_QWORD *)(result + 24) = 0;
  }
  return result;
}

uint64_t MKBKeyBagCreateEscrowWithAuth(const __CFData *a1, CFDataRef theData, uint64_t *a3)
{
  uint64_t escrow_bag_with_auth;
  uint64_t v8;

  if (theData)
  {
    CFDataGetBytePtr(theData);
    CFDataGetLength(theData);
    if (!a1)
      goto LABEL_5;
    goto LABEL_3;
  }
  if (a1)
  {
LABEL_3:
    CFDataGetBytePtr(a1);
    CFDataGetLength(a1);
  }
LABEL_5:
  escrow_bag_with_auth = aks_create_escrow_bag_with_auth();
  if ((_DWORD)escrow_bag_with_auth)
    return convertAKSErrorToMKB(escrow_bag_with_auth);
  v8 = __kbHandleWithKernelHandle(0, 0);
  *a3 = v8;
  if (v8)
    return 0;
  else
    return 4294967291;
}

uint64_t MKBKeyBagCreateBackup(CFDataRef theData, uint64_t *a2)
{
  uint64_t result;
  uint64_t v5;

  if (theData)
  {
    CFDataGetBytePtr(theData);
    CFDataGetLength(theData);
  }
  result = aks_create_bag();
  if ((_DWORD)result)
    return convertAKSErrorToMKB(result);
  v5 = __kbHandleWithKernelHandle(0, 0);
  *a2 = v5;
  result = v5 ? 0 : 4294967291;
  if (theData && v5)
  {
    if (CFDataGetLength(theData) < 1)
      return 0;
    CFDataGetBytePtr(theData);
    CFDataGetLength(theData);
    result = aks_prederived_create();
    if ((_DWORD)result)
      return convertAKSErrorToMKB(result);
  }
  return result;
}

uint64_t MKBKeyBagCreateOTABackup(const __CFData *a1, uint64_t *a2)
{
  uint64_t bag;
  uint64_t v6;

  if (a1)
  {
    CFDataGetBytePtr(a1);
    CFDataGetLength(a1);
  }
  bag = aks_create_bag();
  if ((_DWORD)bag)
    return convertAKSErrorToMKB(bag);
  v6 = __kbHandleWithKernelHandle(0, 1);
  *a2 = v6;
  if (v6)
    return 0;
  else
    return 4294967291;
}

uint64_t MKBKeyBagRegisterOTABackup(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;

  +[MKBKeyStoreDevice sharedService](MKBKeyStoreDevice, "sharedService");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "registerOTABackup:withSecret:", a1, a2);

  return v5;
}

uint64_t MKBBackupEnableForVolume(uint64_t a1, uint64_t a2, _QWORD *a3, CFDataRef *a4)
{
  void *v8;
  uint64_t v9;
  const __CFData *v10;
  id v12;

  +[MKBKeyStoreDevice sharedService](MKBKeyStoreDevice, "sharedService");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v9 = objc_msgSend(v8, "enableBackupForVolume:withSecret:bagData:", a1, a2, &v12);
  v10 = (const __CFData *)v12;

  if (a4 && v10)
    v9 = MKBBackupCopyBackupBagUUIDForBag(v10, a4);
  if (!(_DWORD)v9)
    *a3 = v10;

  return v9;
}

uint64_t MKBBackupCopyBackupBagUUIDForBag(const __CFData *a1, CFDataRef *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  UInt8 bytes[8];
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)bytes = 0;
  v14 = 0;
  CFDataGetBytePtr(a1);
  CFDataGetLength(a1);
  v4 = aks_backup_copy_bag_uuid();
  v11 = v4;
  if ((_DWORD)v4)
    debuglog("MKBBackupCopyBackupBagUUIDForBag", CFSTR("Failed to get backup bag uuid from data: %x"), v5, v6, v7, v8, v9, v10, v4);
  else
    *a2 = CFDataCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], bytes, 16);
  return convertAKSErrorToMKB(v11);
}

uint64_t MKBBackupDisableForVolume(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  +[MKBKeyStoreDevice sharedService](MKBKeyStoreDevice, "sharedService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "disableBackupForVolume:", a1);

  return v3;
}

uint64_t MKBBackupCopyBackupBagUUIDForVolume(const __CFData *a1, CFDataRef *a2)
{
  const unsigned __int8 *BytePtr;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  UInt8 bytes[8];
  uint64_t v14;
  uuid_t dst;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  memset(dst, 0, sizeof(dst));
  *(_QWORD *)bytes = 0;
  v14 = 0;
  BytePtr = CFDataGetBytePtr(a1);
  uuid_copy(dst, BytePtr);
  v4 = aks_backup_copy_current_bag_uuid();
  v11 = v4;
  if ((_DWORD)v4)
    debuglog("MKBBackupCopyBackupBagUUIDForVolume", CFSTR("Failed to get backup bag uuid for volume: %x"), v5, v6, v7, v8, v9, v10, v4);
  else
    *a2 = CFDataCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], bytes, 16);
  return convertAKSErrorToMKB(v11);
}

uint64_t MKBKeyBagLock()
{
  return aks_lock_bag();
}

uint64_t MKBKeyBagUnlock(uint64_t a1, CFDataRef theData)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;

  if (*(_QWORD *)(a1 + 24))
  {
    if (theData)
    {
      CFDataGetBytePtr(theData);
      CFDataGetLength(theData);
    }
    v4 = aks_prederived_unlock_keybag();
    if ((_DWORD)v4)
    {
      v11 = v4;
      debuglog("MKBKeyBagUnlock", CFSTR("aks_prederived_unlock_keybag() returned %d"), v5, v6, v7, v8, v9, v10, v4);
      return convertAKSErrorToMKB(v11);
    }
  }
  else
  {
    if (theData)
    {
      CFDataGetBytePtr(theData);
      CFDataGetLength(theData);
    }
    v13 = aks_unlock_bag();
    if ((_DWORD)v13)
    {
      v14 = v13;
      debuglog("MKBKeyBagUnlock", CFSTR("aks_unlock_bag() returned %d"), v5, v6, v7, v8, v9, v10, v13);
      return convertAKSErrorToMKB(v14);
    }
  }
  debuglog("MKBKeyBagUnlock", CFSTR("unlocked bag %d"), v5, v6, v7, v8, v9, v10, *(_DWORD *)(a1 + 16));
  return convertAKSErrorToMKB(0);
}

uint64_t MKBKeyBagCopyData(uint64_t a1, CFDataRef *a2)
{
  CFDataRef v4;

  if (aks_save_bag())
    return 0xFFFFFFFFLL;
  if (a2)
  {
    v4 = CFDataCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0, (CFAllocatorRef)*MEMORY[0x1E0C9AE00]);
    *a2 = v4;
    if (!v4)
      return 4294967291;
  }
  return 0;
}

uint64_t MKBKeyBagCreateWithData(const __CFData *a1, uint64_t *a2)
{
  uint64_t v5;

  if (!a1)
    return 0xFFFFFFFFLL;
  CFDataGetBytePtr(a1);
  CFDataGetLength(a1);
  if (aks_load_bag())
    return 0xFFFFFFFFLL;
  v5 = __kbHandleWithKernelHandle(0, 0);
  *a2 = v5;
  if (!v5)
    return 4294967291;
  aks_prederived_is_enabled();
  return 0;
}

uint64_t MKBOTABackupKeyBag()
{
  return __kbHandleWithKernelHandle(-2, 1);
}

uint64_t MKBKeyBagChangeSecret(uint64_t a1, CFDataRef theData, const __CFData *a3)
{
  uint64_t v5;

  if (!*(_QWORD *)(a1 + 24))
  {
    if (theData)
    {
      CFDataGetBytePtr(theData);
      CFDataGetLength(theData);
      if (!a3)
      {
LABEL_11:
        v5 = aks_change_secret();
        return convertAKSErrorToMKB(v5);
      }
    }
    else if (!a3)
    {
      goto LABEL_11;
    }
    CFDataGetBytePtr(a3);
    CFDataGetLength(a3);
    goto LABEL_11;
  }
  if (!theData)
  {
    if (!a3)
      goto LABEL_9;
    goto LABEL_4;
  }
  CFDataGetBytePtr(theData);
  CFDataGetLength(theData);
  if (a3)
  {
LABEL_4:
    CFDataGetBytePtr(a3);
    CFDataGetLength(a3);
  }
LABEL_9:
  v5 = aks_prederived_change_secret();
  return convertAKSErrorToMKB(v5);
}

uint64_t MKBKeyBagRelease(const void *a1)
{
  CFRelease(a1);
  return 0;
}

uint64_t MKBDeviceObliterateClassDKey()
{
  uint64_t v0;

  v0 = aks_obliterate_class_d();
  return convertAKSErrorToMKB(v0);
}

uint64_t MKBKeyBagCreateSystemUnwrapped(const __CFData *a1, const char *a2)
{
  return _MKBKeyBagCreateSystem(a1, a2);
}

uint64_t _MKBKeyBagCreateSystem(const __CFData *a1, const char *a2)
{
  uint64_t v4;
  uint64_t v5;
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
  uint64_t bag;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v40;
  char v41;
  stat v42;
  int v43;
  char __str[1025];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  if (!MKBDeviceSupportsEnhancedAPFS())
  {
    v43 = 0;
    memset(&v42, 0, sizeof(v42));
    snprintf(__str, 0x401uLL, "%s/%s/%s.kb", a2, "keybags", "systembag");
    if (!stat(__str, &v42))
    {
      debuglog("_MKBKeyBagCreateSystem", CFSTR("%s already exists"), v11, v12, v13, v14, v15, v16, (char)__str);
      return 4294967292;
    }
    if (a1)
    {
      CFDataGetBytePtr(a1);
      CFDataGetLength(a1);
    }
    bag = aks_create_bag();
    if ((_DWORD)bag)
    {
      v40 = bag;
      debuglog("_MKBKeyBagCreateSystem", CFSTR("AKS can't create bag: %08x"), v18, v19, v20, v21, v22, v23, bag);
    }
    else
    {
      v24 = aks_set_system();
      if (!(_DWORD)v24)
      {
        v31 = KBSaveSystemBagHandle(0, a2, 0, 0, 0);
        if ((_DWORD)v31)
        {
          v10 = v31;
          debuglog("_MKBKeyBagCreateSystem", CFSTR("Can't save the bag: %d"), v32, v33, v34, v35, v36, v37, v31);
          goto LABEL_14;
        }
        if ((MKBDeviceSupportsEnhancedAPFS() & 1) != 0)
        {
          v10 = 0;
LABEL_14:
          aks_unload_bag();
          return v10;
        }
        v38 = KBMapDeviceBag(a2, 0);
LABEL_13:
        v10 = v38;
        goto LABEL_14;
      }
      v40 = v24;
      debuglog("_MKBKeyBagCreateSystem", CFSTR("Can't set the system bag: %08x"), v25, v26, v27, v28, v29, v30, v24);
    }
    v38 = convertAKSErrorToMKB(v40);
    goto LABEL_13;
  }
  debuglog("_MKBKeyBagCreateSystem", CFSTR("_MKBKeyBagCreateSystem does nothing, returning success"), v4, v5, v6, v7, v8, v9, v41);
  return 0;
}

uint64_t MKBKeyBagCreateSystem(const __CFData *a1, const char *a2)
{
  return _MKBKeyBagCreateSystem(a1, a2);
}

uint64_t _MKBKeyBagChangeSystemSecretDirect(const __CFData *a1, const __CFData *a2, const void *a3)
{
  const UInt8 *BytePtr;
  CFIndex Length;
  const UInt8 *v8;
  CFIndex v9;

  BytePtr = CFDataGetBytePtr(a1);
  Length = CFDataGetLength(a1);
  v8 = CFDataGetBytePtr(a2);
  v9 = CFDataGetLength(a2);
  return KBChangeSystemSecret(0, 0, (uint64_t)BytePtr, Length, (const __CFData *)v8, v9, a3, 0);
}

uint64_t MKBKeyBagPerformRecovery(const __CFData *a1, const __CFDictionary *a2)
{
  void *v4;
  uint64_t v5;
  void *v6;

  +[MKBKeyStoreDevice sharedService](MKBKeyStoreDevice, "sharedService");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "Event:", 4);

  handleToUse(a2);
  if (a1)
  {
    CFDataGetBytePtr(a1);
    CFDataGetLength(a1);
    CFDataGetBytePtr(a1);
    CFDataGetLength(a1);
  }
  v5 = aks_change_secret();
  if ((_DWORD)v5 == -536362987)
  {
    +[MKBKeyStoreDevice sharedService](MKBKeyStoreDevice, "sharedService");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "SeshatRecover:", a1);

  }
  return convertAKSErrorToMKB(v5);
}

uint64_t make_random_key(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 1072))
    return 0;
  if (SecRandomCopyBytes((SecRandomRef)*MEMORY[0x1E0CD7000], 0x20uLL, (void *)(a1 + 1036)))
    return 0xFFFFFFFFLL;
  if (CCCryptorCreate(0, 0, 1u, (const void *)(a1 + 1036), 0x20uLL, 0, (CCCryptorRef *)(a1 + 1072)))
    return 0xFFFFFFFFLL;
  return 0;
}

uint64_t MKBFileOpenForBackup(const __CFString *a1, _QWORD *a2)
{
  char *v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  int v15;

  v4 = (char *)malloc_type_malloc(0x558uLL, 0x10A004079D672F0uLL);
  if (!v4)
    return 4294967291;
  v5 = v4;
  bzero(v4, 0x558uLL);
  v6 = 0xFFFFFFFFLL;
  *((_DWORD *)v5 + 257) = -1;
  if (!CFStringGetCString(a1, v5, 1025, 0x8000100u))
    goto LABEL_17;
  if (stat(v5, (stat *)(v5 + 1088)))
    goto LABEL_16;
  v14 = open(v5, 256);
  *((_DWORD *)v5 + 257) = v14;
  if (v14 == -1)
  {
    if (*__error() == 1)
    {
      v14 = open_dprotected_np(v5, 256, 0, 1);
      *((_DWORD *)v5 + 257) = v14;
      if (v14 != -1)
      {
        v5[1080] = 1;
        goto LABEL_9;
      }
LABEL_16:
      v6 = 4294967290;
LABEL_17:
      MKBFileClose(v5, v7, v8, v9, v10, v11, v12, v13);
      return v6;
    }
    v14 = *((_DWORD *)v5 + 257);
    if (v14 == -1)
      goto LABEL_16;
  }
LABEL_9:
  v15 = fcntl(v14, 63);
  *((_DWORD *)v5 + 308) = v15;
  if (v15 == -1)
    goto LABEL_16;
  if ((v15 - 8) < 0xFFFFFFF9)
  {
    v6 = 0xFFFFFFFFLL;
    goto LABEL_17;
  }
  if ((v15 - 1) >= 2 && v5[1080])
  {
    close(*((_DWORD *)v5 + 257));
    return 4294967294;
  }
  else
  {
    v6 = 0;
    *a2 = v5;
  }
  return v6;
}

uint64_t MKBFileClose(_DWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v9;
  _CCCryptor *v10;
  uint64_t v11;
  char v13;

  v9 = a1[257];
  if (v9 != -1)
    close(v9);
  v10 = (_CCCryptor *)*((_QWORD *)a1 + 134);
  if (v10)
    CCCryptorRelease(v10);
  v11 = *((_QWORD *)a1 + 170);
  if (v11)
    deallocate_page_aligned_buffer(v11, 4096, a3, a4, a5, a6, a7, a8, v13);
  bzero(a1, 0x558uLL);
  free(a1);
  return 0;
}

uint64_t MKBFileCreateForRestore(const __CFString *a1, int a2, CFDataRef theData, _QWORD *a4)
{
  const UInt8 *BytePtr;
  char *v8;
  char *v9;
  CFIndex Length;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  int v20;
  int v21;
  uint64_t v22;
  int *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char buffer[1025];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (!theData)
    return 0xFFFFFFFFLL;
  BytePtr = CFDataGetBytePtr(theData);
  if (!CFStringGetCString(a1, buffer, 1025, 0x8000100u))
    return 0xFFFFFFFFLL;
  v8 = (char *)malloc_type_malloc(0x558uLL, 0x10A004079D672F0uLL);
  if (!v8)
    return 4294967291;
  v9 = v8;
  bzero(v8, 0x558uLL);
  *((_DWORD *)v9 + 257) = -1;
  Length = CFDataGetLength(theData);
  if (Length == 76 || Length == 44)
  {
    v11 = *(_DWORD *)BytePtr;
    CFDataGetLength(theData);
    if (!aks_unwrap_key())
    {
      if (CCCryptorCreate(1u, 0, 1u, v9 + 1036, 0x20uLL, 0, (CCCryptorRef *)v9 + 134))
      {
        v22 = 4294967289;
        goto LABEL_18;
      }
      goto LABEL_8;
    }
LABEL_17:
    v22 = 0xFFFFFFFFLL;
    goto LABEL_18;
  }
  CC_SHA1_Init((CC_SHA1_CTX *)(v9 + 1236));
  v9[1080] = 1;
  *((_DWORD *)v9 + 271) = bswap32(*((_DWORD *)BytePtr + 5));
  v11 = bswap32(*((_DWORD *)BytePtr + 6));
  CFDataGetLength(theData);
  if (aks_unwrap_key())
    goto LABEL_17;
LABEL_8:
  if (v11 == 1)
    v19 = 2;
  else
    v19 = v11;
  if (v19 == 17)
    v20 = 7;
  else
    v20 = v19;
  v21 = open_dprotected_np(buffer, 2817, v20, 0, 420);
  *((_DWORD *)v9 + 257) = v21;
  if (v21 != -1)
  {
    v22 = 0;
    *a4 = v9;
    return v22;
  }
  v24 = __error();
  strerror(*v24);
  debuglog("MKBFileCreateForRestore", CFSTR("Can't create file to restore to (class: %d): %s"), v25, v26, v27, v28, v29, v30, v19);
  v22 = 4294967290;
LABEL_18:
  if (*((_DWORD *)v9 + 257) != -1)
    unlink(buffer);
  MKBFileClose(v9, v12, v13, v14, v15, v16, v17, v18);
  return v22;
}

uint64_t init_ota(uint64_t a1, int a2)
{
  int v4;
  int v5;
  uint64_t result;

  CC_SHA1_Init((CC_SHA1_CTX *)(a1 + 1236));
  if (!a2)
    return 0;
  if (*(_BYTE *)(a1 + 1080) || (*(_DWORD *)(a1 + 1232) - 1) > 1)
    goto LABEL_6;
  v4 = open_dprotected_np((const char *)a1, 256, 0, 1);
  if (v4 != -1)
  {
    v5 = v4;
    close(*(_DWORD *)(a1 + 1028));
    *(_DWORD *)(a1 + 1028) = v5;
    *(_BYTE *)(a1 + 1080) = 1;
LABEL_6:
    result = 0;
    *(_DWORD *)(a1 + 1084) = 4096;
    return result;
  }
  return 4294967290;
}

uint64_t MKBFileEncryptedBlockSize(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 1080))
    return *(unsigned int *)(a1 + 1084);
  else
    return 4096;
}

size_t MKBFileWrite(uint64_t a1, char *data, size_t size, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  size_t v8;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  size_t v14;
  size_t dataOutAvailable;
  unsigned int v16;
  unsigned int v17;
  unsigned int v18;
  unsigned int v19;
  unsigned int v20;
  size_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  CCCryptorStatus v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  off_t v39;
  const __CFString *v40;
  CCCryptorStatus v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  size_t v48;
  int *v50;
  int *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  int *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char dataOut;
  char dataOuta;
  char dataOutb;
  size_t dataOutMoved;
  size_t dataIn;
  unsigned int v70;
  unsigned int v71;
  unsigned __int8 md[8];
  uint64_t v73;
  unsigned int v74;
  uint64_t v75;

  v8 = size;
  v75 = *MEMORY[0x1E0C80C00];
  if (!*(_BYTE *)(a1 + 1080))
  {
    v21 = 0;
    dataOutMoved = 0;
    dataIn = 0;
    if (*(_DWORD *)(a1 + 1032))
      return v21;
    if ((size & 0xF) != 0)
    {
      debuglog("MKBFileWriteTranscrypt", CFSTR("buffer size %zu not a multiple of %d\n"), size, a4, a5, a6, a7, a8, size);
    }
    else if (size)
    {
      v22 = (char *)malloc_type_malloc(size, 0xDC01CF7uLL);
      if (v22)
      {
        v29 = v22;
        v30 = CCCryptorUpdate(*(CCCryptorRef *)(a1 + 1072), data, v8, v22, v8, &dataOutMoved);
        if (v30)
        {
          debuglog("MKBFileWriteTranscrypt", CFSTR("CCCryptorUpdate() failed: %d\n"), v31, v32, v33, v34, v35, v36, v30);
        }
        else
        {
          v21 = writen(*(_DWORD *)(a1 + 1028), v29, dataOutMoved);
          if (v21 == dataOutMoved)
          {
LABEL_36:
            free(v29);
            return v21;
          }
          v51 = __error();
          dataOuta = strerror(*v51);
          debuglog("MKBFileWriteTranscrypt", CFSTR("write failed: %s\n"), v52, v53, v54, v55, v56, v57, dataOuta);
        }
        v21 = -1;
        goto LABEL_36;
      }
      debuglog("MKBFileWriteTranscrypt", CFSTR("Couldn't allocate work buffer of %zu bytes\n"), v23, v24, v25, v26, v27, v28, v8);
    }
    else
    {
      *(_DWORD *)(a1 + 1032) = 1;
      v41 = CCCryptorFinal(*(CCCryptorRef *)(a1 + 1072), md, 0x10uLL, &dataIn);
      if (v41)
      {
        debuglog("MKBFileWriteTranscrypt", CFSTR("CCCryptorFinal() failed: %d\n"), v42, v43, v44, v45, v46, v47, v41);
      }
      else
      {
        v48 = writen(*(_DWORD *)(a1 + 1028), (char *)md, dataIn);
        if (v48 == dataIn)
          return v48;
        v58 = __error();
        dataOutb = strerror(*v58);
        debuglog("MKBFileWriteTranscrypt", CFSTR("write failed: %s\n"), v59, v60, v61, v62, v63, v64, dataOutb);
      }
    }
    return -1;
  }
  if (!*(_QWORD *)(a1 + 1360))
    *(_QWORD *)(a1 + 1360) = allocate_page_aligned_buffer(0x1000uLL);
  if (!v8)
    return v8;
  v11 = v8;
  while (v11 >= 0x1000)
  {
    v12 = *(_QWORD *)(a1 + 1336);
    if (v12 <= 0)
      v13 = -(-v12 & 0xFFF);
    else
      v13 = *(_QWORD *)(a1 + 1336) & 0xFFFLL;
    v14 = 4096 - v13;
    if (v11 >= v14)
      dataOutAvailable = v14;
    else
      dataOutAvailable = v11;
    if (!(v12 % *(unsigned int *)(a1 + 1084)))
    {
      CC_SHA1((const void *)(a1 + 1036), 0x20u, md);
      v16 = *(_DWORD *)(a1 + 1336);
      if ((v16 & 1) != 0)
        v17 = (v16 >> 1) ^ 0x80000061;
      else
        v17 = v16 >> 1;
      v18 = v17 >> 1;
      if ((v17 & 1) != 0)
        v18 = (v17 >> 1) ^ 0x80000061;
      dataIn = __PAIR64__(v18, v17);
      v19 = v18 >> 1;
      if ((v18 & 1) != 0)
        v19 = (v18 >> 1) ^ 0x80000061;
      v20 = v19 >> 1;
      if ((v19 & 1) != 0)
        v20 = (v19 >> 1) ^ 0x80000061;
      v70 = v19;
      v71 = v20;
      if (CCCrypt(0, 0, 0, md, 0x10uLL, 0, &dataIn, 0x10uLL, (void *)(a1 + 1344), 0x10uLL, 0))
        return -1;
    }
    CC_SHA1_Update((CC_SHA1_CTX *)(a1 + 1236), data, dataOutAvailable);
    if (CCCrypt(1u, 0, 0, (const void *)(a1 + 1036), 0x20uLL, (const void *)(a1 + 1344), data, dataOutAvailable, *(void **)(a1 + 1360), dataOutAvailable, 0))
    {
      return -1;
    }
    if ((*(_QWORD *)(a1 + 1336) + dataOutAvailable) % *(unsigned int *)(a1 + 1084))
      *(_OWORD *)(a1 + 1344) = *(_OWORD *)&data[dataOutAvailable - 16];
    if (writen(*(_DWORD *)(a1 + 1028), *(char **)(a1 + 1360), dataOutAvailable) != dataOutAvailable)
    {
      v50 = __error();
      dataOut = strerror(*v50);
      v40 = CFSTR("write failed: %s\n");
      goto LABEL_58;
    }
    data += dataOutAvailable;
    *(_QWORD *)(a1 + 1336) += dataOutAvailable;
    v11 -= dataOutAvailable;
    if (!v11)
      return v8;
  }
  if (v11 != 28)
  {
    v40 = CFSTR("Unknown trailer blob");
LABEL_58:
    debuglog("MKBFileWriteEncrypted", v40, size, a4, a5, a6, a7, a8, dataOut);
    return -1;
  }
  CC_SHA1_Final(md, (CC_SHA1_CTX *)(a1 + 1236));
  if (*((_QWORD *)data + 1) != *(_QWORD *)md
    || *((_QWORD *)data + 2) != v73
    || *((_DWORD *)data + 6) != (unint64_t)v74)
  {
    ftruncate(*(_DWORD *)(a1 + 1028), 0);
    return -1;
  }
  v39 = bswap64(*(_QWORD *)data);
  if (v39 > *(_QWORD *)(a1 + 1336))
  {
    v40 = CFSTR("file cannot be larger than backup");
    goto LABEL_58;
  }
  if (ftruncate(*(_DWORD *)(a1 + 1028), v39))
  {
    v40 = CFSTR("ftruncate() failed");
    goto LABEL_58;
  }
  return v8;
}

uint64_t MKBFileReadEncrypted(uint64_t a1, unsigned __int8 *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v10;
  size_t v13;
  unint64_t v14;
  BOOL v15;
  int *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  char v31;
  stat v32;

  if (*(_DWORD *)(a1 + 1032))
    return 0;
  if (!*(_BYTE *)(a1 + 1080))
    return -1;
  v10 = a3;
  if (!*(_QWORD *)(a1 + 1360))
    *(_QWORD *)(a1 + 1360) = allocate_page_aligned_buffer(0x1000uLL);
  if ((v10 & 0xFFF) != 0)
  {
    debuglog("MKBFileReadEncrypted", CFSTR("Buffer size %zu not multiple of %zu\n"), a3, a4, a5, a6, a7, a8, v10);
    return -1;
  }
  memset(&v32, 0, sizeof(v32));
  if (fstat(*(_DWORD *)(a1 + 1028), &v32) < 0)
  {
    v16 = __error();
    v30 = strerror(*v16);
    debuglog("MKBFileReadEncrypted", CFSTR("fstat() failed:%s\n"), v17, v18, v19, v20, v21, v22, v30);
    return -1;
  }
  if (v10 < 1)
    return 0;
  v8 = 0;
  while (!*(_DWORD *)(a1 + 1032))
  {
    v13 = readn(*(_DWORD *)(a1 + 1028), *(char **)(a1 + 1360), 0x1000uLL);
    if ((v13 & 0x8000000000000000) != 0)
    {
      v23 = __error();
      v31 = strerror(*v23);
      debuglog("MKBFileReadEncrypted", CFSTR("read() failed:%s\n"), v24, v25, v26, v27, v28, v29, v31);
      return -1;
    }
    if (!v13
      || (v14 = (v13 + 4095) & 0xFFFFFFFFFFFFF000,
          memcpy(a2, *(const void **)(a1 + 1360), v14),
          CC_SHA1_Update((CC_SHA1_CTX *)(a1 + 1236), *(const void **)(a1 + 1360), v14),
          (*(_QWORD *)(a1 + 1336) += v14) == 0))
    {
      *(_DWORD *)(a1 + 1032) = 1;
      *(_QWORD *)a2 = bswap64(*(_QWORD *)(a1 + 1184));
      CC_SHA1_Final(a2 + 8, (CC_SHA1_CTX *)(a1 + 1236));
      v14 = 28;
    }
    a2 += v14;
    v8 += v14;
    v15 = v10 > v14;
    if (v10 >= v14)
      v10 -= v14;
    else
      v10 = 0;
    if (!v15)
      return v8;
  }
  return v8;
}

vm_address_t allocate_page_aligned_buffer(vm_size_t size)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v8;
  vm_address_t address;

  address = 0;
  if (vm_allocate(*MEMORY[0x1E0C83DA0], &address, size, -268435455))
    debuglog("allocate_page_aligned_buffer", CFSTR("Failed to allocate page aligned buffer"), v1, v2, v3, v4, v5, v6, v8);
  return address;
}

size_t readn(int a1, char *a2, size_t a3)
{
  size_t v6;
  ssize_t v7;

  if (a3)
  {
    v6 = a3;
    while (1)
    {
      v7 = read(a1, a2, v6);
      if (v7 == -1)
      {
        if (*__error() != 4)
          return -1;
        v7 = 0;
      }
      else if (!v7)
      {
        return a3 - v6;
      }
      a2 += v7;
      v6 -= v7;
      if (!v6)
        return a3 - v6;
    }
  }
  v6 = 0;
  return a3 - v6;
}

uint64_t MKBFileRead(uint64_t a1, unsigned __int8 *a2, int64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  size_t v18;
  int64_t v19;
  CCCryptorStatus v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  size_t v34;
  CCCryptorStatus v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  size_t v42;
  char v43;
  size_t v44;
  size_t dataOutMoved;

  if (*(_BYTE *)(a1 + 1080))
    return MKBFileReadEncrypted(a1, a2, a3, a4, a5, a6, a7, a8);
  v44 = 0;
  dataOutMoved = 0;
  if (make_random_key(a1))
    return -1;
  if ((a3 & 0xF) == 0)
  {
    if (*(_DWORD *)(a1 + 1032))
      return 0;
    v18 = readn(*(_DWORD *)(a1 + 1028), (char *)a2, a3);
    if ((v18 & 0x8000000000000000) != 0)
    {
      v27 = __error();
      v43 = strerror(*v27);
      debuglog("MKBFileReadTranscrypt", CFSTR("read() failed:%s\n"), v28, v29, v30, v31, v32, v33, v43);
      return -1;
    }
    v19 = v18;
    if (v18)
    {
      v20 = CCCryptorUpdate(*(CCCryptorRef *)(a1 + 1072), a2, v18, a2, a3, &dataOutMoved);
      if (v20)
      {
        debuglog("MKBFileReadTranscrypt", CFSTR("CCCryptorUpdate() failed:%d\n"), v21, v22, v23, v24, v25, v26, v20);
        return -1;
      }
      v34 = dataOutMoved;
    }
    else
    {
      v34 = 0;
    }
    if (v19 >= a3)
    {
      v42 = 0;
    }
    else
    {
      *(_DWORD *)(a1 + 1032) = 1;
      v35 = CCCryptorFinal(*(CCCryptorRef *)(a1 + 1072), &a2[v34], a3 - v34, &v44);
      if (v35)
      {
        debuglog("MKBFileReadTranscrypt", CFSTR("CCCCryptorFinal() failed:%d\n"), v36, v37, v38, v39, v40, v41, v35);
        return -1;
      }
      v42 = v44;
      v34 = dataOutMoved;
    }
    return v34 + v42;
  }
  debuglog("MKBFileReadTranscrypt", CFSTR("Buffer size %zu not multiple of %d\n"), v12, v13, v14, v15, v16, v17, a3);
  return -1;
}

uint64_t MKBFileValidateWrappedKey(uint64_t a1, uint64_t a2, CFDataRef theData)
{
  CFIndex Length;
  unsigned int v6;
  const UInt8 *BytePtr;

  if (!theData || !*(_BYTE *)(a2 + 20))
    return 0xFFFFFFFFLL;
  Length = CFDataGetLength(theData);
  if (Length == 76 || Length == 44)
  {
    if (!*(_QWORD *)(a1 + 1072) || (unint64_t)CFDataGetLength(theData) < 4)
      return 0xFFFFFFFFLL;
    v6 = *(_DWORD *)CFDataGetBytePtr(theData);
  }
  else
  {
    if ((unint64_t)CFDataGetLength(theData) < 0x1C)
      return 0xFFFFFFFFLL;
    BytePtr = CFDataGetBytePtr(theData);
    if (*((_DWORD *)BytePtr + 3) != *(_DWORD *)(a1 + 1096)
      || *(_DWORD *)BytePtr != *(_DWORD *)(a1 + 1168)
      || *((_DWORD *)BytePtr + 1) != *(_DWORD *)(a1 + 1176))
    {
      return 0xFFFFFFFFLL;
    }
    v6 = bswap32(*((_DWORD *)CFDataGetBytePtr(theData) + 6));
  }
  if (!init_ota(a1, 1) && *(_DWORD *)(a1 + 1232) == v6)
    return 0;
  return 0xFFFFFFFFLL;
}

uint64_t MKBFileCopyWrappedKey_OTA(int64x2_t *a1, __CFData **a2)
{
  __CFData *Mutable;
  int v5;
  int v6;
  int v7;
  const __CFData *v8;
  const __CFData *v9;
  const UInt8 *BytePtr;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int v17;
  const UInt8 *v18;
  CFIndex Length;
  UInt8 v21[4];
  UInt8 bytes[8];
  __int32 v23;
  uint64_t v24;

  Mutable = CFDataCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
  *(int32x2_t *)bytes = vmovn_s64(a1[73]);
  v23 = a1[68].i32[0];
  v24 = a1[68].i64[1];
  CFDataAppendBytes(Mutable, bytes, 20);
  *(_DWORD *)v21 = bswap32(a1[67].u32[3]);
  CFDataAppendBytes(Mutable, v21, 4);
  if (!a1[67].i8[8] || (v5 = open(a1->i8, 256), v5 < 0))
  {
    v7 = a1[64].i32[1];
    v6 = v7;
  }
  else
  {
    v6 = v5;
    v7 = a1[64].i32[1];
  }
  v8 = MKBCopyCryptoIDKeysForFileDescriptor(v7, 0, 0);
  if (v8)
  {
    v9 = v8;
    if ((unint64_t)CFDataGetLength(v8) >= 8)
    {
      BytePtr = CFDataGetBytePtr(v9);
      v17 = bswap32(*((_DWORD *)BytePtr + 6));
      if (v17 == a1[77].i32[0])
      {
        v18 = BytePtr;
        CFDataAppendBytes(Mutable, BytePtr + 24, 4);
        Length = CFDataGetLength(v9);
        CFDataAppendBytes(Mutable, v18 + 36, Length - 36);
        *a2 = Mutable;
        CFRelease(v9);
        return 0;
      }
      debuglog("MKBFileCopyWrappedKey_OTA", CFSTR("Protection class changed from %d to %d"), v11, v12, v13, v14, v15, v16, v17);
      CFRelease(v9);
    }
  }
  if (v6 != -1)
    close(v6);
  if (Mutable)
    CFRelease(Mutable);
  *a2 = 0;
  return 0xFFFFFFFFLL;
}

CFMutableDataRef MKBCopyCryptoIDKeysForFileDescriptor(int a1, const __CFData *a2, _QWORD *a3)
{
  int v5;
  int *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  CFMutableDataRef v20;
  unsigned __int16 *all_crypto_ids;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unsigned __int16 *v29;
  CFMutableDataRef Mutable;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unsigned __int16 *v38;
  unint64_t v39;
  _QWORD *v40;
  unint64_t v41;
  const UInt8 *BytePtr;
  unint64_t Length;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  const UInt8 *v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  unsigned int v73;
  void *v74;
  void *v75;
  void *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  char v89;
  id v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  void *v98;
  int v99;
  id v100;
  int v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  id v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  char v128;
  id v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  stat *v136;
  uint64_t v137;
  _QWORD *v138;
  const __CFData *v139;
  int v140;
  CFMutableDataRef cf;
  unsigned __int16 *v142;
  void *v143;
  void *v144;
  id v145;
  unsigned __int16 *v146;
  id v147;
  UInt8 bytes[8];
  id v149;
  stat *p_dst;
  const __CFString *v151;
  const __CFString *v152;
  const __CFString *v153;
  const __CFString *v154;
  _QWORD v155[4];
  stat dst;
  unsigned __int8 uu2[8];
  uint64_t v158;
  _QWORD v159[4];

  v5 = a1;
  v159[2] = *MEMORY[0x1E0C80C00];
  v159[0] = 0;
  v159[1] = 0;
  *(_QWORD *)uu2 = 0;
  v158 = 0;
  if (ffsctl(a1, 0x40104A60uLL, v159, 0))
  {
    v6 = __error();
    strerror(*v6);
    debuglog("MKBCopyCryptoIDKeysForFileDescriptor", CFSTR("Can't get volume uuid for fd %d: %s"), v7, v8, v9, v10, v11, v12, v5);
    return 0;
  }
  v13 = aks_backup_copy_current_bag_uuid();
  if (v13)
  {
    debuglog("MKBCopyCryptoIDKeysForFileDescriptor", CFSTR("Error from aks_backup_copy_current_bag_uuid: %d"), v14, v15, v16, v17, v18, v19, v13);
    return 0;
  }
  all_crypto_ids = _apfs_get_all_crypto_ids(v5);
  if (!all_crypto_ids)
  {
    memset(&dst, 0, sizeof(dst));
    if (!fstat(v5, &dst))
      debuglog("MKBCopyCryptoIDKeysForFileDescriptor", CFSTR("file size %lld bytes"), v130, v131, v132, v133, v134, v135, dst.st_size);
    return 0;
  }
  v29 = all_crypto_ids;
  debuglog("MKBCopyCryptoIDKeysForFileDescriptor", CFSTR("found %d extent%s"), v23, v24, v25, v26, v27, v28, all_crypto_ids[4]);
  KBPostAggdDistribution((uint64_t)CFSTR("com.apple.mobile.keybagd.db.file.extents.number"), 0, 0xAu);
  Mutable = CFDataCreateMutable(0, 0);
  v20 = Mutable;
  if (v29[4])
  {
    v138 = a3;
    v37 = 0;
    v144 = 0;
    v146 = v29 + 8;
    v137 = *MEMORY[0x1E0CB2F90];
    v139 = a2;
    v140 = v5;
    cf = Mutable;
    v142 = v29;
    while (1)
    {
      memset(&dst.st_atimespec, 0, 76);
      *(_OWORD *)&dst.st_dev = 0u;
      *(_OWORD *)&dst.st_uid = 0xFFFFFFFFFFFFFFFFLL;
      v38 = &v146[12 * v37];
      v39 = *((_QWORD *)v38 + 2);
      v41 = *((_QWORD *)v38 + 1);
      v40 = v38 + 4;
      *(_QWORD *)bytes = bswap64(v41);
      if (v39 == -1)
        break;
      if ((v39 & 0x8000000000000000) == 0)
      {
        debuglog("MKBCopyCryptoIDKeysForFileDescriptor", CFSTR("looking for backup key for crypto_id 0x%016qx (%d of %u)"), v31, v32, v33, v34, v35, v36, v39);
        if (a2)
        {
          BytePtr = CFDataGetBytePtr(a2);
          Length = CFDataGetLength(a2);
          if (_MKBBackupCheckKey((uint64_t)BytePtr, Length, v44, v45, v46, v47, v48, v49))
          {
            v66 = -19;
          }
          else
          {
            if (Length)
            {
              v56 = 0;
              v57 = BytePtr;
              while (1)
              {
                v58 = bswap32(*((_DWORD *)v57 + 8));
                v59 = bswap64(*((_QWORD *)v57 + 2));
                debuglog("copy_rewrapped_key_from_existing_key", CFSTR("crypto_id = 0x%016llx, extent_size = %llu, key class = %u"), v50, v51, v52, v53, v54, v55, v59);
                if (v59 == v39)
                {
                  debuglog("copy_rewrapped_key_from_existing_key", CFSTR("Found target crypto_id"), v50, v51, v52, v53, v54, v55, (char)v136);
                  if (!uuid_compare(v57, uu2))
                  {
                    __memcpy_chk();
                    v145 = 0;
                    v90 = 0;
                    a2 = v139;
                    v5 = v140;
                    v20 = cf;
                    v29 = v142;
                    goto LABEL_49;
                  }
                  debuglog("copy_rewrapped_key_from_existing_key", CFSTR("Bag uuid mismatch, ignore"), v60, v61, v62, v63, v64, v65, (char)v136);
                }
                v56 += v58 + 44;
                v57 = &BytePtr[v56];
                if (v56 >= Length)
                {
                  v66 = -8;
                  a2 = v139;
                  v5 = v140;
                  goto LABEL_25;
                }
              }
            }
            v66 = -8;
          }
LABEL_25:
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MobileKeyBagError"), v66, 0);
          v145 = (id)objc_claimAutoreleasedReturnValue();
          v29 = v142;
        }
        else
        {
          v145 = 0;
        }
        v147 = 0;
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", v159, 16, 0);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        +[MKBKeyStoreDevice sharedService](MKBKeyStoreDevice, "sharedService");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v75, "getBackupkeyForVolume:andCryptoID:withError:", v74, v39, &v147);
        v76 = (void *)objc_claimAutoreleasedReturnValue();

        if (v76)
        {
          debuglog("copy_rewrapped_key_from_db", CFSTR("found rewrapped key in MKB backup db"), v77, v78, v79, v80, v81, v82, (char)v136);
          objc_msgSend(v76, "getBytes:length:", &dst, objc_msgSend(v76, "length"));
          if (uuid_compare((const unsigned __int8 *)&dst, uu2))
          {
            debuglog("copy_rewrapped_key_from_db", CFSTR("key found in db doesn't match current backup bag!!"), v83, v84, v85, v86, v87, v88, (char)v136);
            goto LABEL_29;
          }
          v89 = 1;
        }
        else
        {
LABEL_29:
          v89 = 0;
        }

        v90 = v147;
        if ((v89 & 1) != 0)
        {
          v20 = cf;
          goto LABEL_49;
        }
        v143 = v90;
        v149 = 0;
        p_dst = &dst;
        debuglog("copy_rewrapped_key_from_file", CFSTR("getting wrapped key from aks"), v91, v92, v93, v94, v95, v96, (char)v136);
        v97 = _apfs_copy_wrapped_key_from_file(v5, v39, (CFTypeRef *)&v149);
        if (!v97)
        {
          v100 = v149;
          goto LABEL_43;
        }
        v98 = v97;
        if (v144)
        {
          v136 = &dst;
          v99 = aks_backup_rewrap_ek();
        }
        else
        {
          v99 = aks_backup_rewrap_key();
        }
        v101 = v99;
        free(v98);
        if (v101)
        {
          objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v137, v101, 0);
          v100 = (id)objc_claimAutoreleasedReturnValue();
          debuglog("copy_rewrapped_key_from_file", CFSTR("aks_backup_rewrap_key() failed: %d"), v102, v103, v104, v105, v106, v107, v101);
          goto LABEL_43;
        }
        if (uuid_compare((const unsigned __int8 *)&dst, uu2))
        {
          debuglog("copy_rewrapped_key_from_file", CFSTR("backup key doesn't match current bag uuid!!"), v91, v92, v93, v94, v95, v96, (char)v136);
          v100 = 0;
LABEL_43:
          v108 = v100;
          debuglog("MKBCopyCryptoIDKeysForFileDescriptor", CFSTR("Could not get the backup key for crypto ID 0x%016qx (%d of %u, existing keys: %s, found1:%d, found2:%d, found3:%d)"), v109, v110, v111, v112, v113, v114, v39);
          v115 = (void *)MEMORY[0x1E0CB35C8];
          v151 = CFSTR("cryptoId");
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v39);
          v116 = (void *)objc_claimAutoreleasedReturnValue();
          v155[0] = v116;
          v152 = CFSTR("existingKeyError");
          ObjectOrNull(v145);
          v117 = (void *)objc_claimAutoreleasedReturnValue();
          v155[1] = v117;
          v153 = CFSTR("dbError");
          ObjectOrNull(v143);
          v118 = (void *)objc_claimAutoreleasedReturnValue();
          v155[2] = v118;
          v154 = CFSTR("fileError");
          ObjectOrNull(v108);
          v119 = (void *)objc_claimAutoreleasedReturnValue();
          v155[3] = v119;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v155, &v151, 4);
          v120 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v115, "errorWithDomain:code:userInfo:", CFSTR("MobileKeyBagError"), -8, v120);
          v121 = (void *)objc_claimAutoreleasedReturnValue();

          debuglog("MKBCopyCryptoIDKeysForFileDescriptor", CFSTR("Error: %@"), v122, v123, v124, v125, v126, v127, (char)v121);
          if (v138)
            *v138 = v121;
          free(v144);
          v29 = v142;
          free(v142);
          v20 = cf;
          CFRelease(cf);

          v128 = 0;
          v73 = 0;
          a2 = v139;
          v5 = v140;
          v90 = v143;
        }
        else
        {
          if (bswap64(*(unint64_t *)&dst.st_uid) != v39)
          {
            debuglog("copy_rewrapped_key_from_file", CFSTR("whoa, cryptoID does not match backup_key.inode: %llu vs %llu"), v91, v92, v93, v94, v95, v96, bswap64((unint64_t)v152));
            *(_QWORD *)&p_dst->st_uid = bswap64(v39);
          }
          v5 = v140;
          v20 = cf;
          v90 = v143;
LABEL_49:
          if (LODWORD(dst.st_atimespec.tv_sec))
          {
            v121 = 0;
            v73 = bswap32(dst.st_atimespec.tv_sec);
            v128 = 1;
          }
          else
          {
            v129 = v90;
            debuglog("MKBCopyCryptoIDKeysForFileDescriptor", CFSTR("got zero-length key for non-sparse crypto id"), v91, v92, v93, v94, v95, v96, (char)v136);
            free(v29);
            CFRelease(v20);
            v90 = v129;
            v128 = 0;
            v73 = 0;
            v121 = 0;
          }
        }

        if ((v128 & 1) == 0)
          return 0;
LABEL_53:
        debuglog("MKBCopyCryptoIDKeysForFileDescriptor", CFSTR("got extent size %llu, keysize %d"), v67, v68, v69, v70, v71, v72, *v40);
        CFDataAppendBytes(v20, (const UInt8 *)&dst, v73 + 36);
        CFDataAppendBytes(v20, bytes, 8);
        goto LABEL_54;
      }
      debuglog("MKBCopyCryptoIDKeysForFileDescriptor", CFSTR("looking for ekwk, crypto_id 0x%016qx (%d of %u)"), v31, v32, v33, v34, v35, v36, v39);
      v144 = _apfs_copy_wrapped_key_from_file(v5, v39, 0);
LABEL_54:
      if (++v37 >= (unint64_t)v29[4])
        goto LABEL_60;
    }
    debuglog("MKBCopyCryptoIDKeysForFileDescriptor", CFSTR("found sparse extent (%d of %u)"), v31, v32, v33, v34, v35, v36, v37);
    uuid_copy((unsigned __int8 *)&dst, uu2);
    v73 = 0;
    goto LABEL_53;
  }
  v144 = 0;
LABEL_60:
  free(v144);
  free(v29);
  return v20;
}

uint64_t MKBFileCopyWrappedKey()
{
  uint64_t v0;
  __CFData **v1;
  __CFData **v2;
  int64x2_t *v3;
  uint64_t v4;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __CFData *Mutable;
  __CFData *v17;
  UInt8 bytes[4];
  int length;
  UInt8 length_4;
  uint64_t v21;

  v0 = MEMORY[0x1E0C80A78]();
  v2 = v1;
  v3 = (int64x2_t *)v0;
  v21 = *MEMORY[0x1E0C80C00];
  length = 0x8000;
  if (*(_BYTE *)(v4 + 20) && init_ota(v0, 1))
    return 0xFFFFFFFFLL;
  if (v3[67].i8[8])
    return MKBFileCopyWrappedKey_OTA(v3, v2);
  if (make_random_key((uint64_t)v3))
    return 0xFFFFFFFFLL;
  if (v3[77].i32[0] == 7)
    v7 = 17;
  else
    v7 = v3[77].i32[0];
  *(_DWORD *)bytes = v7;
  v8 = aks_wrap_key();
  v9 = convertAKSErrorToMKB(v8);
  if ((_DWORD)v9)
  {
    v6 = v9;
    debuglog("MKBFileCopyWrappedKey", CFSTR("aks_wrap_key error class: %d (%d) result: %d"), v10, v11, v12, v13, v14, v15, v7);
  }
  else
  {
    Mutable = CFDataCreateMutable(0, 76);
    if (Mutable)
    {
      v17 = Mutable;
      CFDataAppendBytes(Mutable, bytes, 4);
      CFDataAppendBytes(v17, &length_4, length);
      v6 = 0;
      *v2 = v17;
    }
    else
    {
      return 4294967291;
    }
  }
  return v6;
}

uint64_t MKBFileGetFD(uint64_t a1)
{
  return *(unsigned int *)(a1 + 1028);
}

void deallocate_page_aligned_buffer(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  if (MEMORY[0x1B5E341C8](*MEMORY[0x1E0C83DA0], a1, a2))
    debuglog("deallocate_page_aligned_buffer", CFSTR("Failed to deallocate page aligned buffer"), v9, v10, v11, v12, v13, v14, a9);
}

uint64_t MKBBackupOpen(const char *a1, _QWORD *a2)
{
  int v4;
  int *v5;
  int v6;
  int *v7;
  int v8;
  _DWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _DWORD *v16;
  int v17;
  uint64_t result;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  stat v32;

  memset(&v32, 0, sizeof(v32));
  v4 = open_dprotected_np(a1, 256, 0, 1);
  v5 = __error();
  if (v4 == -1)
  {
    v8 = *v5;
    strerror(*v5);
    debuglog("MKBBackupOpen", CFSTR("failed to open_dprotected_np(%s): %s"), v19, v20, v21, v22, v23, v24, (char)a1);
LABEL_10:
    *__error() = v8;
    return 0xFFFFFFFFLL;
  }
  v6 = fstat(v4, &v32);
  v7 = __error();
  v8 = *v7;
  if (v6 == -1)
  {
    strerror(*v7);
    debuglog("MKBBackupOpen", CFSTR("failed to stat(%s): %s"), v25, v26, v27, v28, v29, v30, (char)a1);
LABEL_9:
    close(v4);
    goto LABEL_10;
  }
  v9 = malloc_type_calloc(1uLL, 0x28uLL, 0x1080040265FDEEEuLL);
  if (!v9)
  {
    debuglog("MKBBackupOpen", CFSTR("failed to allocate handle"), v10, v11, v12, v13, v14, v15, v31);
    goto LABEL_9;
  }
  v16 = v9;
  *v9 = v4;
  v17 = open(a1, 256);
  result = 0;
  v16[1] = v17;
  *((_QWORD *)v16 + 1) = 0;
  *((_QWORD *)v16 + 2) = 0;
  *((_QWORD *)v16 + 3) = v32.st_ino;
  *((_QWORD *)v16 + 4) = v32.st_size;
  *a2 = v16;
  return result;
}

uint64_t MKBBackupGetFileDescriptors(_DWORD *a1, _DWORD *a2, _DWORD *a3)
{
  uint64_t result;

  result = 0xFFFFFFFFLL;
  if (a1 && a2)
  {
    if (a3)
    {
      result = 0;
      *a2 = a1[1];
      *a3 = *a1;
    }
  }
  return result;
}

uint64_t MKBBackupCreateFromFileDescriptors(int a1, int a2, int **a3)
{
  int *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int *v13;
  uint64_t result;
  int *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  stat v23;

  memset(&v23, 0, sizeof(v23));
  if (fstat(a2, &v23) == -1)
  {
    v15 = __error();
    strerror(*v15);
    debuglog("MKBBackupCreateFromFileDescriptors", CFSTR("failed to fstat encryptedfd(%d): %s"), v16, v17, v18, v19, v20, v21, a2);
    return 0xFFFFFFFFLL;
  }
  v6 = (int *)malloc_type_calloc(1uLL, 0x28uLL, 0x1080040265FDEEEuLL);
  if (!v6)
  {
    debuglog("MKBBackupCreateFromFileDescriptors", CFSTR("failed to allocate handle"), v7, v8, v9, v10, v11, v12, v22);
    return 0xFFFFFFFFLL;
  }
  v13 = v6;
  result = 0;
  *v13 = a2;
  v13[1] = a1;
  *((_QWORD *)v13 + 1) = 0;
  *((_QWORD *)v13 + 2) = 0;
  *((_QWORD *)v13 + 3) = v23.st_ino;
  *((_QWORD *)v13 + 4) = v23.st_size;
  *a3 = v13;
  return result;
}

uint64_t MKBBackupActualFileSize(uint64_t a1)
{
  return *(_QWORD *)(a1 + 32);
}

unint64_t MKBBackupSize(uint64_t a1)
{
  return (*(_QWORD *)(a1 + 32) + 15) & 0xFFFFFFFFFFFFFFF0;
}

uint64_t MKBBackupPread(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  size_t v8;
  int64_t v12;
  int64_t v13;
  unint64_t v14;
  void *page_aligned_buffer;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int64_t v25;
  int *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int64_t v34;
  char v35;
  char v36;

  v8 = 0;
  if (a3 && (uint64_t)((*(_QWORD *)(a1 + 32) + 15) & 0xFFFFFFFFFFFFFFF0) >= a4)
  {
    v12 = a4 + a3;
    v13 = (a4 + a3 + 4095) & 0xFFFFFFFFFFFFF000;
    v14 = v13 - (a4 & 0xFFFFFFFFFFFFF000);
    if (v13 <= (uint64_t)(a4 & 0xFFFFFFFFFFFFF000))
      return -1;
    page_aligned_buffer = *(void **)(a1 + 8);
    v17 = *(_QWORD *)(a1 + 16);
    if (v14 > v17)
    {
      if (v17 && page_aligned_buffer)
        deallocate_page_aligned_buffer(*(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), a3, a4, a5, a6, a7, a8, v35);
      *(_QWORD *)(a1 + 16) = v14;
      page_aligned_buffer = (void *)allocate_page_aligned_buffer(v13 - (a4 & 0xFFFFFFFFFFFFF000));
      *(_QWORD *)(a1 + 8) = page_aligned_buffer;
    }
    v18 = pread(*(_DWORD *)a1, page_aligned_buffer, v13 - (a4 & 0xFFFFFFFFFFFFF000), a4 & 0xFFFFFFFFFFFFF000);
    if ((v18 & 0x8000000000000000) != 0)
    {
      v26 = __error();
      v36 = strerror(*v26);
      debuglog("MKBBackupPread", CFSTR("pread() failed: %s\n"), v27, v28, v29, v30, v31, v32, v36);
      return -1;
    }
    v25 = *(_QWORD *)(a1 + 32);
    if (v18 < v14 && v13 <= v25)
    {
      debuglog("MKBBackupPread", CFSTR("bytes_read(%ld) < read_size(%ld), but effective_start(%lld) + read_size(%ld) <= file_size(%lld)\n"), v19, v20, v21, v22, v23, v24, v18);
      return -1;
    }
    v34 = (v25 + 15) & 0xFFFFFFFFFFFFFFF0;
    if (v12 <= v34)
      v8 = a3;
    else
      v8 = v34 - a4;
    memcpy(a2, (const void *)(*(_QWORD *)(a1 + 8) + (a4 & 0xFFF)), v8);
  }
  return v8;
}

uint64_t MKBBackupClose(void **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  void *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  char v14;

  v9 = *a1;
  v10 = *((_QWORD *)*a1 + 2);
  if (v10)
  {
    v11 = *((_QWORD *)v9 + 1);
    if (v11)
      deallocate_page_aligned_buffer(v11, v10, a3, a4, a5, a6, a7, a8, v14);
  }
  if (*(_DWORD *)v9 != -1)
    close(*(_DWORD *)v9);
  v12 = *((_DWORD *)v9 + 1);
  if (v12 != -1)
    close(v12);
  free(*a1);
  *a1 = 0;
  return 0;
}

uint64_t MKBBackupValidateKeyUUID(uint64_t a1, CFDataRef theData)
{
  const UInt8 *BytePtr;
  CFIndex Length;
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
  CFDataRef v18;
  const UInt8 *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v28;
  CFDataRef theDataa;

  theDataa = 0;
  BytePtr = CFDataGetBytePtr(theData);
  Length = CFDataGetLength(theData);
  if (_MKBBackupCheckKey((uint64_t)BytePtr, Length, v6, v7, v8, v9, v10, v11))
    return 0xFFFFFFFFLL;
  if (MKBKeyBagCopyUUID(a1, &theDataa))
  {
    debuglog("MKBBackupValidateKeyUUID", CFSTR("Failed to get bag uuid"), v12, v13, v14, v15, v16, v17, v28);
    v18 = theDataa;
LABEL_11:
    if (v18)
      CFRelease(v18);
    return 0xFFFFFFFFLL;
  }
  v18 = theDataa;
  v19 = CFDataGetBytePtr(theDataa);
  if (*(_QWORD *)BytePtr != *(_QWORD *)v19 || *((_QWORD *)BytePtr + 1) != *((_QWORD *)v19 + 1))
  {
    debuglog("MKBBackupValidateKeyUUID", CFSTR("Bag uuid mismatch"), v20, v21, v22, v23, v24, v25, v28);
    goto LABEL_11;
  }
  CFRelease(v18);
  return 0;
}

uint64_t _MKBBackupCheckKey(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unsigned int v20;

  if (a2 <= 0x23)
  {
    debuglog("_MKBBackupCheckKey", CFSTR("corrupt blob size %zu, expected at least %zu"), a3, a4, a5, a6, a7, a8, a2);
    return 0xFFFFFFFFLL;
  }
  v10 = bswap32(*(_DWORD *)(a1 + 32));
  if (v10 + 36 != a2)
  {
    if (v10 + 44 <= a2)
    {
      debuglog("_MKBBackupCheckKey", CFSTR("found extent-based key_blob, size %zu"), a3, a4, a5, a6, a7, a8, a2);
      v18 = 0;
      v19 = a1;
      do
      {
        if (a2 - v18 <= 0x23)
        {
          debuglog("_MKBBackupCheckKey", CFSTR("remaining blob size too short offset=%zu blob_size=%zu"), v12, v13, v14, v15, v16, v17, v18);
          return 0xFFFFFFFFLL;
        }
        v20 = bswap32(*(_DWORD *)(v19 + 32));
        if (v20 >= 0x49)
        {
          debuglog("_MKBBackupCheckKey", CFSTR("wrapped key size too big (%lu>%u)"), v12, v13, v14, v15, v16, v17, a2);
          return 0xFFFFFFFFLL;
        }
        debuglog("_MKBBackupCheckKey", CFSTR("offset = %zu, keysize = %u, extent size = %llu"), v12, v13, v14, v15, v16, v17, v18);
        v18 += v20 + 44;
        v19 = v18 + a1;
      }
      while (v18 < a2);
      if (v18 == a2)
        return 0;
      debuglog("_MKBBackupCheckKey", CFSTR("odd blob size %zu, offset = %zu"), v12, v13, v14, v15, v16, v17, a2);
    }
    else
    {
      debuglog("_MKBBackupCheckKey", CFSTR("odd blob size %zu"), a3, a4, a5, a6, a7, a8, a2);
    }
    return 0xFFFFFFFFLL;
  }
  debuglog("_MKBBackupCheckKey", CFSTR("found single-extent key_blob, size %zu"), a3, a4, a5, a6, a7, a8, a2);
  return 0;
}

uint64_t MKBKeyBagCopyUUID(uint64_t a1, CFDataRef *a2)
{
  uint64_t bag_uuid;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  UInt8 bytes[8];
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)bytes = 0;
  v14 = 0;
  bag_uuid = aks_get_bag_uuid();
  v11 = convertAKSErrorToMKB(bag_uuid);
  if ((_DWORD)v11)
    debuglog("MKBKeyBagCopyUUID", CFSTR("failed to get uuid for handle %d"), v5, v6, v7, v8, v9, v10, *(_DWORD *)(a1 + 16));
  else
    *a2 = CFDataCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], bytes, 16);
  return v11;
}

uint64_t MKBBackupValidateBackupKeyWithUUID(const __CFData *a1, const __CFData *a2)
{
  const UInt8 *BytePtr;
  CFIndex Length;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const UInt8 *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v21;

  BytePtr = CFDataGetBytePtr(a1);
  Length = CFDataGetLength(a1);
  if (!_MKBBackupCheckKey((uint64_t)BytePtr, Length, v6, v7, v8, v9, v10, v11))
  {
    v12 = CFDataGetBytePtr(a2);
    if (*(_QWORD *)BytePtr == *(_QWORD *)v12 && *((_QWORD *)BytePtr + 1) == *((_QWORD *)v12 + 1))
      return 0;
    debuglog("MKBBackupValidateBackupKeyWithUUID", CFSTR("BackupKey uuid mismatch"), v13, v14, v15, v16, v17, v18, v21);
  }
  return 0xFFFFFFFFLL;
}

uint64_t MKBBackupValidateKey(uint64_t a1, CFDataRef theData)
{
  const UInt8 *BytePtr;
  unint64_t Length;
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
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t *v26;
  const UInt8 *v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  int *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  unsigned __int16 *all_crypto_ids;
  char v47[48];
  char out[40];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  BytePtr = CFDataGetBytePtr(theData);
  Length = CFDataGetLength(theData);
  if (_MKBBackupCheckKey((uint64_t)BytePtr, Length, v6, v7, v8, v9, v10, v11))
    return 0xFFFFFFFFLL;
  if (Length < (unint64_t)bswap32(*((_DWORD *)BytePtr + 8)) + 44)
  {
    debuglog("MKBBackupValidateKey", CFSTR("truncated key size: %zd"), v12, v13, v14, v15, v16, v17, Length);
    return 0xFFFFFFFFLL;
  }
  memset(out, 0, 37);
  uuid_unparse(BytePtr, out);
  all_crypto_ids = _apfs_get_all_crypto_ids(*(_DWORD *)a1);
  if (!all_crypto_ids)
  {
    v37 = *(_QWORD *)(a1 + 24);
    v38 = __error();
    strerror(*v38);
    debuglog("MKBBackupValidateKey", CFSTR("Can't get crypto keys for inode %llu (fd %d): %s"), v39, v40, v41, v42, v43, v44, v37);
    return 0xFFFFFFFFLL;
  }
  if (Length)
  {
    v24 = 0;
    v25 = 0;
    v26 = (uint64_t *)(all_crypto_ids + 16);
    v27 = BytePtr;
    while (v24 < all_crypto_ids[4])
    {
      v28 = bswap32(*((_DWORD *)v27 + 8));
      v29 = bswap64(*((_QWORD *)v27 + 2));
      v30 = bswap64(*(_QWORD *)&v27[v28 + 36]);
      memset(v47, 0, 37);
      uuid_unparse(v27, v47);
      debuglog("MKBBackupValidateKey", CFSTR("[%d] crypto_id = 0x%016llx, extent_size = %llu, key class = %u, bag uuid = %s"), v31, v32, v33, v34, v35, v36, v24);
      if (*v26 >= -1)
      {
        if (v29 != *v26)
        {
          debuglog("MKBBackupValidateKey", CFSTR("crypto_id mismatch (0x%016llx != 0x%016llx)"), v18, v19, v20, v21, v22, v23, v29);
          goto LABEL_25;
        }
        if (v30 != *(v26 - 1))
        {
          debuglog("MKBBackupValidateKey", CFSTR("extent_size mismatch (%llu != %llu)"), v18, v19, v20, v21, v22, v23, v30);
          goto LABEL_25;
        }
        if (uuid_compare(v27, BytePtr))
        {
          debuglog("MKBBackupValidateKey", CFSTR("bag uuid mismatch (%s != %s)"), v18, v19, v20, v21, v22, v23, (char)v47);
          goto LABEL_25;
        }
        v25 += v28 + 44;
        v27 = &BytePtr[v25];
      }
      ++v24;
      v26 += 3;
      if (v25 >= Length)
        break;
    }
  }
  else
  {
    LODWORD(v24) = 0;
    v25 = 0;
  }
  if (v25 != Length || (_DWORD)v24 != all_crypto_ids[4])
  {
    debuglog("MKBBackupValidateKey", CFSTR("extent count mismatch i=%d, count=%d, offset=%zu, key_blob_size=%zu"), v18, v19, v20, v21, v22, v23, v24);
LABEL_25:
    free(all_crypto_ids);
    return 0xFFFFFFFFLL;
  }
  free(all_crypto_ids);
  return 0;
}

uint64_t MKBBackupUpdateKeyWithError(int *a1, const __CFData *a2, CFTypeRef *a3, _QWORD *a4)
{
  CFMutableDataRef v6;
  uint64_t result;

  if (!a3)
    return 4294967279;
  v6 = MKBCopyCryptoIDKeysForFileDescriptor(*a1, a2, a4);
  *a3 = v6;
  if (!v6)
    return 0xFFFFFFFFLL;
  if (!a2)
    return 0;
  result = CFEqual(v6, a2);
  if ((_DWORD)result)
  {
    CFRelease(*a3);
    result = 0;
    *a3 = 0;
  }
  return result;
}

uint64_t MKBBackupUpdateKey(int *a1, const __CFData *a2, CFTypeRef *a3)
{
  return MKBBackupUpdateKeyWithError(a1, a2, a3, 0);
}

uint64_t MKBBackupCopyKeyWithError(int *a1, CFMutableDataRef *a2, _QWORD *a3)
{
  CFMutableDataRef v4;
  CFMutableDataRef v5;
  uint64_t result;

  v4 = MKBCopyCryptoIDKeysForFileDescriptor(*a1, 0, a3);
  if (!v4)
    return 0xFFFFFFFFLL;
  v5 = v4;
  result = 0;
  *a2 = v5;
  return result;
}

uint64_t MKBBackupCopyKey(int *a1, CFMutableDataRef *a2)
{
  CFMutableDataRef v3;
  CFMutableDataRef v4;
  uint64_t result;

  v3 = MKBCopyCryptoIDKeysForFileDescriptor(*a1, 0, 0);
  if (!v3)
    return 0xFFFFFFFFLL;
  v4 = v3;
  result = 0;
  *a2 = v4;
  return result;
}

uint64_t MKBBackupCopyBackupKeyUUID(const __CFData *a1, CFDataRef *a2)
{
  const UInt8 *BytePtr;
  CFIndex Length;
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
  CFDataRef v18;
  uint64_t v19;
  char v21;

  BytePtr = CFDataGetBytePtr(a1);
  Length = CFDataGetLength(a1);
  if (_MKBBackupCheckKey((uint64_t)BytePtr, Length, v6, v7, v8, v9, v10, v11))
  {
    debuglog("MKBBackupCopyBackupKeyUUID", CFSTR("Bad key passed in, does not validate"), v12, v13, v14, v15, v16, v17, v21);
    v18 = 0;
    v19 = 0xFFFFFFFFLL;
  }
  else
  {
    v18 = CFDataCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], BytePtr, 16);
    v19 = 0;
  }
  *a2 = v18;
  return v19;
}

uint64_t MKBBackupSetKeyEncryptionModeToXTS(const __CFData *a1)
{
  const UInt8 *BytePtr;
  CFIndex Length;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;

  if (!a1)
    return 0xFFFFFFFFLL;
  BytePtr = CFDataGetBytePtr(a1);
  Length = CFDataGetLength(a1);
  result = _MKBBackupCheckKey((uint64_t)BytePtr, Length, v4, v5, v6, v7, v8, v9);
  if ((_DWORD)result)
    return 0xFFFFFFFFLL;
  *((_BYTE *)BytePtr + 29) = 1;
  return result;
}

uint64_t ANS_AKDF2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  unint64_t v19;
  size_t v20;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  ccaes_cbc_encrypt_mode();
  v12 = ((uint64_t (*)(void))MEMORY[0x1E0C80A78])();
  v14 = &v22 - 2 * v13;
  MEMORY[0x1E0C80A78](v12);
  v17 = &v22 - 2 * v16;
  v18 = 0xFFFFFFFFLL;
  if (a5)
  {
    if (a6)
    {
      if ((a6 & 0xF) == 0)
      {
        if (a4)
        {
          if (a1)
          {
            if (a2)
            {
              if (a3)
              {
                v23 = v15;
                if (!cccmac_init())
                {
                  v24 = 1;
                  if (a6 < 0x10)
                  {
LABEL_15:
                    v18 = 0;
                  }
                  else
                  {
                    v19 = a6 >> 4;
                    v20 = 80 * v23;
                    while (1)
                    {
                      memcpy(v17, v14, v20);
                      if (cccmac_update()
                        || cccmac_update()
                        || cccmac_final_generate())
                      {
                        break;
                      }
                      ++v24;
                      a5 += 16;
                      if (v24 > v19)
                        goto LABEL_15;
                    }
                    v18 = 0xFFFFFFFFLL;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  cc_clear();
  cc_clear();
  return v18;
}

uint64_t ANS_AKDF2_construct_fixed_data(_QWORD *a1, uint64_t a2, char *__s, uint64_t a4)
{
  uint64_t result;
  uint64_t v7;
  uint64_t i;
  char v9;

  result = 0xFFFFFFFFLL;
  if (a2 == 8 && __s && a1 && a4 == 15)
  {
    memset_s(__s, 0xFuLL, 0, 0xFuLL);
    v7 = 0;
    strcpy(__s, "ANS2");
    *(_QWORD *)(__s + 5) = *a1;
    *(_WORD *)(__s + 13) = 1;
    for (i = 14; i != 7; --i)
    {
      v9 = __s[v7];
      __s[v7] = __s[i];
      __s[i] = v9;
      ++v7;
    }
    return 0;
  }
  return result;
}

uint64_t MKBBackupDecryptInPlace(uint64_t a1, const char *a2, off_t a3, CFDataRef theData)
{
  return __MKBBackupDecryptInPlace(0, *(unsigned int *)(a1 + 16), a2, a3, theData);
}

uint64_t __MKBBackupDecryptInPlace(uint64_t a1, uint64_t a2, const char *a3, off_t a4, CFDataRef theData)
{
  const UInt8 *BytePtr;
  unint64_t Length;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  const char *v33;
  int v34;
  vm_address_t page_aligned_buffer;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  off_t v43;
  int v44;
  const UInt8 *v45;
  unsigned int v46;
  uint64_t v47;
  unsigned int v48;
  unsigned int v49;
  char v50;
  int v51;
  char *v52;
  unsigned int v53;
  uint64_t v54;
  char v55;
  int v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char *v63;
  int v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  char *v71;
  unint64_t v72;
  unsigned int v73;
  ssize_t v74;
  ssize_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  int v82;
  uint64_t v83;
  uint64_t i;
  uint64_t v85;
  char *v86;
  off_t v87;
  char *v88;
  char *v89;
  unsigned int v90;
  unsigned int v91;
  unsigned int v92;
  unsigned int v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  int *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  int *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  int *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  const __CFString *v128;
  int *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  int *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  __int128 *v143;
  const char *v144;
  int v145;
  vm_address_t v146;
  __int128 **v147;
  const UInt8 *v148;
  int v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  unint64_t v153;
  off_t v154;
  unint64_t v155;
  int v156;
  const UInt8 *v157;
  unint64_t v158;
  unsigned int v159;
  char *v160;
  char *v161;
  uint64_t v162;
  size_t v163;
  _QWORD iv[2];
  unint64_t dataIn;
  unsigned int v166;
  unsigned int v167;
  __int128 md;
  unint64_t v169;
  uint64_t v170;
  uint64_t v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 data;
  __int128 v177;
  uint64_t v178;

  v178 = *MEMORY[0x1E0C80C00];
  BytePtr = CFDataGetBytePtr(theData);
  Length = CFDataGetLength(theData);
  data = 0u;
  v177 = 0u;
  v163 = 32;
  v175 = 0u;
  v173 = 0u;
  v174 = 0u;
  v172 = 0u;
  v162 = ccaes_xts_decrypt_mode();
  v12 = MEMORY[0x1E0C80A78](v162);
  v14 = (char *)&v143 - v13;
  MEMORY[0x1E0C80A78](v12);
  v16 = (char *)&v143 - v15;
  v170 = 0;
  v171 = 0;
  v23 = _MKBBackupCheckKey((uint64_t)BytePtr, Length, v17, v18, v19, v20, v21, v22);
  v30 = bswap32(*((_DWORD *)BytePtr + 8));
  if (v23)
  {
    debuglog("__MKBBackupDecryptInPlace", CFSTR("corrupt key; blob size %lu, key size %u"),
      v24,
      v25,
      v26,
      v27,
      v28,
      v29,
      Length);
    return 0xFFFFFFFFLL;
  }
  v157 = BytePtr;
  v152 = a1;
  v150 = a2;
  v32 = v30 + 36;
  v33 = "false";
  v153 = v32;
  if (Length > v32)
    v33 = "true";
  debuglog("__MKBBackupDecryptInPlace", CFSTR("extents = %s"), v24, v25, v26, v27, v28, v29, (char)v33);
  v34 = open(a3, 2);
  if (v34 == -1)
  {
    v114 = __error();
    strerror(*v114);
    debuglog("__MKBBackupDecryptInPlace", CFSTR("open(%s) failed: %s"), v115, v116, v117, v118, v119, v120, (char)a3);
    v42 = 0;
LABEL_95:
    v31 = 0xFFFFFFFFLL;
    goto LABEL_81;
  }
  v154 = a4;
  page_aligned_buffer = allocate_page_aligned_buffer(0x8000uLL);
  v42 = page_aligned_buffer;
  if (!page_aligned_buffer)
  {
    debuglog("__MKBBackupDecryptInPlace", CFSTR("Failed to initialize crypto_buffer"), v36, v37, v38, v39, v40, v41, (char)v143);
    goto LABEL_95;
  }
  v161 = v16;
  v148 = &v157[Length];
  if (&v157[Length] <= v157)
    goto LABEL_77;
  v43 = 0;
  v44 = 0;
  v143 = &v177;
  v149 = 1;
  v160 = v14;
  v147 = &v143;
  v156 = v34;
  v146 = page_aligned_buffer;
  v144 = a3;
  v155 = Length;
  while (2)
  {
    v45 = v157;
    v46 = *((_DWORD *)v157 + 8);
    v151 = bswap32(v46);
    v159 = v46;
    if (v46)
    {
      v47 = v42;
      v48 = *((_DWORD *)v157 + 6);
      v49 = bswap32(v48);
      debuglog("__MKBBackupDecryptInPlace", CFSTR("key class %d"), v36, v37, v38, v39, v40, v41, v49);
      v50 = (char)v45;
      if (*((_DWORD *)v45 + 7) == 0x1000000)
      {
        v51 = 0;
      }
      else if (v45[28] == 1)
      {
        v51 = v45[29];
      }
      else
      {
        v51 = v45[28];
      }
      if ((v149 & 1) != 0)
      {
        v53 = v48 == 285212672 ? 7 : v49;
        v54 = v53 == 1 ? 2 : v53;
        if (fcntl(v34, 64, v54))
        {
          v121 = __error();
          strerror(*v121);
          debuglog("__MKBBackupDecryptInPlace", CFSTR("Can't set key class to %d: %s"), v122, v123, v124, v125, v126, v127, v54);
          v31 = 0xFFFFFFFFLL;
          v42 = v47;
          goto LABEL_81;
        }
      }
      v55 = v50 + 36;
      if ((_DWORD)v150 == -1)
      {
        v42 = v47;
        if (aks_backup_unwrap_key())
        {
          debuglog("__MKBBackupDecryptInPlace", CFSTR("Failed to unwrap key (%p,%d) in class %d with keypair: 0x%08x"), v57, v58, v59, v60, v61, v62, v55);
          goto LABEL_99;
        }
      }
      else
      {
        LODWORD(md) = v163;
        v56 = aks_unwrap_key();
        v163 = (int)md;
        v42 = v47;
        if (v56)
        {
          debuglog("__MKBBackupDecryptInPlace", CFSTR("Failed to unwrap key (%p,%d) in class %d with handle %d: 0x%08x"), v57, v58, v59, v60, v61, v62, v55);
LABEL_99:
          v31 = 0xFFFFFFFFLL;
          goto LABEL_81;
        }
      }
      if (v51 != 2)
      {
        v63 = v160;
        if (v51 == 1)
        {
          debuglog("__MKBBackupDecryptInPlace", CFSTR("xts mode"), v57, v58, v59, v60, v61, v62, (char)v143);
          (*(void (**)(uint64_t, char *, uint64_t, __int128 *, __int128 *))(v162 + 24))(v162, v63, 16, &data, v143);
          v149 = 0;
          v44 = 1;
        }
        else
        {
          if (v51)
          {
            debuglog("__MKBBackupDecryptInPlace", CFSTR("error: unexpected encryption mode : %d"), v57, v58, v59, v60, v61, v62, v51);
            goto LABEL_87;
          }
          debuglog("__MKBBackupDecryptInPlace", CFSTR("cbc mode"), v57, v58, v59, v60, v61, v62, (char)v143);
          v44 = 0;
          v149 = 0;
        }
        goto LABEL_38;
      }
      dataIn = 0;
      iv[0] = 0x100000000000000;
      *(_QWORD *)((char *)&md + 7) = 0;
      *(_QWORD *)&md = 0;
      debuglog("__MKBBackupDecryptInPlace", CFSTR("xts ans kdf2 mode"), v57, v58, v59, v60, v61, v62, (char)v143);
      v64 = ANS_AKDF2_construct_fixed_data(&dataIn, 8, (char *)&md, 15);
      v71 = v160;
      if (v64)
      {
        v128 = CFSTR("Failed to construct tweak key fixed data");
      }
      else if (ANS_AKDF2((uint64_t)&data, v163, (uint64_t)&md, 15, (uint64_t)&v172, 0x20uLL))
      {
        v128 = CFSTR("Failed to construct tweak key");
      }
      else if (ANS_AKDF2_construct_fixed_data(iv, 8, (char *)&md, 15))
      {
        v128 = CFSTR("Failed to construct data key fixed data");
      }
      else
      {
        if (!ANS_AKDF2((uint64_t)&data, v163, (uint64_t)&md, 15, (uint64_t)&v174, 0x20uLL))
        {
          (*(void (**)(uint64_t, char *, uint64_t, __int128 *, __int128 *))(v162 + 24))(v162, v71, 32, &v174, &v172);
          v149 = 0;
          v44 = 2;
LABEL_38:
          v52 = (char *)v42;
          goto LABEL_39;
        }
        v128 = CFSTR("Failed to construct data key");
      }
      debuglog("__MKBBackupDecryptInPlace", v128, v65, v66, v67, v68, v69, v70, (char)v143);
      goto LABEL_87;
    }
    v52 = 0;
LABEL_39:
    if (Length <= v153)
    {
      v72 = -1;
    }
    else
    {
      v72 = bswap64(*(_QWORD *)&v157[v151 + 36]);
      debuglog("__MKBBackupDecryptInPlace", CFSTR("extent = %llu bytes"), v36, v37, v38, v39, v40, v41, v72);
    }
    if (!v159)
    {
      if ((uint64_t)(v72 + v43) <= v154)
      {
        *(_QWORD *)&md = 0;
        *((_QWORD *)&md + 1) = v43;
        v169 = v72;
        if (fcntl(v34, 99, &md))
        {
          v136 = __error();
          strerror(*v136);
          debuglog("__MKBBackupDecryptInPlace", CFSTR("F_PUNCHHOLE failed on %s for range (%lld:%llu): %s"), v137, v138, v139, v140, v141, v142, (char)v144);
LABEL_106:
          v31 = 0xFFFFFFFFLL;
LABEL_80:
          v42 = v146;
          goto LABEL_81;
        }
      }
      else if (ftruncate(v34, v43))
      {
        v129 = __error();
        strerror(*v129);
        debuglog("__MKBBackupDecryptInPlace", CFSTR("Failed to shrink %s to %lld: %s"), v130, v131, v132, v133, v134, v135, (char)v144);
        goto LABEL_106;
      }
    }
    v145 = v44;
    v73 = v44 - 1;
    do
    {
      if (v72 >= 0x8000)
        v74 = 0x8000;
      else
        v74 = v72;
      if (v159)
      {
        v75 = pread(v34, v52, v74, v43);
        debuglog("__MKBBackupDecryptInPlace", CFSTR("nbytes = %zd, bytes_read = %zd"), v76, v77, v78, v79, v80, v81, v74);
        if (!v75)
          break;
        if (v75 <= 0)
        {
          v107 = __error();
          strerror(*v107);
          debuglog("__MKBBackupDecryptInPlace", CFSTR("Failed to pread(%zu, %llu) from %s (%s)"), v108, v109, v110, v111, v112, v113, v74);
          goto LABEL_92;
        }
        if ((v75 & 0xF) != 0)
        {
          debuglog("__MKBBackupDecryptInPlace", CFSTR("bytes_read(%zd) not multiple of encryption block size"), v36, v37, v38, v39, v40, v41, v75);
          goto LABEL_92;
        }
        v158 = v72;
        if (((v75 + 4095) & 0xFFFFFFFF000) != 0)
        {
          v82 = 0;
          v83 = v43 >> 12;
          for (i = ((unint64_t)(v75 + 4095) >> 12); i; --i)
          {
            if (v73 > 1)
            {
              CC_SHA1(&data, v163, (unsigned __int8 *)&md);
              v90 = ((v43 + v82) >> 1) ^ 0x80000061;
              if ((v43 & 1) == 0)
                v90 = (v43 + v82) >> 1;
              v91 = v90 >> 1;
              if ((v90 & 1) != 0)
                v91 = (v90 >> 1) ^ 0x80000061;
              dataIn = __PAIR64__(v91, v90);
              v92 = v91 >> 1;
              if ((v91 & 1) != 0)
                v92 = (v91 >> 1) ^ 0x80000061;
              v93 = v92 >> 1;
              if ((v92 & 1) != 0)
                v93 = (v92 >> 1) ^ 0x80000061;
              v166 = v92;
              v167 = v93;
              if (CCCrypt(0, 0, 0, &md, 0x10uLL, 0, &dataIn, 0x10uLL, iv, 0x10uLL, 0)
                || CCCrypt(1u, 0, 0, &data, v163, iv, &v52[v82], 0x1000uLL, &v52[v82], 0x1000uLL, 0))
              {
                v31 = 0xFFFFFFFFLL;
                v34 = v156;
                goto LABEL_80;
              }
            }
            else
            {
              v170 = v83;
              v171 = v83;
              v85 = v162;
              v86 = v160;
              v87 = v43;
              v88 = v161;
              (*(void (**)(char *, char *, uint64_t *))(v162 + 40))(v160, v161, &v170);
              v89 = v88;
              v43 = v87;
              (*(void (**)(char *, char *, uint64_t, char *, char *))(v85 + 48))(v86, v89, 256, &v52[v82 & 0xFFFFF000], &v52[v82 & 0xFFFFF000]);
            }
            v82 += 4096;
            ++v83;
          }
        }
        v34 = v156;
        v74 = pwrite(v156, v52, v75, v43);
        Length = v155;
        v72 = v158;
      }
      else
      {
        v75 = v74;
      }
      if (v74 <= 0)
      {
        debuglog("__MKBBackupDecryptInPlace", CFSTR("Failed to pwrite(%lu, %llu) from %s"), v36, v37, v38, v39, v40, v41, 0);
LABEL_92:
        v31 = 0xFFFFFFFFLL;
        goto LABEL_80;
      }
      if (v75 != v74)
      {
        debuglog("__MKBBackupDecryptInPlace", CFSTR("bytes_read(%lu) != bytes_written(%lu)"), v36, v37, v38, v39, v40, v41, v75);
        goto LABEL_92;
      }
      v43 += v75;
      if (v75 < 1)
        break;
      v72 -= v75;
    }
    while (v72);
    v157 += v151 + 44;
    v42 = v146;
    LOBYTE(a3) = (_BYTE)v144;
    v44 = v145;
    if (v148 > v157)
      continue;
    break;
  }
LABEL_77:
  if (!ftruncate(v34, v154))
  {
    v31 = 0;
    goto LABEL_81;
  }
  debuglog("__MKBBackupDecryptInPlace", CFSTR("Failed to truncate %s to %lld"), v94, v95, v96, v97, v98, v99, (char)a3);
LABEL_87:
  v31 = 0xFFFFFFFFLL;
LABEL_81:
  __memset_chk();
  v173 = 0u;
  v174 = 0u;
  v175 = 0u;
  v172 = 0u;
  cc_clear();
  cc_clear();
  cc_clear();
  if (v42)
    deallocate_page_aligned_buffer(v42, 0x8000, v100, v101, v102, v103, v104, v105, (char)v143);
  if (v34 != -1)
    close(v34);
  return v31;
}

uint64_t MKBOTABackupBagOpen(const __CFData *a1, const __CFData *a2, _QWORD *a3)
{
  _DWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _DWORD *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int bag;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t result;
  char v35;

  v6 = malloc_type_calloc(1uLL, 0x44uLL, 0x100004069DB8102uLL);
  if (v6)
  {
    v13 = v6;
    *v6 = -1;
    CFDataGetBytePtr(a1);
    CFDataGetLength(a1);
    if (a2)
    {
      CFDataGetBytePtr(a2);
      CFDataGetLength(a2);
    }
    if (!aks_backup_unwrap_bag())
    {
      debuglog("MKBOTABackupBagOpen", CFSTR("Unwrapped userland backup bag"), v14, v15, v16, v17, v18, v19, v35);
LABEL_10:
      result = 0;
      *a3 = v13;
      return result;
    }
    CFDataGetBytePtr(a1);
    CFDataGetLength(a1);
    bag = aks_load_bag();
    if (bag)
    {
      debuglog("MKBOTABackupBagOpen", CFSTR("Failed to load in-kernel backup bag: 0x%08x"), v21, v22, v23, v24, v25, v26, bag);
    }
    else
    {
      if (a2)
      {
        CFDataGetBytePtr(a2);
        CFDataGetLength(a2);
      }
      v27 = aks_unlock_bag();
      if (!v27)
        goto LABEL_10;
      debuglog("MKBOTABackupBagOpen", CFSTR("Failed to unlock in-kernel backup bag: 0x%08x"), v28, v29, v30, v31, v32, v33, v27);
    }
    if (*v13 != -1)
      aks_unload_bag();
    free(v13);
  }
  else
  {
    debuglog("MKBOTABackupBagOpen", CFSTR("failed to allocate backup bag handle"), v7, v8, v9, v10, v11, v12, v35);
  }
  return 0xFFFFFFFFLL;
}

uint64_t MKBOTABackupBagClose(char *a1)
{
  if (*(_DWORD *)a1 != -1)
    aks_unload_bag();
  *(_OWORD *)(a1 + 52) = 0u;
  *(_OWORD *)(a1 + 36) = 0u;
  *(_OWORD *)(a1 + 20) = 0u;
  *(_OWORD *)(a1 + 4) = 0u;
  free(a1);
  return 0;
}

uint64_t MKBOTABackupBagCopyUUID(uint64_t a1, CFDataRef *a2)
{
  uint64_t bag_uuid;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  CFDataRef v12;
  UInt8 bytes[8];
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (*(_DWORD *)a1 == -1)
  {
    v12 = CFDataCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const UInt8 *)(a1 + 36), 16);
    v11 = 0;
LABEL_6:
    *a2 = v12;
    return v11;
  }
  *(_QWORD *)bytes = 0;
  v15 = 0;
  bag_uuid = aks_get_bag_uuid();
  v11 = convertAKSErrorToMKB(bag_uuid);
  if (!(_DWORD)v11)
  {
    v12 = CFDataCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], bytes, 16);
    goto LABEL_6;
  }
  debuglog("MKBOTABackupBagCopyUUID", CFSTR("failed to get uuid for handle %d"), v5, v6, v7, v8, v9, v10, *(_DWORD *)a1);
  return v11;
}

uint64_t MKBOTABackupBagIsKernel(_DWORD *a1, BOOL *a2)
{
  *a2 = *a1 != -1;
  return 0;
}

uint64_t MKBOTABackupDecryptInPlace(unsigned int *a1, const char *a2, off_t a3, CFDataRef theData)
{
  return __MKBBackupDecryptInPlace((uint64_t)(a1 + 1), *a1, a2, a3, theData);
}

uint64_t MKBKeyBagChangeSystemSecretWithEscrow(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v10;
  uint64_t v11;

  +[MKBKeyStoreDevice sharedService](MKBKeyStoreDevice, "sharedService");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "ChangeSystemSecretWithEscrow:FromOldPasscode:ToNew:withOpaqueDats:withKeepState:", a1, a2, a3, a5, a4);

  return v11;
}

uint64_t MKBOTABackupStart()
{
  void *v0;
  uint64_t v1;

  +[MKBKeyStoreDevice sharedService](MKBKeyStoreDevice, "sharedService");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "startBackupSessionForVolume:", 0);

  return v1;
}

uint64_t MKBOTABackupStop()
{
  void *v0;
  uint64_t v1;

  +[MKBKeyStoreDevice sharedService](MKBKeyStoreDevice, "sharedService");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "stopBackupSessionForVolume:", 0);

  return v1;
}

uint64_t MKBOTABackupStartForVolume(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  +[MKBKeyStoreDevice sharedService](MKBKeyStoreDevice, "sharedService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "startBackupSessionForVolume:", a1);

  return v3;
}

uint64_t MKBOTABackupStopForVolume(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  +[MKBKeyStoreDevice sharedService](MKBKeyStoreDevice, "sharedService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "stopBackupSessionForVolume:", a1);

  return v3;
}

uint64_t MKBKeyBagChangeSystemGeneration(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;

  +[MKBKeyStoreDevice sharedService](MKBKeyStoreDevice, "sharedService");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "changeClassKeysGenerationWithSecret:withGenerationOption:", a1, a2);

  return v5;
}

uint64_t MKBKeyBagGetSystemGeneration()
{
  if (aks_generation())
    return 4294966296;
  else
    return 0;
}

uint64_t MKBKeyBagIsKeyRolling(_DWORD *a1)
{
  void *v2;
  uint64_t v3;
  int v5;

  v5 = 0;
  +[MKBKeyStoreDevice sharedService](MKBKeyStoreDevice, "sharedService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isKeyRollingWithKeyStatus:", &v5);

  if (a1 && !(_DWORD)v3)
    *a1 = v5;
  return v3;
}

uint64_t MKBKeyBagMigrateFS()
{
  void *v0;
  uint64_t v1;

  +[MKBKeyStoreDevice sharedService](MKBKeyStoreDevice, "sharedService");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "migrateFS");

  return v1;
}

uint64_t MKBPrewarmSPS(char a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  debuglog("MKBPrewarmSPS", CFSTR("Prewarming SPSs with %@"), a3, a4, a5, a6, a7, a8, a1);
  result = aks_prewarm_sps();
  if ((_DWORD)result)
  {
    debuglog("MKBPrewarmSPS", CFSTR("Error prewarming SPSs: %d"), v9, v10, v11, v12, v13, v14, result);
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t MKBForgottenPasscodeEvent()
{
  void *v0;
  uint64_t v1;

  +[MKBKeyStoreDevice sharedService](MKBKeyStoreDevice, "sharedService");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "forgottenPasscodeEvent");

  return v1;
}

void __MKBAssertionFinalize(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v9;

  if (a1)
    v9 = *(_DWORD *)(a1 + 24);
  else
    LOBYTE(v9) = -1;
  debuglog("__MKBAssertionFinalize", CFSTR("dropping lock assertion for: handle:%d, type:%d, status:%d"), a3, a4, a5, a6, a7, a8, v9);
  if (*(_DWORD *)(a1 + 20))
  {
    if (!aks_assert_drop())
      *(_DWORD *)(a1 + 20) = 0;
  }
}

__CFString *__MKBAssertionCopyDescription(unsigned int *a1)
{
  const __CFAllocator *v2;
  const __CFAllocator *v3;
  uint64_t v4;
  const __CFString *v5;
  __CFString *Mutable;
  uint64_t v7;
  CFIndex v8;

  v2 = CFGetAllocator(a1);
  v3 = v2;
  v4 = a1[4];
  if (v4 <= 4)
    v5 = __AssertionTypes[v4];
  else
    v5 = CFSTR("Other");
  Mutable = CFStringCreateMutable(v2, 0);
  v7 = a1[4];
  v8 = CFGetRetainCount(a1);
  CFStringAppendFormat(Mutable, 0, CFSTR("<MKBAssertion %p [%p]> { AssertionType '%@' (%d), Assertion Retain: (%d)"), a1, v3, v5, v7, v8);
  CFStringAppendFormat(Mutable, 0, CFSTR("}"));
  return Mutable;
}

uint64_t __MKBKeyBagHandleFinalize(uint64_t a1)
{
  uint64_t result;

  if (*(_QWORD *)(a1 + 24))
    aks_prederived_free();
  result = *(unsigned int *)(a1 + 16);
  if ((result & 0x80000000) == 0)
  {
    result = aks_unload_bag();
    *(_DWORD *)(a1 + 16) = -1;
  }
  return result;
}

id ObjectOrNull(void *a1)
{
  id v1;
  void *v2;
  id v3;
  void *v4;

  v1 = a1;
  v2 = v1;
  if (v1)
  {
    v3 = v1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;

  return v4;
}

uint64_t KBPostAggdScalar(uint64_t a1, int a2, unsigned int a3)
{
  BOOL v3;

  if (MEMORY[0x1E0CF6398])
    v3 = MEMORY[0x1E0CF63D0] == 0;
  else
    v3 = 1;
  if (v3 || a1 == 0)
    return 0xFFFFFFFFLL;
  if (a3 && arc4random() % a3)
    return 0xFFFFFFFFLL;
  if (a2)
    ADClientSetValueForScalarKey();
  else
    ADClientAddValueForScalarKey();
  return 0;
}

uint64_t KBPostAggdDistribution(uint64_t a1, int a2, unsigned int a3)
{
  BOOL v3;

  if (MEMORY[0x1E0CF63B8])
    v3 = MEMORY[0x1E0CF63C8] == 0;
  else
    v3 = 1;
  if (v3 || a1 == 0)
    return 0xFFFFFFFFLL;
  if (a3 && arc4random() % a3)
    return 0xFFFFFFFFLL;
  if (a2)
    ADClientSetValueForDistributionKey();
  else
    ADClientPushValueForDistributionKey();
  return 0;
}

uint64_t analytics_persist_event(CFStringRef theString1, unsigned int a2, uint64_t a3)
{
  int id;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const __CFDictionary *Mutable;
  const __CFArray *Value;
  const __CFArray *v13;
  CFTypeID v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const __CFAllocator *v21;
  CFMutableArrayRef MutableCopy;
  __CFArray *v23;
  CFNumberRef v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  CFNumberRef v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  CFNumberRef v38;
  __CFArray *v39;
  __CFArray *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  CFNumberRef v47;
  CFNumberRef v48;
  io_registry_entry_t v49;
  CFTypeRef v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  const void *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  int v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  const __CFString *v73;
  const __CFString *v74;
  const __CFDictionary *v75;
  const __CFString *v76;
  char v77;
  int v78;
  uint64_t v79;
  uint64_t valuePtr;

  valuePtr = a3;
  if (!theString1 || a2 && arc4random() % a2)
    return 0xFFFFFFFFLL;
  id = analytics_persistance_report_get_id(theString1);
  v79 = id;
  if (id == -1)
  {
    v73 = CFSTR("unsupported key");
LABEL_32:
    debuglog("analytics_persist_event", v73, v5, v6, v7, v8, v9, v10, v77);
    return 0xFFFFFFFFLL;
  }
  Mutable = CopyPersistedReports();
  if (!Mutable)
  {
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    if (!Mutable)
    {
      v73 = CFSTR("Can't create dict");
      goto LABEL_32;
    }
  }
  Value = (const __CFArray *)CFDictionaryGetValue(Mutable, CFSTR("DATA"));
  if (Value)
  {
    v13 = Value;
    v14 = CFGetTypeID(Value);
    if (v14 != CFArrayGetTypeID())
    {
      v74 = CFSTR("wrong type");
      goto LABEL_45;
    }
    v21 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    MutableCopy = CFArrayCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, v13);
  }
  else
  {
    v21 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    MutableCopy = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]);
  }
  v23 = MutableCopy;
  if (!MutableCopy)
  {
    v74 = CFSTR("unable to allocate array");
LABEL_45:
    debuglog("analytics_persist_event", v74, v15, v16, v17, v18, v19, v20, v77);
    v75 = Mutable;
    goto LABEL_46;
  }
  v24 = CFNumberCreate(v21, kCFNumberSInt64Type, &valuePtr);
  if (!v24)
  {
    debuglog("analytics_persist_event", CFSTR("unable to allocate"), v25, v26, v27, v28, v29, v30, v77);
    CFRelease(Mutable);
    v75 = v23;
LABEL_46:
    CFRelease(v75);
    return 0xFFFFFFFFLL;
  }
  v31 = v24;
  v38 = CFNumberCreate(v21, kCFNumberSInt64Type, &v79);
  if (v38)
  {
    v39 = CFArrayCreateMutable(v21, 0, MEMORY[0x1E0C9B378]);
    v40 = v39;
    if (v39)
    {
      CFArrayAppendValue(v39, v38);
      CFArrayAppendValue(v40, v31);
      CFArrayAppendValue(v23, v40);
      if (CFArrayGetCount(v23) >= 6)
      {
        debuglog("analytics_persist_event", CFSTR("at capacity, discarding oldest data entry"), v41, v42, v43, v44, v45, v46, v77);
        CFArrayRemoveValueAtIndex(v23, 0);
      }
      CFDictionarySetValue(Mutable, CFSTR("DATA"), v23);
      v78 = 0;
      v47 = CFNumberCreate(v21, kCFNumberSInt32Type, &v78);
      if (v47)
      {
        v48 = v47;
        CFDictionarySetValue(Mutable, CFSTR("VERS"), v47);
        v49 = IORegistryEntryFromPath(*MEMORY[0x1E0CBBAA8], "IODeviceTree:/options");
        v50 = convertObjectToBinary(Mutable);
        if (v50)
        {
          v57 = v50;
          if (IORegistryEntrySetCFProperty(v49, CFSTR("mkb-reports"), v50))
          {
            debuglog("SetPersistedReports", CFSTR("cant set"), v58, v59, v60, v61, v62, v63, v77);
            v64 = -1;
          }
          else
          {
            v64 = 0;
          }
          CFRelease(v57);
          if (!v49)
            goto LABEL_23;
        }
        else
        {
          debuglog("SetPersistedReports", CFSTR("Can't serialize dictionary"), v51, v52, v53, v54, v55, v56, v77);
          v64 = -1;
          if (!v49)
            goto LABEL_23;
        }
        IOObjectRelease(v49);
LABEL_23:
        if (v64)
        {
          debuglog("analytics_persist_event", CFSTR("failed to persist dict"), v65, v66, v67, v68, v69, v70, v77);
          v71 = 0xFFFFFFFFLL;
        }
        else
        {
          v71 = 0;
        }
        CFRelease(v48);
        CFRelease(Mutable);
        CFRelease(v31);
        goto LABEL_26;
      }
      v76 = CFSTR("cant allocate mem");
    }
    else
    {
      v76 = CFSTR("cant allocate");
    }
  }
  else
  {
    v40 = 0;
    v76 = CFSTR("unable to allocate");
  }
  debuglog("analytics_persist_event", v76, v32, v33, v34, v35, v36, v37, v77);
  CFRelease(Mutable);
  CFRelease(v31);
  v71 = 0xFFFFFFFFLL;
  if (v38)
LABEL_26:
    CFRelease(v38);
  CFRelease(v23);
  if (v40)
    CFRelease(v40);
  return v71;
}

uint64_t analytics_persistance_report_get_id(CFStringRef theString1)
{
  uint64_t v2;
  CFStringRef *i;

  if (!theString1)
    return 0xFFFFFFFFLL;
  v2 = 0;
  for (i = (CFStringRef *)&persisted_keys_table; !*i || CFStringCompare(theString1, *i, 1uLL); i += 2)
  {
    if (++v2 == 4)
      return 0xFFFFFFFFLL;
  }
  return v2;
}

const __CFDictionary *CopyPersistedReports()
{
  io_registry_entry_t v0;
  io_object_t v1;
  const __CFData *CFProperty;
  const __CFData *v3;
  UInt8 *BytePtr;
  CFIndex Length;
  const __CFDictionary *binary_dict_from_buffer;
  const __CFDictionary *v7;
  const __CFNumber *Value;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const __CFNumber *v15;
  CFTypeID v16;
  const __CFArray *v17;
  const __CFArray *v18;
  CFTypeID v19;
  CFIndex v20;
  const void *ValueAtIndex;
  CFTypeID v22;
  CFIndex v23;
  char v24;
  char v25;
  const void *v26;
  CFTypeID v27;
  const __CFString *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v36;
  char v37;
  int valuePtr;

  v0 = IORegistryEntryFromPath(*MEMORY[0x1E0CBBAA8], "IODeviceTree:/options");
  if (!v0)
    return 0;
  v1 = v0;
  CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(v0, CFSTR("mkb-reports"), (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
  if (!CFProperty)
  {
    IOObjectRelease(v1);
    return 0;
  }
  v3 = CFProperty;
  BytePtr = (UInt8 *)CFDataGetBytePtr(CFProperty);
  Length = CFDataGetLength(v3);
  binary_dict_from_buffer = (const __CFDictionary *)load_binary_dict_from_buffer(BytePtr, Length);
  v7 = binary_dict_from_buffer;
  if (!binary_dict_from_buffer)
    goto LABEL_24;
  Value = (const __CFNumber *)CFDictionaryGetValue(binary_dict_from_buffer, CFSTR("VERS"));
  if (!Value)
  {
    v28 = CFSTR("no version");
LABEL_22:
    debuglog("analytics_persistance_validate_dict", v28, v9, v10, v11, v12, v13, v14, v36);
LABEL_23:
    CFRelease(v7);
    debuglog("CopyPersistedReports", CFSTR("invalid dict"), v29, v30, v31, v32, v33, v34, v37);
    v7 = 0;
    goto LABEL_24;
  }
  v15 = Value;
  v16 = CFGetTypeID(Value);
  if (v16 != CFNumberGetTypeID())
  {
    v28 = CFSTR("version is of wrong type");
    goto LABEL_22;
  }
  valuePtr = 0;
  if (!CFNumberGetValue(v15, kCFNumberSInt32Type, &valuePtr))
  {
    v28 = CFSTR("invalid version format");
    goto LABEL_22;
  }
  if (valuePtr)
  {
    debuglog("analytics_persistance_validate_dict", CFSTR("non-current version %d"), v9, v10, v11, v12, v13, v14, valuePtr);
    goto LABEL_23;
  }
  v17 = (const __CFArray *)CFDictionaryGetValue(v7, CFSTR("DATA"));
  if (!v17)
  {
    v28 = CFSTR("no data");
    goto LABEL_22;
  }
  v18 = v17;
  v19 = CFGetTypeID(v17);
  if (v19 != CFArrayGetTypeID())
  {
    v28 = CFSTR("data is of wrong type");
    goto LABEL_22;
  }
  if (CFArrayGetCount(v18) > 5)
  {
    v28 = CFSTR("too many entries");
    goto LABEL_22;
  }
  if (CFArrayGetCount(v18) >= 1)
  {
    v20 = 0;
    while (2)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(v18, v20);
      v22 = CFGetTypeID(ValueAtIndex);
      if (v22 == CFArrayGetTypeID())
      {
        if (CFArrayGetCount((CFArrayRef)ValueAtIndex) == 2)
        {
          v23 = 0;
          v24 = 1;
          do
          {
            v25 = v24;
            v26 = CFArrayGetValueAtIndex((CFArrayRef)ValueAtIndex, v23);
            if (!v26 || (v27 = CFGetTypeID(v26), v27 != CFNumberGetTypeID()))
            {
              v36 = v23;
              v28 = CFSTR("sub%d is of wrong type");
              goto LABEL_22;
            }
            v24 = 0;
            v23 = 1;
          }
          while ((v25 & 1) != 0);
          if (CFArrayGetCount(v18) > ++v20)
            continue;
          break;
        }
        v28 = CFSTR("sub has unexpected number of data");
      }
      else
      {
        v28 = CFSTR("sub is of wrong type");
      }
      goto LABEL_22;
    }
  }
LABEL_24:
  IOObjectRelease(v1);
  CFRelease(v3);
  return v7;
}

uint64_t analytics_iterate_persisted_eventsWithBlock(uint64_t a1)
{
  const __CFDictionary *v2;
  const __CFDictionary *v3;
  const __CFArray *Value;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const __CFArray *v11;
  CFIndex v12;
  const __CFArray *ValueAtIndex;
  const __CFNumber *v14;
  const __CFNumber *v15;
  uint64_t v17;
  uint64_t v18;
  unint64_t v20;
  uint64_t valuePtr;

  v20 = 0;
  valuePtr = 0;
  if (!a1)
    return 0xFFFFFFFFLL;
  v2 = CopyPersistedReports();
  if (!v2)
    return 0xFFFFFFFFLL;
  v3 = v2;
  Value = (const __CFArray *)CFDictionaryGetValue(v2, CFSTR("DATA"));
  if (Value)
  {
    v11 = Value;
    if (CFArrayGetCount(Value) >= 1)
    {
      v12 = 0;
      do
      {
        ValueAtIndex = (const __CFArray *)CFArrayGetValueAtIndex(v11, v12);
        v14 = (const __CFNumber *)CFArrayGetValueAtIndex(ValueAtIndex, 0);
        CFNumberGetValue(v14, kCFNumberSInt64Type, &v20);
        v15 = (const __CFNumber *)CFArrayGetValueAtIndex(ValueAtIndex, 1);
        CFNumberGetValue(v15, kCFNumberSInt64Type, &valuePtr);
        if (v20 <= 0xFFFFFFFE && (v20 & 0xFFFFFFFC) == 0)
        {
          v17 = *((_QWORD *)&persisted_keys_table + 2 * v20);
          if (v17)
            (*(void (**)(uint64_t, uint64_t, uint64_t, _QWORD, uint64_t))(a1 + 16))(a1, v17, 1, 0, valuePtr);
        }
        ++v12;
      }
      while (CFArrayGetCount(v11) > v12);
    }
    v18 = 0;
  }
  else
  {
    debuglog("analytics_iterate_persisted_eventsWithBlock", CFSTR("no data"), v5, v6, v7, v8, v9, v10, v20);
    v18 = 0xFFFFFFFFLL;
  }
  CFRelease(v3);
  return v18;
}

uint64_t analytics_submit_persisted_eventsWithBlock(uint64_t a1)
{
  io_registry_entry_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  kern_return_t v8;
  char v10;

  if (analytics_iterate_persisted_eventsWithBlock(a1))
    return 0xFFFFFFFFLL;
  v1 = IORegistryEntryFromPath(*MEMORY[0x1E0CBBAA8], "IODeviceTree:/options");
  v8 = IORegistryEntrySetCFProperty(v1, CFSTR("IONVRAM-DELETE-PROPERTY"), CFSTR("mkb-reports"));
  if (v8)
  {
    debuglog("DeletePersistedReports", CFSTR("cant delete"), v2, v3, v4, v5, v6, v7, v10);
    if (!v1)
      goto LABEL_5;
    goto LABEL_4;
  }
  if (v1)
LABEL_4:
    IOObjectRelease(v1);
LABEL_5:
  if (!v8)
    return 0;
  debuglog("analytics_submit_persisted_eventsWithBlock", CFSTR("cant delete"), v2, v3, v4, v5, v6, v7, v10);
  return 0xFFFFFFFFLL;
}

uint64_t analytics_is_event_persisted(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char v8;
  uint64_t v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v8 = a1;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2000000000;
  v15 = 0;
  if (a1)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 0x40000000;
    v11[2] = __analytics_is_event_persisted_block_invoke;
    v11[3] = &unk_1E6757128;
    v11[4] = &v12;
    v11[5] = a1;
    analytics_iterate_persisted_eventsWithBlock((uint64_t)v11);
  }
  debuglog("analytics_is_event_persisted", CFSTR("event %@ is already persisted: %d"), a3, a4, a5, a6, a7, a8, v8);
  v9 = *((unsigned __int8 *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  return v9;
}

uint64_t __analytics_is_event_persisted_block_invoke(uint64_t a1, const void *a2)
{
  if (CFEqual(*(CFTypeRef *)(a1 + 40), a2))
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  return 0;
}

uint64_t analytics_submit_persisted_events()
{
  return analytics_submit_persisted_eventsWithBlock((uint64_t)&__block_literal_global_1);
}

uint64_t __analytics_submit_persisted_events_block_invoke(int a1, CFStringRef theString, int a3, uint64_t a4, uint64_t a5)
{
  char CStringPtr;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int id;

  CStringPtr = CFStringGetCStringPtr(theString, 0x8000100u);
  debuglog("analytics_submit_persisted_events_block_invoke", CFSTR("persisted-report-submit %s:%llx"), v9, v10, v11, v12, v13, v14, CStringPtr);
  id = analytics_persistance_report_get_id(theString);
  if (id <= 3)
    (*((void (**)(uint64_t))&persisted_keys_table + 2 * id + 1))(a5);
  return KBPostAggdScalar((uint64_t)theString, a3, 0);
}

uint64_t analytics_persistance_test()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const __CFString *v10;
  char v11;
  _QWORD v12[5];
  _QWORD v13[5];
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  int v18;

  v15 = 0;
  v16 = &v15;
  v17 = 0x2000000000;
  v18 = 0;
  if (geteuid())
  {
    v10 = CFSTR("must be privileged");
    goto LABEL_18;
  }
  if (analytics_persist_event(CFSTR("com.apple.mobile.keybagd.seshat.report"), 0, 0)
    || analytics_persist_event(CFSTR("com.apple.mobile.keybagd.seshat.recovery_required"), 0, 0))
  {
    v10 = CFSTR("post failed");
LABEL_18:
    debuglog("analytics_persistance_test", v10, v0, v1, v2, v3, v4, v5, v11);
LABEL_19:
    v8 = 0xFFFFFFFFLL;
    goto LABEL_13;
  }
  if (!analytics_persist_event(CFSTR("example.that.doesnt.exist"), 0, 0))
  {
    v10 = CFSTR("post succeeded unexpectedly");
    goto LABEL_18;
  }
  v6 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 0x40000000;
  v14[2] = __analytics_persistance_test_block_invoke;
  v14[3] = &unk_1E6757170;
  v14[4] = &v15;
  if (analytics_submit_persisted_eventsWithBlock((uint64_t)v14))
  {
    v10 = CFSTR("submission failed");
    goto LABEL_18;
  }
  if (*((_DWORD *)v16 + 6) != 2)
    goto LABEL_19;
  *((_DWORD *)v16 + 6) = 0;
  v13[0] = v6;
  v13[1] = 0x40000000;
  v13[2] = __analytics_persistance_test_block_invoke_2;
  v13[3] = &unk_1E6757198;
  v13[4] = &v15;
  analytics_submit_persisted_eventsWithBlock((uint64_t)v13);
  if (*((_DWORD *)v16 + 6))
    goto LABEL_19;
  v7 = 0;
  *((_DWORD *)v16 + 6) = 0;
  do
    analytics_persist_event(CFSTR("com.apple.mobile.keybagd.seshat.report"), 0, v7++);
  while (v7 != 10);
  analytics_iterate_persisted_eventsWithBlock((uint64_t)&__block_literal_global_48);
  v12[0] = v6;
  v12[1] = 0x40000000;
  v12[2] = __analytics_persistance_test_block_invoke_4;
  v12[3] = &unk_1E6757200;
  v12[4] = &v15;
  analytics_submit_persisted_eventsWithBlock((uint64_t)v12);
  if (*((_DWORD *)v16 + 6) == 35)
    v8 = 0;
  else
    v8 = 0xFFFFFFFFLL;
LABEL_13:
  _Block_object_dispose(&v15, 8);
  return v8;
}

uint64_t __analytics_persistance_test_block_invoke(uint64_t a1)
{
  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return 0;
}

uint64_t __analytics_persistance_test_block_invoke_2(uint64_t a1)
{
  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return 0;
}

uint64_t __analytics_persistance_test_block_invoke_3()
{
  return 0;
}

uint64_t __analytics_persistance_test_block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += a5;
  return 0;
}

uint64_t MKBUserSessionLoadWithPasscode(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t, uint64_t);
  const __CFString *v15;
  char v16;

  v6 = dlopen("/System/Library/PrivateFrameworks/UserManagement.framework/UserManagement", 2);
  if (v6)
  {
    v13 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))dlsym(v6, "UMUserSessionLoadWithPasscode");
    if (v13)
      return v13(a1, a2, a3);
    v15 = CFSTR("Failed to find UMUserSessionLoadWithPasscode in UM");
  }
  else
  {
    v15 = CFSTR("Failed to dlopen UserManagement.framework");
  }
  debuglog("MKBUserSessionLoadWithPasscode", v15, v7, v8, v9, v10, v11, v12, v16);
  return 0;
}

uint64_t MKBUserSessionSetSecureBackupBlob(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t, uint64_t);
  const __CFString *v15;
  char v16;

  v6 = dlopen("/System/Library/PrivateFrameworks/UserManagement.framework/UserManagement", 2);
  if (v6)
  {
    v13 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))dlsym(v6, "UMUserSessionSetSecureBackupBlob");
    if (v13)
      return v13(a1, a2, a3);
    v15 = CFSTR("Failed to find UMUserSessionSetSecureBackupBlob in UM");
  }
  else
  {
    v15 = CFSTR("Failed to dlopen UserManagement.framework");
  }
  debuglog("MKBUserSessionSetSecureBackupBlob", v15, v7, v8, v9, v10, v11, v12, v16);
  return 0;
}

uint64_t MKBUserSessionRetrieveSecureBackupBlob(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t, uint64_t);
  const __CFString *v15;
  char v16;

  v6 = dlopen("/System/Library/PrivateFrameworks/UserManagement.framework/UserManagement", 2);
  if (v6)
  {
    v13 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))dlsym(v6, "UMUserSessionRetrieveSecureBackupBlob");
    if (v13)
      return v13(a1, a2, a3);
    v15 = CFSTR("Failed to find UMUserSessionRetrieveSecureBackupBlob in UM");
  }
  else
  {
    v15 = CFSTR("Failed to dlopen UserManagement.framework");
  }
  debuglog("MKBUserSessionRetrieveSecureBackupBlob", v15, v7, v8, v9, v10, v11, v12, v16);
  return 0;
}

uint64_t MKBUserSessionDeleteSecureBackupBlob(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  const __CFString *v13;
  char v14;

  v4 = dlopen("/System/Library/PrivateFrameworks/UserManagement.framework/UserManagement", 2);
  if (v4)
  {
    v11 = (uint64_t (*)(uint64_t, uint64_t))dlsym(v4, "UMUserSessionDeleteSecureBackupBlob");
    if (v11)
      return v11(a1, a2);
    v13 = CFSTR("Failed to find UMUserSessionDeleteSecureBackupBlob in UM");
  }
  else
  {
    v13 = CFSTR("Failed to dlopen UserManagement.framework");
  }
  debuglog("MKBUserSessionDeleteSecureBackupBlob", v13, v5, v6, v7, v8, v9, v10, v14);
  return 0;
}

BOOL MKBUserSessionIsLoginWindow(uint64_t a1, CFErrorRef *a2)
{
  return MKBForegroundUserSessionID(a2) == 502;
}

uint64_t MKBForegroundUserSessionID(CFErrorRef *a1)
{
  int hostmultiuserconfig;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const __CFString *v16;
  CFIndex v17;
  char v19;
  uint32_t v20;

  v20 = 0;
  hostmultiuserconfig = get_hostmultiuserconfig(&v20);
  if (hostmultiuserconfig)
  {
    v9 = hostmultiuserconfig;
    debuglog("MKBForegroundUserSessionID", CFSTR("Failed to get multiuser_config flags from kernel with error:%d"), v3, v4, v5, v6, v7, v8, hostmultiuserconfig);
    if (v9 == 2)
      v16 = CFSTR("FAILED to MKBUserTypeDeviceMode, EPERM");
    else
      v16 = CFSTR("FAILED to MKBUserTypeDeviceMode, EINVAL");
    if (v9 == 2)
      v17 = 1;
    else
      v17 = 22;
    debuglog("MKBForegroundUserSessionID", v16, v10, v11, v12, v13, v14, v15, v19);
    if (!a1)
      return 0xFFFFFFFFLL;
LABEL_9:
    *a1 = CFErrorCreate(0, (CFErrorDomain)*MEMORY[0x1E0C9AFD0], v17, 0);
    return 0xFFFFFFFFLL;
  }
  if ((v20 & 0x80000000) == 0)
  {
    v17 = 2;
    if (!a1)
      return 0xFFFFFFFFLL;
    goto LABEL_9;
  }
  return v20 & 0x3FFFFFFF;
}

uint64_t MKBUserSessionIsLoginSession(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  const __CFString *v13;
  char v14;

  v4 = dlopen("/System/Library/PrivateFrameworks/UserManagement.framework/UserManagement", 2);
  if (v4)
  {
    v11 = (uint64_t (*)(uint64_t, uint64_t))dlsym(v4, "UMUserSessionIsLoginSession");
    if (v11)
      return v11(a1, a2);
    v13 = CFSTR("Failed to find UMUserSessionIsLoginSession in UM");
  }
  else
  {
    v13 = CFSTR("Failed to dlopen UserManagement.framework");
  }
  debuglog("MKBUserSessionIsLoginSession", v13, v5, v6, v7, v8, v9, v10, v14);
  return 0;
}

uint64_t MKBUserSessionConfigureLoginWindow(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  const __CFString *v13;
  char v14;

  v4 = dlopen("/System/Library/PrivateFrameworks/UserManagement.framework/UserManagement", 2);
  if (v4)
  {
    v11 = (uint64_t (*)(uint64_t, uint64_t))dlsym(v4, "UMUserSessionConfigureLoginWindow");
    if (v11)
      return v11(a1, a2);
    v13 = CFSTR("Failed to find UMUserSessionConfigureLoginWindow in UM");
  }
  else
  {
    v13 = CFSTR("Failed to dlopen UserManagement.framework");
  }
  debuglog("MKBUserSessionConfigureLoginWindow", v13, v5, v6, v7, v8, v9, v10, v14);
  return 0;
}

uint64_t MKBUserSessionSwitchToLoginWindow(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  const __CFString *v13;
  char v14;

  v4 = dlopen("/System/Library/PrivateFrameworks/UserManagement.framework/UserManagement", 2);
  if (v4)
  {
    v11 = (uint64_t (*)(uint64_t, uint64_t))dlsym(v4, "UMUserSessionSwitchToLoginWindow");
    if (v11)
      return v11(a1, a2);
    v13 = CFSTR("Failed to find UMUserSessionSwitchToLoginWindow in UM");
  }
  else
  {
    v13 = CFSTR("Failed to dlopen UserManagement.framework");
  }
  debuglog("MKBUserSessionSwitchToLoginWindow", v13, v5, v6, v7, v8, v9, v10, v14);
  return 0;
}

uint64_t MKBForegroundUserSession(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  const __CFString *v13;
  char v14;

  v4 = dlopen("/System/Library/PrivateFrameworks/UserManagement.framework/UserManagement", 2);
  if (v4)
  {
    v11 = (uint64_t (*)(uint64_t, uint64_t))dlsym(v4, "UMUserSessionForegroundSession");
    if (v11)
      return v11(a1, a2);
    v13 = CFSTR("Failed to find UMUserSessionForegroundSession in UM");
  }
  else
  {
    v13 = CFSTR("Failed to dlopen UserManagement.framework");
  }
  debuglog("MKBForegroundUserSession", v13, v5, v6, v7, v8, v9, v10, v14);
  return 0;
}

uint64_t MKBUserSessionListSyncMachServices(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  const __CFString *v13;
  char v14;

  v4 = dlopen("/System/Library/PrivateFrameworks/UserManagement.framework/UserManagement", 2);
  if (v4)
  {
    v11 = (uint64_t (*)(uint64_t, uint64_t))dlsym(v4, "UMUserSessionListSyncMachServices");
    if (v11)
      return v11(a1, a2);
    v13 = CFSTR("Failed to find UMUserSessionListSyncMachServices in UM");
  }
  else
  {
    v13 = CFSTR("Failed to dlopen UserManagement.framework");
  }
  debuglog("MKBUserSessionListSyncMachServices", v13, v5, v6, v7, v8, v9, v10, v14);
  return 0;
}

uint64_t MKBCurrentSyncBubbleSessionID(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t);
  const __CFString *v11;
  char v12;

  v2 = dlopen("/System/Library/PrivateFrameworks/UserManagement.framework/UserManagement", 2);
  if (v2)
  {
    v9 = (uint64_t (*)(uint64_t))dlsym(v2, "UMCurrentSyncBubbleSessionID");
    if (v9)
      return v9(a1);
    v11 = CFSTR("Failed to find UMCurrentSyncBubbleSessionID in UM");
  }
  else
  {
    v11 = CFSTR("Failed to dlopen UserManagement.framework");
  }
  debuglog("MKBCurrentSyncBubbleSessionID", v11, v3, v4, v5, v6, v7, v8, v12);
  return 0xFFFFFFFFLL;
}

__CFDictionary *MKBUserSessionGetUserLockStateInfo(CFDictionaryRef theDict)
{
  const __CFDictionary *Int;
  void *v2;
  const void *v3;
  CFTypeID v4;
  __CFDictionary *dict;
  uint64_t v6;
  const void *v7;
  const void *v8;
  const void *Value;
  _QWORD v11[9];

  Int = theDict;
  v11[8] = *MEMORY[0x1E0C80C00];
  if (theDict)
  {
    if (CFDictionaryContainsKey(theDict, kMKBUserSessionIDKey))
      Int = (const __CFDictionary *)_getInt(Int, kMKBUserSessionIDKey);
    else
      Int = 0;
  }
  +[MKBKeyStoreDevice sharedService](MKBKeyStoreDevice, "sharedService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getLockStateForUser:", Int);
  v3 = (const void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  v4 = CFGetTypeID(v3);
  if (v4 == CFDictionaryGetTypeID())
  {
    dict = create_dict();
    if (dict)
    {
      v6 = 0;
      v11[0] = CFSTR("IsWipePending");
      v11[1] = CFSTR("sw");
      v11[2] = CFSTR("IsPermanentlyBlocked");
      v11[3] = CFSTR("pb");
      v11[4] = CFSTR("FailedPasscodeAttempts");
      v11[5] = CFSTR("fa");
      v11[6] = CFSTR("TimeUntilUnblockedSinceReferenceDate");
      v11[7] = CFSTR("boff");
      do
      {
        v7 = (const void *)v11[v6];
        if (CFDictionaryContainsKey((CFDictionaryRef)v3, v7))
        {
          v8 = (const void *)v11[v6 + 1];
          Value = CFDictionaryGetValue((CFDictionaryRef)v3, v7);
          CFDictionarySetValue(dict, v8, Value);
        }
        v6 += 2;
      }
      while (v6 != 8);
    }
  }
  else
  {
    dict = 0;
  }
  CFRelease(v3);
  return dict;
}

uint64_t MKBUserSessionLoadKeybagForUser(const __CFDictionary *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  uint64_t system;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v19;
  uint64_t v20;
  const __CFDictionary *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const __CFDictionary *v29;
  const __CFData *Value;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const __CFData *v37;
  uint64_t bag;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char v60;
  char v61;

  if (!a6)
  {
    +[MKBKeyStoreDevice sharedService](MKBKeyStoreDevice, "sharedService");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "loadKeybagForUserSession:withSessionID:withSecret:shouldSetGracePeriod:withGracePeriod:isInEarlyStar:", a1, a2, a3, a4, a5, 0);

    return v20;
  }
  system = aks_get_system();
  if ((_DWORD)system != -536870160)
  {
    v15 = system;
    if ((_DWORD)system)
      return convertAKSErrorToMKB(system);
    return v15;
  }
  debuglog("MKBUserSessionLoadKeybagForUser", CFSTR("From EARLYSTART skip check switch between users"), v9, v10, v11, v12, v13, v14, v60);
  v22 = KBLoadUserKeybag(a2);
  if (v22)
  {
    v29 = v22;
    Value = (const __CFData *)CFDictionaryGetValue(v22, CFSTR("KeyBagKeys"));
    if (Value)
    {
      v37 = Value;
      CFDataGetBytePtr(Value);
      CFDataGetLength(v37);
      bag = aks_load_bag();
      if ((_DWORD)bag)
      {
        v45 = bag;
        debuglog("MKBUserSessionLoadKeybagForUser", CFSTR("failed to load bag for user %d: 0x%x"), v39, v40, v41, v42, v43, v44, a2);
      }
      else
      {
        v46 = aks_set_system();
        if ((_DWORD)v46)
        {
          v45 = v46;
          debuglog("MKBUserSessionLoadKeybagForUser", CFSTR("failed to set bag handle %d as session bag for UID %d: 0x%x"), v47, v48, v49, v50, v51, v52, -1);
        }
        else
        {
          v53 = aks_get_system();
          if (!(_DWORD)v53)
          {
            if ((_DWORD)a2 != 502)
            {
              debuglog("MKBUserSessionLoadKeybagForUser", CFSTR("seting APFSVolumeID For KeyBag "), v54, v55, v56, v57, v58, v59, v61);
              setAPFSVolumeIDForKeyBag(0xFFFFFFFFLL, a2, a1);
            }
            v15 = 0;
            goto LABEL_17;
          }
          v45 = v53;
          debuglog("MKBUserSessionLoadKeybagForUser", CFSTR("loaded bag handle %ld as session bag for %d, but got no session handle back: 0x%x"), v54, v55, v56, v57, v58, v59, -1);
        }
      }
      v15 = convertAKSErrorToMKB(v45);
    }
    else
    {
      debuglog("MKBUserSessionLoadKeybagForUser", CFSTR("no keybag in user bag plist"), v31, v32, v33, v34, v35, v36, v61);
      v15 = 4294966296;
    }
LABEL_17:
    CFRelease(v29);
    return v15;
  }
  debuglog("MKBUserSessionLoadKeybagForUser", CFSTR("no user bag found for UID %d"), v23, v24, v25, v26, v27, v28, a2);
  return 4294967288;
}

void setAPFSVolumeIDForKeyBag(uint64_t a1, uint64_t a2, const __CFDictionary *a3)
{
  const void *String;
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
  uint64_t v18;
  char v19;
  uuid_t uu;
  char in[1024];
  _BYTE v22[5];
  _BYTE v23[3];
  _OWORD v24[16];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  bzero(v23, 0x3FBuLL);
  qmemcpy(v22, "/dev/", sizeof(v22));
  memset(v24, 0, sizeof(v24));
  _getCString(a3, kMKBUserSessionVolumeDeviceNodeKey, (char *)v24, 256);
  if (LODWORD(v24[0]) == 1802725732)
    __strlcat_chk();
  if (a3)
  {
    if (CFDictionaryContainsKey(a3, kMKBUserSessionVolumeUUIDKey))
    {
      String = _getString(a3, kMKBUserSessionVolumeUUIDKey);
      if (String)
      {
        memset(uu, 0, sizeof(uu));
        debuglog("setAPFSVolumeIDForKeyBag", CFSTR("Updating VolumeUUID %@"), v7, v8, v9, v10, v11, v12, (char)String);
        bzero(in, 0x400uLL);
        _getCString(a3, kMKBUserSessionVolumeUUIDKey, in, 1024);
        if (uuid_parse(in, uu))
        {
          debuglog("setAPFSVolumeIDForKeyBag", CFSTR("uuid_parse failed"), v13, v14, v15, v16, v17, v18, v19);
        }
        else
        {
          debuglog("setAPFSVolumeIDForKeyBag", CFSTR("uuid_parse SUCCESS"), v13, v14, v15, v16, v17, v18, v19);
          KBMapVolume(a1, a2, (uint64_t)v22, (uint64_t)uu, 0);
        }
      }
    }
  }
}

uint64_t MKBUserSessionCreateKeybagForUser(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v10;
  uint64_t v11;

  +[MKBKeyStoreDevice sharedService](MKBKeyStoreDevice, "sharedService");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "createKeybagForUserSession:withSessionUID:WithSecret:withGracePeriod:withOpaqeStuff:", a1, a2, a3, a4, a5);

  return v11;
}

uint64_t MKBUserSessionUnloadKeybagForUser(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  +[MKBKeyStoreDevice sharedService](MKBKeyStoreDevice, "sharedService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "unloadKeybagForUserSession:", a1);

  return v3;
}

uint64_t MKBUserSessionDeleteKeybagForUser(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  +[MKBKeyStoreDevice sharedService](MKBKeyStoreDevice, "sharedService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "deleteKeybagForUserSession:", a1);

  return v3;
}

uint64_t MKBUserSessionSetVolumeToPersona(const __CFString *a1, const __CFString *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const __CFString *v10;
  uint64_t v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uuid_t uu;
  char in[16];
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
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  char buffer[1024];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  memset(uu, 0, sizeof(uu));
  bzero(buffer, 0x400uLL);
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  *(_OWORD *)in = 0u;
  v23 = 0u;
  if (!CFStringGetCString(a1, buffer, 1024, 0x8000100u))
  {
    v10 = CFSTR("Failed to get cstring from volumePath");
    goto LABEL_7;
  }
  if (!CFStringGetCString(a2, in, 256, 0x8000100u))
  {
    v10 = CFSTR("Failed to get cstring from uuidString");
    goto LABEL_7;
  }
  if (uuid_parse(in, uu))
  {
    v10 = CFSTR("Failed to parse to uuid_t");
LABEL_7:
    debuglog("MKBUserSessionSetVolumeToPersona", v10, v4, v5, v6, v7, v8, v9, v20);
    return 0xFFFFFFFFLL;
  }
  v13 = KBMapDeviceBag(buffer, 1);
  v11 = v13;
  if ((_DWORD)v13)
    debuglog("MKBUserSessionSetVolumeToPersona", CFSTR("KBMapDeviceBag failed with error %d"), v14, v15, v16, v17, v18, v19, v13);
  else
    debuglog("MKBUserSessionSetVolumeToPersona", CFSTR("KBMapDeviceBag Success"), v14, v15, v16, v17, v18, v19, v20);
  return v11;
}

uint64_t MKBUserSessionCreateSyncBagForUser(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;

  +[MKBKeyStoreDevice sharedService](MKBKeyStoreDevice, "sharedService");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "createSyncBagForUserSession:withSessionUID:", a1, a2);

  return v5;
}

uint64_t MKBUserSessionLoadSyncBagForUser(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;

  +[MKBKeyStoreDevice sharedService](MKBKeyStoreDevice, "sharedService");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "loadSyncBagForUserSession:withSessionUID:", a1, a2);

  return v5;
}

uint64_t MKBUserSessionVerifySyncBagForUser(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;

  +[MKBKeyStoreDevice sharedService](MKBKeyStoreDevice, "sharedService");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "verifySyncBagForUserSession:withSessionUID:", a1, a2);

  return v5;
}

uint64_t MKBUserSessionUnLoadSyncBagForUser(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;

  +[MKBKeyStoreDevice sharedService](MKBKeyStoreDevice, "sharedService");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unloadSyncBagForUserSession:withSessionUID:", a1, a2);

  return v5;
}

uint64_t MKBUserSessionRemoveSyncBagForUser(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;

  +[MKBKeyStoreDevice sharedService](MKBKeyStoreDevice, "sharedService");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "removeSyncBagForUserSession:withSessionUID:", a1, a2);

  return v5;
}

uint64_t MKBUserSessionUnloadSessionBags()
{
  uint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  result = aks_unload_session_bags();
  if ((_DWORD)result)
  {
    debuglog("MKBUserSessionUnloadSessionBags", CFSTR("Failed to unload session keybags: 0x%x"), v1, v2, v3, v4, v5, v6, result);
    return 0xFFFFFFFFLL;
  }
  return result;
}

CFDataRef MKBUserSessionWrapSession(int a1, CFDataRef theData, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v30;
  char v31;
  _DWORD length[21];

  *(_QWORD *)&length[19] = *MEMORY[0x1E0C80C00];
  if (!theData)
  {
    debuglog("MKBUserSessionWrapSession", CFSTR("Data to Wrap is NULL"), a3, a4, a5, a6, a7, a8, v30);
    goto LABEL_6;
  }
  v9 = CFDataGetLength(theData);
  debuglog("MKBUserSessionWrapSession", CFSTR("Data to Wrap with length:%d"), v10, v11, v12, v13, v14, v15, v9);
  if (CFDataGetLength(theData) < 1)
  {
LABEL_6:
    debuglog("MKBUserSessionWrapSession", CFSTR("Invalid Blob entry for wrap"), v16, v17, v18, v19, v20, v21, v31);
    return 0;
  }
  CFDataGetBytePtr(theData);
  CFDataGetLength(theData);
  v22 = aks_wrap_key();
  if (!v22)
  {
    debuglog("MKBUserSessionWrapSession", CFSTR("key_class_f wrap Completed with size %d"), v23, v24, v25, v26, v27, v28, 72);
    return CFDataCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const UInt8 *)&length[1], 72);
  }
  debuglog("MKBUserSessionWrapSession", CFSTR("failed to key_class_f wrap by aks_wrap_key: 0x%x"), v23, v24, v25, v26, v27, v28, v22);
  return 0;
}

CFDataRef MKBUserSessionUnWrapSession(int a1, CFDataRef theData, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const __CFString *v16;
  char v18;
  _BYTE length[52];

  *(_QWORD *)&length[44] = *MEMORY[0x1E0C80C00];
  memset(&length[4], 0, 32);
  if (theData && CFDataGetLength(theData) >= 1)
  {
    v9 = CFDataGetLength(theData);
    debuglog("MKBUserSessionUnWrapSession", CFSTR("sessionblob length:%ld"), v10, v11, v12, v13, v14, v15, v9);
    CFDataGetBytePtr(theData);
    CFDataGetLength(theData);
    if (!aks_unwrap_key())
    {
      debuglog("MKBUserSessionUnWrapSession", CFSTR("deCryptnextsession: session decrypt length:%d(expected: 32)"), a3, a4, a5, a6, a7, a8, 32);
      return CFDataCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], &length[4], 32);
    }
    v16 = CFSTR("Failed to unwrap dict blob with classF");
  }
  else
  {
    v16 = CFSTR("Invalid Blob entry for unwrap");
  }
  debuglog("MKBUserSessionUnWrapSession", v16, a3, a4, a5, a6, a7, a8, v18);
  return 0;
}

uint64_t MKBUserSessionCreatePersonaKeyForUser(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v9;
  uint64_t v10;

  +[MKBKeyStoreDevice sharedService](MKBKeyStoreDevice, "sharedService");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "addPersonaKeyForUserSession:withSecret:withPersonaUUIDString:forPath:", a2, a3, a4, a5);

  return v10;
}

uint64_t MKBUserSessionRemovePersonaKeyForUser(CFDictionaryRef theDict, uint64_t a2, uint64_t a3)
{
  const __CFDictionary *String;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  char v15;

  String = theDict;
  if (!theDict
    || CFDictionaryContainsKey(theDict, kMKBUserSessionVolumeUUIDKey)
    && (String = (const __CFDictionary *)_getString(String, kMKBUserSessionVolumeUUIDKey)) != 0)
  {
    +[MKBKeyStoreDevice sharedService](MKBKeyStoreDevice, "sharedService");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "removePersonaKeyForUserSession:withPersonaUUIDString:withVolumeUUIDString:", a2, a3, String);

    return v13;
  }
  else
  {
    debuglog("MKBUserSessionRemovePersonaKeyForUser", CFSTR("Cannot find proper VolumeUUID String to remove personakey with volume unmap"), v6, v7, v8, v9, v10, v11, v15);
    return 22;
  }
}

const void *_getData(const __CFDictionary *a1, const void *a2)
{
  const void *result;
  const void *v3;
  CFTypeID v4;

  result = CFDictionaryGetValue(a1, a2);
  if (result)
  {
    v3 = result;
    v4 = CFGetTypeID(result);
    if (v4 == CFDataGetTypeID())
      return v3;
    else
      return 0;
  }
  return result;
}

const void *_getArray(const __CFDictionary *a1, const void *a2)
{
  const void *result;
  const void *v3;
  CFTypeID v4;

  result = CFDictionaryGetValue(a1, a2);
  if (result)
  {
    v3 = result;
    v4 = CFGetTypeID(result);
    if (v4 == CFArrayGetTypeID())
      return v3;
    else
      return 0;
  }
  return result;
}

uint64_t _getInt(const __CFDictionary *a1, const void *a2)
{
  uint64_t v2;
  const __CFNumber *Value;
  const __CFNumber *v4;
  CFTypeID v5;
  unsigned int valuePtr;

  v2 = 0xFFFFFFFFLL;
  valuePtr = -1;
  Value = (const __CFNumber *)CFDictionaryGetValue(a1, a2);
  if (Value)
  {
    v4 = Value;
    v5 = CFGetTypeID(Value);
    if (v5 == CFNumberGetTypeID())
    {
      CFNumberGetValue(v4, kCFNumberIntType, &valuePtr);
      return valuePtr;
    }
    else
    {
      return 0xFFFFFFFFLL;
    }
  }
  return v2;
}

uint64_t _getLongLongInt(const __CFDictionary *a1, const void *a2)
{
  uint64_t v2;
  const __CFNumber *Value;
  const __CFNumber *v4;
  CFTypeID v5;
  uint64_t valuePtr;

  v2 = -1;
  valuePtr = -1;
  Value = (const __CFNumber *)CFDictionaryGetValue(a1, a2);
  if (Value)
  {
    v4 = Value;
    v5 = CFGetTypeID(Value);
    if (v5 == CFNumberGetTypeID())
    {
      CFNumberGetValue(v4, kCFNumberLongLongType, &valuePtr);
      return valuePtr;
    }
    else
    {
      return -1;
    }
  }
  return v2;
}

uint64_t _getSInt64(const __CFDictionary *a1, const void *a2)
{
  uint64_t v2;
  const __CFNumber *Value;
  const __CFNumber *v4;
  CFTypeID v5;
  uint64_t valuePtr;

  v2 = -1;
  valuePtr = -1;
  Value = (const __CFNumber *)CFDictionaryGetValue(a1, a2);
  if (Value)
  {
    v4 = Value;
    v5 = CFGetTypeID(Value);
    if (v5 == CFNumberGetTypeID())
    {
      CFNumberGetValue(v4, kCFNumberSInt64Type, &valuePtr);
      return valuePtr;
    }
    else
    {
      return -1;
    }
  }
  return v2;
}

const __CFBoolean *_getBool(const __CFDictionary *a1, const void *a2)
{
  const __CFBoolean *result;
  const __CFBoolean *v3;
  CFTypeID v4;

  result = (const __CFBoolean *)CFDictionaryGetValue(a1, a2);
  if (result)
  {
    v3 = result;
    v4 = CFGetTypeID(result);
    if (v4 == CFBooleanGetTypeID())
      return (const __CFBoolean *)(CFBooleanGetValue(v3) != 0);
    else
      return 0;
  }
  return result;
}

const void *_getString(const __CFDictionary *a1, const void *a2)
{
  const void *Value;
  const void *v3;
  CFTypeID v4;

  Value = CFDictionaryGetValue(a1, a2);
  if (!Value)
    return 0;
  v3 = Value;
  v4 = CFGetTypeID(Value);
  if (v4 != CFStringGetTypeID())
    return 0;
  return v3;
}

BOOL _getCString(const __CFDictionary *a1, const void *a2, char *a3, int a4)
{
  const __CFString *String;

  String = (const __CFString *)_getString(a1, a2);
  return String && CFStringGetCString(String, a3, a4, 0x8000100u);
}

CFTypeRef _getRetainedDict(const __CFDictionary *a1, const void *a2)
{
  const void *Value;
  const void *v3;
  CFTypeID v4;

  Value = CFDictionaryGetValue(a1, a2);
  if (Value && (v3 = Value, v4 = CFGetTypeID(Value), v4 == CFDictionaryGetTypeID()))
    return CFRetain(v3);
  else
    return 0;
}

CFTypeRef convertObjectToBinary(const void *a1)
{
  __CFWriteStream *v2;
  __CFWriteStream *v3;
  CFTypeRef v4;

  v2 = CFWriteStreamCreateWithAllocatedBuffers((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFAllocatorRef)*MEMORY[0x1E0C9AE00]);
  if (!v2)
    return 0;
  v3 = v2;
  if (CFWriteStreamOpen(v2))
  {
    if (CFPropertyListWrite(a1, v3, kCFPropertyListBinaryFormat_v1_0, 0, 0) < 1)
      v4 = 0;
    else
      v4 = CFWriteStreamCopyProperty(v3, (CFStreamPropertyKey)*MEMORY[0x1E0C9B2A8]);
    CFWriteStreamClose(v3);
  }
  else
  {
    v4 = 0;
  }
  CFRelease(v3);
  return v4;
}

CFPropertyListRef convertBinaryToObject(UInt8 *bytes, CFIndex length)
{
  const __CFAllocator *v2;
  __CFReadStream *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __CFReadStream *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  CFPropertyListRef v23;
  char v25;
  CFPropertyListFormat format;

  format = kCFPropertyListBinaryFormat_v1_0;
  v2 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v3 = CFReadStreamCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], bytes, length, (CFAllocatorRef)*MEMORY[0x1E0C9AE20]);
  if (v3)
  {
    v10 = v3;
    if (CFReadStreamOpen(v3))
    {
      v23 = CFPropertyListCreateWithStream(v2, v10, 0, 2uLL, &format, 0);
      if (!v23)
        debuglog("convertBinaryToObject", CFSTR("Could not create object from stream"), v17, v18, v19, v20, v21, v22, v25);
      CFReadStreamClose(v10);
    }
    else
    {
      debuglog("convertBinaryToObject", CFSTR("Could not open the stream"), v11, v12, v13, v14, v15, v16, v25);
      v23 = 0;
    }
    CFRelease(v10);
  }
  else
  {
    debuglog("convertBinaryToObject", CFSTR("Could not create stream for serialized data"), v4, v5, v6, v7, v8, v9, v25);
    return 0;
  }
  return v23;
}

size_t writen(int __fd, char *__buf, size_t __nbyte)
{
  size_t v3;
  size_t v6;
  ssize_t v7;

  v3 = __nbyte;
  if (__nbyte)
  {
    v6 = __nbyte;
    do
    {
      v7 = write(__fd, __buf, v6);
      if (v7 == -1)
      {
        if (*__error() != 4)
          return -1;
        v7 = 0;
      }
      __buf += v7;
      v6 -= v7;
    }
    while (v6);
  }
  return v3;
}

uint64_t store_binary_dict_fd(const void *a1, const char *a2, int *a3)
{
  const __CFData *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const __CFData *v12;
  int v13;
  int v14;
  char *BytePtr;
  size_t Length;
  uint64_t v17;
  int *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const __CFString *v25;
  int *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char v34;

  v5 = (const __CFData *)convertObjectToBinary(a1);
  if (!v5)
  {
    debuglog("store_binary_dict_fd", CFSTR("Can't serialize dictionary"), v6, v7, v8, v9, v10, v11, v34);
    return 0xFFFFFFFFLL;
  }
  v12 = v5;
  v13 = open_dprotected_np(a2, 1537, 4, 0, 420);
  if (v13 == -1)
  {
    v18 = __error();
    strerror(*v18);
    debuglog("store_binary_dict_fd", CFSTR("Could not create %s: %s"), v19, v20, v21, v22, v23, v24, (char)a2);
    v17 = 0xFFFFFFFFLL;
    goto LABEL_7;
  }
  v14 = v13;
  BytePtr = (char *)CFDataGetBytePtr(v12);
  Length = CFDataGetLength(v12);
  if (writen(v14, BytePtr, Length) == -1)
  {
    v25 = CFSTR("Could not write to %s: %s");
LABEL_12:
    v26 = __error();
    strerror(*v26);
    debuglog("store_binary_dict_fd", v25, v27, v28, v29, v30, v31, v32, (char)a2);
    v17 = 0xFFFFFFFFLL;
    goto LABEL_13;
  }
  if (fcntl(v14, 51))
  {
    v25 = CFSTR("Unable to fsync %s: %s");
    goto LABEL_12;
  }
  v17 = 0;
  if (!a3)
  {
LABEL_13:
    CFRelease(v12);
    close(v14);
    return v17;
  }
  *a3 = v14;
LABEL_7:
  CFRelease(v12);
  return v17;
}

uint64_t store_binary_dict(const void *a1, const char *a2)
{
  return store_binary_dict_fd(a1, a2, 0);
}

const void *load_binary_dict_from_buffer(UInt8 *bytes, CFIndex length)
{
  const void *v2;
  const __CFAllocator *v4;
  __CFReadStream *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __CFReadStream *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  CFPropertyListRef v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  CFTypeID v26;
  char v28;
  CFPropertyListFormat format;

  v2 = 0;
  format = kCFPropertyListBinaryFormat_v1_0;
  if (bytes && length)
  {
    v4 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v5 = CFReadStreamCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], bytes, length, (CFAllocatorRef)*MEMORY[0x1E0C9AE20]);
    if (!v5)
    {
      debuglog("load_binary_dict_from_buffer", CFSTR("Could not create stream from serialized data"), v6, v7, v8, v9, v10, v11, v28);
      return 0;
    }
    v12 = v5;
    if (CFReadStreamOpen(v5))
    {
      v19 = CFPropertyListCreateWithStream(v4, v12, length, 2uLL, &format, 0);
      v2 = v19;
      if (!v19)
      {
        debuglog("load_binary_dict_from_buffer", CFSTR("Could not create dictionary from stream"), v20, v21, v22, v23, v24, v25, v28);
        goto LABEL_9;
      }
      v26 = CFGetTypeID(v19);
      if (v26 == CFDictionaryGetTypeID())
      {
LABEL_9:
        CFReadStreamClose(v12);
        CFRelease(v12);
        return v2;
      }
      CFRelease(v2);
    }
    else
    {
      debuglog("load_binary_dict_from_buffer", CFSTR("Could not open the stream"), v13, v14, v15, v16, v17, v18, v28);
    }
    v2 = 0;
    goto LABEL_9;
  }
  return v2;
}

const void *load_binary_dict(const char *a1)
{
  char v1;
  int v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  ssize_t v11;
  const void *binary_dict_from_buffer;
  int *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const __CFString *v28;
  int *v29;
  char v30;
  stat v31;

  v1 = (char)a1;
  memset(&v31, 0, sizeof(v31));
  v2 = open(a1, 0);
  if (v2 == -1)
  {
    v14 = __error();
    strerror(*v14);
    debuglog("load_binary_dict", CFSTR("Could not open %s: %s"), v15, v16, v17, v18, v19, v20, v1);
    v10 = 0;
    binary_dict_from_buffer = 0;
    goto LABEL_7;
  }
  v3 = v2;
  if (fstat(v2, &v31))
  {
    v21 = __error();
    strerror(*v21);
    debuglog("load_binary_dict", CFSTR("Could not fstat %s: %s"), v22, v23, v24, v25, v26, v27, v1);
    binary_dict_from_buffer = 0;
    v10 = 0;
    goto LABEL_6;
  }
  v10 = malloc_type_malloc(LODWORD(v31.st_size), 0x9026304CuLL);
  if (!v10)
  {
    v28 = CFSTR("Could not allocate buffer");
LABEL_12:
    debuglog("load_binary_dict", v28, v4, v5, v6, v7, v8, v9, v30);
    binary_dict_from_buffer = 0;
    goto LABEL_6;
  }
  v11 = read(v3, v10, v31.st_size);
  if (v11 != v31.st_size)
  {
    v29 = __error();
    v30 = v1;
    strerror(*v29);
    v28 = CFSTR("Could not read %s: %s");
    goto LABEL_12;
  }
  binary_dict_from_buffer = load_binary_dict_from_buffer((UInt8 *)v10, v11);
LABEL_6:
  close(v3);
LABEL_7:
  free(v10);
  return binary_dict_from_buffer;
}

CFMutableDictionaryRef create_mutable_dict(CFDictionaryRef theDict)
{
  CFMutableDictionaryRef result;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char vars0;

  result = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, theDict);
  if (!result)
  {
    debuglog("create_mutable_dict", CFSTR("Out of Memory!!! Dying!...so...cold...."), v2, v3, v4, v5, v6, v7, vars0);
    exit(-1);
  }
  return result;
}

CFMutableArrayRef create_array()
{
  CFMutableArrayRef result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char vars0;

  result = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]);
  if (!result)
  {
    debuglog("create_array", CFSTR("Out of Memory!!! Dying!...so...cold...."), v1, v2, v3, v4, v5, v6, vars0);
    exit(-1);
  }
  return result;
}

CFStringRef create_string(char *cStr)
{
  CFStringRef result;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char vars0;

  result = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x1E0C9AE00], cStr, 0x8000100u);
  if (!result)
  {
    debuglog("create_string", CFSTR("Out of Memory!!! Dying!...so...cold...."), v2, v3, v4, v5, v6, v7, vars0);
    exit(-1);
  }
  return result;
}

uint64_t set_hostmultiuserconfig(uint32_t a1)
{
  host_priv_t v2;

  v2 = MEMORY[0x1B5E33E20]();
  return host_set_multiuser_config_flags(v2, a1);
}

uint64_t GetConfiguredForegroundUserID()
{
  int hostmultiuserconfig;
  uint32_t v1;
  int v3;

  v3 = 0;
  hostmultiuserconfig = get_hostmultiuserconfig((uint32_t *)&v3);
  if (v3 >= 0)
    v1 = -1;
  else
    v1 = v3 & 0x3FFFFFFF;
  if (hostmultiuserconfig)
    return 0xFFFFFFFFLL;
  else
    return v1;
}

BOOL IsConfiguredMultiUser()
{
  int v2;

  v2 = 0;
  return !get_hostmultiuserconfig((uint32_t *)&v2) && v2 < 0;
}

uint64_t get_port_type(mach_port_name_t name)
{
  mach_port_type_t ptype;

  ptype = 0;
  if (mach_port_type(*MEMORY[0x1E0C83DA0], name, &ptype))
    return 0;
  else
    return ptype;
}

void log_port_type(mach_port_name_t name)
{
  char v1;
  kern_return_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  mach_port_type_t v9;
  BOOL v10;
  const __CFString *v11;
  mach_port_type_t ptype;

  v1 = name;
  ptype = 0;
  v2 = mach_port_type(*MEMORY[0x1E0C83DA0], name, &ptype);
  v9 = ptype;
  if (v2)
    v10 = 1;
  else
    v10 = ptype == 0;
  if (v10)
  {
    v11 = CFSTR("Port:%d has NORIGHTS");
LABEL_16:
    debuglog("log_port_type", v11, v3, v4, v5, v6, v7, v8, v1);
    return;
  }
  if ((ptype & 0x10000) != 0)
  {
    debuglog("log_port_type", CFSTR("Port:%d has SENDRIGHT"), v3, v4, v5, v6, v7, v8, v1);
    if ((v9 & 0x20000) == 0)
    {
LABEL_9:
      if ((v9 & 0x40000) == 0)
        goto LABEL_10;
LABEL_14:
      debuglog("log_port_type", CFSTR("Port:%d has SENDONCERIGHT"), v3, v4, v5, v6, v7, v8, v1);
      if ((v9 & 0x100000) == 0)
        return;
      goto LABEL_15;
    }
  }
  else if ((ptype & 0x20000) == 0)
  {
    goto LABEL_9;
  }
  debuglog("log_port_type", CFSTR("Port:%d has RECEIVERIGHT"), v3, v4, v5, v6, v7, v8, v1);
  if ((v9 & 0x40000) != 0)
    goto LABEL_14;
LABEL_10:
  if ((v9 & 0x100000) != 0)
  {
LABEL_15:
    v11 = CFSTR("Port:%d has DEADNAME");
    goto LABEL_16;
  }
}

unsigned __int16 *_apfs_get_all_crypto_ids(int a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned __int16 *v8;
  uint64_t v9;
  int v10;
  unsigned __int16 *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v19;
  char *v20;
  char v21;
  unsigned __int16 v22;
  _QWORD v23[97];

  v23[96] = *MEMORY[0x1E0C80C00];
  v19 = xmmword_1B401C040;
  v20 = &v21;
  v8 = 0;
  if (ffsctl(a1, 0x80184A07uLL, &v19, 0))
  {
LABEL_12:
    debuglog("_apfs_get_all_crypto_ids", CFSTR("APFSIOC_GET_CRYPTO_IDS fail"), v2, v3, v4, v5, v6, v7, v19);
    free(v8);
    return 0;
  }
  else
  {
    while (1)
    {
      v9 = v22;
      if (!v22)
        break;
      if (v8)
        v10 = v8[4];
      else
        v10 = 0;
      v11 = (unsigned __int16 *)reallocf(v8, 24 * (v10 + v22) + 16);
      v8 = v11;
      if (!v11)
      {
        debuglog("_apfs_get_all_crypto_ids", CFSTR("realloc failed"), v12, v13, v14, v15, v16, v17, v19);
        return v8;
      }
      if ((_QWORD)v19 == -1)
      {
        memset_s(v11, 0x10uLL, 0, 0x10uLL);
        v9 = v22;
      }
      memcpy(&v8[12 * v8[4] + 8], v23, 24 * v9);
      v8[4] += v9;
      if ((_DWORD)v9)
        *(_QWORD *)&v19 = v23[3 * (unsigned __int16)(v9 - 1) + 1] + v23[3 * (unsigned __int16)(v9 - 1)];
      if (ffsctl(a1, 0x80184A07uLL, &v19, 0))
        goto LABEL_12;
    }
  }
  return v8;
}

void *_apfs_copy_wrapped_key_from_file(int a1, uint64_t a2, CFTypeRef *a3)
{
  void *v6;
  int *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const __CFAllocator *v14;
  const __CFString *v15;
  int *v16;
  _QWORD v18[3];

  v6 = malloc_type_malloc(0x400uLL, 0x56D46FCCuLL);
  v18[0] = a2;
  v18[1] = 1024;
  v18[2] = v6;
  if (ffsctl(a1, 0x80184A08uLL, v18, 0) < 0)
  {
    v7 = __error();
    strerror(*v7);
    debuglog("_apfs_copy_wrapped_key_from_file", CFSTR("Could not get wrapped crypto key for inode %llu right now: %s"), v8, v9, v10, v11, v12, v13, a2);
    if (a3)
    {
      if (*a3)
      {
        CFRelease(*a3);
        *a3 = 0;
      }
      v14 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      v15 = (const __CFString *)*MEMORY[0x1E0C9AFD0];
      v16 = __error();
      *a3 = CFErrorCreate(v14, v15, *v16, 0);
    }
    free(v6);
    return 0;
  }
  return v6;
}

uint64_t mkb_time_start(uint64_t result)
{
  _QWORD *v1;

  if (result)
  {
    v1 = (_QWORD *)result;
    result = mach_absolute_time();
    *v1 = result;
  }
  return result;
}

double mkb_time_stop(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  double result;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  mach_timebase_info info;

  v4 = mach_absolute_time();
  if (mkb_time_stop_time_overhead_measured)
  {
    if (!a2)
      return result;
  }
  else
  {
    v6 = mach_absolute_time();
    mkb_time_stop_time_overhead_measured = mach_absolute_time() - v6;
    info = 0;
    mach_timebase_info(&info);
    LODWORD(v8) = info.denom;
    LODWORD(v7) = info.numer;
    result = (double)v7 / (double)v8;
    mkb_time_stop_timebase_factor = *(_QWORD *)&result;
    if (!a2)
      return result;
  }
  result = *(double *)&mkb_time_stop_timebase_factor * (double)(v4 - a1 - mkb_time_stop_time_overhead_measured) / 1000.0;
  *a2 = (unint64_t)result;
  return result;
}

void sub_1B4008F18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B400916C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B400933C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B40094C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_1B4009714(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1B4009A10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4009B8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4009DB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B4009F80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B400A148(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B400A3D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1B400A5D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B400A79C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B400A94C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B400AAFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B400ACAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B400AE84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B400B04C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B400B26C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B400B42C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B400B5DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B400B7D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1B400B9D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1B400BB9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B400BD4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B400BFFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B400C28C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void sub_1B400C4CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1B400C660(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B400C8F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B400CB38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B400CCAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B400CE20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B400CFC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B400D14C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B400D2D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B400D464(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B400D5F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B400D77C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B400D988(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B400DB30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t SeshatHWAvailable(uint64_t a1)
{
  NFHWMonitor *v2;
  int v3;
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;

  v24 = 0;
  v23 = 0;
  if ((SeshatHWAvailable_cached_answer & 1) == 0)
  {
    v21 = 0;
    v22 = 0;
    mkb_time_start((uint64_t)&v22);
    v2 = objc_alloc_init(NFHWMonitor);
    objc_msgSend((id)objc_msgSend((id)getNFHardwareManagerClass(), "sharedHardwareManager"), "registerEventListener:", v2);
    v3 = objc_msgSend((id)objc_msgSend((id)getNFHardwareManagerClass(), "sharedHardwareManager"), "getHwSupport");
    if ((v3 & 0xFFFFFFFD) == 1)
    {
      LOBYTE(v23) = -[NFHWMonitor waitForNotificationOrTimeout:](v2, "waitForNotificationOrTimeout:", a1) != 0;
      v4 = objc_msgSend((id)objc_msgSend((id)getNFHardwareManagerClass(), "sharedHardwareManager"), "getHwSupport");
    }
    else
    {
      v4 = v3;
    }
    objc_msgSend((id)objc_msgSend((id)getNFHardwareManagerClass(), "sharedHardwareManager"), "unregisterEventListener:", v2);

    v11 = &SeshatHWAvailable_answer;
    if (v4 != 2 && v4 != 5)
    {
      debuglog("SeshatHWAvailable", CFSTR("getHwSupport=%d, prev=%d. timedout=%d, intepreting as unsupported."), v5, v6, v7, v8, v9, v10, v4);
      SeshatHWAvailable_answer = 0;
      v11 = &SeshatHWAvailable_cached_answer;
    }
    *v11 = 1;
    mkb_time_stop(v22, &v21);
    HIDWORD(v23) = v21 / 0xF4240;
    v24 = v4;
    analytics_send_nfc_hardware_state((uint64_t)&v23, v12, v13, v14, v15, v16, v17, v18, v20);
  }
  return SeshatHWAvailable_answer;
}

uint64_t getNFHardwareManagerClass()
{
  uint64_t v0;
  _QWORD v2[5];
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  void (*v7)(uint64_t);
  uint64_t v8;

  v3 = 0;
  v4 = &v3;
  v5 = 0x3052000000;
  v6 = __Block_byref_object_copy__0;
  v7 = __Block_byref_object_dispose__0;
  v0 = getNFHardwareManagerClass_softClass;
  v8 = getNFHardwareManagerClass_softClass;
  if (!getNFHardwareManagerClass_softClass)
  {
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __getNFHardwareManagerClass_block_invoke;
    v2[3] = &unk_1E6757760;
    v2[4] = &v3;
    __getNFHardwareManagerClass_block_invoke((uint64_t)v2);
    v0 = v4[5];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1B400DED4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t SeshatAvailable()
{
  uint64_t result;

  result = SeshatFwkAvailable();
  if ((_DWORD)result)
    return SeshatHWAvailable(20);
  return result;
}

BOOL SeshatFwkAvailable()
{
  _BOOL8 result;

  if (SeshatFwkAvailable_seshat_available)
    return 1;
  if (!NearFieldLibraryCore_frameworkLibrary)
    NearFieldLibraryCore_frameworkLibrary = _sl_dlopen();
  if (NearFieldLibraryCore_frameworkLibrary)
    result = getNFHardwareManagerClass() != 0;
  else
    result = 0;
  SeshatFwkAvailable_seshat_available = result;
  return result;
}

void SeshatTTR(time_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  char v17;
  time_t v18;
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  void (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  uint64_t v25;

  v18 = a1;
  v1 = (void *)MEMORY[0x1B5E33EBC]();
  if (SeshatFwkAvailable())
  {
    debuglog("SeshatTTR", CFSTR("requesting NF TTR"), v2, v3, v4, v5, v6, v7, v16);
    v20 = 0;
    v21 = &v20;
    v22 = 0x3052000000;
    v23 = __Block_byref_object_copy__0;
    v24 = __Block_byref_object_dispose__0;
    v8 = (void *)getNFTapToRadarClass_softClass;
    v25 = getNFTapToRadarClass_softClass;
    if (!getNFTapToRadarClass_softClass)
    {
      v19[0] = MEMORY[0x1E0C809B0];
      v19[1] = 3221225472;
      v19[2] = __getNFTapToRadarClass_block_invoke;
      v19[3] = &unk_1E6757760;
      v19[4] = &v20;
      __getNFTapToRadarClass_block_invoke((uint64_t)v19);
      v8 = (void *)v21[5];
    }
    _Block_object_dispose(&v20, 8);
    v9 = (void *)MEMORY[0x1E0CB3940];
    v17 = ctime(&v18);
    objc_msgSend(v8, "requestTapToRadar:preferences:", objc_msgSend(v9, "stringWithFormat:", CFSTR("SesHat session failure on %s")), CFSTR("com.apple.keybagd.ttr"));
    debuglog("SeshatTTR", CFSTR("requested NF TTR"), v10, v11, v12, v13, v14, v15, v17);
  }
  objc_autoreleasePoolPop(v1);
}

void sub_1B400E0F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t SeshatCreateSessionWithTimeoutVerbose(int a1, _BYTE *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int v17;
  uint64_t v18;
  __darwin_time_t v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  dispatch_time_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  char v28;
  char v29;
  _QWORD block[7];
  timespec __rqtp;
  void (*v32)(uint64_t, uint64_t, uint64_t);
  void *v33;
  NSObject *v34;
  _QWORD *v35;
  uint64_t *v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  void (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  uint64_t v43;
  _QWORD v44[3];
  char v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  void (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  uint64_t v51;

  SeshatPowerAssertion(1, (uint64_t)a2, a3, a4, a5, a6, a7, a8, v28);
  v17 = 0;
  v18 = 1000000 * a1;
  v19 = MEMORY[0x1E0C809B0];
  do
  {
    if (v17)
    {
      __rqtp = (timespec)xmmword_1B401C070;
      nanosleep(&__rqtp, 0);
    }
    debuglog("SeshatCreateSessionWithTimeoutVerbose", CFSTR("asking for session with timeout of %lld nsec (attempt: %d)"), v11, v12, v13, v14, v15, v16, v18);
    if (a3)
    {
      *(_QWORD *)a3 = 0;
      *(_DWORD *)(a3 + 8) = 0;
    }
    if (a2)
      *a2 = 0;
    v46 = 0;
    v47 = &v46;
    v48 = 0x3052000000;
    v49 = __Block_byref_object_copy__0;
    v50 = __Block_byref_object_dispose__0;
    v51 = 0;
    v44[0] = 0;
    v44[1] = v44;
    v44[2] = 0x2020000000;
    v45 = 0;
    v38 = 0;
    v39 = &v38;
    v40 = 0x3052000000;
    v41 = __Block_byref_object_copy__0;
    v42 = __Block_byref_object_dispose__0;
    v43 = 0;
    if (SeshatFwkAvailable() && (SeshatHWAvailable(20) & 1) != 0 && (seshat_debug_mask & 0x100) == 0)
    {
      if (a2)
        *a2 = 0;
      if (_SeshatCreateSessionWithTimeout_onceToken != -1)
        dispatch_once(&_SeshatCreateSessionWithTimeout_onceToken, &__block_literal_global_3);
      v20 = dispatch_semaphore_create(0);
      dispatch_retain(v20);
      v21 = (void *)objc_msgSend((id)getNFHardwareManagerClass(), "sharedHardwareManager");
      __rqtp.tv_sec = v19;
      __rqtp.tv_nsec = 3221225472;
      v32 = ___SeshatCreateSessionWithTimeout_block_invoke_2;
      v33 = &unk_1E67577C8;
      v34 = v20;
      v35 = v44;
      v36 = &v38;
      v37 = &v46;
      v22 = objc_msgSend(v21, "startSesHatSession:", &__rqtp);
      v23 = dispatch_time(0, v18);
      dispatch_semaphore_wait(v20, v23);
      block[0] = v19;
      block[1] = 3221225472;
      block[2] = ___SeshatCreateSessionWithTimeout_block_invoke_4;
      block[3] = &unk_1E67577F0;
      block[4] = v22;
      block[5] = v44;
      block[6] = a2;
      dispatch_sync((dispatch_queue_t)_SeshatCreateSessionWithTimeout_queue, block);
      dispatch_release(v20);
    }
    v24 = (void *)v39[5];
    if (a3 && v24)
    {
      *(_DWORD *)(a3 + 8) = objc_msgSend((id)getNFSeshatSessionClass(), "smallCrumbsFromError:", v39[5]);
      *(_QWORD *)a3 = objc_msgSend((id)getNFSeshatSessionClass(), "largeCrumbsFromError:", v39[5]);
      v24 = (void *)v39[5];
    }
    if (v24)

    v25 = v47[5];
    _Block_object_dispose(&v38, 8);
    _Block_object_dispose(v44, 8);
    _Block_object_dispose(&v46, 8);
    if (v17 > 3)
      break;
    ++v17;
  }
  while (!v25);
  if (!v25)
    SeshatPowerAssertion(0, v26, v11, v12, v13, v14, v15, v16, v29);
  return v25;
}

void sub_1B400E3B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
  uint64_t v34;

  _Block_object_dispose(&a28, 8);
  _Block_object_dispose(&a34, 8);
  _Block_object_dispose((const void *)(v34 - 168), 8);
  _Unwind_Resume(a1);
}

void SeshatPowerAssertion(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;

  if (SeshatPowerAssertion_taken == a1)
  {
    debuglog("SeshatPowerAssertion", CFSTR("not doing anything %d:%d"), a3, a4, a5, a6, a7, a8, a1);
  }
  else if (a1)
  {
    if (IOPMAssertionDeclareSystemActivity())
      debuglog("SeshatPowerAssertion", CFSTR("Unable to take power assertion."), v9, v10, v11, v12, v13, v14, v21);
    else
      SeshatPowerAssertion_taken = 1;
  }
  else if (IOPMAssertionRelease(SeshatPowerAssertion__powerAssertionId))
  {
    debuglog("SeshatPowerAssertion", CFSTR("Unable to remove power assertion."), v15, v16, v17, v18, v19, v20, a9);
  }
  else
  {
    SeshatPowerAssertion_taken = 0;
  }
}

uint64_t SeshatCreateSessionWithTimeout(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return SeshatCreateSessionWithTimeoutVerbose(a1, 0, 0, a4, a5, a6, a7, a8);
}

void SeshatEndSession(id *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  int v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  if (SeshatFwkAvailable())
  {
    v10 = SeshatHWAvailable(20);
    if (a1)
    {
      if (v10)
      {
        v11 = *a1;
        if (*a1)
        {
          objc_msgSend(*a1, "endSession");

          *a1 = 0;
          SeshatPowerAssertion(0, v12, v13, v14, v15, v16, v17, v18, a9);
        }
      }
    }
  }
}

uint64_t SeshatAugmentPreflightResult(unint64_t *a1)
{
  unint64_t v2;
  uint64_t result;
  void *v4;
  unint64_t v5;
  int v6;
  unint64_t v7;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;

  v2 = *a1;
  result = SeshatFwkAvailable();
  if ((_DWORD)result)
  {
    result = SeshatHWAvailable(20);
    if ((_DWORD)result)
    {
      result = objc_msgSend((id)getNFSecureElementClass(), "embeddedSecureElement");
      if (result)
      {
        v4 = (void *)result;
        v5 = v2 & 0xFF00000000000000;
        v6 = objc_msgSend((id)result, "hwType");
        if (v6 == 3)
        {
          v7 = v2 & 0xE7FFFFFFFFFFFFLL | ((unint64_t)((unint64_t)objc_msgSend((id)objc_msgSend(v4, "sequenceCounter"), "unsignedLongValue") > 0x1E9) << 51);
          v8 = (unint64_t)objc_msgSend((id)objc_msgSend(v4, "sequenceCounter"), "unsignedLongValue") > 0x22F;
        }
        else
        {
          if (v6 != 1)
          {
            v10 = v2 & 0xF7FFFFFFFFFFFFLL;
LABEL_13:
            *a1 = v10 | v5;
            return 1;
          }
          v7 = v2 & 0xE7FFFFFFFFFFFFLL | ((unint64_t)((unint64_t)objc_msgSend((id)objc_msgSend(v4, "sequenceCounter"), "unsignedLongValue") >> 4 > 0x102) << 51);
          v8 = (unint64_t)objc_msgSend((id)objc_msgSend(v4, "sequenceCounter"), "unsignedLongValue") >> 2 > 0x48E;
        }
        v9 = v8;
        v10 = v7 | (v9 << 52);
        goto LABEL_13;
      }
    }
  }
  return result;
}

uint64_t getNFSecureElementClass()
{
  uint64_t v0;
  _QWORD v2[5];
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  void (*v7)(uint64_t);
  uint64_t v8;

  v3 = 0;
  v4 = &v3;
  v5 = 0x3052000000;
  v6 = __Block_byref_object_copy__0;
  v7 = __Block_byref_object_dispose__0;
  v0 = getNFSecureElementClass_softClass;
  v8 = getNFSecureElementClass_softClass;
  if (!getNFSecureElementClass_softClass)
  {
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __getNFSecureElementClass_block_invoke;
    v2[3] = &unk_1E6757760;
    v2[4] = &v3;
    __getNFSecureElementClass_block_invoke((uint64_t)v2);
    v0 = v4[5];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1B400E6B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t SeshatPreWarm()
{
  if (SeshatFwkAvailable() && SeshatHWAvailable(20))
    return objc_msgSend((id)objc_msgSend((id)getNFHardwareManagerClass(), "sharedHardwareManager"), "preWarm");
  else
    return 0;
}

unint64_t SeshatRetry(id *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t SessionWithTimeoutVerbose;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  BOOL v33;
  char v34;
  __int128 v36;

  if (SeshatFwkAvailable() && SeshatHWAvailable(20))
  {
    v10 = 0;
    v11 = 0;
    v12 = 0;
    SessionWithTimeoutVerbose = (uint64_t)*a1;
    while (1)
    {
      if (v10)
      {
        v36 = xmmword_1B401C070;
        nanosleep((const timespec *)&v36, 0);
      }
      if (v10 > 2 || v11 == 7)
      {
        debuglog("SeshatRetry", CFSTR("transient error, re-creating session"), v4, v5, v6, v7, v8, v9, v36);
        SeshatEndSession(a1, v14, v15, v16, v17, v18, v19, v20, v36);
        SessionWithTimeoutVerbose = SeshatCreateSessionWithTimeoutVerbose(65000, 0, 0, v21, v22, v23, v24, v25);
        *a1 = (id)SessionWithTimeoutVerbose;
        if (!SessionWithTimeoutVerbose)
          break;
      }
      if ((seshat_debug_mask & 0x400) != 0 && (arc4random() & 0xF) == 0)
      {
        v12 = 0xFFFFLL;
        v11 = 7;
      }
      else
      {
        v32 = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a2, SessionWithTimeoutVerbose);
        v11 = v32;
        v12 = HIDWORD(v32);
      }
      if (v11)
        v33 = 0;
      else
        v33 = (_DWORD)v12 == 36864;
      v34 = !v33;
      if (v10 <= 3)
      {
        ++v10;
        if ((v34 & 1) != 0)
          continue;
      }
      return v11 | (unint64_t)(v12 << 32);
    }
    debuglog("SeshatRetry", CFSTR("failed to re-create session"), v26, v27, v28, v29, v30, v31, v36);
  }
  else
  {
    v12 = 0xFFFFLL;
    v11 = 6;
  }
  return v11 | (unint64_t)(v12 << 32);
}

unint64_t SeshatAllocateSlot(id *a1, char a2, char a3, uint64_t a4, CFTypeRef *a5, uint64_t a6)
{
  unint64_t v6;
  void *v13;
  const void *v14;
  _QWORD v16[7];
  char v17;
  char v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  uint64_t v24;

  v6 = 0xFFFF0000000ALL;
  if (a1 && *a1 && (seshat_debug_mask & 1) == 0)
  {
    v13 = (void *)MEMORY[0x1B5E33EBC]();
    v19 = 0;
    v20 = &v19;
    v21 = 0x3052000000;
    v22 = __Block_byref_object_copy__0;
    v23 = __Block_byref_object_dispose__0;
    v24 = 0;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __SeshatAllocateSlot_block_invoke;
    v16[3] = &unk_1E6757688;
    v17 = a2;
    v18 = a3;
    v16[4] = &v19;
    v16[5] = a4;
    v16[6] = a6;
    v6 = SeshatRetry(a1, (uint64_t)v16);
    v14 = (const void *)v20[5];
    if (v14)
      *a5 = CFRetain(v14);
    _Block_object_dispose(&v19, 8);
    objc_autoreleasePoolPop(v13);
  }
  return v6;
}

void sub_1B400E980(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__0(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

unint64_t SeshatDerive(id *a1, char a2, uint64_t a3, CFTypeRef *a4, uint64_t a5, uint64_t a6)
{
  unint64_t v6;
  void *v13;
  const void *v14;
  _QWORD v16[8];
  char v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  void (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  uint64_t v29;

  v6 = 0xFFFF0000000ALL;
  if (a1 && *a1 && (seshat_debug_mask & 2) == 0)
  {
    v13 = (void *)MEMORY[0x1B5E33EBC]();
    v24 = 0;
    v25 = &v24;
    v26 = 0x3052000000;
    v27 = __Block_byref_object_copy__0;
    v28 = __Block_byref_object_dispose__0;
    v29 = 0;
    v18 = 0;
    v19 = &v18;
    v20 = 0x3052000000;
    v21 = __Block_byref_object_copy__0;
    v22 = __Block_byref_object_dispose__0;
    v23 = 0;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __SeshatDerive_block_invoke;
    v16[3] = &unk_1E67576B0;
    v17 = a2;
    v16[6] = a3;
    v16[7] = a5;
    v16[4] = &v24;
    v16[5] = &v18;
    v6 = SeshatRetry(a1, (uint64_t)v16);
    v14 = (const void *)v25[5];
    if (v14)
      *a4 = CFRetain(v14);
    if (v19[5])
    {
      *(_DWORD *)(a6 + 8) = objc_msgSend((id)getNFSeshatSessionClass(), "smallCrumbsFromError:", v19[5]);
      *(_QWORD *)a6 = objc_msgSend((id)getNFSeshatSessionClass(), "largeCrumbsFromError:", v19[5]);
    }
    _Block_object_dispose(&v18, 8);
    _Block_object_dispose(&v24, 8);
    objc_autoreleasePoolPop(v13);
  }
  return v6;
}

void sub_1B400EB4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
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

uint64_t getNFSeshatSessionClass()
{
  uint64_t v0;
  _QWORD v2[5];
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  void (*v7)(uint64_t);
  uint64_t v8;

  v3 = 0;
  v4 = &v3;
  v5 = 0x3052000000;
  v6 = __Block_byref_object_copy__0;
  v7 = __Block_byref_object_dispose__0;
  v0 = getNFSeshatSessionClass_softClass;
  v8 = getNFSeshatSessionClass_softClass;
  if (!getNFSeshatSessionClass_softClass)
  {
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __getNFSeshatSessionClass_block_invoke;
    v2[3] = &unk_1E6757760;
    v2[4] = &v3;
    __getNFSeshatSessionClass_block_invoke((uint64_t)v2);
    v0 = v4[5];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1B400EC44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

unint64_t SeshatResetCounter(id *a1, char a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t v8;
  const __CFData *v11;
  __CFData *MutableCopy;
  CFIndex Length;
  void *v15;
  char v17;
  _QWORD v18[6];
  char v19;
  CFRange v20;

  v8 = 0xFFFF0000000ALL;
  if (a1 && *a1 && (seshat_debug_mask & 4) == 0)
  {
    v11 = (const __CFData *)a3;
    if ((seshat_debug_mask & 0x2000) != 0)
    {
      debuglog("SeshatResetCounter", CFSTR("corrupting reset token"), a3, a4, a5, a6, a7, a8, v17);
      Length = CFDataGetLength(v11);
      MutableCopy = CFDataCreateMutableCopy(0, Length, v11);
      v20.location = 0;
      v20.length = 4;
      CFDataReplaceBytes(MutableCopy, v20, (const UInt8 *)"0000", 4);
      v11 = MutableCopy;
    }
    else
    {
      MutableCopy = 0;
    }
    v15 = (void *)MEMORY[0x1B5E33EBC]();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __SeshatResetCounter_block_invoke;
    v18[3] = &__block_descriptor_49_e30____II_16__0__NFSeshatSession_8l;
    v19 = a2;
    v18[4] = v11;
    v18[5] = a4;
    v8 = SeshatRetry(a1, (uint64_t)v18);
    objc_autoreleasePoolPop(v15);
    if (MutableCopy)
      CFRelease(MutableCopy);
  }
  return v8;
}

unint64_t SeshatAuthorizeUpdate(id *a1, int a2, char a3, uint64_t a4, uint64_t a5)
{
  unint64_t v5;
  void *v11;
  _QWORD v13[6];
  int v14;
  char v15;

  v5 = 0xFFFF0000000ALL;
  if (a1 && (seshat_debug_mask & 8) == 0 && *a1)
  {
    v11 = (void *)MEMORY[0x1B5E33EBC]();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __SeshatAuthorizeUpdate_block_invoke;
    v13[3] = &__block_descriptor_53_e30____II_16__0__NFSeshatSession_8l;
    v14 = a2;
    v15 = a3;
    v13[4] = a4;
    v13[5] = a5;
    v5 = SeshatRetry(a1, (uint64_t)v13);
    objc_autoreleasePoolPop(v11);
  }
  return v5;
}

unint64_t SeshatDeleteSlot(id *a1, char a2, uint64_t a3)
{
  unint64_t v3;
  void *v7;
  _QWORD v9[5];
  char v10;

  v3 = 0xFFFF0000000ALL;
  if (a1 && *a1 && (seshat_debug_mask & 0x10) == 0)
  {
    v7 = (void *)MEMORY[0x1B5E33EBC]();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __SeshatDeleteSlot_block_invoke;
    v9[3] = &__block_descriptor_41_e30____II_16__0__NFSeshatSession_8l;
    v10 = a2;
    v9[4] = a3;
    v3 = SeshatRetry(a1, (uint64_t)v9);
    objc_autoreleasePoolPop(v7);
  }
  return v3;
}

unint64_t SeshatUpgradeSlot(id *a1, char a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4;
  void *v9;
  _QWORD v11[6];
  char v12;

  v4 = 0xFFFF0000000ALL;
  if (a1 && (seshat_debug_mask & 0x1000) == 0 && *a1)
  {
    v9 = (void *)MEMORY[0x1B5E33EBC]();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __SeshatUpgradeSlot_block_invoke;
    v11[3] = &__block_descriptor_49_e30____II_16__0__NFSeshatSession_8l;
    v12 = a2;
    v11[4] = a3;
    v11[5] = a4;
    v4 = SeshatRetry(a1, (uint64_t)v11);
    objc_autoreleasePoolPop(v9);
  }
  return v4;
}

unint64_t SeshatGetData(id *a1, CFTypeRef *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  unint64_t v5;
  void *v11;
  const void *v12;
  _QWORD v14[8];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  uint64_t v20;

  v5 = 0xFFFF0000000ALL;
  if (a1 && *a1 && (seshat_debug_mask & 0x20) == 0)
  {
    v11 = (void *)MEMORY[0x1B5E33EBC]();
    v15 = 0;
    v16 = &v15;
    v17 = 0x3052000000;
    v18 = __Block_byref_object_copy__0;
    v19 = __Block_byref_object_dispose__0;
    v20 = 0;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __SeshatGetData_block_invoke;
    v14[3] = &unk_1E6757738;
    v14[4] = &v15;
    v14[5] = a3;
    v14[6] = a4;
    v14[7] = a5;
    v5 = SeshatRetry(a1, (uint64_t)v14);
    v12 = (const void *)v16[5];
    if (v12)
      *a2 = CFRetain(v12);
    _Block_object_dispose(&v15, 8);
    objc_autoreleasePoolPop(v11);
  }
  return v5;
}

void sub_1B400F110(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t isTransientError(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  v2 = (void *)MEMORY[0x1B5E33EBC]();
  v3 = objc_msgSend((id)getNFSeshatSessionClass(), "isTransientError:", a1);
  objc_autoreleasePoolPop(v2);
  return v3;
}

uint64_t SeshatSeHistoryTest()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  id v4;

  v0 = (void *)MEMORY[0x1B5E33EBC]();
  v4 = 0;
  v1 = 0xFFFFFFFFLL;
  if (objc_msgSend((id)objc_msgSend((id)getNFHardwareManagerClass(), "sharedHardwareManager"), "secureElementBootHistory:", &v4)&& v4)
  {
    if ((int)objc_msgSend(v4, "count") < 1)
    {
      v1 = 0;
    }
    else
    {
      v2 = 0;
      LODWORD(v1) = 0;
      do
        v1 = objc_msgSend((id)objc_msgSend(v4, "objectAtIndex:", v2++), "intValue") + v1;
      while (v2 < (int)objc_msgSend(v4, "count"));
    }
  }
  objc_autoreleasePoolPop(v0);
  return v1;
}

CFDataRef SeshatCreateDerivedPasscode(CFDataRef result)
{
  _OWORD v1[2];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  memset(v1, 0, sizeof(v1));
  if (result)
  {
    ccsha256_di();
    ccdigest();
    return CFDataCreate(0, (const UInt8 *)v1, 32);
  }
  return result;
}

uint64_t SeshatDebug(uint64_t a1)
{
  uint64_t v1;

  v1 = seshat_debug_mask;
  seshat_debug_mask = a1;
  return v1;
}

uint64_t SeshatGetDebug()
{
  return seshat_debug_mask;
}

BOOL SeshatIsReportingEnabled(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  char v10;

  v8 = seshat_debug_mask;
  if (seshat_debug_mask)
    debuglog("SeshatIsReportingEnabled", CFSTR("not reporting aggd data, since debugging mode is enabled"), a3, a4, a5, a6, a7, a8, v10);
  return v8 == 0;
}

uint64_t SeshatGetNumberOfUsedSlots(CFDataRef theData)
{
  uint64_t v2;
  unsigned __int8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (theData)
  {
    v2 = 0;
    v3 = 0;
    do
    {
      if (CFDataGetBytePtr(theData)[v2] != 238)
        ++v3;
      ++v2;
    }
    while (v2 != 10);
    debuglog("SeshatGetNumberOfUsedSlots", CFSTR("number of enrolled slots %d"), v4, v5, v6, v7, v8, v9, v3);
  }
  else
  {
    return 0;
  }
  return v3;
}

uint64_t SeshatNextAvailableSlot(CFDataRef theData)
{
  uint64_t v2;

  if (theData)
  {
    v2 = 0;
    while (CFDataGetBytePtr(theData)[v2] != 238)
    {
      if (++v2 == 10)
        goto LABEL_5;
    }
  }
  else
  {
LABEL_5:
    LOBYTE(v2) = -1;
  }
  return v2;
}

uint64_t SeshatPreflightCheck(int a1, uint64_t a2, _BYTE *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  CFDataRef v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t Data;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unsigned __int8 v33;
  unint64_t v34;
  const __CFData *v35;
  uint64_t v36;
  unint64_t v37;
  const __CFData *v38;
  unint64_t v39;
  unsigned __int8 v40;
  const __CFData *v41;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  unsigned __int8 v48;
  unint64_t v49;
  unint64_t v50;
  unint64_t v51;
  unsigned __int8 v52;
  const __CFData *v53;
  unint64_t v54;
  unint64_t v56;
  uint64_t v57;
  unint64_t v58;
  char v59;
  uint64_t v60;
  _QWORD v61[2];
  char v62;
  id v63;
  unsigned int v64;
  unsigned int v65;
  char v66;
  CFTypeRef v67;
  CFTypeRef cf;
  CFDataRef theData;
  CFTypeRef v70;
  CFTypeRef v71;
  const __CFData *v72;

  v71 = 0;
  v72 = 0;
  v70 = 0;
  cf = 0;
  theData = 0;
  v67 = 0;
  v66 = -1;
  v64 = 0;
  v65 = 0;
  v63 = 0;
  v62 = 0;
  v61[0] = 0;
  v61[1] = 0;
  v11 = CFDataCreate(0, goodHash, 32);
  if (a1)
  {
    v12 = SeshatSeHistoryTest();
    if ((SeshatAvailableinRestrictedMode() & 1) == 0)
    {
      if (v12)
      {
        v15 = 0;
        LOBYTE(v16) = -1;
        v17 = 1;
        goto LABEL_63;
      }
    }
  }
  v18 = (void *)SeshatCreateSessionWithTimeoutVerbose(65000, &v62, (uint64_t)v61, v6, v7, v8, v9, v10);
  v63 = v18;
  if (!v18)
  {
    v17 = 2;
    goto LABEL_67;
  }
  if (a2 && ((*(uint64_t (**)(uint64_t, void *))(a2 + 16))(a2, v18) & 1) == 0)
  {
    debuglog("SeshatPreflightCheck", CFSTR("unsatisfactory condition for preflight"), v19, v20, v21, v22, v23, v24, v59);
    v15 = 0;
    LOBYTE(v16) = -1;
    v17 = 14;
    goto LABEL_63;
  }
  Data = SeshatGetData(&v63, (CFTypeRef *)&theData, (uint64_t)&v66, (uint64_t)&v65, (uint64_t)&v64);
  v33 = Data;
  v34 = HIDWORD(Data);
  if (Data != 0x900000000000)
  {
    if (HIDWORD(Data) == 27266)
    {
      debuglog("SeshatPreflightCheck", CFSTR("no seshat applet"), v27, v28, v29, v30, v31, v32, v59);
      v36 = 13;
    }
    else if (HIDWORD(Data) == 26277)
    {
      debuglog("SeshatPreflightCheck", CFSTR("restricted mode"), v27, v28, v29, v30, v31, v32, v59);
      v36 = 12;
    }
    else
    {
      debuglog("SeshatPreflightCheck", CFSTR("unknown getData() -> 0x%x:0x%x"), v27, v28, v29, v30, v31, v32, Data);
      v36 = 3;
    }
    v15 = 0;
    v17 = ((_DWORD)v34 << 16) | ((unint64_t)v33 << 8) | v36;
LABEL_62:
    LOBYTE(v16) = -1;
    goto LABEL_63;
  }
  v60 = 1000 * ((v64 + 999) / 0x3E8);
  analytics_send_seshat_write_count(&v60, v26, v27, v28, v29, v30, v31, v32, v59);
  v35 = theData;
  if (!theData)
  {
    v15 = 0;
    LOBYTE(v16) = -1;
LABEL_88:
    v17 = 4;
    goto LABEL_63;
  }
  v16 = 0;
  v17 = 4;
  while (CFDataGetBytePtr(v35)[v16] != 238)
  {
    if (++v16 == 10)
    {
      v15 = 0;
      goto LABEL_62;
    }
  }
  if (v16 > 9u)
  {
    v15 = 0;
    goto LABEL_88;
  }
  v17 = 2415919109;
  debuglog("SeshatPreflightCheck", CFSTR("globalWriteCounter = %d, globalWriteCounterLimit = %d, slot = %d\n"), v14, v6, v7, v8, v9, v10, v64);
  v15 = 0;
  if (v65 >= 0x2711 && v64 < v65 - 10000)
  {
    v37 = SeshatAllocateSlot(&v63, v16, 238, 0, (CFTypeRef *)&v72, (uint64_t)&v64);
    if ((_DWORD)v37 || HIDWORD(v37) != 36864)
    {
      v15 = 0;
      v17 = (HIDWORD(v37) << 16) | ((unint64_t)v37 << 8) | 6;
      goto LABEL_63;
    }
    v38 = v72;
    if (!v72)
    {
      debuglog("SeshatPreflightCheck", CFSTR("no reset token returned"), v14, v6, v7, v8, v9, v10, v59);
      v15 = 1;
      v17 = 6;
      goto LABEL_63;
    }
    CFRelease(v35);
    theData = 0;
    v39 = SeshatGetData(&v63, (CFTypeRef *)&theData, (uint64_t)&v66, (uint64_t)&v65, (uint64_t)&v64);
    v40 = v39;
    if ((_DWORD)v39 || HIDWORD(v39) != 36864)
    {
      v58 = (HIDWORD(v39) << 16) | ((unint64_t)v39 << 8);
LABEL_100:
      v17 = v58 | 3;
      goto LABEL_105;
    }
    v41 = theData;
    if (CFDataGetBytePtr(theData)[v16] != 238 && (char)CFDataGetBytePtr(v41)[v16] < 0)
    {
      v56 = (unint64_t)v40 << 8;
      v57 = 2415919110;
      goto LABEL_104;
    }
    v42 = SeshatDerive(&v63, v16, (uint64_t)v11, &v71, (uint64_t)&v64, (uint64_t)v61);
    v43 = HIDWORD(v42);
    if (!(_DWORD)v42 && v43 == 36864)
    {
      v44 = SeshatResetCounter(&v63, v16, (uint64_t)v38, (uint64_t)&v64, v7, v8, v9, v10);
      v45 = HIDWORD(v44);
      if ((_DWORD)v44 || v45 != 36864)
        goto LABEL_85;
      v42 = SeshatDerive(&v63, v16, (uint64_t)v11, &v70, (uint64_t)&v64, (uint64_t)v61);
      v43 = HIDWORD(v42);
      if (!(_DWORD)v42 && v43 == 36864)
      {
        if (!CFEqual(v70, v71))
        {
          v15 = 1;
          v17 = 9;
          goto LABEL_63;
        }
        v44 = SeshatResetCounter(&v63, v16, (uint64_t)v38, (uint64_t)&v64, v7, v8, v9, v10);
        v45 = HIDWORD(v44);
        if (!(_DWORD)v44 && v45 == 36864)
        {
          v46 = SeshatAuthorizeUpdate(&v63, 1, v16, (uint64_t)v38, (uint64_t)&v64);
          if ((_DWORD)v46 || HIDWORD(v46) != 36864)
          {
            v56 = (HIDWORD(v46) << 16) | ((unint64_t)v46 << 8);
          }
          else
          {
            v47 = SeshatAuthorizeUpdate(&v63, 0, v16, (uint64_t)v38, (uint64_t)&v64);
            v48 = v47;
            if (!(_DWORD)v47 && HIDWORD(v47) == 36864)
            {
              if (a3)
                *a3 |= 1u;
              if (SeshatPreflightGetResetStuff(v64, v38, (CFDataRef *)&cf, (CFDataRef *)&v67))
              {
                v56 = (unint64_t)v48 << 8;
                v57 = 2415919120;
                goto LABEL_104;
              }
              v49 = SeshatUpgradeSlot(&v63, v16, (uint64_t)cf, (uint64_t)&v64);
              if (!(_DWORD)v49 && HIDWORD(v49) == 36864)
              {
                v50 = SeshatResetCounter(&v63, v16, (uint64_t)v67, (uint64_t)&v64, v7, v8, v9, v10);
                if (!(_DWORD)v50 && HIDWORD(v50) == 36864)
                {
                  if (v41)
                  {
                    CFRelease(v41);
                    theData = 0;
                  }
                  v51 = SeshatGetData(&v63, (CFTypeRef *)&theData, (uint64_t)&v66, (uint64_t)&v65, (uint64_t)&v64);
                  v52 = v51;
                  if (!(_DWORD)v51 && HIDWORD(v51) == 36864)
                  {
                    v53 = theData;
                    if (CFDataGetBytePtr(theData)[v16] == 238 || ((char)CFDataGetBytePtr(v53)[v16] & 0x80000000) == 0)
                    {
                      v56 = (unint64_t)v52 << 8;
                      v57 = 2415919123;
                    }
                    else if ((CFDataGetBytePtr(v53)[v16] & 0x7F) != 0)
                    {
                      v56 = (unint64_t)v52 << 8;
                      v57 = 2415919124;
                    }
                    else
                    {
                      if (a3)
                        *a3 |= 2u;
                      v54 = SeshatDeleteSlot(&v63, v16, (uint64_t)&v64);
                      if (!(_DWORD)v54 && HIDWORD(v54) == 36864)
                      {
                        v15 = 0;
                        v17 = 0;
                        goto LABEL_63;
                      }
                      v56 = (HIDWORD(v54) << 16) | ((unint64_t)v54 << 8);
                      v57 = 11;
                    }
                    goto LABEL_104;
                  }
                  v58 = (HIDWORD(v51) << 16) | ((unint64_t)v51 << 8);
                  goto LABEL_100;
                }
                v56 = (HIDWORD(v50) << 16) | ((unint64_t)v50 << 8);
                v57 = 18;
LABEL_104:
                v17 = v56 | v57;
                goto LABEL_105;
              }
              v17 = (HIDWORD(v49) << 16) | ((unint64_t)v49 << 8) | 0xF;
LABEL_105:
              v15 = 1;
              goto LABEL_63;
            }
            v56 = (HIDWORD(v47) << 16) | ((unint64_t)v47 << 8);
          }
          v57 = 10;
          goto LABEL_104;
        }
LABEL_85:
        v17 = ((_DWORD)v45 << 16) | ((unint64_t)v44 << 8) | 8;
        goto LABEL_105;
      }
    }
    v17 = ((_DWORD)v43 << 16) | ((unint64_t)v42 << 8) | 7;
    goto LABEL_105;
  }
LABEL_63:
  if (v63)
  {
    if (v15)
      SeshatDeleteSlot(&v63, v16, (uint64_t)&v64);
    SeshatEndSession(&v63, v13, v14, v6, v7, v8, v9, v10, v59);
  }
LABEL_67:
  if (v72)
    CFRelease(v72);
  if (v71)
    CFRelease(v71);
  if (v70)
    CFRelease(v70);
  if (theData)
    CFRelease(theData);
  if (v11)
    CFRelease(v11);
  if (cf)
  {
    CFRelease(cf);
    cf = 0;
  }
  if (v67)
    CFRelease(v67);
  return v17;
}

uint64_t SeshatAvailableinRestrictedMode()
{
  uint64_t result;
  void *v1;

  result = SeshatFwkAvailable();
  if ((_DWORD)result)
  {
    result = SeshatHWAvailable(20);
    if ((_DWORD)result)
    {
      v1 = (void *)objc_msgSend((id)getNFSecureElementClass(), "embeddedSecureElement");
      if (v1)
        LODWORD(v1) = objc_msgSend(v1, "isSeshatAvailabledInRestrictedMode");
      return v1 | ((BYTE1(seshat_debug_mask) & 0x40) >> 6);
    }
  }
  return result;
}

uint64_t SeshatPreflightGetResetStuff(unsigned int a1, const __CFData *a2, CFDataRef *a3, CFDataRef *a4)
{
  uint64_t v8;
  const UInt8 *v9;
  CFIndex v10;
  uint64_t v11;
  unint64_t v12;
  UInt8 *v13;
  CFDataRef v14;
  CFDataRef v15;
  uint64_t v17;
  CFIndex v18;
  _DWORD v19[2];
  int v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  char v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v20 = 0;
  v28 = 0u;
  v29 = 0u;
  MEMORY[0x1B5E33C64]();
  MEMORY[0x1E0C80A78]();
  LOBYTE(v19[1]) = 0;
  v19[0] = 2;
  v23 = xmmword_1B401C0A5;
  v24 = unk_1B401C0B5;
  v25 = xmmword_1B401C0C5;
  v26 = unk_1B401C0D5;
  v21 = xmmword_1B401C085;
  v22 = unk_1B401C095;
  v27 = -121;
  cczp_bitlen();
  MEMORY[0x1E0C80A78]();
  v9 = (const UInt8 *)&v17 - ((v8 + 24) & 0x7FFFFFFFFFFFFFF0);
  v18 = v10;
  v11 = 0xFFFFFFFFLL;
  if (a2)
  {
    if (a3)
    {
      if (a4)
      {
        ccrng();
        if (!v20)
        {
          if (ccec_x963_import_priv())
            return 0xFFFFFFFFLL;
          *(_DWORD *)((char *)v19 + 1) = bswap32(a1);
          ccsha256_di();
          ccdigest();
          if (ccec_sign())
          {
            return 0xFFFFFFFFLL;
          }
          else
          {
            v12 = (((unint64_t)(cczp_bitlen() + 7) >> 2) | 1) + 16;
            v13 = (UInt8 *)malloc_type_malloc(v12, 0xE0546DF0uLL);
            ccec_x963_export();
            *(_OWORD *)v13 = *(_OWORD *)CFDataGetBytePtr(a2);
            MEMORY[0x1E0C80A78]();
            ccec_x963_import_pub();
            HIBYTE(v17) = 0;
            if (ccec_verify() || !HIBYTE(v17))
            {
              puts("validation failed");
              v11 = 0xFFFFFFFFLL;
            }
            else
            {
              v14 = CFDataCreate(0, v13, v12);
              *a3 = v14;
              if (v14)
              {
                v15 = CFDataCreate(0, v9, v18);
                *a4 = v15;
                if (v15)
                  v11 = 0;
                else
                  v11 = 0xFFFFFFFFLL;
              }
              else
              {
                v11 = 0xFFFFFFFFLL;
              }
            }
            if (v13)
              free(v13);
          }
        }
      }
    }
  }
  return v11;
}

void SeshatReportIfNeeded(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  char v10;
  _QWORD v11[3];

  if (a1 == 27268)
  {
    v11[1] = v8;
    v11[2] = v9;
    v11[0] = 1;
    analytics_send_seshat_eol(v11, a2, a3, a4, a5, a6, a7, a8, v10);
  }
}

uint64_t SeshatEnabled()
{
  return 1;
}

uint64_t SeshatForceEOL()
{
  return BYTE1(seshat_debug_mask) >> 7;
}

uint64_t KBSeshatGetSeSecret(id *a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, _QWORD *a6, size_t *a7)
{
  uint64_t v8;
  CFDataRef v12;
  unint64_t v13;
  const __CFData *v14;
  size_t Length;
  void *v16;
  void *v17;
  const UInt8 *BytePtr;
  uint64_t v20;
  int v21;
  CFDataRef theData;
  UInt8 bytes[16];
  __int128 v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  theData = 0;
  *(_OWORD *)bytes = 0u;
  v24 = 0u;
  v21 = 0;
  if (a1 && *a1)
  {
    v8 = 4294967293;
    if (a4)
    {
      if (a5)
      {
        v8 = 4294967292;
        if (a6)
        {
          if (a7)
          {
            ccsha256_di();
            ccdigest();
            v12 = CFDataCreateWithBytesNoCopy(0, bytes, 32, (CFAllocatorRef)*MEMORY[0x1E0C9AE20]);
            v13 = SeshatDerive(a1, a3, (uint64_t)v12, (CFTypeRef *)&theData, (uint64_t)&v21, (uint64_t)&v20);
            v14 = theData;
            if (v13 == 0x900000000000)
            {
              Length = CFDataGetLength(theData);
              v16 = malloc_type_malloc(Length, 0x89E86EC7uLL);
              if (v16)
              {
                v17 = v16;
                BytePtr = CFDataGetBytePtr(v14);
                memcpy(v17, BytePtr, Length);
                v8 = 0;
                *a6 = v17;
                *a7 = Length;
              }
              else
              {
                v8 = 4294967290;
              }
            }
            else
            {
              v8 = 4294967291;
            }
            if (v14)
              CFRelease(v14);
            if (v12)
              CFRelease(v12);
          }
        }
      }
    }
  }
  else
  {
    v8 = 4294967294;
  }
  memset_s(bytes, 0x20uLL, 0, 0x20uLL);
  return v8;
}

BOOL SeshatIsPreflightResultTransient(__int16 a1)
{
  return (a1 & 0x1F) == 2 || (a1 & 0x1F) == 14 || (a1 & 0xFF00) == 1792;
}

uint64_t SeshatCreateNonceBlob(uint64_t result, unsigned int a2, uint64_t a3)
{
  *(_DWORD *)a3 = 0;
  *(_BYTE *)(a3 + 4) = 0;
  *(_BYTE *)a3 = result;
  *(_DWORD *)(a3 + 1) = bswap32(a2);
  return result;
}

const __CFData *SeshatIsNonceEquivalent(char a1, unsigned int a2, CFDataRef theData, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  const __CFData *v8;
  const UInt8 *BytePtr;
  char v13;
  _BYTE v14[5];

  if ((seshat_debug_mask & 0x10000) != 0)
  {
    debuglog("SeshatIsNonceEquivalent", CFSTR("not eq"), (uint64_t)theData, a4, a5, a6, a7, a8, v13);
    return 0;
  }
  else
  {
    v8 = theData;
    v14[0] = a1;
    *(_DWORD *)&v14[1] = bswap32(a2);
    if (theData)
    {
      if (CFDataGetLength(theData) == 5)
      {
        BytePtr = CFDataGetBytePtr(v8);
        v8 = (const __CFData *)(*(_DWORD *)v14 == *(_DWORD *)BytePtr && v14[4] == BytePtr[4]);
      }
      else
      {
        v8 = 0;
      }
    }
    debuglog("SeshatIsNonceEquivalent", CFSTR("nonce eq: %d,%u -> %d"), (uint64_t)theData, a4, a5, a6, a7, a8, a1);
  }
  return v8;
}

Class __getNFHardwareManagerClass_block_invoke(uint64_t a1)
{
  Class result;

  NearFieldLibrary();
  result = objc_getClass("NFHardwareManager");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
    __getNFHardwareManagerClass_block_invoke_cold_1();
  getNFHardwareManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  return result;
}

void NearFieldLibrary()
{
  void *v0;
  __int128 v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v0 = 0;
  if (!NearFieldLibraryCore_frameworkLibrary)
  {
    v1 = xmmword_1E6757780;
    v2 = 0;
    NearFieldLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!NearFieldLibraryCore_frameworkLibrary)
    NearFieldLibrary_cold_1(&v0);
}

Class __getNFTapToRadarClass_block_invoke(uint64_t a1)
{
  Class result;

  NearFieldLibrary();
  result = objc_getClass("NFTapToRadar");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
    __getNFTapToRadarClass_block_invoke_cold_1();
  getNFTapToRadarClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  return result;
}

Class __getNFSecureElementClass_block_invoke(uint64_t a1)
{
  Class result;

  NearFieldLibrary();
  result = objc_getClass("NFSecureElement");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
    __getNFSecureElementClass_block_invoke_cold_1();
  getNFSecureElementClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  return result;
}

Class __getNFSeshatSessionClass_block_invoke(uint64_t a1)
{
  Class result;

  NearFieldLibrary();
  result = objc_getClass("NFSeshatSession");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
    __getNFSeshatSessionClass_block_invoke_cold_1();
  getNFSeshatSessionClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  return result;
}

_QWORD *MKBEventsRegister(NSObject *a1, const void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  mach_port_t v10;
  const __CFDictionary *v11;
  io_service_t MatchingService;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  io_service_t v19;
  IONotificationPortRef v20;
  IONotificationPort *v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const __CFString *v44;
  NSObject *v46;
  const void *v47;
  char v48;
  io_object_t notification;

  notification = 0;
  if (!a1 || !a2)
  {
    v44 = CFSTR("bad arguments");
LABEL_13:
    debuglog("MKBEventsRegister", v44, a3, a4, a5, a6, a7, a8, v48);
    return 0;
  }
  v10 = *MEMORY[0x1E0CBBAA8];
  v11 = IOServiceMatching("AppleKeyStore");
  MatchingService = IOServiceGetMatchingService(v10, v11);
  if (!MatchingService)
  {
    debuglog("MKBEventsRegister", CFSTR("failed to find %s service"), v13, v14, v15, v16, v17, v18, (char)"AppleKeyStore");
    return 0;
  }
  v19 = MatchingService;
  v20 = IONotificationPortCreate(v10);
  if (!v20)
  {
    v44 = CFSTR("failed to create notification port for AKS");
    goto LABEL_13;
  }
  v21 = v20;
  v22 = malloc_type_calloc(1uLL, 0x20uLL, 0x10A0040648D5F1CuLL);
  v29 = v22;
  if (!v22)
  {
    debuglog("MKBEventsRegister", CFSTR("failed to allocate memory for event callback"), v23, v24, v25, v26, v27, v28, v48);
    IONotificationPortDestroy(v21);
    return v29;
  }
  *v22 = v21;
  v30 = _Block_copy(a2);
  v29[1] = v30;
  if (v30)
  {
    v37 = dispatch_queue_create_with_target_V2("mkb events", 0, a1);
    v29[3] = v37;
    IONotificationPortSetDispatchQueue(v21, v37);
    if (!IOServiceAddInterestNotification(v21, v19, "IOGeneralInterest", (IOServiceInterestCallback)aksNotificationCB, v29, &notification))
    {
      *((_DWORD *)v29 + 4) = notification;
      *((_DWORD *)v29 + 5) = 1918985081;
      return v29;
    }
    debuglog("MKBEventsRegister", CFSTR("failed to add interest notification"), v38, v39, v40, v41, v42, v43, v48);
    if (notification)
      IOObjectRelease(notification);
  }
  else
  {
    debuglog("MKBEventsRegister", CFSTR("failed to copy block"), v31, v32, v33, v34, v35, v36, v48);
  }
  IONotificationPortDestroy(v21);
  v46 = v29[3];
  if (v46)
    dispatch_release(v46);
  v47 = (const void *)v29[1];
  if (v47)
    _Block_release(v47);
  free(v29);
  return 0;
}

void MKBEventsUnregister(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[5];

  if (a1)
  {
    IOObjectRelease(*(_DWORD *)(a1 + 16));
    IONotificationPortDestroy(*(IONotificationPortRef *)a1);
    v2 = *(NSObject **)(a1 + 24);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 0x40000000;
    block[2] = __MKBEventsUnregister_block_invoke;
    block[3] = &__block_descriptor_tmp_1;
    block[4] = a1;
    dispatch_barrier_async(v2, block);
  }
}

void analytics_send_persisted_seshat_recovery_required(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char v8;
  unint64_t v9;

  v9 = a1;
  analytics_send_seshat_recovery_required(&v9, a2, a3, a4, a5, a6, a7, a8, v8);
}

void analytics_send_persisted_seshat_report(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char v8;
  uint64_t v9;

  v9 = a1;
  analytics_send_seshat_report(&v9, a2, a3, a4, a5, a6, a7, a8, v8);
}

void analytics_send_persisted_sidp_recovery(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char v8;
  uint64_t v9;

  v9 = a1;
  analytics_send_sidp_recovery(&v9, a2, a3, a4, a5, a6, a7, a8, v8);
}

void analytics_send_persisted_forgotten_passcode_event(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  char v8;
  uint64_t v9;

  v9 = a1;
  analytics_send_forgotten_passcode_event(&v9, a2, a3, a4, a5, a6, a7, a8, v8);
}

void analytics_send_nfc_hardware_state(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (MEMORY[0x1E0D15478])
    analytics_send_event_lazy();
  else
    debuglog("analytics_send_nfc_hardware_state", CFSTR("CA fwk missing, not sending event"), a3, a4, a5, a6, a7, a8, a9);
}

xpc_object_t __analytics_send_nfc_hardware_state_block_invoke(uint64_t a1)
{
  xpc_object_t v2;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v2, "timedout", **(_BYTE **)(a1 + 32));
  xpc_dictionary_set_uint64(v2, "duration", *(unsigned int *)(*(_QWORD *)(a1 + 32) + 4));
  xpc_dictionary_set_uint64(v2, "state", *(unsigned int *)(*(_QWORD *)(a1 + 32) + 8));
  return v2;
}

void analytics_send_passcode_status(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  debuglog("analytics_send_passcode_status", CFSTR("AnalyticsEvent: is_set: %llu, type: %llu, activation_status: %llu"), a3, a4, a5, a6, a7, a8, *a1);
  if (MEMORY[0x1E0D15478])
    analytics_send_event_lazy();
  else
    debuglog("analytics_send_passcode_status", CFSTR("CA fwk missing, not sending event"), v9, v10, v11, v12, v13, v14, a9);
}

xpc_object_t __analytics_send_passcode_status_block_invoke(uint64_t a1)
{
  xpc_object_t v2;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v2, "is_set", **(_BYTE **)(a1 + 32));
  xpc_dictionary_set_uint64(v2, "type", *(unsigned int *)(*(_QWORD *)(a1 + 32) + 4));
  xpc_dictionary_set_uint64(v2, "activation_status", *(unsigned int *)(*(_QWORD *)(a1 + 32) + 8));
  return v2;
}

void analytics_send_kek_stats(char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  debuglog("analytics_send_kek_stats", CFSTR("AnalyticsEvent: xart_policy: %llu, xart_policy_enforced: %llu, xart_policy_missing: %llu"), a3, a4, a5, a6, a7, a8, *a1);
  if (MEMORY[0x1E0D15478])
    analytics_send_event_lazy();
  else
    debuglog("analytics_send_kek_stats", CFSTR("CA fwk missing, not sending event"), v9, v10, v11, v12, v13, v14, a9);
}

xpc_object_t __analytics_send_kek_stats_block_invoke(uint64_t a1)
{
  xpc_object_t v2;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v2, "xart_policy", **(_BYTE **)(a1 + 32));
  xpc_dictionary_set_BOOL(v2, "xart_policy_enforced", *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1));
  xpc_dictionary_set_BOOL(v2, "xart_policy_missing", *(_BYTE *)(*(_QWORD *)(a1 + 32) + 2));
  return v2;
}

void analytics_send_seshat_debug(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  debuglog("analytics_send_seshat_debug", CFSTR("AnalyticsEvent: debug: %llu"), a3, a4, a5, a6, a7, a8, *a1);
  if (MEMORY[0x1E0D15478])
    analytics_send_event_lazy();
  else
    debuglog("analytics_send_seshat_debug", CFSTR("CA fwk missing, not sending event"), v9, v10, v11, v12, v13, v14, a9);
}

xpc_object_t __analytics_send_seshat_debug_block_invoke(uint64_t a1)
{
  xpc_object_t v2;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "debug", **(_QWORD **)(a1 + 32));
  return v2;
}

void analytics_send_seshat_enroll(__int16 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  __int16 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const __CFString *v24;

  v9 = *a1;
  *a1 = *a1 & 0xFC3F | 0x80;
  debuglog("analytics_send_seshat_enroll", CFSTR("AnalyticsEvent: X: %llu, Sampling: %llu, Vslot: %llu, version: %llu, WCProtected: %llu, SEPRMProtected: %llu, AKPUProtected: %llu, PSProtected: %llu, SeshatRM: %llu, unhealthy: %llu"), a3, a4, a5, a6, a7, a8, v9 & 1);
  if (SeshatIsReportingEnabled(v10, v11, v12, v13, v14, v15, v16, v17))
  {
    if (MEMORY[0x1E0D15478])
    {
      analytics_send_event_lazy();
      return;
    }
    v24 = CFSTR("CA fwk missing, not sending event");
  }
  else
  {
    v24 = CFSTR("runtime condition not sastisifed");
  }
  debuglog("analytics_send_seshat_enroll", v24, v18, v19, v20, v21, v22, v23, a9);
}

xpc_object_t __analytics_send_seshat_enroll_block_invoke(uint64_t a1)
{
  xpc_object_t v2;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "X", **(_WORD **)(a1 + 32) & 1);
  xpc_dictionary_set_uint64(v2, "Sampling", ((unint64_t)**(unsigned __int16 **)(a1 + 32) >> 1) & 1);
  xpc_dictionary_set_uint64(v2, "Vslot", ((unint64_t)**(unsigned __int16 **)(a1 + 32) >> 2) & 0xF);
  xpc_dictionary_set_uint64(v2, "version", ((unint64_t)**(unsigned __int16 **)(a1 + 32) >> 6) & 0xF);
  xpc_dictionary_set_uint64(v2, "WCProtected", ((unint64_t)**(unsigned __int16 **)(a1 + 32) >> 10) & 1);
  xpc_dictionary_set_uint64(v2, "SEPRMProtected", ((unint64_t)**(unsigned __int16 **)(a1 + 32) >> 11) & 1);
  xpc_dictionary_set_uint64(v2, "AKPUProtected", ((unint64_t)**(unsigned __int16 **)(a1 + 32) >> 12) & 1);
  xpc_dictionary_set_uint64(v2, "PSProtected", ((unint64_t)**(unsigned __int16 **)(a1 + 32) >> 13) & 1);
  xpc_dictionary_set_uint64(v2, "SeshatRM", ((unint64_t)**(unsigned __int16 **)(a1 + 32) >> 14) & 1);
  xpc_dictionary_set_uint64(v2, "unhealthy", (unint64_t)**(unsigned __int16 **)(a1 + 32) >> 15);
  return v2;
}

void analytics_send_seshat_unenroll(__int16 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  __int16 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const __CFString *v24;

  v9 = *a1;
  *a1 = *a1 & 0xFC3F | 0x80;
  debuglog("analytics_send_seshat_unenroll", CFSTR("AnalyticsEvent: X: %llu, Sampling: %llu, Vslot: %llu, version: %llu, WCProtected: %llu, SEPRMProtected: %llu, AKPUProtected: %llu, PSProtected: %llu, SeshatRM: %llu, unhealthy: %llu"), a3, a4, a5, a6, a7, a8, v9 & 1);
  if (SeshatIsReportingEnabled(v10, v11, v12, v13, v14, v15, v16, v17))
  {
    if (MEMORY[0x1E0D15478])
    {
      analytics_send_event_lazy();
      return;
    }
    v24 = CFSTR("CA fwk missing, not sending event");
  }
  else
  {
    v24 = CFSTR("runtime condition not sastisifed");
  }
  debuglog("analytics_send_seshat_unenroll", v24, v18, v19, v20, v21, v22, v23, a9);
}

xpc_object_t __analytics_send_seshat_unenroll_block_invoke(uint64_t a1)
{
  xpc_object_t v2;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "X", **(_WORD **)(a1 + 32) & 1);
  xpc_dictionary_set_uint64(v2, "Sampling", ((unint64_t)**(unsigned __int16 **)(a1 + 32) >> 1) & 1);
  xpc_dictionary_set_uint64(v2, "Vslot", ((unint64_t)**(unsigned __int16 **)(a1 + 32) >> 2) & 0xF);
  xpc_dictionary_set_uint64(v2, "version", ((unint64_t)**(unsigned __int16 **)(a1 + 32) >> 6) & 0xF);
  xpc_dictionary_set_uint64(v2, "WCProtected", ((unint64_t)**(unsigned __int16 **)(a1 + 32) >> 10) & 1);
  xpc_dictionary_set_uint64(v2, "SEPRMProtected", ((unint64_t)**(unsigned __int16 **)(a1 + 32) >> 11) & 1);
  xpc_dictionary_set_uint64(v2, "AKPUProtected", ((unint64_t)**(unsigned __int16 **)(a1 + 32) >> 12) & 1);
  xpc_dictionary_set_uint64(v2, "PSProtected", ((unint64_t)**(unsigned __int16 **)(a1 + 32) >> 13) & 1);
  xpc_dictionary_set_uint64(v2, "SeshatRM", ((unint64_t)**(unsigned __int16 **)(a1 + 32) >> 14) & 1);
  xpc_dictionary_set_uint64(v2, "unhealthy", (unint64_t)**(unsigned __int16 **)(a1 + 32) >> 15);
  return v2;
}

void analytics_send_seshat_eol(_BYTE *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const __CFString *v23;

  debuglog("analytics_send_seshat_eol", CFSTR("AnalyticsEvent: occured: %llu"), a3, a4, a5, a6, a7, a8, *a1 & 1);
  if (SeshatIsReportingEnabled(v9, v10, v11, v12, v13, v14, v15, v16))
  {
    if (MEMORY[0x1E0D15478])
    {
      analytics_send_event_lazy();
      return;
    }
    v23 = CFSTR("CA fwk missing, not sending event");
  }
  else
  {
    v23 = CFSTR("runtime condition not sastisifed");
  }
  debuglog("analytics_send_seshat_eol", v23, v17, v18, v19, v20, v21, v22, a9);
}

xpc_object_t __analytics_send_seshat_eol_block_invoke(uint64_t a1)
{
  xpc_object_t v2;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "occured", **(_BYTE **)(a1 + 32) & 1);
  return v2;
}

void analytics_send_preflight_result(unsigned int *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  int v9;
  int v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const __CFString *v26;

  v9 = *((unsigned __int16 *)a1 + 2);
  v10 = v9 | (*((unsigned __int8 *)a1 + 6) << 16);
  v11 = *a1;
  *((_WORD *)a1 + 2) = v9;
  *((_BYTE *)a1 + 6) = BYTE2(v10);
  *a1 = v11 & 0xFFFFFF1F | 0x60;
  debuglog("analytics_send_preflight_result", CFSTR("AnalyticsEvent: reason: %llu, version: %llu, nf_result: %llu, applet_result: %llu, num_fails: %llu, num_preflights: %llu, failed: %llu, calling_ctx: %llu, jcop_seq_gen: %llu, jcop_seq_gen2: %llu"), a3, a4, a5, a6, a7, a8, v11 & 0x1F);
  if (SeshatIsReportingEnabled(v12, v13, v14, v15, v16, v17, v18, v19))
  {
    if (MEMORY[0x1E0D15478])
    {
      analytics_send_event_lazy();
      return;
    }
    v26 = CFSTR("CA fwk missing, not sending event");
  }
  else
  {
    v26 = CFSTR("runtime condition not sastisifed");
  }
  debuglog("analytics_send_preflight_result", v26, v20, v21, v22, v23, v24, v25, a9);
}

xpc_object_t __analytics_send_preflight_result_block_invoke(uint64_t a1)
{
  xpc_object_t v2;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "reason", **(_DWORD **)(a1 + 32) & 0x1FLL);
  xpc_dictionary_set_uint64(v2, "version", **(_DWORD **)(a1 + 32) >> 5);
  xpc_dictionary_set_uint64(v2, "nf_result", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 1));
  xpc_dictionary_set_uint64(v2, "applet_result", *(unsigned __int16 *)(*(_QWORD *)(a1 + 32) + 2));
  xpc_dictionary_set_uint64(v2, "num_fails", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 4));
  xpc_dictionary_set_uint64(v2, "num_preflights", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 5));
  xpc_dictionary_set_uint64(v2, "failed", *(_BYTE *)(*(_QWORD *)(a1 + 32) + 6) & 1);
  xpc_dictionary_set_uint64(v2, "calling_ctx", ((unint64_t)*(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 6) >> 1) & 3);
  xpc_dictionary_set_uint64(v2, "jcop_seq_gen", ((unint64_t)*(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 6) >> 3) & 1);
  xpc_dictionary_set_uint64(v2, "jcop_seq_gen2", ((unint64_t)*(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 6) >> 4) & 1);
  return v2;
}

void analytics_send_seshat_recovery_required(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const __CFString *v23;

  *a1 = *a1 & 0xFFFFFFFFFFFFFFF8 | 5;
  debuglog("analytics_send_seshat_recovery_required", CFSTR("AnalyticsEvent: version: %llu, context: %llu, timedout: %llu, padding: %llu, nf_result: %llu, applet_result: %llu, reason: %llu"), a3, a4, a5, a6, a7, a8, 5);
  if (SeshatIsReportingEnabled(v9, v10, v11, v12, v13, v14, v15, v16))
  {
    if (MEMORY[0x1E0D15478])
    {
      analytics_send_event_lazy();
      return;
    }
    v23 = CFSTR("CA fwk missing, not sending event");
  }
  else
  {
    v23 = CFSTR("runtime condition not sastisifed");
  }
  debuglog("analytics_send_seshat_recovery_required", v23, v17, v18, v19, v20, v21, v22, a9);
}

xpc_object_t __analytics_send_seshat_recovery_required_block_invoke(uint64_t a1)
{
  xpc_object_t v2;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "version", **(_QWORD **)(a1 + 32) & 7);
  xpc_dictionary_set_uint64(v2, "context", (**(_QWORD **)(a1 + 32) >> 3) & 7);
  xpc_dictionary_set_uint64(v2, "timedout", (**(_QWORD **)(a1 + 32) >> 6) & 1);
  xpc_dictionary_set_uint64(v2, "padding", (**(_QWORD **)(a1 + 32) >> 7) & 1);
  xpc_dictionary_set_uint64(v2, "nf_result", *(unsigned int *)(*(_QWORD *)(a1 + 32) + 1));
  xpc_dictionary_set_uint64(v2, "applet_result", *(unsigned __int16 *)(*(_QWORD *)(a1 + 32) + 5));
  xpc_dictionary_set_uint64(v2, "reason", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 7));
  return v2;
}

void analytics_send_seshat_recovery_success(_BYTE *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const __CFString *v23;

  debuglog("analytics_send_seshat_recovery_success", CFSTR("AnalyticsEvent: occured: %llu"), a3, a4, a5, a6, a7, a8, *a1 & 1);
  if (SeshatIsReportingEnabled(v9, v10, v11, v12, v13, v14, v15, v16))
  {
    if (MEMORY[0x1E0D15478])
    {
      analytics_send_event_lazy();
      return;
    }
    v23 = CFSTR("CA fwk missing, not sending event");
  }
  else
  {
    v23 = CFSTR("runtime condition not sastisifed");
  }
  debuglog("analytics_send_seshat_recovery_success", v23, v17, v18, v19, v20, v21, v22, a9);
}

xpc_object_t __analytics_send_seshat_recovery_success_block_invoke(uint64_t a1)
{
  xpc_object_t v2;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "occured", **(_BYTE **)(a1 + 32) & 1);
  return v2;
}

void analytics_send_seshat_unexpected_sentinel(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const __CFString *v23;

  debuglog("analytics_send_seshat_unexpected_sentinel", CFSTR("AnalyticsEvent: occured: %llu"), a3, a4, a5, a6, a7, a8, *a1);
  if (SeshatIsReportingEnabled(v9, v10, v11, v12, v13, v14, v15, v16))
  {
    if (MEMORY[0x1E0D15478])
    {
      analytics_send_event_lazy();
      return;
    }
    v23 = CFSTR("CA fwk missing, not sending event");
  }
  else
  {
    v23 = CFSTR("runtime condition not sastisifed");
  }
  debuglog("analytics_send_seshat_unexpected_sentinel", v23, v17, v18, v19, v20, v21, v22, a9);
}

xpc_object_t __analytics_send_seshat_unexpected_sentinel_block_invoke(uint64_t a1)
{
  xpc_object_t v2;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "occured", **(_QWORD **)(a1 + 32));
  return v2;
}

void analytics_send_seshat_write_count(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  const __CFString *v24;

  debuglog("analytics_send_seshat_write_count", CFSTR("AnalyticsEvent: writes: %llu"), a3, a4, a5, a6, a7, a8, *a1);
  if (SeshatIsReportingEnabled(v9, v10, v11, v12, v13, v14, v15, v16))
  {
    HIDWORD(v23) = -858993459 * arc4random();
    LODWORD(v23) = HIDWORD(v23);
    if ((v23 >> 1) >= 0x1999999A)
    {
      v24 = CFSTR("sampling condition not sastisifed");
    }
    else
    {
      if (MEMORY[0x1E0D15478])
      {
        analytics_send_event_lazy();
        return;
      }
      v24 = CFSTR("CA fwk missing, not sending event");
    }
  }
  else
  {
    v24 = CFSTR("runtime condition not sastisifed");
  }
  debuglog("analytics_send_seshat_write_count", v24, v17, v18, v19, v20, v21, v22, a9);
}

xpc_object_t __analytics_send_seshat_write_count_block_invoke(uint64_t a1)
{
  xpc_object_t v2;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "writes", **(_QWORD **)(a1 + 32));
  return v2;
}

void analytics_send_seshat_report(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const __CFString *v23;

  debuglog("analytics_send_seshat_report", CFSTR("AnalyticsEvent: key: %llu, value: %llu"), a3, a4, a5, a6, a7, a8, *a1);
  if (SeshatIsReportingEnabled(v9, v10, v11, v12, v13, v14, v15, v16))
  {
    if (MEMORY[0x1E0D15478])
    {
      analytics_send_event_lazy();
      return;
    }
    v23 = CFSTR("CA fwk missing, not sending event");
  }
  else
  {
    v23 = CFSTR("runtime condition not sastisifed");
  }
  debuglog("analytics_send_seshat_report", v23, v17, v18, v19, v20, v21, v22, a9);
}

xpc_object_t __analytics_send_seshat_report_block_invoke(uint64_t a1)
{
  xpc_object_t v2;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "key", **(unsigned int **)(a1 + 32));
  xpc_dictionary_set_uint64(v2, "value", *(unsigned int *)(*(_QWORD *)(a1 + 32) + 4));
  return v2;
}

void analytics_send_sidp_recovery(_WORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  *a1 = *a1 & 0xFFF0 | 1;
  debuglog("analytics_send_sidp_recovery", CFSTR("AnalyticsEvent: version: %llu, type: %llu, event: %llu, recoverable: %llu, recovery_required: %llu, se_entangled: %llu, se_recovery_required: %llu, smdk_entalgned: %llu"), a3, a4, a5, a6, a7, a8, 1);
  if (MEMORY[0x1E0D15478])
    analytics_send_event_lazy();
  else
    debuglog("analytics_send_sidp_recovery", CFSTR("CA fwk missing, not sending event"), v9, v10, v11, v12, v13, v14, a9);
}

xpc_object_t __analytics_send_sidp_recovery_block_invoke(uint64_t a1)
{
  xpc_object_t v2;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "version", **(_WORD **)(a1 + 32) & 0xFLL);
  xpc_dictionary_set_uint64(v2, "type", ((unint64_t)**(unsigned __int16 **)(a1 + 32) >> 4) & 3);
  xpc_dictionary_set_uint64(v2, "event", **(_WORD **)(a1 + 32) >> 6);
  xpc_dictionary_set_uint64(v2, "recoverable", ((unint64_t)**(unsigned __int16 **)(a1 + 32) >> 8) & 1);
  xpc_dictionary_set_uint64(v2, "recovery_required", ((unint64_t)**(unsigned __int16 **)(a1 + 32) >> 9) & 1);
  xpc_dictionary_set_uint64(v2, "se_entangled", ((unint64_t)**(unsigned __int16 **)(a1 + 32) >> 10) & 1);
  xpc_dictionary_set_uint64(v2, "se_recovery_required", ((unint64_t)**(unsigned __int16 **)(a1 + 32) >> 11) & 1);
  xpc_dictionary_set_uint64(v2, "smdk_entalgned", ((unint64_t)**(unsigned __int16 **)(a1 + 32) >> 12) & 1);
  return v2;
}

void analytics_send_first_unlock(_BYTE *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const __CFString *v23;

  *a1 &= 0xE0u;
  debuglog("analytics_send_first_unlock", CFSTR("AnalyticsEvent: version: %llu, se_entangled: %llu, smdk_entalgned: %llu"), a3, a4, a5, a6, a7, a8, 0);
  if (SeshatIsReportingEnabled(v9, v10, v11, v12, v13, v14, v15, v16))
  {
    if (MEMORY[0x1E0D15478])
    {
      analytics_send_event_lazy();
      return;
    }
    v23 = CFSTR("CA fwk missing, not sending event");
  }
  else
  {
    v23 = CFSTR("runtime condition not sastisifed");
  }
  debuglog("analytics_send_first_unlock", v23, v17, v18, v19, v20, v21, v22, a9);
}

xpc_object_t __analytics_send_first_unlock_block_invoke(uint64_t a1)
{
  xpc_object_t v2;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "version", **(_BYTE **)(a1 + 32) & 0x1F);
  xpc_dictionary_set_uint64(v2, "se_entangled", ((unint64_t)**(unsigned __int8 **)(a1 + 32) >> 5) & 1);
  xpc_dictionary_set_uint64(v2, "smdk_entalgned", ((unint64_t)**(unsigned __int8 **)(a1 + 32) >> 6) & 1);
  return v2;
}

void analytics_send_db_filekey_found(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  debuglog("analytics_send_db_filekey_found", CFSTR("AnalyticsEvent: filekey_count: %llu"), a3, a4, a5, a6, a7, a8, *a1);
  if (MEMORY[0x1E0D15478])
    analytics_send_event_lazy();
  else
    debuglog("analytics_send_db_filekey_found", CFSTR("CA fwk missing, not sending event"), v9, v10, v11, v12, v13, v14, a9);
}

xpc_object_t __analytics_send_db_filekey_found_block_invoke(uint64_t a1)
{
  xpc_object_t v2;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "filekey_count", **(_QWORD **)(a1 + 32));
  return v2;
}

void analytics_send_db_filekey_not_found(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  debuglog("analytics_send_db_filekey_not_found", CFSTR("AnalyticsEvent: filekey_count: %llu"), a3, a4, a5, a6, a7, a8, *a1);
  if (MEMORY[0x1E0D15478])
    analytics_send_event_lazy();
  else
    debuglog("analytics_send_db_filekey_not_found", CFSTR("CA fwk missing, not sending event"), v9, v10, v11, v12, v13, v14, a9);
}

xpc_object_t __analytics_send_db_filekey_not_found_block_invoke(uint64_t a1)
{
  xpc_object_t v2;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "filekey_count", **(_QWORD **)(a1 + 32));
  return v2;
}

void analytics_send_db_add(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (MEMORY[0x1E0D15478])
    analytics_send_event_lazy();
  else
    debuglog("analytics_send_db_add", CFSTR("CA fwk missing, not sending event"), a3, a4, a5, a6, a7, a8, a9);
}

xpc_object_t __analytics_send_db_add_block_invoke(uint64_t a1)
{
  xpc_object_t v2;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "status", **(_QWORD **)(a1 + 32));
  return v2;
}

void analytics_send_db_get(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (MEMORY[0x1E0D15478])
    analytics_send_event_lazy();
  else
    debuglog("analytics_send_db_get", CFSTR("CA fwk missing, not sending event"), a3, a4, a5, a6, a7, a8, a9);
}

xpc_object_t __analytics_send_db_get_block_invoke(uint64_t a1)
{
  xpc_object_t v2;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "status", **(_QWORD **)(a1 + 32));
  return v2;
}

void analytics_send_passphrase_change(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  debuglog("analytics_send_passphrase_change", CFSTR("AnalyticsEvent: change_count: %llu"), a3, a4, a5, a6, a7, a8, *a1);
  if (MEMORY[0x1E0D15478])
    analytics_send_event_lazy();
  else
    debuglog("analytics_send_passphrase_change", CFSTR("CA fwk missing, not sending event"), v9, v10, v11, v12, v13, v14, a9);
}

xpc_object_t __analytics_send_passphrase_change_block_invoke(uint64_t a1)
{
  xpc_object_t v2;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "change_count", **(_QWORD **)(a1 + 32));
  return v2;
}

void analytics_send_backup_key_drain(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  if (MEMORY[0x1E0D15478])
    analytics_send_event_lazy();
  else
    debuglog("analytics_send_backup_key_drain", CFSTR("CA fwk missing, not sending event"), a3, a4, a5, a6, a7, a8, a9);
}

xpc_object_t __analytics_send_backup_key_drain_block_invoke(uint64_t a1)
{
  xpc_object_t v2;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "filekey_count", **(_QWORD **)(a1 + 32));
  xpc_dictionary_set_uint64(v2, "fault", *(unsigned int *)(*(_QWORD *)(a1 + 32) + 8));
  xpc_dictionary_set_BOOL(v2, "first_unlocked", *(_BYTE *)(*(_QWORD *)(a1 + 32) + 12));
  xpc_dictionary_set_uint64(v2, "add_error", *(unsigned int *)(*(_QWORD *)(a1 + 32) + 16));
  xpc_dictionary_set_uint64(v2, "open_error", *(unsigned int *)(*(_QWORD *)(a1 + 32) + 20));
  xpc_dictionary_set_uint64(v2, "sqlite_error", *(unsigned int *)(*(_QWORD *)(a1 + 32) + 24));
  xpc_dictionary_set_BOOL(v2, "truncated", *(_BYTE *)(*(_QWORD *)(a1 + 32) + 28));
  xpc_dictionary_set_BOOL(v2, "unlinked", *(_BYTE *)(*(_QWORD *)(a1 + 32) + 29));
  return v2;
}

void analytics_send_fv_status(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  debuglog("analytics_send_fv_status", CFSTR("AnalyticsEvent: fv_enabled: %llu, fv_users_count: %llu, icloud_recovery_key: %llu, institutional_recovery_key: %llu, personal_recovery_key: %llu, mdm_recovery_key: %llu, installer_user: %llu, icloud_recovery_user: %llu, institutional_recovery_user: %llu, vek_device_protected: %llu, vek_ephemeral: %llu, vek_is_owner: %llu, vek_boot_policy: %llu, vek_imported: %llu, kek_sidp_count: %llu, kek_ps_count: %llu, kek_last_count: %llu, kek_imported_count: %llu, kek_bad_sig_count: %llu, kek_xart_policy_missing_count: %llu, kek_ps_missing_count: %llu"), *(unsigned __int8 *)(a1 + 26), *(unsigned __int8 *)(a1 + 27), *(_QWORD *)(a1 + 80), a6, a7, a8, *(_BYTE *)a1);
  if (MEMORY[0x1E0D15478])
    analytics_send_event_lazy();
  else
    debuglog("analytics_send_fv_status", CFSTR("CA fwk missing, not sending event"), v9, v10, v11, v12, v13, v14, a9);
}

xpc_object_t __analytics_send_fv_status_block_invoke(uint64_t a1)
{
  xpc_object_t v2;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v2, "fv_enabled", **(_BYTE **)(a1 + 32));
  xpc_dictionary_set_uint64(v2, "fv_users_count", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8));
  xpc_dictionary_set_BOOL(v2, "icloud_recovery_key", *(_BYTE *)(*(_QWORD *)(a1 + 32) + 16));
  xpc_dictionary_set_BOOL(v2, "institutional_recovery_key", *(_BYTE *)(*(_QWORD *)(a1 + 32) + 17));
  xpc_dictionary_set_BOOL(v2, "personal_recovery_key", *(_BYTE *)(*(_QWORD *)(a1 + 32) + 18));
  xpc_dictionary_set_BOOL(v2, "mdm_recovery_key", *(_BYTE *)(*(_QWORD *)(a1 + 32) + 19));
  xpc_dictionary_set_BOOL(v2, "installer_user", *(_BYTE *)(*(_QWORD *)(a1 + 32) + 20));
  xpc_dictionary_set_BOOL(v2, "icloud_recovery_user", *(_BYTE *)(*(_QWORD *)(a1 + 32) + 21));
  xpc_dictionary_set_BOOL(v2, "institutional_recovery_user", *(_BYTE *)(*(_QWORD *)(a1 + 32) + 22));
  xpc_dictionary_set_BOOL(v2, "vek_device_protected", *(_BYTE *)(*(_QWORD *)(a1 + 32) + 23));
  xpc_dictionary_set_BOOL(v2, "vek_ephemeral", *(_BYTE *)(*(_QWORD *)(a1 + 32) + 24));
  xpc_dictionary_set_BOOL(v2, "vek_is_owner", *(_BYTE *)(*(_QWORD *)(a1 + 32) + 25));
  xpc_dictionary_set_BOOL(v2, "vek_boot_policy", *(_BYTE *)(*(_QWORD *)(a1 + 32) + 26));
  xpc_dictionary_set_BOOL(v2, "vek_imported", *(_BYTE *)(*(_QWORD *)(a1 + 32) + 27));
  xpc_dictionary_set_uint64(v2, "kek_sidp_count", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32));
  xpc_dictionary_set_uint64(v2, "kek_ps_count", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
  xpc_dictionary_set_uint64(v2, "kek_last_count", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48));
  xpc_dictionary_set_uint64(v2, "kek_imported_count", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));
  xpc_dictionary_set_uint64(v2, "kek_bad_sig_count", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64));
  xpc_dictionary_set_uint64(v2, "kek_xart_policy_missing_count", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72));
  xpc_dictionary_set_uint64(v2, "kek_ps_missing_count", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80));
  return v2;
}

void analytics_send_forgotten_passcode_event(_DWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  debuglog("analytics_send_forgotten_passcode_event", CFSTR("AnalyticsEvent: days_since_passcode_change: %llu, passcode_reset_expired: %llu, passcode_reset_exists: %llu"), a3, a4, a5, a6, a7, a8, *a1);
  if (MEMORY[0x1E0D15478])
    analytics_send_event_lazy();
  else
    debuglog("analytics_send_forgotten_passcode_event", CFSTR("CA fwk missing, not sending event"), v9, v10, v11, v12, v13, v14, a9);
}

xpc_object_t __analytics_send_forgotten_passcode_event_block_invoke(uint64_t a1)
{
  xpc_object_t v2;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "days_since_passcode_change", **(unsigned int **)(a1 + 32));
  xpc_dictionary_set_uint64(v2, "passcode_reset_expired", *(_BYTE *)(*(_QWORD *)(a1 + 32) + 4) & 1);
  xpc_dictionary_set_uint64(v2, "passcode_reset_exists", ((unint64_t)*(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 4) >> 1) & 1);
  return v2;
}

void __getNFHardwareManagerClass_block_invoke_cold_1()
{
  void *v0;

  v0 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getNFHardwareManagerClass(void)_block_invoke"), CFSTR("SeshatSupport.m"), 37, CFSTR("Unable to find class %s"), "NFHardwareManager");
  __break(1u);
}

void NearFieldLibrary_cold_1(_QWORD *a1)
{
  void *v2;

  v2 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *NearFieldLibrary(void)"), CFSTR("SeshatSupport.m"), 35, CFSTR("%s"), *a1);
  __break(1u);
}

void __getNFTapToRadarClass_block_invoke_cold_1()
{
  void *v0;

  v0 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getNFTapToRadarClass(void)_block_invoke"), CFSTR("SeshatSupport.m"), 36, CFSTR("Unable to find class %s"), "NFTapToRadar");
  __break(1u);
}

void __getNFSecureElementClass_block_invoke_cold_1()
{
  void *v0;

  v0 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getNFSecureElementClass(void)_block_invoke"), CFSTR("SeshatSupport.m"), 39, CFSTR("Unable to find class %s"), "NFSecureElement");
  __break(1u);
}

void __getNFSeshatSessionClass_block_invoke_cold_1()
{
  void *v0;

  v0 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getNFSeshatSessionClass(void)_block_invoke"), CFSTR("SeshatSupport.m"), 38, CFSTR("Unable to find class %s"), "NFSeshatSession");
  __break(1u);
  ADClientAddValueForScalarKey();
}

uint64_t ADClientAddValueForScalarKey()
{
  return MEMORY[0x1E0CF6398]();
}

uint64_t ADClientPushValueForDistributionKey()
{
  return MEMORY[0x1E0CF63B8]();
}

uint64_t ADClientSetValueForDistributionKey()
{
  return MEMORY[0x1E0CF63C8]();
}

uint64_t ADClientSetValueForScalarKey()
{
  return MEMORY[0x1E0CF63D0]();
}

uint64_t AKSIdentityGetPrimary()
{
  return MEMORY[0x1E0CFD2F0]();
}

CCCryptorStatus CCCrypt(CCOperation op, CCAlgorithm alg, CCOptions options, const void *key, size_t keyLength, const void *iv, const void *dataIn, size_t dataInLength, void *dataOut, size_t dataOutAvailable, size_t *dataOutMoved)
{
  return MEMORY[0x1E0C80088](*(_QWORD *)&op, *(_QWORD *)&alg, *(_QWORD *)&options, key, keyLength, iv, dataIn, dataInLength);
}

CCCryptorStatus CCCryptorCreate(CCOperation op, CCAlgorithm alg, CCOptions options, const void *key, size_t keyLength, const void *iv, CCCryptorRef *cryptorRef)
{
  return MEMORY[0x1E0C80098](*(_QWORD *)&op, *(_QWORD *)&alg, *(_QWORD *)&options, key, keyLength, iv, cryptorRef);
}

CCCryptorStatus CCCryptorFinal(CCCryptorRef cryptorRef, void *dataOut, size_t dataOutAvailable, size_t *dataOutMoved)
{
  return MEMORY[0x1E0C800A8](cryptorRef, dataOut, dataOutAvailable, dataOutMoved);
}

size_t CCCryptorGetOutputLength(CCCryptorRef cryptorRef, size_t inputLength, BOOL final)
{
  return MEMORY[0x1E0C80100](cryptorRef, inputLength, final);
}

CCCryptorStatus CCCryptorRelease(CCCryptorRef cryptorRef)
{
  return MEMORY[0x1E0C80108](cryptorRef);
}

CCCryptorStatus CCCryptorUpdate(CCCryptorRef cryptorRef, const void *dataIn, size_t dataInLength, void *dataOut, size_t dataOutAvailable, size_t *dataOutMoved)
{
  return MEMORY[0x1E0C80118](cryptorRef, dataIn, dataInLength, dataOut, dataOutAvailable, dataOutMoved);
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1E0C80328](data, *(_QWORD *)&len, md);
}

int CC_SHA1_Final(unsigned __int8 *md, CC_SHA1_CTX *c)
{
  return MEMORY[0x1E0C80330](md, c);
}

int CC_SHA1_Init(CC_SHA1_CTX *c)
{
  return MEMORY[0x1E0C80338](c);
}

int CC_SHA1_Update(CC_SHA1_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1E0C80340](c, data, *(_QWORD *)&len);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x1E0C97CF8](theArray, value);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1E0C97D38](allocator, capacity, callBacks);
}

CFMutableArrayRef CFArrayCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFArrayRef theArray)
{
  return (CFMutableArrayRef)MEMORY[0x1E0C97D50](allocator, capacity, theArray);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1E0C97D60](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x1E0C97D90]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1E0C97D98](theArray, idx);
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
  MEMORY[0x1E0C97DC0](theArray, idx);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1E0C97FC8]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1E0C97FE0](BOOLean);
}

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
  MEMORY[0x1E0C98390](theData, bytes, length);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x1E0C983A0](allocator, bytes, length);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x1E0C983B8](allocator, capacity);
}

CFMutableDataRef CFDataCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDataRef theData)
{
  return (CFMutableDataRef)MEMORY[0x1E0C983C0](allocator, capacity, theData);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x1E0C983C8](allocator, bytes, length, bytesDeallocator);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1E0C983E0](theData);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
  MEMORY[0x1E0C983F0](theData, range.location, range.length, buffer);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1E0C983F8](theData);
}

UInt8 *__cdecl CFDataGetMutableBytePtr(CFMutableDataRef theData)
{
  return (UInt8 *)MEMORY[0x1E0C98408](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x1E0C98418]();
}

void CFDataReplaceBytes(CFMutableDataRef theData, CFRange range, const UInt8 *newBytes, CFIndex newLength)
{
  MEMORY[0x1E0C98428](theData, range.location, range.length, newBytes, newLength);
}

void CFDataSetLength(CFMutableDataRef theData, CFIndex length)
{
  MEMORY[0x1E0C98430](theData, length);
}

CFComparisonResult CFDateCompare(CFDateRef theDate, CFDateRef otherDate, void *context)
{
  return MEMORY[0x1E0C98440](theDate, otherDate, context);
}

CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at)
{
  return (CFDateRef)MEMORY[0x1E0C98448](allocator, at);
}

CFAbsoluteTime CFDateGetAbsoluteTime(CFDateRef theDate)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C984D8](theDate);
  return result;
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98500](theDict, key, value);
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x1E0C98518](theDict, key);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98550](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98558](allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x1E0C98570](theDict);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x1E0C985A8]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
  MEMORY[0x1E0C985E8](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98610](theDict, key, value);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1E0C98620](cf1, cf2);
}

CFErrorRef CFErrorCreate(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, CFDictionaryRef userInfo)
{
  return (CFErrorRef)MEMORY[0x1E0C98650](allocator, domain, code, userInfo);
}

CFAllocatorRef CFGetAllocator(CFTypeRef cf)
{
  return (CFAllocatorRef)MEMORY[0x1E0C98718](cf);
}

CFIndex CFGetRetainCount(CFTypeRef cf)
{
  return MEMORY[0x1E0C98720](cf);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1E0C98928](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1E0C989B8]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1E0C989C0](number, theType, valuePtr);
}

CFPropertyListRef CFPropertyListCreateWithStream(CFAllocatorRef allocator, CFReadStreamRef stream, CFIndex streamLength, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98AE0](allocator, stream, streamLength, options, format, error);
}

CFIndex CFPropertyListWrite(CFPropertyListRef propertyList, CFWriteStreamRef stream, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return MEMORY[0x1E0C98AF8](propertyList, stream, format, options, error);
}

void CFReadStreamClose(CFReadStreamRef stream)
{
  MEMORY[0x1E0C98B10](stream);
}

CFReadStreamRef CFReadStreamCreateWithBytesNoCopy(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFReadStreamRef)MEMORY[0x1E0C98B38](alloc, bytes, length, bytesDeallocator);
}

Boolean CFReadStreamOpen(CFReadStreamRef stream)
{
  return MEMORY[0x1E0C98B80](stream);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

void CFShow(CFTypeRef obj)
{
  MEMORY[0x1E0C98DF8](obj);
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  MEMORY[0x1E0C98EF0](theString, formatOptions, format);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1E0C98F10](theString1, theString2, compareOptions);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x1E0C98F90](alloc, maxLength);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1E0C98FD0](alloc, cStr, *(_QWORD *)&encoding);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1E0C99018](alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithFormatAndArguments(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, va_list arguments)
{
  return (CFStringRef)MEMORY[0x1E0C99020](alloc, formatOptions, format, arguments);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1E0C99098](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1E0C990A0](theString, *(_QWORD *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1E0C99170]();
}

CFUUIDRef CFUUIDCreateFromUUIDBytes(CFAllocatorRef alloc, CFUUIDBytes bytes)
{
  return (CFUUIDRef)MEMORY[0x1E0C99530](alloc, *(_QWORD *)&bytes.byte0, *(_QWORD *)&bytes.byte8);
}

void CFWriteStreamClose(CFWriteStreamRef stream)
{
  MEMORY[0x1E0C99600](stream);
}

CFTypeRef CFWriteStreamCopyProperty(CFWriteStreamRef stream, CFStreamPropertyKey propertyName)
{
  return (CFTypeRef)MEMORY[0x1E0C99610](stream, propertyName);
}

CFWriteStreamRef CFWriteStreamCreateWithAllocatedBuffers(CFAllocatorRef alloc, CFAllocatorRef bufferAllocator)
{
  return (CFWriteStreamRef)MEMORY[0x1E0C99620](alloc, bufferAllocator);
}

Boolean CFWriteStreamOpen(CFWriteStreamRef stream)
{
  return MEMORY[0x1E0C99650](stream);
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x1E0CBAD80](*(_QWORD *)&connection, *(_QWORD *)&selector, input, *(_QWORD *)&inputCnt, inputStruct, inputStructCnt, output, outputCnt);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return (IONotificationPortRef)MEMORY[0x1E0CBB698](*(_QWORD *)&mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
  MEMORY[0x1E0CBB6A0](notify);
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
  MEMORY[0x1E0CBB6B8](notify, queue);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x1E0CBB6F0](*(_QWORD *)&object);
}

uint64_t IOPMAssertionDeclareSystemActivity()
{
  return MEMORY[0x1E0CBB720]();
}

IOReturn IOPMAssertionRelease(IOPMAssertionID AssertionID)
{
  return MEMORY[0x1E0CBB738](*(_QWORD *)&AssertionID);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x1E0CBB900](*(_QWORD *)&entry, key, allocator, *(_QWORD *)&options);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return MEMORY[0x1E0CBB918](*(_QWORD *)&mainPort, path);
}

kern_return_t IORegistryEntrySetCFProperty(io_registry_entry_t entry, CFStringRef propertyName, CFTypeRef property)
{
  return MEMORY[0x1E0CBB9B0](*(_QWORD *)&entry, propertyName, property);
}

kern_return_t IOServiceAddInterestNotification(IONotificationPortRef notifyPort, io_service_t service, const io_name_t interestType, IOServiceInterestCallback callback, void *refCon, io_object_t *notification)
{
  return MEMORY[0x1E0CBB9C0](notifyPort, *(_QWORD *)&service, interestType, callback, refCon, notification);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x1E0CBB9D0](*(_QWORD *)&connect);
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

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

int SecRandomCopyBytes(SecRandomRef rnd, size_t count, void *bytes)
{
  return MEMORY[0x1E0CD65A0](rnd, count, bytes);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
  MEMORY[0x1E0C80940](a1, a2, *(_QWORD *)&a3);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x1E0C9A498]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x1E0C9A4B0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1E0C80B68]();
}

uint64_t __memset_chk()
{
  return MEMORY[0x1E0C80B78]();
}

uint64_t __strlcat_chk()
{
  return MEMORY[0x1E0C80C40]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

uint64_t aks_assert_consume()
{
  return MEMORY[0x1E0CFD2F8]();
}

uint64_t aks_assert_drop()
{
  return MEMORY[0x1E0CFD300]();
}

uint64_t aks_assert_hold()
{
  return MEMORY[0x1E0CFD308]();
}

uint64_t aks_assert_promote()
{
  return MEMORY[0x1E0CFD310]();
}

uint64_t aks_backup_copy_bag_uuid()
{
  return MEMORY[0x1E0CFD318]();
}

uint64_t aks_backup_copy_current_bag_uuid()
{
  return MEMORY[0x1E0CFD320]();
}

uint64_t aks_backup_rewrap_ek()
{
  return MEMORY[0x1E0CFD328]();
}

uint64_t aks_backup_rewrap_key()
{
  return MEMORY[0x1E0CFD330]();
}

uint64_t aks_backup_unwrap_bag()
{
  return MEMORY[0x1E0CFD338]();
}

uint64_t aks_backup_unwrap_key()
{
  return MEMORY[0x1E0CFD340]();
}

uint64_t aks_bag_in_xart()
{
  return MEMORY[0x1E0CFD348]();
}

uint64_t aks_change_secret()
{
  return MEMORY[0x1E0CFD358]();
}

uint64_t aks_change_secret_epilogue()
{
  return MEMORY[0x1E0CFD360]();
}

uint64_t aks_change_secret_opts()
{
  return MEMORY[0x1E0CFD368]();
}

uint64_t aks_copy_volume_cookie()
{
  return MEMORY[0x1E0CFD370]();
}

uint64_t aks_copy_volume_cookie_persona()
{
  return MEMORY[0x1E0CFD378]();
}

uint64_t aks_create_bag()
{
  return MEMORY[0x1E0CFD380]();
}

uint64_t aks_create_escrow_bag()
{
  return MEMORY[0x1E0CFD388]();
}

uint64_t aks_create_escrow_bag_with_auth()
{
  return MEMORY[0x1E0CFD390]();
}

uint64_t aks_generation()
{
  return MEMORY[0x1E0CFD3A0]();
}

uint64_t aks_get_bag_uuid()
{
  return MEMORY[0x1E0CFD3A8]();
}

uint64_t aks_get_configuration()
{
  return MEMORY[0x1E0CFD3B0]();
}

uint64_t aks_get_current_sep_measurement()
{
  return MEMORY[0x1E0CFD3B8]();
}

uint64_t aks_get_device_state()
{
  return MEMORY[0x1E0CFD3C0]();
}

uint64_t aks_get_extended_device_state()
{
  return MEMORY[0x1E0CFD3C8]();
}

uint64_t aks_get_lock_state()
{
  return MEMORY[0x1E0CFD3D0]();
}

uint64_t aks_get_system()
{
  return MEMORY[0x1E0CFD3D8]();
}

uint64_t aks_load_bag()
{
  return MEMORY[0x1E0CFD3F0]();
}

uint64_t aks_lock_bag()
{
  return MEMORY[0x1E0CFD3F8]();
}

uint64_t aks_lock_device()
{
  return MEMORY[0x1E0CFD400]();
}

uint64_t aks_memento_efface_blob()
{
  return MEMORY[0x1E0CFD408]();
}

uint64_t aks_memento_get_state()
{
  return MEMORY[0x1E0CFD410]();
}

uint64_t aks_migrate_s_key()
{
  return MEMORY[0x1E0CFD420]();
}

uint64_t aks_obliterate_class_d()
{
  return MEMORY[0x1E0CFD428]();
}

uint64_t aks_prederived_change_secret()
{
  return MEMORY[0x1E0CFD460]();
}

uint64_t aks_prederived_create()
{
  return MEMORY[0x1E0CFD468]();
}

uint64_t aks_prederived_free()
{
  return MEMORY[0x1E0CFD470]();
}

uint64_t aks_prederived_is_enabled()
{
  return MEMORY[0x1E0CFD478]();
}

uint64_t aks_prederived_unlock_keybag()
{
  return MEMORY[0x1E0CFD480]();
}

uint64_t aks_prewarm_sps()
{
  return MEMORY[0x1E0CFD488]();
}

uint64_t aks_recover_with_escrow_bag()
{
  return MEMORY[0x1E0CFD490]();
}

uint64_t aks_save_bag()
{
  return MEMORY[0x1E0CFD520]();
}

uint64_t aks_se_delete_reset_token()
{
  return MEMORY[0x1E0CFD528]();
}

uint64_t aks_se_get_reset_pubkey()
{
  return MEMORY[0x1E0CFD530]();
}

uint64_t aks_se_get_reset_sig()
{
  return MEMORY[0x1E0CFD538]();
}

uint64_t aks_se_get_reset_token()
{
  return MEMORY[0x1E0CFD540]();
}

uint64_t aks_se_get_reset_token_for_memento_secret()
{
  return MEMORY[0x1E0CFD548]();
}

uint64_t aks_se_recover()
{
  return MEMORY[0x1E0CFD550]();
}

uint64_t aks_se_set_nonce()
{
  return MEMORY[0x1E0CFD558]();
}

uint64_t aks_se_support_in_rm()
{
  return MEMORY[0x1E0CFD560]();
}

uint64_t aks_se_support_in_rm_is_set()
{
  return MEMORY[0x1E0CFD568]();
}

uint64_t aks_set_configuration()
{
  return MEMORY[0x1E0CFD570]();
}

uint64_t aks_set_jcop_supports_updated_kud_policy()
{
  return MEMORY[0x1E0CFD578]();
}

uint64_t aks_set_keybag_for_volume_with_cookie()
{
  return MEMORY[0x1E0CFD580]();
}

uint64_t aks_set_keybag_for_volume_with_cookie_persona()
{
  return MEMORY[0x1E0CFD588]();
}

uint64_t aks_set_system()
{
  return MEMORY[0x1E0CFD590]();
}

uint64_t aks_set_system_with_passcode()
{
  return MEMORY[0x1E0CFD598]();
}

uint64_t aks_stash_enable()
{
  return MEMORY[0x1E0CFD5A8]();
}

uint64_t aks_stash_load()
{
  return MEMORY[0x1E0CFD5B0]();
}

uint64_t aks_stash_persist()
{
  return MEMORY[0x1E0CFD5B8]();
}

uint64_t aks_unload_bag()
{
  return MEMORY[0x1E0CFD5E8]();
}

uint64_t aks_unload_session_bags()
{
  return MEMORY[0x1E0CFD5F0]();
}

uint64_t aks_unlock_bag()
{
  return MEMORY[0x1E0CFD5F8]();
}

uint64_t aks_unlock_device()
{
  return MEMORY[0x1E0CFD600]();
}

uint64_t aks_unwrap_key()
{
  return MEMORY[0x1E0CFD608]();
}

uint64_t aks_verify_password()
{
  return MEMORY[0x1E0CFD610]();
}

uint64_t aks_verify_password_memento()
{
  return MEMORY[0x1E0CFD618]();
}

uint64_t aks_wrap_key()
{
  return MEMORY[0x1E0CFD620]();
}

uint64_t analytics_send_event_lazy()
{
  return MEMORY[0x1E0D15478]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x1E0C81570]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

uint64_t cc_clear()
{
  return MEMORY[0x1E0C81868]();
}

uint64_t ccaes_cbc_encrypt_mode()
{
  return MEMORY[0x1E0C81880]();
}

uint64_t ccaes_xts_decrypt_mode()
{
  return MEMORY[0x1E0C818D0]();
}

uint64_t cccmac_final_generate()
{
  return MEMORY[0x1E0C81980]();
}

uint64_t cccmac_init()
{
  return MEMORY[0x1E0C81988]();
}

uint64_t cccmac_update()
{
  return MEMORY[0x1E0C81990]();
}

uint64_t ccder_decode_len()
{
  return MEMORY[0x1E0C81A70]();
}

uint64_t ccder_decode_tag()
{
  return MEMORY[0x1E0C81AA0]();
}

uint64_t ccdigest()
{
  return MEMORY[0x1E0C81BD0]();
}

uint64_t ccec_cp_256()
{
  return MEMORY[0x1E0C81C60]();
}

uint64_t ccec_sign()
{
  return MEMORY[0x1E0C81DA8]();
}

uint64_t ccec_verify()
{
  return MEMORY[0x1E0C81DC8]();
}

uint64_t ccec_x963_export()
{
  return MEMORY[0x1E0C81DE0]();
}

uint64_t ccec_x963_import_priv()
{
  return MEMORY[0x1E0C81DE8]();
}

uint64_t ccec_x963_import_pub()
{
  return MEMORY[0x1E0C81DF8]();
}

uint64_t ccrng()
{
  return MEMORY[0x1E0C822A8]();
}

uint64_t ccsha256_di()
{
  return MEMORY[0x1E0C823E0]();
}

uint64_t cczp_bitlen()
{
  return MEMORY[0x1E0C825C8]();
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

char *__cdecl ctime(const time_t *a1)
{
  return (char *)MEMORY[0x1E0C82B80](a1);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C28](queue, block);
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

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E50](label, attr, target);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x1E0C82E98](object);
}

void dispatch_retain(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA8](object);
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1E0C83040](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

void exit(int a1)
{
  MEMORY[0x1E0C83278](*(_QWORD *)&a1);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1E0C83300](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

int ffsctl(int a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x1E0C83378](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1E0C83560](*(_QWORD *)&a1, a2);
}

int ftruncate(int a1, off_t a2)
{
  return MEMORY[0x1E0C83590](*(_QWORD *)&a1, a2);
}

int getattrlist(const char *a1, void *a2, void *a3, size_t a4, unsigned int a5)
{
  return MEMORY[0x1E0C83610](a1, a2, a3, a4, *(_QWORD *)&a5);
}

uid_t geteuid(void)
{
  return MEMORY[0x1E0C83668]();
}

kern_return_t host_get_multiuser_config_flags(host_t host, uint32_t *multiuser_flags)
{
  return MEMORY[0x1E0C838B0](*(_QWORD *)&host, multiuser_flags);
}

kern_return_t host_set_multiuser_config_flags(host_priv_t host_priv, uint32_t multiuser_flags)
{
  return MEMORY[0x1E0C838D0](*(_QWORD *)&host_priv, *(_QWORD *)&multiuser_flags);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1E0C83C50]();
}

mach_port_t mach_host_self(void)
{
  return MEMORY[0x1E0C83C90]();
}

kern_return_t mach_port_type(ipc_space_t task, mach_port_name_t name, mach_port_type_t *ptype)
{
  return MEMORY[0x1E0C83D88](*(_QWORD *)&task, *(_QWORD *)&name, ptype);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1E0C83DB8](info);
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

errno_t memset_s(void *__s, rsize_t __smax, int __c, rsize_t __n)
{
  return MEMORY[0x1E0C840D0](__s, __smax, *(_QWORD *)&__c, __n);
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x1E0C84160](a1, a2);
}

int nanosleep(const timespec *__rqtp, timespec *__rmtp)
{
  return MEMORY[0x1E0C84238](__rqtp, __rmtp);
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

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
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

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C84480](a1, *(_QWORD *)&a2);
}

int open_dprotected_np(const char *a1, int a2, int a3, int a4, ...)
{
  return MEMORY[0x1E0C84488](a1, *(_QWORD *)&a2, *(_QWORD *)&a3, *(_QWORD *)&a4);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

int pipe(int a1[2])
{
  return MEMORY[0x1E0C84B10](a1);
}

ssize_t pread(int __fd, void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x1E0C84BC8](*(_QWORD *)&__fd, __buf, __nbyte, a4);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x1E0C84E68](a1, a2);
}

int puts(const char *a1)
{
  return MEMORY[0x1E0C84F60](a1);
}

ssize_t pwrite(int __fd, const void *__buf, size_t __nbyte, off_t a4)
{
  return MEMORY[0x1E0C84F68](*(_QWORD *)&__fd, __buf, __nbyte, a4);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1E0C85000](*(_QWORD *)&a1, a2, a3);
}

void *__cdecl reallocf(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x1E0C85030](__ptr, __size);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
  MEMORY[0x1E0C85100](__from, __to, __ec);
}

int renamex_np(const char *a1, const char *a2, unsigned int a3)
{
  return MEMORY[0x1E0C85118](a1, a2, *(_QWORD *)&a3);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1E0C85440](__str, __size, __format);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C854D8](a1, a2);
}

int statfs(const char *a1, statfs *a2)
{
  return MEMORY[0x1E0C854E0](a1, a2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1E0C85540](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

char *__cdecl strnstr(const char *__big, const char *__little, size_t __len)
{
  return (char *)MEMORY[0x1E0C855C8](__big, __little, __len);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C85658](__str, __endptr, *(_QWORD *)&__base);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1E0C857A0](a1, a2, a3, a4, a5);
}

time_t time(time_t *a1)
{
  return MEMORY[0x1E0C85950](a1);
}

int unlink(const char *a1)
{
  return MEMORY[0x1E0C859B8](a1);
}

int uuid_compare(const uuid_t uu1, const uuid_t uu2)
{
  return MEMORY[0x1E0C85A08](uu1, uu2);
}

void uuid_copy(uuid_t dst, const uuid_t src)
{
  MEMORY[0x1E0C85A10](dst, src);
}

int uuid_parse(const uuid_string_t in, uuid_t uu)
{
  return MEMORY[0x1E0C85A38](in, uu);
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
  MEMORY[0x1E0C85A40](uu, out);
}

kern_return_t vm_allocate(vm_map_t target_task, vm_address_t *address, vm_size_t size, int flags)
{
  return MEMORY[0x1E0C85A80](*(_QWORD *)&target_task, address, size, *(_QWORD *)&flags);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return MEMORY[0x1E0C85A98](*(_QWORD *)&target_task, address, size);
}

uint64_t voucher_get_current_persona()
{
  return MEMORY[0x1E0C85B30]();
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1E0C85D40](*(_QWORD *)&__fd, __buf, __nbyte);
}

uint64_t xpc_connection_set_target_user_session_uid()
{
  return MEMORY[0x1E0C860D8]();
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C86208](keys, values, count);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x1E0C86310](xdict, key, value);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  MEMORY[0x1E0C86398](xdict, key, value);
}

uint64_t xpc_strerror()
{
  return MEMORY[0x1E0C86710]();
}

uint64_t xpc_user_sessions_enabled()
{
  return MEMORY[0x1E0C867C8]();
}

uint64_t xpc_user_sessions_get_foreground_uid()
{
  return MEMORY[0x1E0C867D0]();
}

