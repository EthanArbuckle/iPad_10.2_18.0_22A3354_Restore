uint64_t sub_100002304(__CFArray **a1)
{
  uint64_t v1;
  __CFDictionary *v3;
  uint64_t MatchingServices;
  const __CFAllocator *v5;
  io_object_t v6;
  io_registry_entry_t v7;
  const __CFBoolean *CFProperty;
  const __CFBoolean *v9;
  __CFDictionary *Mutable;
  kern_return_t RegistryEntryID;
  CFNumberRef v12;
  CFNumberRef v13;
  CFTypeRef v14;
  int v15;
  int v16;
  const __CFString *v17;
  CFTypeRef v18;
  CFTypeRef v19;
  CFTypeRef v20;
  const void *v21;
  CFTypeRef v22;
  __CFDictionary *v23;
  __CFArray **v25;
  __CFArray *theArray;
  const __CFBoolean *cf;
  io_iterator_t existing;
  uint64_t entryID;
  int valuePtr;

  v1 = 3758097090;
  if (a1)
  {
    existing = 0;
    v3 = IOServiceMatching("AppleAuthCP");
    CFDictionarySetValue(v3, CFSTR("InternalComponent"), kCFBooleanTrue);
    MatchingServices = IOServiceGetMatchingServices(kIOMasterPortDefault, v3, &existing);
    if ((_DWORD)MatchingServices)
    {
      return MatchingServices;
    }
    else
    {
      v25 = a1;
      v5 = kCFAllocatorDefault;
      theArray = CFArrayCreateMutable(kCFAllocatorDefault, 0, &kCFTypeArrayCallBacks);
      v6 = IOIteratorNext(existing);
      if (v6)
      {
        v7 = v6;
        do
        {
          CFProperty = (const __CFBoolean *)IORegistryEntryCreateCFProperty(v7, CFSTR("InternalComponent"), v5, 0);
          if (!CFProperty)
          {
            v23 = 0;
LABEL_38:
            v16 = -536870206;
            goto LABEL_40;
          }
          v9 = CFProperty;
          valuePtr = 0;
          entryID = 0;
          if (!CFBooleanGetValue(CFProperty))
          {
            v23 = 0;
            Mutable = 0;
            v22 = v9;
            v16 = -536870206;
            goto LABEL_34;
          }
          Mutable = CFDictionaryCreateMutable(v5, 5, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
          if (!Mutable)
            goto LABEL_45;
          RegistryEntryID = IORegistryEntryGetRegistryEntryID(v7, &entryID);
          if (RegistryEntryID)
          {
            v16 = RegistryEntryID;
            v23 = 0;
LABEL_49:
            v22 = v9;
LABEL_34:
            CFRelease(v22);
            goto LABEL_35;
          }
          v12 = CFNumberCreate(v5, kCFNumberSInt64Type, &entryID);
          if (!v12)
          {
LABEL_45:
            v23 = 0;
            v16 = -536870181;
            goto LABEL_49;
          }
          v13 = v12;
          CFDictionaryAddValue(Mutable, CFSTR("IORegistryEntryID"), v12);
          v14 = IORegistryEntryCreateCFProperty(v7, CFSTR("flags"), v5, 0);
          if (v14)
            CFDictionaryAddValue(Mutable, CFSTR("flags"), v14);
          CFNumberGetValue((CFNumberRef)v14, kCFNumberSInt32Type, &valuePtr);
          v15 = BYTE2(valuePtr) << 16;
          v16 = -536870201;
          cf = v9;
          if (v15 == 0x10000)
          {
            v17 = CFSTR("Battery");
          }
          else
          {
            if (v15 != 196608)
            {
              v23 = 0;
              v19 = 0;
              v21 = 0;
              v22 = 0;
              v18 = 0;
              goto LABEL_25;
            }
            v17 = CFSTR("TouchController");
          }
          CFDictionaryAddValue(Mutable, CFSTR("ComponentName"), v17);
          v18 = IORegistryEntryCreateCFProperty(v7, CFSTR("authErrorDescription"), v5, 0);
          if (v18)
          {
            CFDictionaryAddValue(Mutable, CFSTR("authErrorDescription"), v18);
            v19 = IORegistryEntryCreateCFProperty(v7, CFSTR("AuthPassed"), v5, 0);
            if (v19)
              CFDictionaryAddValue(Mutable, CFSTR("AuthPassed"), v19);
            v20 = IORegistryEntryCreateCFProperty(v7, CFSTR("isTrusted"), v5, 0);
            v21 = v20;
            if (v20)
              CFDictionaryAddValue(Mutable, CFSTR("isTrusted"), v20);
            v22 = IORegistryEntryCreateCFProperty(v7, CFSTR("isTrustedForUI"), v5, 0);
            if (v22)
              CFDictionaryAddValue(Mutable, CFSTR("isTrustedForUI"), v22);
            v16 = 0;
            v23 = Mutable;
          }
          else
          {
            v23 = 0;
            v19 = 0;
            v21 = 0;
            v22 = 0;
          }
LABEL_25:
          CFRelease(cf);
          CFRelease(v13);
          if (v14)
            CFRelease(v14);
          if (v18)
            CFRelease(v18);
          if (v19)
            CFRelease(v19);
          if (v21)
            CFRelease(v21);
          if (v22)
            goto LABEL_34;
LABEL_35:
          if (Mutable)
          {
            v5 = kCFAllocatorDefault;
            if (!v16)
              goto LABEL_40;
            CFRelease(Mutable);
            goto LABEL_38;
          }
          v5 = kCFAllocatorDefault;
LABEL_40:
          IOObjectRelease(v7);
          if (v23 && !v16)
          {
            CFArrayAppendValue(theArray, v23);
            CFRelease(v23);
          }
          v7 = IOIteratorNext(existing);
        }
        while (v7);
      }
      IOObjectRelease(existing);
      v1 = 0;
      *v25 = theArray;
    }
  }
  return v1;
}

void sub_100002708(id a1)
{
  os_log_t v1;
  NSObject *v2;

  v1 = os_log_create("com.apple.BiometricKit", "Library-MesaFactory");
  qword_1000BA0E8 = (uint64_t)v1;
  if (!v1)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_1000041D4(&v2);
      v1 = v2;
    }
    else
    {
      v1 = 0;
    }
  }
  qword_1000BA0F0 = (uint64_t)v1;
}

uint64_t sub_100002770(mach_port_t a1, __int16 a2, __int16 a3, const void *a4, size_t a5, void *a6, _QWORD *a7)
{
  size_t v7;
  _BOOL8 v8;
  _WORD *v16;
  void *v17;
  uint64_t v18;
  NSObject *v20;
  NSObject *v21;
  _BYTE v22[12];
  __int16 v23;
  _BOOL8 v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;

  v7 = a5 + 8;
  v8 = a5 >= 0xFFFFFFFFFFFFFFF8;
  if (a5 >= 0xFFFFFFFFFFFFFFF8)
  {
    if (qword_1000BA030 != -1)
      dispatch_once(&qword_1000BA030, &stru_100080948);
    if (qword_1000BA0E8)
      v20 = qword_1000BA0E8;
    else
      v20 = &_os_log_default;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v22 = 136316162;
      *(_QWORD *)&v22[4] = "err == 0 ";
      v23 = 2048;
      v24 = v8;
      v25 = 2080;
      v26 = "";
      v27 = 2080;
      v28 = "/Library/Caches/com.apple.xbs/Sources/Mesa/AppleBiometricServices/MesaFactoryC/MesaFactoryC.c";
      v29 = 1024;
      v30 = 64;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", v22, 0x30u);
    }
    return 1;
  }
  else
  {
    v16 = malloc_type_malloc(a5 + 8, 0x6EB58E55uLL);
    if (v16)
    {
      v17 = v16;
      *v16 = 19778;
      v16[1] = a2;
      v16[2] = 1;
      v16[3] = a3;
      if (a5)
        memmove(v16 + 4, a4, a5);
      if (a7)
      {
        *(_QWORD *)v22 = *a7;
        v18 = IOConnectCallStructMethod(a1, 0, v17, v7, a6, (size_t *)v22);
        *a7 = *(_QWORD *)v22;
      }
      else
      {
        *(_QWORD *)v22 = 0;
        v18 = IOConnectCallStructMethod(a1, 0, v17, v7, a6, (size_t *)v22);
      }
      free(v17);
    }
    else
    {
      if (qword_1000BA030 != -1)
        dispatch_once(&qword_1000BA030, &stru_100080948);
      if (qword_1000BA0E8)
        v21 = qword_1000BA0E8;
      else
        v21 = &_os_log_default;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v22 = 136316162;
        *(_QWORD *)&v22[4] = "cmd";
        v23 = 2048;
        v24 = 0;
        v25 = 2080;
        v26 = "";
        v27 = 2080;
        v28 = "/Library/Caches/com.apple.xbs/Sources/Mesa/AppleBiometricServices/MesaFactoryC/MesaFactoryC.c";
        v29 = 1024;
        v30 = 67;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", v22, 0x30u);
      }
      return 12;
    }
  }
  return v18;
}

uint64_t sub_100002A58()
{
  int v0;
  uint64_t v1;
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  uint64_t v7;
  __int16 v8;
  const char *v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  int v13;

  v0 = sub_100002770(dword_1000BA0FC, 2, 1, 0, 0, 0, 0);
  v1 = v0;
  if (v0)
  {
    if (qword_1000BA030 != -1)
      dispatch_once(&qword_1000BA030, &stru_100080948);
    if (qword_1000BA0E8)
      v3 = qword_1000BA0E8;
    else
      v3 = &_os_log_default;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      v4 = 136316162;
      v5 = "err == 0 ";
      v6 = 2048;
      v7 = v1;
      v8 = 2080;
      v9 = "";
      v10 = 2080;
      v11 = "/Library/Caches/com.apple.xbs/Sources/Mesa/AppleBiometricServices/MesaFactoryC/MesaFactoryC.c";
      v12 = 1024;
      v13 = 95;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v4, 0x30u);
    }
  }
  return v1;
}

uint64_t sub_100002BA4()
{
  int v0;
  int v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  unsigned int v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;

  v6 = 0;
  v5 = 4;
  v0 = sub_100002770(dword_1000BA0FC, 16, 0, 0, 0, &v6, &v5);
  if (v0)
  {
    v2 = v0;
    if (qword_1000BA030 != -1)
      dispatch_once(&qword_1000BA030, &stru_100080948);
    if (qword_1000BA0E8)
      v3 = qword_1000BA0E8;
    else
      v3 = &_os_log_default;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v8 = "err == 0 ";
      v9 = 2048;
      v10 = v2;
      v11 = 2080;
      v12 = "";
      v13 = 2080;
      v14 = "/Library/Caches/com.apple.xbs/Sources/Mesa/AppleBiometricServices/MesaFactoryC/MesaFactoryC.c";
      v15 = 1024;
      v16 = 114;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
  }
  else if (v5 != 4)
  {
    if (qword_1000BA030 != -1)
      dispatch_once(&qword_1000BA030, &stru_100080948);
    if (qword_1000BA0E8)
      v4 = qword_1000BA0E8;
    else
      v4 = &_os_log_default;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136316162;
      v8 = "size == sizeof(state)";
      v9 = 2048;
      v10 = 0;
      v11 = 2080;
      v12 = "";
      v13 = 2080;
      v14 = "/Library/Caches/com.apple.xbs/Sources/Mesa/AppleBiometricServices/MesaFactoryC/MesaFactoryC.c";
      v15 = 1024;
      v16 = 115;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", buf, 0x30u);
    }
    return 0;
  }
  return v6;
}

uint64_t sub_100002DE0()
{
  const __CFDictionary *v0;
  io_service_t MatchingService;
  io_object_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  int v16;

  if (dword_1000BA0FC)
    goto LABEL_5;
  v0 = IOServiceMatching("AppleBiometricServices");
  MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v0);
  if (MatchingService)
  {
    v2 = MatchingService;
    v3 = IOServiceOpen(MatchingService, mach_task_self_, 0, (io_connect_t *)&dword_1000BA0FC);
    if (!(_DWORD)v3)
    {
      IOObjectRelease(v2);
LABEL_5:
      if (!sub_100002BA4())
        sub_100002A58();
      return 0;
    }
    v4 = v3;
    if (qword_1000BA030 != -1)
      dispatch_once(&qword_1000BA030, &stru_100080948);
    if (qword_1000BA0E8)
      v6 = qword_1000BA0E8;
    else
      v6 = &_os_log_default;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = 136316162;
      v8 = "err == 0 ";
      v9 = 2048;
      v10 = (int)v4;
      v11 = 2080;
      v12 = "";
      v13 = 2080;
      v14 = "/Library/Caches/com.apple.xbs/Sources/Mesa/AppleBiometricServices/MesaFactoryC/MesaFactoryC.c";
      v15 = 1024;
      v16 = 135;
      goto LABEL_23;
    }
  }
  else
  {
    if (qword_1000BA030 != -1)
      dispatch_once(&qword_1000BA030, &stru_100080948);
    v4 = 3758097084;
    if (qword_1000BA0E8)
      v6 = qword_1000BA0E8;
    else
      v6 = &_os_log_default;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = 136316162;
      v8 = "service";
      v9 = 2048;
      v10 = 0;
      v11 = 2080;
      v12 = "";
      v13 = 2080;
      v14 = "/Library/Caches/com.apple.xbs/Sources/Mesa/AppleBiometricServices/MesaFactoryC/MesaFactoryC.c";
      v15 = 1024;
      v16 = 132;
LABEL_23:
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v7, 0x30u);
    }
  }
  return v4;
}

uint64_t sub_10000303C(void *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t result;
  NSObject *v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;

  if (!a1)
  {
    if (qword_1000BA030 != -1)
      dispatch_once(&qword_1000BA030, &stru_100080948);
    if (qword_1000BA0E8)
      v4 = qword_1000BA0E8;
    else
      v4 = &_os_log_default;
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      return 22;
    v6 = 136316162;
    v7 = "buffer";
    v8 = 2048;
    v9 = 0;
    v10 = 2080;
    v11 = "";
    v12 = 2080;
    v13 = "/Library/Caches/com.apple.xbs/Sources/Mesa/AppleBiometricServices/MesaFactoryC/MesaFactoryC.c";
    v14 = 1024;
    v15 = 298;
    goto LABEL_27;
  }
  if (!a2)
  {
    if (qword_1000BA030 != -1)
      dispatch_once(&qword_1000BA030, &stru_100080948);
    if (qword_1000BA0E8)
      v4 = qword_1000BA0E8;
    else
      v4 = &_os_log_default;
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      return 22;
    v6 = 136316162;
    v7 = "bufferSize";
    v8 = 2048;
    v9 = 0;
    v10 = 2080;
    v11 = "";
    v12 = 2080;
    v13 = "/Library/Caches/com.apple.xbs/Sources/Mesa/AppleBiometricServices/MesaFactoryC/MesaFactoryC.c";
    v14 = 1024;
    v15 = 299;
    goto LABEL_27;
  }
  if (!*a2)
  {
    if (qword_1000BA030 != -1)
      dispatch_once(&qword_1000BA030, &stru_100080948);
    if (qword_1000BA0E8)
      v4 = qword_1000BA0E8;
    else
      v4 = &_os_log_default;
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      return 22;
    v6 = 136316162;
    v7 = "*bufferSize";
    v8 = 2048;
    v9 = 0;
    v10 = 2080;
    v11 = "";
    v12 = 2080;
    v13 = "/Library/Caches/com.apple.xbs/Sources/Mesa/AppleBiometricServices/MesaFactoryC/MesaFactoryC.c";
    v14 = 1024;
    v15 = 300;
LABEL_27:
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v6, 0x30u);
    return 22;
  }
  v2 = sub_100002770(dword_1000BA0FC, 34, 0, 0, 0, a1, a2);
  result = 0;
  if ((_DWORD)v2)
  {
    if (qword_1000BA030 != -1)
      dispatch_once(&qword_1000BA030, &stru_100080948);
    if (qword_1000BA0E8)
      v5 = qword_1000BA0E8;
    else
      v5 = &_os_log_default;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 136316162;
      v7 = "err == 0 ";
      v8 = 2048;
      v9 = (int)v2;
      v10 = 2080;
      v11 = "";
      v12 = 2080;
      v13 = "/Library/Caches/com.apple.xbs/Sources/Mesa/AppleBiometricServices/MesaFactoryC/MesaFactoryC.c";
      v14 = 1024;
      v15 = 303;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v6, 0x30u);
    }
    return v2;
  }
  return result;
}

uint64_t sub_1000033EC(void *a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t result;
  NSObject *v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;

  if (!a1)
  {
    if (qword_1000BA030 != -1)
      dispatch_once(&qword_1000BA030, &stru_100080948);
    if (qword_1000BA0E8)
      v4 = qword_1000BA0E8;
    else
      v4 = &_os_log_default;
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      return 22;
    v6 = 136316162;
    v7 = "buffer";
    v8 = 2048;
    v9 = 0;
    v10 = 2080;
    v11 = "";
    v12 = 2080;
    v13 = "/Library/Caches/com.apple.xbs/Sources/Mesa/AppleBiometricServices/MesaFactoryC/MesaFactoryC.c";
    v14 = 1024;
    v15 = 317;
    goto LABEL_27;
  }
  if (!a2)
  {
    if (qword_1000BA030 != -1)
      dispatch_once(&qword_1000BA030, &stru_100080948);
    if (qword_1000BA0E8)
      v4 = qword_1000BA0E8;
    else
      v4 = &_os_log_default;
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      return 22;
    v6 = 136316162;
    v7 = "bufferSize";
    v8 = 2048;
    v9 = 0;
    v10 = 2080;
    v11 = "";
    v12 = 2080;
    v13 = "/Library/Caches/com.apple.xbs/Sources/Mesa/AppleBiometricServices/MesaFactoryC/MesaFactoryC.c";
    v14 = 1024;
    v15 = 318;
    goto LABEL_27;
  }
  if (!*a2)
  {
    if (qword_1000BA030 != -1)
      dispatch_once(&qword_1000BA030, &stru_100080948);
    if (qword_1000BA0E8)
      v4 = qword_1000BA0E8;
    else
      v4 = &_os_log_default;
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      return 22;
    v6 = 136316162;
    v7 = "*bufferSize";
    v8 = 2048;
    v9 = 0;
    v10 = 2080;
    v11 = "";
    v12 = 2080;
    v13 = "/Library/Caches/com.apple.xbs/Sources/Mesa/AppleBiometricServices/MesaFactoryC/MesaFactoryC.c";
    v14 = 1024;
    v15 = 319;
LABEL_27:
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v6, 0x30u);
    return 22;
  }
  v2 = sub_100002770(dword_1000BA0FC, 59, 0, 0, 0, a1, a2);
  result = 0;
  if ((_DWORD)v2)
  {
    if (qword_1000BA030 != -1)
      dispatch_once(&qword_1000BA030, &stru_100080948);
    if (qword_1000BA0E8)
      v5 = qword_1000BA0E8;
    else
      v5 = &_os_log_default;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = 136316162;
      v7 = "err == 0 ";
      v8 = 2048;
      v9 = (int)v2;
      v10 = 2080;
      v11 = "";
      v12 = 2080;
      v13 = "/Library/Caches/com.apple.xbs/Sources/Mesa/AppleBiometricServices/MesaFactoryC/MesaFactoryC.c";
      v14 = 1024;
      v15 = 322;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v6, 0x30u);
    }
    return v2;
  }
  return result;
}

uint64_t sub_10000379C(int *a1)
{
  NSObject *v2;
  uint64_t v3;
  NSObject *v4;
  int v5;
  NSObject *v6;
  int v7;
  NSObject *v8;
  os_log_type_t v9;
  NSObject *v11;
  int v12;
  _BYTE v13[10];
  uint64_t v14;
  __int16 v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;

  if (qword_1000BA030 != -1)
    dispatch_once(&qword_1000BA030, &stru_100080948);
  if (qword_1000BA0F0)
    v2 = qword_1000BA0F0;
  else
    v2 = &_os_log_default;
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 134217984;
    *(_QWORD *)v13 = a1;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "getSensorProvisioningState %p\n", (uint8_t *)&v12, 0xCu);
  }
  if (a1)
  {
    if (byte_1000BA0F9)
    {
      v3 = 0;
      *a1 = dword_1000B9B88;
    }
    else
    {
      v3 = sub_100002DE0();
      if ((_DWORD)v3)
      {
        if (qword_1000BA030 != -1)
          dispatch_once(&qword_1000BA030, &stru_100080948);
        if (qword_1000BA0E8)
          v11 = qword_1000BA0E8;
        else
          v11 = &_os_log_default;
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        {
          v12 = 136316162;
          *(_QWORD *)v13 = "err == 0 ";
          *(_WORD *)&v13[8] = 2048;
          v14 = (int)v3;
          v15 = 2080;
          v16 = "";
          v17 = 2080;
          v18 = "/Library/Caches/com.apple.xbs/Sources/Mesa/AppleBiometricServices/MesaFactoryC/MesaFactoryC.c";
          v19 = 1024;
          v20 = 402;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v12, 0x30u);
        }
      }
      else
      {
        *a1 = sub_100002BA4();
      }
    }
  }
  else
  {
    v3 = 3758097090;
  }
  if (dword_1000BA0FC)
  {
    IOServiceClose(dword_1000BA0FC);
    dword_1000BA0FC = 0;
  }
  if ((_DWORD)v3)
  {
    if (qword_1000BA030 != -1)
      dispatch_once(&qword_1000BA030, &stru_100080948);
    if (qword_1000BA0F0)
      v4 = qword_1000BA0F0;
    else
      v4 = &_os_log_default;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      if (a1)
        v5 = *a1;
      else
        v5 = -1;
      v12 = 67109376;
      *(_DWORD *)v13 = v3;
      *(_WORD *)&v13[4] = 1024;
      *(_DWORD *)&v13[6] = v5;
      v8 = v4;
      v9 = OS_LOG_TYPE_ERROR;
LABEL_36:
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "getSensorProvisioningState -> %{errno}d %d\n", (uint8_t *)&v12, 0xEu);
    }
  }
  else
  {
    if (qword_1000BA030 != -1)
      dispatch_once(&qword_1000BA030, &stru_100080948);
    if (qword_1000BA0F0)
      v6 = qword_1000BA0F0;
    else
      v6 = &_os_log_default;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      if (a1)
        v7 = *a1;
      else
        v7 = -1;
      v12 = 67109376;
      *(_DWORD *)v13 = 0;
      *(_WORD *)&v13[4] = 1024;
      *(_DWORD *)&v13[6] = v7;
      v8 = v6;
      v9 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_36;
    }
  }
  return v3;
}

uint64_t sub_100003ABC(char *a1, _QWORD *a2)
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  os_log_type_t v9;
  NSObject *v10;
  NSObject *v12;
  int v13;
  const char *v14;
  __int16 v15;
  _QWORD *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;

  if (qword_1000BA030 != -1)
    dispatch_once(&qword_1000BA030, &stru_100080948);
  if (qword_1000BA0F0)
    v4 = qword_1000BA0F0;
  else
    v4 = &_os_log_default;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 134218240;
    v14 = a1;
    v15 = 2048;
    v16 = a2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "getModuleSerialNumber %p %p\n", (uint8_t *)&v13, 0x16u);
  }
  v5 = sub_100002DE0();
  if ((_DWORD)v5)
  {
    v6 = v5;
    if (qword_1000BA030 != -1)
      dispatch_once(&qword_1000BA030, &stru_100080948);
    if (qword_1000BA0E8)
      v12 = qword_1000BA0E8;
    else
      v12 = &_os_log_default;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = 136316162;
      v14 = "err == 0 ";
      v15 = 2048;
      v16 = (_QWORD *)(int)v6;
      v17 = 2080;
      v18 = "";
      v19 = 2080;
      v20 = "/Library/Caches/com.apple.xbs/Sources/Mesa/AppleBiometricServices/MesaFactoryC/MesaFactoryC.c";
      v21 = 1024;
      v22 = 622;
LABEL_43:
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v13, 0x30u);
    }
  }
  else
  {
    v6 = sub_10000303C(a1, a2);
    if ((_DWORD)v6)
    {
      if (qword_1000BA030 != -1)
        dispatch_once(&qword_1000BA030, &stru_100080948);
      v12 = qword_1000BA0E8 ? qword_1000BA0E8 : &_os_log_default;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = 136316162;
        v14 = "err == 0 ";
        v15 = 2048;
        v16 = (_QWORD *)(int)v6;
        v17 = 2080;
        v18 = "";
        v19 = 2080;
        v20 = "/Library/Caches/com.apple.xbs/Sources/Mesa/AppleBiometricServices/MesaFactoryC/MesaFactoryC.c";
        v21 = 1024;
        v22 = 624;
        goto LABEL_43;
      }
    }
  }
  if (dword_1000BA0FC)
  {
    IOServiceClose(dword_1000BA0FC);
    dword_1000BA0FC = 0;
  }
  if ((_DWORD)v6)
  {
    if (qword_1000BA030 != -1)
      dispatch_once(&qword_1000BA030, &stru_100080948);
    if (qword_1000BA0F0)
      v7 = qword_1000BA0F0;
    else
      v7 = &_os_log_default;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v13 = 67109120;
      LODWORD(v14) = v6;
      v8 = v7;
      v9 = OS_LOG_TYPE_ERROR;
LABEL_27:
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "getModuleSerialNumber -> %{errno}d\n", (uint8_t *)&v13, 8u);
    }
  }
  else
  {
    if (qword_1000BA030 != -1)
      dispatch_once(&qword_1000BA030, &stru_100080948);
    if (qword_1000BA0F0)
      v10 = qword_1000BA0F0;
    else
      v10 = &_os_log_default;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 67109120;
      LODWORD(v14) = 0;
      v8 = v10;
      v9 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_27;
    }
  }
  return v6;
}

uint64_t sub_100003E48(char *a1, _QWORD *a2)
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  os_log_type_t v9;
  NSObject *v10;
  NSObject *v12;
  int v13;
  const char *v14;
  __int16 v15;
  _QWORD *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;

  if (qword_1000BA030 != -1)
    dispatch_once(&qword_1000BA030, &stru_100080948);
  if (qword_1000BA0F0)
    v4 = qword_1000BA0F0;
  else
    v4 = &_os_log_default;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 134218240;
    v14 = a1;
    v15 = 2048;
    v16 = a2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "getSensorSerialNumber %p %p\n", (uint8_t *)&v13, 0x16u);
  }
  v5 = sub_100002DE0();
  if ((_DWORD)v5)
  {
    v6 = v5;
    if (qword_1000BA030 != -1)
      dispatch_once(&qword_1000BA030, &stru_100080948);
    if (qword_1000BA0E8)
      v12 = qword_1000BA0E8;
    else
      v12 = &_os_log_default;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = 136316162;
      v14 = "err == 0 ";
      v15 = 2048;
      v16 = (_QWORD *)(int)v6;
      v17 = 2080;
      v18 = "";
      v19 = 2080;
      v20 = "/Library/Caches/com.apple.xbs/Sources/Mesa/AppleBiometricServices/MesaFactoryC/MesaFactoryC.c";
      v21 = 1024;
      v22 = 645;
LABEL_43:
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v13, 0x30u);
    }
  }
  else
  {
    v6 = sub_1000033EC(a1, a2);
    if ((_DWORD)v6)
    {
      if (qword_1000BA030 != -1)
        dispatch_once(&qword_1000BA030, &stru_100080948);
      v12 = qword_1000BA0E8 ? qword_1000BA0E8 : &_os_log_default;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v13 = 136316162;
        v14 = "err == 0 ";
        v15 = 2048;
        v16 = (_QWORD *)(int)v6;
        v17 = 2080;
        v18 = "";
        v19 = 2080;
        v20 = "/Library/Caches/com.apple.xbs/Sources/Mesa/AppleBiometricServices/MesaFactoryC/MesaFactoryC.c";
        v21 = 1024;
        v22 = 647;
        goto LABEL_43;
      }
    }
  }
  if (dword_1000BA0FC)
  {
    IOServiceClose(dword_1000BA0FC);
    dword_1000BA0FC = 0;
  }
  if ((_DWORD)v6)
  {
    if (qword_1000BA030 != -1)
      dispatch_once(&qword_1000BA030, &stru_100080948);
    if (qword_1000BA0F0)
      v7 = qword_1000BA0F0;
    else
      v7 = &_os_log_default;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v13 = 67109120;
      LODWORD(v14) = v6;
      v8 = v7;
      v9 = OS_LOG_TYPE_ERROR;
LABEL_27:
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "getSensorSerialNumber -> %{errno}d\n", (uint8_t *)&v13, 8u);
    }
  }
  else
  {
    if (qword_1000BA030 != -1)
      dispatch_once(&qword_1000BA030, &stru_100080948);
    if (qword_1000BA0F0)
      v10 = qword_1000BA0F0;
    else
      v10 = &_os_log_default;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 67109120;
      LODWORD(v14) = 0;
      v8 = v10;
      v9 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_27;
    }
  }
  return v6;
}

void sub_1000041D4(_QWORD *a1)
{
  uint8_t v2[16];

  *(_WORD *)v2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Couldn't create OS Log for 'com.apple.BiometricKit.Library-MesaFactory'!\n", v2, 2u);
  *a1 = qword_1000BA0E8;
}

id sub_100004230(int a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  int v8;
  int v9;
  char **v11;
  uint64_t (*v12)(void);
  const char *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  BOOL v17;
  void *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  id v38;
  void *v39;
  unsigned int v40;
  _UNKNOWN **v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  _UNKNOWN **v50;
  char *v51;
  char **v52;
  uint64_t v53;

  v8 = a3;
  v9 = a2;
  v52 = 0;
  v53 = 0;
  v11 = (char **)qword_1000BA038;
  if (qword_1000BA038)
  {
    v52 = (char **)qword_1000BA038;
  }
  else
  {
    if (!sub_10001B674(&v52))
    {
      v13 = "gatherASPFTLData: Could not get nand_exporter_t";
      goto LABEL_19;
    }
    v11 = v52;
  }
  if (!*((_DWORD *)v11 + 4))
  {
    v13 = "gatherASPFTLData: No io_connection exist";
LABEL_19:
    sub_10001B514(v13, a2, a3, a4, a5, a6, a7, a8, (char)v52);
    v18 = 0;
    goto LABEL_42;
  }
  v53 = 0;
  if (!v9)
  {
    v12 = (uint64_t (*)(void))v11[6];
    if (v12)
      goto LABEL_11;
    v36 = "gatherASPFTLData: No getReadStatsSelectors exist";
LABEL_25:
    sub_10001B514(v36, a2, a3, a4, a5, a6, a7, a8, (char)v52);
    return 0;
  }
  v12 = (uint64_t (*)(void))v11[5];
  if (!v12)
  {
    v36 = "gatherASPFTLData: No getStatsSelectors exist";
    goto LABEL_25;
  }
  v8 = 0;
LABEL_11:
  v14 = v12();
  v15 = sub_10001CBC4(v52, *(_DWORD *)(v14 + 4), 0, v8, &v53, 0, 0);
  v16 = v15;
  if (v15)
    v17 = v53 == 0;
  else
    v17 = 1;
  if (v17)
  {
    v18 = 0;
    if (!v15)
      goto LABEL_42;
  }
  else
  {
    v19 = (uint64_t *)malloc_type_calloc(1uLL, 0x20uLL, 0x20040DC1BFBCFuLL);
    if (v19)
    {
      v27 = v19;
      if (a1)
        v28 = ((uint64_t (*)(uint64_t *, void *, _QWORD))v52[19])(v19, v16, v53);
      else
        v28 = ((uint64_t (*)(uint64_t *, void *, _QWORD))v52[18])(v19, v16, v53);
      if (v28)
      {
        v38 = sub_10001B2F4(v27, 0);
        v18 = (void *)objc_claimAutoreleasedReturnValue(v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", *v52));
        v40 = objc_msgSend(v39, "isEqualToString:", CFSTR("ASPStorage"));

        if (v40)
          v41 = &off_1000B26F8;
        else
          v41 = &off_1000B2650;
        objc_msgSend(v18, "setObject:forKeyedSubscript:", v41, CFSTR("com.apple.NANDInfo.IsANS1Controller"), v52);
        if (v18
          && (v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKey:", CFSTR("magazineFWVersion_1"))),
              v49,
              v49))
        {
          v50 = &off_1000B26F8;
        }
        else
        {
          sub_10001B514("Stat Magazine not supported", v42, v43, v44, v45, v46, v47, v48, (char)v52);
          v50 = &off_1000B2650;
        }
        objc_msgSend(v18, "setObject:forKeyedSubscript:", v50, CFSTR("com.apple.NANDInfo.IsStatMagSupported"));
      }
      else
      {
        sub_10001B514("gatherASPFTLData: parseFTL failed", v29, v30, v31, v32, v33, v34, v35, (char)v52);
        v18 = 0;
      }
      v51 = v52[20];
      if (v51)
        ((void (*)(uint64_t *))v51)(v27);
      free(v27);
    }
    else
    {
      sub_10001B514("gatherASPFTLData: Could not allocate memory for pcxt.ftlData", v20, v21, v22, v23, v24, v25, v26, (char)v52);
      v18 = 0;
    }
  }
  free(v16);
LABEL_42:
  if (!qword_1000BA038)
  {
    if (v52)
      sub_10001B7BC((uint64_t)v52);
  }
  return v18;
}

void *CopyAppleCareNANDInfo()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  NSString *v14;
  void *v15;
  _QWORD v17[5];

  v17[0] = CFSTR("com.apple.NANDInfo.Health.MaxPercentageNANDUsed");
  v17[1] = CFSTR("com.apple.NANDInfo.Health.HostReadErrors");
  v17[2] = CFSTR("com.apple.NANDInfo.Health.MaxE2EErrors");
  v17[3] = CFSTR("com.apple.NANDInfo.Health.NumGrownBadBlocks");
  v17[4] = CFSTR("com.apple.NANDInfo.Health.NumDieFailures");
  v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v17, 5));
  v1 = sub_1000045DC();
  v2 = (void *)objc_claimAutoreleasedReturnValue(v1);
  v10 = v2;
  if (v2)
  {
    v11 = sub_10001B3E4(v2, v0);
    v12 = (id)objc_claimAutoreleasedReturnValue(v11);
  }
  else
  {
    sub_10001B514("CopyAppleCareNANDInfo: Unable to get health API fields", v3, v4, v5, v6, v7, v8, v9, v17[0]);
    v12 = objc_alloc_init((Class)NSMutableDictionary);
  }
  v13 = v12;
  v14 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", sub_10001B5E0());
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v15, off_1000B9B90);

  return v13;
}

id sub_1000045DC()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *i;
  uint64_t v21;
  void *v22;
  void *v23;
  signed int v24;
  void *v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  void *j;
  uint64_t v31;
  void *v32;
  void *v33;
  signed int v34;
  void *v35;
  void *v36;
  void *v37;
  unsigned int v38;
  const __CFString *v39;
  void *v40;
  unsigned int v41;
  void *v42;
  int v43;
  uint64_t v44;
  void *v45;
  void *v46;
  id v47;
  id v48;
  id v49;
  uint64_t v50;
  void *k;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[128];
  _BYTE v70[128];
  _BYTE v71[128];
  _QWORD v72[3];
  _QWORD v73[3];

  v0 = objc_alloc_init((Class)NSMutableDictionary);
  v72[0] = CFSTR("numGrownBad");
  v72[1] = CFSTR("spareAvailablePercent");
  v73[0] = CFSTR("com.apple.NANDInfo.Health.NumGrownBadBlocks");
  v73[1] = CFSTR("com.apple.NANDInfo.Health.SpareAvailablePercent");
  v72[2] = CFSTR("numDieFailures");
  v73[2] = CFSTR("com.apple.NANDInfo.Health.NumDieFailures");
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v73, v72, 3));
  v7 = sub_100004230(0, 1, 0, v2, v3, v4, v5, v6);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v7);
  if (!v15)
  {
    sub_10001B514("gatherNANDHealthInfo: Unable to get FTL fields", v8, v9, v10, v11, v12, v13, v14, v57);
    goto LABEL_44;
  }
  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  v16 = objc_msgSend(&off_1000B2530, "countByEnumeratingWithState:objects:count:", &v65, v71, 16);
  if (v16)
  {
    v17 = v16;
    v18 = 0;
    v19 = *(_QWORD *)v66;
    do
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(_QWORD *)v66 != v19)
          objc_enumerationMutation(&off_1000B2530);
        v21 = *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * (_QWORD)i);
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKey:", v21));

        if (v22)
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKey:", v21));
          v24 = objc_msgSend(v23, "intValue");

          if (v18 <= v24)
            v18 = v24;
        }
      }
      v17 = objc_msgSend(&off_1000B2530, "countByEnumeratingWithState:objects:count:", &v65, v71, 16);
    }
    while (v17);
  }
  else
  {
    v18 = 0;
  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v18));
  objc_msgSend(v0, "setObject:forKeyedSubscript:", v25, CFSTR("com.apple.NANDInfo.Health.MaxPercentageNANDUsed"));

  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  v26 = objc_msgSend(&off_1000B2548, "countByEnumeratingWithState:objects:count:", &v61, v70, 16);
  if (v26)
  {
    v27 = v26;
    v28 = 0;
    v29 = *(_QWORD *)v62;
    do
    {
      for (j = 0; j != v27; j = (char *)j + 1)
      {
        if (*(_QWORD *)v62 != v29)
          objc_enumerationMutation(&off_1000B2548);
        v31 = *(_QWORD *)(*((_QWORD *)&v61 + 1) + 8 * (_QWORD)j);
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKey:", v31));

        if (v32)
        {
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKey:", v31));
          v34 = objc_msgSend(v33, "intValue");

          if (v28 <= v34)
            v28 = v34;
        }
      }
      v27 = objc_msgSend(&off_1000B2548, "countByEnumeratingWithState:objects:count:", &v61, v70, 16);
    }
    while (v27);
  }
  else
  {
    v28 = 0;
  }
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v28));
  objc_msgSend(v0, "setObject:forKeyedSubscript:", v35, CFSTR("com.apple.NANDInfo.Health.MaxE2EErrors"));

  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKey:", CFSTR("com.apple.NANDInfo.IsANS1Controller")));
  if (!v36)
    goto LABEL_32;
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKey:", CFSTR("com.apple.NANDInfo.IsANS1Controller")));
  v38 = objc_msgSend(v37, "intValue");

  if (!v38)
  {
    v39 = CFSTR("raidSmartErrors");
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKey:", CFSTR("raidSmartErrors")));

    if (v45)
      goto LABEL_30;
LABEL_32:
    v44 = 0;
    goto LABEL_33;
  }
  v39 = CFSTR("ueccReads");
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKey:", CFSTR("ueccReads")));
  v41 = objc_msgSend(v40, "intValue");

  if (!v41)
    goto LABEL_32;
LABEL_30:
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKey:", v39));
  v43 = objc_msgSend(v42, "intValue");

  v44 = v43 & ~(v43 >> 31);
LABEL_33:
  v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v44));
  objc_msgSend(v0, "setObject:forKeyedSubscript:", v46, CFSTR("com.apple.NANDInfo.Health.HostReadErrors"));

  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  v47 = v1;
  v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v57, v69, 16);
  if (v48)
  {
    v49 = v48;
    v50 = *(_QWORD *)v58;
    do
    {
      for (k = 0; k != v49; k = (char *)k + 1)
      {
        if (*(_QWORD *)v58 != v50)
          objc_enumerationMutation(v47);
        v52 = *(_QWORD *)(*((_QWORD *)&v57 + 1) + 8 * (_QWORD)k);
        v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKey:", v52, (_QWORD)v57));

        if (v53)
        {
          v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKey:", v52));
          v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "objectForKeyedSubscript:", v52));
          objc_msgSend(v0, "setObject:forKeyedSubscript:", v54, v55);

        }
        else
        {
          v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "objectForKeyedSubscript:", v52));
          objc_msgSend(v0, "setObject:forKeyedSubscript:", &off_1000B2770, v54);
        }

      }
      v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v57, v69, 16);
    }
    while (v49);
  }

LABEL_44:
  return v0;
}

uint64_t sub_100004B04(uint64_t a1, uint64_t *a2, unsigned int a3)
{
  uint64_t result;
  unsigned int v6;
  int v7;
  uint64_t *v8;
  unint64_t v9;
  unint64_t v10;
  unsigned int v11;
  uint64_t v13;
  uint64_t *v14;
  unsigned int v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  int v22;

  *(_DWORD *)(a1 + 36) = -1;
  if (a3 < 8)
    return 0;
  v6 = a3 >> 3;
  while (2)
  {
    v9 = *a2;
    v8 = a2 + 1;
    v7 = v9;
    v10 = HIDWORD(v9);
    v11 = v6 - 1;
    if (v9 > 0x30000000 || v11 < v10)
    {
      result = 0;
      *(_DWORD *)(a1 + 32) = 0;
      return result;
    }
    v13 = (v7 - 1);
    if (v13 <= 0x47)
      __asm { BR              X10 }
    v17 = (v7 - 73);
    if (v17 <= 0x46)
      __asm { BR              X10 }
    switch(v7)
    {
      case 144:
        v18 = *v8;
        v19 = "numMemExtreme";
        goto LABEL_13;
      case 145:
        v18 = *v8;
        v19 = "maxMemExtremeDuration";
        goto LABEL_13;
      case 146:
        v18 = *v8;
        v19 = "memExtremeDuration";
        goto LABEL_13;
      case 147:
        v18 = *v8;
        v19 = "bandGetsExtreme";
        goto LABEL_13;
      case 148:
        v18 = *v8;
        v19 = "bandGetsLow";
        goto LABEL_13;
      case 149:
        v18 = *v8;
        v19 = "numHostChoke";
        goto LABEL_13;
      case 152:
        v18 = *v8;
        v19 = "AbortSkip_ProgramError";
        goto LABEL_13;
      case 153:
        v18 = *v8;
        v19 = "AbortSkip_ReadErrorOpenBand";
        goto LABEL_13;
      case 154:
        v18 = *v8;
        v19 = "AbortSkip_FailedRebuildingParity";
        goto LABEL_13;
      case 155:
        v18 = *v8;
        v19 = "AbortPad_OpenRefreshBand";
        goto LABEL_13;
      case 156:
        v18 = *v8;
        v19 = "AbortPad_CloseBands";
        goto LABEL_13;
      case 157:
        v18 = *v8;
        v19 = "AbortPad_SetPhoto";
        goto LABEL_13;
      case 158:
        v18 = *v8;
        v19 = "AbortPad_GcNoSource";
        goto LABEL_13;
      case 159:
        v18 = *v8;
        v19 = "AbortPad_Format";
        goto LABEL_13;
      case 160:
        v18 = *v8;
        v19 = "nandDiscoveryDuration";
        goto LABEL_13;
      case 161:
        v18 = *v8;
        v19 = "coreCCEnableDuration";
        goto LABEL_13;
      case 163:
        v18 = *v8;
        v19 = "coreOpenDuration";
        goto LABEL_13;
      case 164:
        v18 = *v8;
        v19 = "coreWritableDuration";
        goto LABEL_13;
      case 165:
        v18 = *v8;
        v19 = "coreClogLoadDuration";
        goto LABEL_13;
      case 167:
        v18 = *v8;
        v19 = "bulkPFail";
        goto LABEL_13;
      case 169:
        v18 = *v8;
        v19 = "bulkRFail";
        goto LABEL_13;
      case 172:
        v18 = *v8;
        v19 = "raidSmartErrors";
        goto LABEL_13;
      case 182:
        v18 = *v8;
        v19 = "internalUeccs";
        goto LABEL_13;
      case 183:
        v18 = *v8;
        v19 = "e2eFail";
        goto LABEL_13;
      case 184:
        v18 = *v8;
        v19 = "TempSensorMax";
        goto LABEL_13;
      case 185:
        v18 = *v8;
        v19 = "TempSensorMin";
        goto LABEL_13;
      case 186:
        v18 = *v8;
        v19 = "powerUpFromDDR";
        goto LABEL_13;
      case 187:
        v18 = *v8;
        v19 = "numMemLow";
        goto LABEL_13;
      case 188:
        v18 = *v8;
        v19 = "maxMemLowDuration";
        goto LABEL_13;
      case 189:
        v18 = *v8;
        v19 = "memLowDuration";
        goto LABEL_13;
      case 190:
        v18 = *v8;
        v19 = "numFences";
        goto LABEL_13;
      case 191:
        v18 = *v8;
        v19 = "hostPassiveIO";
        goto LABEL_13;
      case 192:
        v18 = *v8;
        v19 = "odtsMax";
        goto LABEL_13;
      case 193:
        v18 = *v8;
        v19 = "defragMFromOrphans";
        goto LABEL_13;
      case 194:
        v18 = *v8;
        v19 = "defragMFromFragments";
        goto LABEL_13;
      case 195:
        v18 = *v8;
        v19 = "defragMTime";
        goto LABEL_13;
      case 196:
        v18 = *v8;
        v19 = "defragMMaxTime";
        goto LABEL_13;
      case 197:
        v18 = *v8;
        v19 = "raidFailedLbaMismatch";
        goto LABEL_13;
      case 198:
        v18 = *v8;
        v19 = "numSyscfgWrites";
        goto LABEL_13;
      case 199:
        v18 = *v8;
        v19 = "indmbUnitsXfer";
        goto LABEL_13;
      case 200:
        v18 = *v8;
        v19 = "indmbUnitsCache";
        goto LABEL_13;
      case 201:
        v18 = *v8;
        v19 = "indmbUnitsInd";
        goto LABEL_13;
      case 202:
        v18 = *v8;
        v19 = "wcacheFS_Mbytes";
        goto LABEL_13;
      case 203:
        v18 = *v8;
        v19 = "wcacheDS_Mbytes";
        goto LABEL_13;
      case 204:
        v18 = *v8;
        v19 = "powerOnSeconds";
        goto LABEL_13;
      case 205:
        v18 = *v8;
        v19 = "numUnknownTokenHostRead";
        goto LABEL_13;
      case 206:
        v18 = *v8;
        v19 = "numUnmmapedTokenHostRead";
        goto LABEL_13;
      case 207:
        v20 = "numOfThrottlingEntriesPerLevel";
        v21 = a1;
        v22 = 207;
LABEL_85:
        v14 = v8;
        v15 = 16;
        goto LABEL_12;
      case 208:
        v18 = *v8;
        v19 = "wcacheFS_MbytesMin";
        goto LABEL_13;
      case 209:
        v18 = *v8;
        v19 = "wcacheFS_MbytesMax";
        goto LABEL_13;
      case 210:
        v18 = *v8;
        v19 = "prepareForShutdownFailCounter";
        goto LABEL_13;
      case 211:
        v18 = *v8;
        v19 = "lpsrEntry";
        goto LABEL_13;
      case 212:
        v18 = *v8;
        v19 = "lpsrExit";
        goto LABEL_13;
      case 213:
        v20 = "crcInternalReadFail";
        v21 = a1;
        v22 = 213;
LABEL_23:
        v14 = v8;
        v15 = 8;
        goto LABEL_12;
      case 214:
        v18 = *v8;
        v19 = "wcacheFSEvictCnt";
        goto LABEL_13;
      case 215:
        v18 = *v8;
        v19 = "wcacheFSEvictSize";
        goto LABEL_13;
      case 216:
        v18 = *v8;
        v19 = "wcacheFSWr";
        goto LABEL_13;
      case 217:
        v18 = *v8;
        v19 = "wcacheDSWr";
        goto LABEL_13;
      case 218:
        v20 = "wcacheFSEvictSizeLogDist";
        v21 = a1;
        v22 = 218;
        goto LABEL_11;
      case 219:
        v18 = *v8;
        v19 = "prepareForShutdownTimeoutCounter";
        goto LABEL_13;
      case 220:
        v18 = *v8;
        v19 = "prepareForShutdownCancelCounter";
        goto LABEL_13;
      case 221:
        v18 = *v8;
        v19 = "RD_openBandCount";
        goto LABEL_13;
      case 222:
        v18 = *v8;
        v19 = "RD_openBandNops";
        goto LABEL_13;
      case 223:
        v18 = *v8;
        v19 = "RD_closedBandEvictCount";
LABEL_13:
        v16 = (_QWORD *)a1;
LABEL_14:
        sub_10001B208(v16, "", v19, v18);
        goto LABEL_15;
      default:
        switch(v7)
        {
          case 224:
            v18 = *v8;
            v19 = "RD_closedBandEvictSectors";
            goto LABEL_13;
          case 225:
            v18 = *v8;
            v19 = "RD_closedBandFragmentCount";
            goto LABEL_13;
          case 226:
            v18 = *v8;
            v19 = "RD_closedBandFragmentSectors";
            goto LABEL_13;
          case 227:
            v20 = "wcacheFSOverWrLogSizeCnts";
            v21 = a1;
            v22 = 227;
            goto LABEL_11;
          case 228:
            v20 = "wcacheFSOverWrSizeByFlow";
            v21 = a1;
            v22 = 228;
            goto LABEL_22;
          case 229:
            v20 = "indmbXferCountTo";
            v21 = a1;
            v22 = 229;
            goto LABEL_20;
          case 230:
            v20 = "indmbAccumulatedTimeBetweenXfers";
            v21 = a1;
            v22 = 230;
LABEL_20:
            v14 = v8;
            v15 = 2;
            goto LABEL_12;
          case 231:
            v18 = *v8;
            v19 = "maxGracefulBootTimeMs";
            goto LABEL_13;
          case 232:
            v18 = *v8;
            v19 = "maxUngracefulBootTimeMs";
            goto LABEL_13;
          case 233:
            v18 = *v8;
            v19 = "averageGracefulBootTimeMs";
            goto LABEL_13;
          case 234:
            v18 = *v8;
            v19 = "averageUngracefulBootTimeMs";
            goto LABEL_13;
          case 235:
            v20 = "gracefulBootTimeLogMs";
            v21 = a1;
            v22 = 235;
            goto LABEL_23;
          case 236:
            v20 = "ungracefulBootTimeLogMs";
            v21 = a1;
            v22 = 236;
            goto LABEL_23;
          case 237:
            v20 = "CalibrationCount";
            v21 = a1;
            v22 = 237;
            goto LABEL_22;
          case 238:
            v18 = *v8;
            v19 = "CalibrationLastTmp";
            goto LABEL_13;
          case 239:
            v18 = *v8;
            v19 = "CalibrationMaxTmp";
            goto LABEL_13;
          case 240:
            v18 = *v8;
            v19 = "CalibrationMinTmp";
            goto LABEL_13;
          case 241:
            v18 = *v8;
            v19 = "ungracefulBootWorstIndicator";
            goto LABEL_13;
          case 242:
            v18 = *v8;
            v19 = "metaMismatchReread";
            goto LABEL_13;
          case 243:
            v18 = *v8;
            v19 = "numS3SleepOps";
            goto LABEL_13;
          case 244:
            v18 = *v8;
            v19 = "odtsCurrent";
            goto LABEL_13;
          case 245:
            v18 = *v8;
            v19 = "prefetchReads";
            goto LABEL_13;
          case 246:
            v18 = *v8;
            v19 = "prefetchHits";
            goto LABEL_13;
          case 247:
            v18 = *v8;
            v19 = "prefetchWritesInvalidation";
            goto LABEL_13;
          case 248:
            v18 = *v8;
            v19 = "indmbUnitsTotal";
            goto LABEL_13;
          case 249:
            v18 = *v8;
            v19 = "selfThrottlingEngage";
            goto LABEL_13;
          case 250:
            v18 = *v8;
            v19 = "selfThrottlingDisengage";
            goto LABEL_13;
          case 252:
            v18 = *v8;
            v19 = "AbortSkip_WlpMode";
            goto LABEL_13;
          case 253:
            v18 = *v8;
            v19 = "hostWritesWlpMode";
            goto LABEL_13;
          case 254:
            v18 = *v8;
            v19 = "numClogDoubleUnc";
            goto LABEL_13;
          case 256:
            v18 = *v8;
            v19 = "AbortPad_WlpMode";
            goto LABEL_13;
          case 257:
            v18 = *v8;
            v19 = "bonfireIntermediateBandErases";
            goto LABEL_13;
          case 258:
            v18 = *v8;
            v19 = "bonfireUserBandErases";
            goto LABEL_13;
          case 259:
            v18 = *v8;
            v19 = "bonfireIntermediateBandProgs";
            goto LABEL_13;
          case 260:
            v18 = *v8;
            v19 = "bonfireUserBandProgs";
            goto LABEL_13;
          case 261:
            v18 = *v8;
            v19 = "bonfireIntermediatePageReads";
            goto LABEL_13;
          case 262:
            v18 = *v8;
            v19 = "bonfireUserPageReads";
            goto LABEL_13;
          case 263:
            v18 = *v8;
            v19 = "refreshUtil00";
            goto LABEL_13;
          case 264:
            v18 = *v8;
            v19 = "failToReadUtil00";
            goto LABEL_13;
          case 265:
            v20 = "readCountHisto";
            v21 = a1;
            v22 = 265;
LABEL_19:
            v14 = v8;
            v15 = 5;
            goto LABEL_12;
          case 266:
            v20 = "readAmpHisto";
            v21 = a1;
            v22 = 266;
            goto LABEL_85;
          case 267:
            v18 = *v8;
            v19 = "totalReadAmp";
            goto LABEL_13;
          case 268:
            v20 = "nvmeModeSelect";
            v21 = a1;
            v22 = 268;
            goto LABEL_22;
          case 269:
            v20 = "numBootBlockRefreshSuccess";
            v21 = a1;
            v22 = 269;
            goto LABEL_23;
          case 270:
            v20 = "numBootBlockRefreshFail";
            v21 = a1;
            v22 = 270;
            goto LABEL_23;
          case 271:
            v18 = *v8;
            v19 = "numUnsupportedAsi";
            goto LABEL_13;
          case 272:
            v18 = *v8;
            v19 = "NumTerminatedProgramSegs";
            goto LABEL_13;
          case 273:
            v18 = *v8;
            v19 = "indParityPagesDrops";
            goto LABEL_13;
          case 274:
            v18 = *v8;
            v19 = "indFlowPrograms";
            goto LABEL_13;
          case 277:
            v20 = "powerBudgetSelect";
            v21 = a1;
            v22 = 277;
LABEL_22:
            v14 = v8;
            v15 = 4;
            goto LABEL_12;
          case 279:
            v18 = *v8;
            v19 = "RxBurnNandWrites";
            goto LABEL_13;
          case 280:
            v20 = "E2EDPErrorCounters";
            v21 = a1;
            v22 = 280;
LABEL_153:
            v14 = v8;
            v15 = 12;
            goto LABEL_12;
          case 281:
            v18 = *v8;
            v19 = "wcacheSectorsMax";
            goto LABEL_13;
          case 282:
            v18 = *v8;
            v19 = "wcacheSectorsMin";
            goto LABEL_13;
          case 283:
            v18 = *v8;
            v19 = "wcacheSectorsCur";
            goto LABEL_13;
          case 284:
            v18 = *v8;
            v19 = "wcacheDS_SectorsMax";
            goto LABEL_13;
          case 285:
            v18 = *v8;
            v19 = "wcacheDS_SectorsMin";
            goto LABEL_13;
          case 286:
            v18 = *v8;
            v19 = "wcacheDS_SectorsCur";
            goto LABEL_13;
          case 287:
            v18 = *v8;
            v19 = "wcacheFS_Reads";
            goto LABEL_13;
          case 288:
            v18 = *v8;
            v19 = "wcacheDS_Reads";
            goto LABEL_13;
          case 289:
            v20 = "mspBootBlockReadFail";
            v21 = a1;
            v22 = 289;
            goto LABEL_155;
          case 290:
            v20 = "mspBootBlockProgFail";
            v21 = a1;
            v22 = 290;
            goto LABEL_155;
          case 291:
            v20 = "mspBootBlockEraseFail";
            v21 = a1;
            v22 = 291;
LABEL_155:
            v14 = v8;
            v15 = 32;
            goto LABEL_12;
          case 292:
            v18 = *v8;
            v19 = "bandsRefreshedOnError";
            goto LABEL_13;
          default:
            switch(v7)
            {
              case 298:
                v20 = "perHostReads";
                v21 = a1;
                v22 = 298;
                goto LABEL_20;
              case 299:
                v20 = "perHostReadXacts";
                v21 = a1;
                v22 = 299;
                goto LABEL_20;
              case 300:
                v20 = "perHostWrites";
                v21 = a1;
                v22 = 300;
                goto LABEL_20;
              case 301:
                v20 = "perHostWriteXacts";
                v21 = a1;
                v22 = 301;
                goto LABEL_20;
              case 302:
                v20 = "perHostNumFlushes";
                v21 = a1;
                v22 = 302;
                goto LABEL_20;
              case 303:
                v20 = "perHostNumFences";
                v21 = a1;
                v22 = 303;
                goto LABEL_20;
              case 304:
                v20 = "commitPadSectorsPerFlow";
                v21 = a1;
                v22 = 304;
                goto LABEL_11;
              case 305:
                v20 = "wcacheDSOverWrLogSizeCnts";
                v21 = a1;
                v22 = 305;
                goto LABEL_11;
              case 306:
                v20 = "wcacheDSOverWrSizeByFlow";
                v21 = a1;
                v22 = 306;
                goto LABEL_22;
              case 307:
                v20 = "CmdRaisePrioiryEvents";
                v21 = a1;
                v22 = 307;
                goto LABEL_11;
              case 308:
                v18 = *v8;
                v19 = "utilNumVerification";
                goto LABEL_13;
              case 309:
                v18 = *v8;
                v19 = "utilRefreshes";
                goto LABEL_13;
              case 310:
                v18 = *v8;
                v19 = "utilBDRErrors";
                goto LABEL_13;
              case 311:
                v18 = *v8;
                v19 = "indBandsPerFlow";
                goto LABEL_13;
              case 312:
                v18 = *v8;
                v19 = "secsPerIndFlow";
                goto LABEL_13;
              case 313:
                v18 = *v8;
                v19 = "indDecodedECC";
                goto LABEL_13;
              case 314:
                v20 = "numBootBlockValidateSuccess";
                v21 = a1;
                v22 = 314;
                goto LABEL_23;
              case 315:
                v20 = "numBootBlockValidateFail";
                v21 = a1;
                v22 = 315;
                goto LABEL_23;
              case 316:
                v20 = "clogPagesFillingPercentage";
                v21 = a1;
                v22 = 316;
                goto LABEL_22;
              case 317:
                v18 = *v8;
                v19 = "bdrCalTimeAccFactor";
                goto LABEL_13;
              case 318:
                v18 = *v8;
                v19 = "bootChainRdError";
                goto LABEL_13;
              case 319:
                v18 = *v8;
                v19 = "bootChainBlankError";
                goto LABEL_13;
              case 320:
                v18 = *v8;
                v19 = "bootChainRefreshError";
                goto LABEL_13;
              case 321:
                v18 = *v8;
                v19 = "bootChainVersionError";
                goto LABEL_13;
              case 322:
                v18 = *v8;
                v19 = "mspBootBlockMismatch";
                goto LABEL_13;
              case 323:
                v18 = *v8;
                v19 = "mspBootBlockMismatchErr";
                goto LABEL_13;
              case 324:
                v20 = "bitflipAddr";
                v21 = a1;
                v22 = 324;
                goto LABEL_19;
              case 325:
                v20 = "bitflipCount";
                v21 = a1;
                v22 = 325;
                goto LABEL_19;
              case 326:
                v20 = "bitflipDupes";
                v21 = a1;
                v22 = 326;
                goto LABEL_19;
              case 327:
                v20 = "bandsMaxTempHisto";
                v21 = a1;
                v22 = 327;
                goto LABEL_217;
              case 328:
                v20 = "bandsMinTempHisto";
                v21 = a1;
                v22 = 328;
                goto LABEL_217;
              case 329:
                v20 = "bandsLifeTimeTempHisto";
                v21 = a1;
                v22 = 329;
                v14 = v8;
                v15 = 30;
                goto LABEL_12;
              case 330:
                v20 = "bandsDeltaTempHisto";
                v21 = a1;
                v22 = 330;
LABEL_217:
                v14 = v8;
                v15 = 22;
                goto LABEL_12;
              case 331:
                v20 = "bandsCrossTempHisto";
                v21 = a1;
                v22 = 331;
                v14 = v8;
                v15 = 45;
                goto LABEL_12;
              case 332:
                v20 = "wcacheWaitLogMs";
                v21 = a1;
                v22 = 332;
                goto LABEL_11;
              case 333:
                v20 = "wcacheDS_segsSortedLogSize";
                v21 = a1;
                v22 = 333;
                goto LABEL_11;
              case 334:
                v18 = *v8;
                v19 = "numFirmwareWrites";
                goto LABEL_13;
              case 335:
                v18 = *v8;
                v19 = "numBisWrites";
                goto LABEL_13;
              case 336:
                v18 = *v8;
                v19 = "numBootChainUpdates";
                goto LABEL_13;
              case 337:
                v18 = *v8;
                v19 = "cntCalTimeWentBackWard";
                goto LABEL_13;
              case 338:
                v18 = *v8;
                v19 = "indBoRecoveries";
                goto LABEL_13;
              case 340:
                v18 = *v8;
                v19 = "numCrossTempUecc";
                goto LABEL_13;
              case 341:
                v18 = *v8;
                v19 = "latencyMonitorError";
                goto LABEL_13;
              case 343:
                v18 = *v8;
                v19 = "utilUeccReads";
                goto LABEL_13;
              case 344:
                v18 = *v8;
                v19 = "numOfAvoidedGCDueToTemp";
                goto LABEL_13;
              case 345:
                v18 = *v8;
                v19 = "forceShutdowns";
                goto LABEL_13;
              case 346:
                v18 = *v8;
                v19 = "gcSlcDestinations";
                goto LABEL_13;
              case 347:
                v18 = *v8;
                v19 = "indReplayExtUsed";
                goto LABEL_13;
              case 348:
                v18 = *v8;
                v19 = "defectsPerPackageOverflow";
                goto LABEL_13;
              case 349:
                v18 = *v8;
                v19 = "RxBurnIntBandsProgrammed";
                goto LABEL_13;
              case 350:
                v18 = *v8;
                v19 = "RxBurnUsrBandsProgrammed";
                goto LABEL_13;
              case 351:
                v18 = *v8;
                v19 = "RxBurnIntNandWrites";
                goto LABEL_13;
              case 352:
                v18 = *v8;
                v19 = "RxBurnUsrNandWrites";
                goto LABEL_13;
              case 353:
                v18 = *v8;
                v19 = "clogLastStripeUeccs";
                goto LABEL_13;
              case 354:
                v18 = *v8;
                v19 = "GC_MidDestSrcSwitchSLC2TLC";
                goto LABEL_13;
              case 355:
                v18 = *v8;
                v19 = "GC_MidDestSrcSwitchTLC2SLC";
                goto LABEL_13;
              case 356:
                v18 = *v8;
                v19 = "nvme_stats_shutdown_count_host0_normal";
                goto LABEL_13;
              case 357:
                v18 = *v8;
                v19 = "nvme_stats_shutdown_count_host1_normal";
                goto LABEL_13;
              case 358:
                v18 = *v8;
                v19 = "nvme_stats_shutdown_count_host0_s2r";
                goto LABEL_13;
              case 359:
                v18 = *v8;
                v19 = "nvme_stats_shutdown_count_host1_s2r";
                goto LABEL_13;
              case 360:
                v20 = "gcPDusterIntrSrcValidityHisto";
                v21 = a1;
                v22 = 360;
                goto LABEL_85;
              case 361:
                v20 = "gcPDusterUserSrcValidityHisto";
                v21 = a1;
                v22 = 361;
                goto LABEL_85;
              case 362:
                v18 = *v8;
                v19 = "raidFailedReadParity";
                goto LABEL_13;
              case 364:
                v18 = *v8;
                v19 = "lhotNumSkipes";
                goto LABEL_13;
              default:
                switch(v7)
                {
                  case 365:
                    v18 = *v8;
                    v19 = "lhotNumIsHotCalls";
                    goto LABEL_13;
                  case 366:
                    v18 = *v8;
                    v19 = "lhotFullLap";
                    goto LABEL_13;
                  case 367:
                    v18 = *v8;
                    v19 = "lhotSkipPrecent";
                    goto LABEL_13;
                  case 368:
                    v18 = *v8;
                    v19 = "eraseSuspendEvents";
                    goto LABEL_13;
                  case 369:
                    v18 = *v8;
                    v19 = "eraseSuspendedStatuses";
                    goto LABEL_13;
                  case 370:
                    v18 = *v8;
                    v19 = "eraseSuspendedBands";
                    goto LABEL_13;
                  case 371:
                    v18 = *v8;
                    v19 = "eraseSuspendSituationsBelowThreshold";
                    goto LABEL_13;
                  case 372:
                    v18 = *v8;
                    v19 = "eraseSuspendSituationsAboveThreshold";
                    goto LABEL_13;
                  case 373:
                    v18 = *v8;
                    v19 = "eraseSuspendReadChainsProcessed";
                    goto LABEL_13;
                  case 374:
                    v18 = *v8;
                    v19 = "bdrLastDoneHr";
                    goto LABEL_13;
                  case 375:
                    v18 = *v8;
                    v19 = "bdrBackupThreshHrs";
                    goto LABEL_13;
                  case 376:
                    v18 = *v8;
                    v19 = "clogPortableProgBufs";
                    goto LABEL_13;
                  case 377:
                    v18 = *v8;
                    v19 = "clogPortableDropBufs";
                    goto LABEL_13;
                  case 378:
                    v18 = *v8;
                    v19 = "clogPortablePadSectors";
                    goto LABEL_13;
                  case 379:
                    v18 = *v8;
                    v19 = "numRetiredBlocks";
                    goto LABEL_13;
                  case 381:
                    v18 = *v8;
                    v19 = "numRefreshOnErrNandRefreshPerf";
                    goto LABEL_13;
                  case 382:
                    v18 = *v8;
                    v19 = "raidReconstructReads";
                    goto LABEL_13;
                  case 383:
                    v18 = *v8;
                    v19 = "gcReadsNoBlog";
                    goto LABEL_13;
                  case 384:
                    v18 = *v8;
                    v19 = "AbortSkip_MPBXReadVerifyClosedBand";
                    goto LABEL_13;
                  case 385:
                    v18 = *v8;
                    v19 = "openBandReadFail";
                    goto LABEL_13;
                  case 386:
                    v18 = *v8;
                    v19 = "AbortSkip_MPBXReadVerifyOpenBand";
                    goto LABEL_13;
                  case 387:
                    v18 = *v8;
                    v19 = "AbortSkip_MBPXFailedRebuildingParity";
                    goto LABEL_13;
                  case 388:
                    v18 = *v8;
                    v19 = "raidSuccessfulPMXReconstructionInternal";
                    goto LABEL_13;
                  case 389:
                    v18 = *v8;
                    v19 = "raidSuccessfulPMXReconstructionHost";
                    goto LABEL_13;
                  case 390:
                    v18 = *v8;
                    v19 = "raidFailedPMXReconstructionInternal";
                    goto LABEL_13;
                  case 391:
                    v18 = *v8;
                    v19 = "raidFailedPMXReconstructionHost";
                    goto LABEL_13;
                  case 392:
                    v18 = *v8;
                    v19 = "raidSuccessfulRMXReconstructionInternal";
                    goto LABEL_13;
                  case 393:
                    v18 = *v8;
                    v19 = "raidSuccessfulRMXReconstructionHost";
                    goto LABEL_13;
                  case 394:
                    v18 = *v8;
                    v19 = "raidFailedRMXReconstructionInternal";
                    goto LABEL_13;
                  case 395:
                    v18 = *v8;
                    v19 = "raidFailedRMXReconstructionHost";
                    goto LABEL_13;
                  case 396:
                    v18 = *v8;
                    v19 = "raidFailedReadParityInternal";
                    goto LABEL_13;
                  case 397:
                    v18 = *v8;
                    v19 = "raidFailedReadQParityInternal";
                    goto LABEL_13;
                  case 398:
                    v18 = *v8;
                    v19 = "raidFailedReadQParity";
                    goto LABEL_13;
                  case 399:
                    v18 = *v8;
                    v19 = "raidFailedReadQCopy";
                    goto LABEL_13;
                  case 400:
                    v18 = *v8;
                    v19 = "raidFailedReconstructionQParity";
                    goto LABEL_13;
                  case 401:
                    v18 = *v8;
                    v19 = "offlineBlocksCnt";
                    goto LABEL_13;
                  case 402:
                    v18 = *v8;
                    v19 = "bork0Revectors";
                    goto LABEL_13;
                  case 403:
                    v18 = *v8;
                    v19 = "raidFailedReadBlog";
                    goto LABEL_13;
                  case 404:
                    v18 = *v8;
                    v19 = "numReliabilityRefreshes";
                    goto LABEL_13;
                  case 405:
                    v18 = *v8;
                    v19 = "raidFailedReadQCopyInternal";
                    goto LABEL_13;
                  case 406:
                    v20 = "raidReconstructSuccessFlow";
                    v21 = a1;
                    v22 = 406;
                    goto LABEL_19;
                  case 407:
                    v20 = "raidReconstructFailFlow";
                    v21 = a1;
                    v22 = 407;
                    goto LABEL_19;
                  case 408:
                    v18 = *v8;
                    v19 = "raidReconstructFailP";
                    goto LABEL_13;
                  case 409:
                    v18 = *v8;
                    v19 = "raidReconstructFailQ";
                    goto LABEL_13;
                  case 410:
                    v18 = *v8;
                    v19 = "raidReconstructFailUECC";
                    goto LABEL_13;
                  case 411:
                    v18 = *v8;
                    v19 = "raidReconstructFailUnsupp";
                    goto LABEL_13;
                  case 412:
                    v18 = *v8;
                    v19 = "raidUECCOpenBand";
                    goto LABEL_13;
                  case 414:
                    v18 = *v8;
                    v19 = "ueccReads";
                    goto LABEL_13;
                  case 416:
                    v18 = *v8;
                    v19 = "raidSuccessfulVerify";
                    goto LABEL_13;
                  case 417:
                    v18 = *v8;
                    v19 = "raidFailedVerify";
                    goto LABEL_13;
                  case 418:
                    v18 = *v8;
                    v19 = "numBandsVerified";
                    goto LABEL_13;
                  case 419:
                    v18 = *v8;
                    v19 = "cache_heads";
                    goto LABEL_13;
                  case 420:
                    v18 = *v8;
                    v19 = "AbortSkip_RMXtoMPBX";
                    goto LABEL_13;
                  case 421:
                    v18 = *v8;
                    v19 = "s3eFwVer";
                    goto LABEL_13;
                  case 422:
                    v18 = *v8;
                    v19 = "readVerifyNative";
                    goto LABEL_13;
                  case 423:
                    v18 = *v8;
                    v19 = "reducedReadVerifyNative";
                    goto LABEL_13;
                  case 424:
                    v18 = *v8;
                    v19 = "readVerifySlc";
                    goto LABEL_13;
                  case 425:
                    v18 = *v8;
                    v19 = "reducedReadVerifySlc";
                    goto LABEL_13;
                  case 426:
                    v18 = *v8;
                    v19 = "RxBurnEvictions";
                    goto LABEL_13;
                  case 427:
                    v18 = *v8;
                    v19 = "directToTLCBands";
                    goto LABEL_13;
                  case 428:
                    v18 = *v8;
                    v19 = "nandDesc";
                    goto LABEL_13;
                  case 429:
                    v18 = *v8;
                    v19 = "fwUpdatesPercentUsed";
                    goto LABEL_13;
                  case 430:
                    v18 = *v8;
                    v19 = "slcPercentUsed";
                    goto LABEL_13;
                  case 431:
                    v18 = *v8;
                    v19 = "percentUsed";
                    goto LABEL_13;
                  default:
                    switch(v7)
                    {
                      case 432:
                        v18 = *v8;
                        v19 = "hostAutoWrites";
                        goto LABEL_13;
                      case 433:
                        v18 = *v8;
                        v19 = "hostAutoWriteXacts";
                        goto LABEL_13;
                      case 434:
                        v18 = *v8;
                        v19 = "gcDestDynamic";
                        goto LABEL_13;
                      case 435:
                        v18 = *v8;
                        v19 = "gcDestStatic";
                        goto LABEL_13;
                      case 436:
                        v18 = *v8;
                        v19 = "gcDestWearlevel";
                        goto LABEL_13;
                      case 437:
                        v18 = *v8;
                        v19 = "gcDestParity";
                        goto LABEL_13;
                      case 438:
                        v18 = *v8;
                        v19 = "AbortSkip_Format";
                        goto LABEL_13;
                      case 440:
                        v18 = *v8;
                        v19 = "raidSLCPadding";
                        goto LABEL_13;
                      case 441:
                        v18 = *v8;
                        v19 = "raidGCBands";
                        goto LABEL_13;
                      case 442:
                        v18 = *v8;
                        v19 = "raidGCSectors";
                        goto LABEL_13;
                      case 443:
                        v18 = *v8;
                        v19 = "raidGCPadding";
                        goto LABEL_13;
                      case 444:
                        v18 = *v8;
                        v19 = "raidSLCBandsPerHostFlow";
                        goto LABEL_13;
                      case 445:
                        v18 = *v8;
                        v19 = "raidSLCSecsPerHostFlow";
                        goto LABEL_13;
                      case 446:
                        v18 = *v8;
                        v19 = "rxBurnMinCycleRuns";
                        goto LABEL_13;
                      case 447:
                        v18 = *v8;
                        v19 = "clogNumFastCxt";
                        goto LABEL_13;
                      case 448:
                        v18 = *v8;
                        v19 = "clogNumRapidReboots";
                        goto LABEL_13;
                      case 449:
                        v18 = *v8;
                        v19 = "clogFastCxtAbvThr";
                        goto LABEL_13;
                      case 450:
                        v18 = *v8;
                        v19 = "rxBurnDiffModeRuns";
                        goto LABEL_13;
                      case 452:
                        v18 = *v8;
                        v19 = "indReadVerifyFail";
                        goto LABEL_13;
                      case 453:
                        v20 = "numOfThrottlingEntriesPerReadLevel";
                        v21 = a1;
                        v22 = 453;
                        goto LABEL_85;
                      case 454:
                        v20 = "numOfThrottlingEntriesPerWriteLevel";
                        v21 = a1;
                        v22 = 454;
                        goto LABEL_85;
                      case 456:
                        v20 = "slcFifoDepth";
                        v21 = a1;
                        v22 = 456;
                        goto LABEL_11;
                      case 457:
                        v18 = *v8;
                        v19 = "wcacheSectorsDirtyIdle";
                        goto LABEL_13;
                      case 458:
                        v18 = *v8;
                        v19 = "wcacheDS_SectorsDirtyIdle";
                        goto LABEL_13;
                      case 459:
                        v18 = *v8;
                        v19 = "wcacheFS_MbytesDirtyIdle";
                        goto LABEL_13;
                      case 460:
                        v20 = "CacheDepthVsThroughput";
                        v21 = a1;
                        v22 = 460;
                        v14 = v8;
                        v15 = 256;
                        goto LABEL_12;
                      case 461:
                        v18 = *v8;
                        v19 = "directToTLCSectors";
                        goto LABEL_13;
                      case 462:
                        v18 = *v8;
                        v19 = "fallbackToWaterfall";
                        goto LABEL_13;
                      case 463:
                        v20 = "balanceProportionBucketsHistogram";
                        v21 = a1;
                        v22 = 463;
LABEL_320:
                        v14 = v8;
                        v15 = 11;
                        goto LABEL_12;
                      case 464:
                        v18 = *v8;
                        v19 = "lockToTlc";
                        goto LABEL_13;
                      case 465:
                        v20 = "burstSizeHistogram";
                        v21 = a1;
                        v22 = 465;
                        goto LABEL_11;
                      case 466:
                        v20 = "qosDirectToTLC";
                        v21 = a1;
                        v22 = 466;
                        goto LABEL_342;
                      case 467:
                        v20 = "maxQosDirectToTLC";
                        v21 = a1;
                        v22 = 467;
                        goto LABEL_22;
                      case 468:
                        v20 = "wcacheDirtyAtFlush";
                        v21 = a1;
                        v22 = 468;
                        goto LABEL_85;
                      case 469:
                        v20 = "raidReconstructSuccessPartition";
                        v21 = a1;
                        v22 = 469;
                        goto LABEL_20;
                      case 470:
                        v20 = "raidReconstructFailPartition";
                        v21 = a1;
                        v22 = 470;
                        goto LABEL_20;
                      case 471:
                        v18 = *v8;
                        v19 = "raidUncleanBootBandFail";
                        goto LABEL_13;
                      case 472:
                        v18 = *v8;
                        v19 = "raidReconstructFailBandFlowHost";
                        goto LABEL_13;
                      case 473:
                        v18 = *v8;
                        v19 = "raidReconstructFailBandFlowGC";
                        goto LABEL_13;
                      case 476:
                        v20 = "raidSuccessfulRecoLbaRange";
                        v21 = a1;
                        v22 = 476;
                        goto LABEL_20;
                      case 477:
                        v20 = "raidFailedRecoLbaRange";
                        v21 = a1;
                        v22 = 477;
                        goto LABEL_20;
                      case 481:
                        v20 = "skinnyBandErases_481";
                        v21 = a1;
                        v22 = 481;
                        goto LABEL_155;
                      case 483:
                        v18 = *v8;
                        v19 = "tlcOverHeatWaterfall";
                        goto LABEL_13;
                      case 484:
                        v18 = *v8;
                        v19 = "skinnyCyclesConvert";
                        goto LABEL_13;
                      case 485:
                        v18 = *v8;
                        v19 = "non_proportional_directToTLCSectors";
                        goto LABEL_13;
                      case 486:
                        v18 = *v8;
                        v19 = "maxFailedFastCxtSync";
                        goto LABEL_13;
                      case 487:
                        v18 = *v8;
                        v19 = "numFormatUserArea";
                        goto LABEL_13;
                      case 488:
                        v18 = *v8;
                        v19 = "clogFastCxtSyncAborted";
                        goto LABEL_13;
                      case 489:
                        v20 = "clogOccupationSectors";
                        v21 = a1;
                        v22 = 489;
                        goto LABEL_19;
                      case 490:
                        v20 = "bdrTmpHist";
                        v21 = a1;
                        v22 = 490;
LABEL_342:
                        v14 = v8;
                        v15 = 64;
                        goto LABEL_12;
                      case 491:
                        v18 = *v8;
                        v19 = "numFWUpdates";
                        goto LABEL_13;
                      case 492:
                        v18 = *v8;
                        v19 = "numClogLoadFails";
                        goto LABEL_13;
                      case 493:
                        v18 = *v8;
                        v19 = "rxBurnNumForcedDiffMode";
                        goto LABEL_13;
                      case 494:
                        v18 = *v8;
                        v19 = "RD_numSaves";
                        goto LABEL_13;
                      case 495:
                        v18 = *v8;
                        v19 = "eanCompressWrites";
                        goto LABEL_13;
                      case 496:
                        v18 = *v8;
                        v19 = "eanHostWrites";
                        goto LABEL_13;
                      case 497:
                        v18 = *v8;
                        v19 = "bandPreErases";
                        goto LABEL_13;
                      case 498:
                        v18 = *v8;
                        v19 = "eanHostUnmaps";
                        goto LABEL_13;
                      case 499:
                        v18 = *v8;
                        v19 = "eanHostFlushes";
                        goto LABEL_13;
                      case 500:
                        v18 = *v8;
                        v19 = "eanFastWrites";
                        goto LABEL_13;
                      case 501:
                        v18 = *v8;
                        v19 = "autowriteDS2FSCollisions";
                        goto LABEL_13;
                      case 502:
                        v18 = *v8;
                        v19 = "autowriteWaitTransferTaskBlocks";
                        goto LABEL_13;
                      case 503:
                        v20 = "avgCycle";
                        v21 = a1;
                        v22 = 503;
                        goto LABEL_20;
                      case 504:
                        v18 = *v8;
                        v19 = "RD_DeferredClearsOverflowCnt";
                        goto LABEL_13;
                      default:
                        switch(v7)
                        {
                          case 505:
                            v18 = *v8;
                            v19 = "maxVerticsInBand";
                            goto LABEL_13;
                          case 506:
                            v18 = *v8;
                            v19 = "numVertics";
                            goto LABEL_13;
                          case 507:
                            v18 = *v8;
                            v19 = "exceededCVertics";
                            goto LABEL_13;
                          case 510:
                            v18 = *v8;
                            v19 = "raidReconstructFailMismatch";
                            goto LABEL_13;
                          case 511:
                            v20 = "mspbootBlockRefreshCnt";
                            v21 = a1;
                            v22 = 511;
                            goto LABEL_155;
                          case 516:
                            v20 = "mspBootBlockRefreshTime";
                            v21 = a1;
                            v22 = 516;
                            goto LABEL_155;
                          case 517:
                            v18 = *v8;
                            v19 = "mspBootBlockCountPerMsp";
                            goto LABEL_13;
                          case 518:
                            v18 = *v8;
                            v19 = "skinnyRevectorSLC";
                            goto LABEL_13;
                          case 519:
                            v18 = *v8;
                            v19 = "skinnyRevectorTLC";
                            goto LABEL_13;
                          case 520:
                            v18 = *v8;
                            v19 = "perfSetupAttempts";
                            goto LABEL_13;
                          case 521:
                            v18 = *v8;
                            v19 = "perfSetupSuccesses";
                            goto LABEL_13;
                          case 522:
                            v18 = *v8;
                            v19 = "perfWriteAttempts";
                            goto LABEL_13;
                          case 523:
                            v18 = *v8;
                            v19 = "perfWriteSuccesses";
                            goto LABEL_13;
                          case 524:
                            v18 = *v8;
                            v19 = "perfReadAttempts";
                            goto LABEL_13;
                          case 525:
                            v18 = *v8;
                            v19 = "perfReadSuccesses";
                            goto LABEL_13;
                          case 526:
                            v18 = *v8;
                            v19 = "perfCleanupAttempts";
                            goto LABEL_13;
                          case 527:
                            v18 = *v8;
                            v19 = "perfCleanupSuccesses";
                            goto LABEL_13;
                          case 530:
                            v18 = *v8;
                            v19 = "firstFailedDieId";
                            goto LABEL_13;
                          case 531:
                            v18 = *v8;
                            v19 = "numDieFailures";
                            goto LABEL_13;
                          case 532:
                            v18 = *v8;
                            v19 = "spareAvailablePercent";
                            goto LABEL_13;
                          case 533:
                            v18 = *v8;
                            v19 = "dataFabricErr";
                            goto LABEL_13;
                          case 534:
                            v18 = *v8;
                            v19 = "downlinkFabricErr";
                            goto LABEL_13;
                          case 535:
                            v18 = *v8;
                            v19 = "prpAccTimeoutErr";
                            goto LABEL_13;
                          case 537:
                            v18 = *v8;
                            v19 = "uplinkFabricErr";
                            goto LABEL_13;
                          case 538:
                            v18 = *v8;
                            v19 = "skinnyBandsGBB";
                            goto LABEL_13;
                          case 539:
                            v18 = *v8;
                            v19 = "AbortPad_GcMustPadBand";
                            goto LABEL_13;
                          case 540:
                            v18 = *v8;
                            v19 = "AbortPad_GcMustPadSkinny";
                            goto LABEL_13;
                          case 541:
                            v18 = *v8;
                            v19 = "bdrHostPingInitial";
                            goto LABEL_13;
                          case 542:
                            v18 = *v8;
                            v19 = "bdrHostPingMoreNeeded";
                            goto LABEL_13;
                          case 543:
                            v18 = *v8;
                            v19 = "bandParityAllocationFailed";
                            goto LABEL_13;
                          case 544:
                            v18 = *v8;
                            v19 = "fastHwBurstToSlc";
                            goto LABEL_13;
                          case 545:
                            v18 = *v8;
                            v19 = "slowHwToTlc";
                            goto LABEL_13;
                          case 546:
                            v20 = "slcDemandBurstSizeDetected";
                            v21 = a1;
                            v22 = 546;
                            goto LABEL_11;
                          case 547:
                            v20 = "slcDemandBurstDur";
                            v21 = a1;
                            v22 = 547;
                            goto LABEL_11;
                          case 548:
                            v18 = *v8;
                            v19 = "fastHwToTlcBurst";
                            goto LABEL_13;
                          case 549:
                            v20 = "slcDemandBurstSizeSlc";
                            v21 = a1;
                            v22 = 549;
                            goto LABEL_11;
                          case 551:
                            v20 = "balanceProportionBucketsHistogramTlc";
                            v21 = a1;
                            v22 = 551;
                            goto LABEL_320;
                          case 553:
                            v18 = *v8;
                            v19 = "slowHwFlushToSlc";
                            goto LABEL_13;
                          case 557:
                            v18 = *v8;
                            v19 = "slowHwToSlc";
                            goto LABEL_13;
                          case 558:
                            v18 = *v8;
                            v19 = "flushNwToSlc";
                            goto LABEL_13;
                          case 559:
                            v18 = *v8;
                            v19 = "flushNwToTlc";
                            goto LABEL_13;
                          case 560:
                            v18 = *v8;
                            v19 = "oslcHw";
                            goto LABEL_13;
                          case 561:
                            v18 = *v8;
                            v19 = "oslcTransitions";
                            goto LABEL_13;
                          case 563:
                            v18 = *v8;
                            v19 = "slcDemandFlushCount";
                            goto LABEL_13;
                          case 564:
                            v18 = *v8;
                            v19 = "slcDemandBurstCount";
                            goto LABEL_13;
                          case 565:
                            v18 = *v8;
                            v19 = "oslcBaseAvgPE";
                            goto LABEL_13;
                          case 566:
                            v18 = *v8;
                            v19 = "raidReconstructFailNoSPBX";
                            goto LABEL_13;
                          case 567:
                            v18 = *v8;
                            v19 = "raidReconstructFailDouble";
                            goto LABEL_13;
                          case 568:
                            v18 = *v8;
                            v19 = "oslcFastWAmpUOnOff";
                            goto LABEL_13;
                          case 569:
                            v18 = *v8;
                            v19 = "oslcSlowWAmpUOnOff";
                            goto LABEL_13;
                          case 570:
                            v18 = *v8;
                            v19 = "raidReconstructFailInvalid";
                            goto LABEL_13;
                          case 572:
                            v18 = *v8;
                            v19 = "oslcLastWAmpUx10";
                            goto LABEL_13;
                          case 573:
                            v18 = *v8;
                            v19 = "raidFailedReadNoBlog";
                            goto LABEL_13;
                          case 574:
                            v18 = *v8;
                            v19 = "raidReconstructFailBlank";
                            goto LABEL_13;
                          case 575:
                            v18 = *v8;
                            v19 = "oslcHotTLCOnOff";
                            goto LABEL_13;
                          case 576:
                            v18 = *v8;
                            v19 = "gcVPackDestinations";
                            goto LABEL_13;
                          case 581:
                            v18 = *v8;
                            v19 = "averageTLCPECycles";
                            goto LABEL_13;
                          case 582:
                            v18 = *v8;
                            v19 = "averageSLCPECycles";
                            goto LABEL_13;
                          case 583:
                            v18 = *v8;
                            v19 = "numAtomicBoots";
                            goto LABEL_13;
                          case 584:
                            v18 = *v8;
                            v19 = "clogMinorMismatch";
                            goto LABEL_13;
                          case 586:
                            v18 = *v8;
                            v19 = "raidExpectedFailRMXReconstructionInternal";
                            goto LABEL_13;
                          case 587:
                            v18 = *v8;
                            v19 = "raidExpectedFailRMXReconstructionHost";
                            goto LABEL_13;
                          case 588:
                            v18 = *v8;
                            v19 = "oslcGCinvalidations";
                            goto LABEL_13;
                          case 589:
                            v18 = *v8;
                            v19 = "oslcGCActivateReason";
                            goto LABEL_13;
                          default:
                            switch(v7)
                            {
                              case 590:
                                v18 = *v8;
                                v19 = "oslcLowCleanBandsUOnOff";
                                goto LABEL_13;
                              case 591:
                                v18 = *v8;
                                v19 = "oslcTooManyGCMustOnOff";
                                goto LABEL_13;
                              case 592:
                                v18 = *v8;
                                v19 = "oslcBaseHostWrites";
                                goto LABEL_13;
                              case 593:
                                v18 = *v8;
                                v19 = "oslcBaseBandErases";
                                goto LABEL_13;
                              case 594:
                                v18 = *v8;
                                v19 = "oslcBdrBands";
                                goto LABEL_13;
                              case 595:
                                v18 = *v8;
                                v19 = "oslcBdrValid";
                                goto LABEL_13;
                              case 596:
                                v18 = *v8;
                                v19 = "unexpectedBlanks";
                                goto LABEL_13;
                              case 597:
                                v18 = *v8;
                                v19 = "unexpectedBlanksOnRV";
                                goto LABEL_13;
                              case 601:
                                v18 = *v8;
                                v19 = "waterfallLockSectors";
                                goto LABEL_13;
                              case 602:
                                v18 = *v8;
                                v19 = "oslcGCActiveWrites";
                                goto LABEL_13;
                              case 603:
                                v18 = *v8;
                                v19 = "chipIdTemperatureSample";
                                goto LABEL_13;
                              case 604:
                                v18 = *v8;
                                v19 = "gcVPackWrites";
                                goto LABEL_13;
                              case 605:
                                v20 = "gcActiveReasons";
                                v21 = a1;
                                v22 = 605;
                                goto LABEL_11;
                              case 606:
                                v18 = *v8;
                                v19 = "eanMaxInitTimeMs";
                                goto LABEL_13;
                              case 607:
                                v18 = *v8;
                                v19 = "eanMinToFirstReadTimeMs";
                                goto LABEL_13;
                              case 608:
                                v18 = *v8;
                                v19 = "skinnyAPGMRetire";
                                goto LABEL_13;
                              case 609:
                                v18 = *v8;
                                v19 = "unexpectedBlanksHost";
                                goto LABEL_13;
                              case 610:
                                v20 = "pcieAerCounters";
                                v21 = a1;
                                v22 = 610;
                                goto LABEL_342;
                              case 611:
                                v18 = *v8;
                                v19 = "fastHwToTlcBalance";
                                goto LABEL_13;
                              case 612:
                                v18 = *v8;
                                v19 = "perfOSLCRuns";
                                goto LABEL_13;
                              case 613:
                                v18 = *v8;
                                v19 = "slcDemandBurstWritesInGC";
                                goto LABEL_13;
                              case 614:
                                v18 = *v8;
                                v19 = "slcDemandBurstWritesInTT";
                                goto LABEL_13;
                              case 615:
                                v18 = *v8;
                                v19 = "slcDemandBurstWritesInNRP";
                                goto LABEL_13;
                              case 616:
                                v18 = *v8;
                                v19 = "perfTotalDmaMb";
                                goto LABEL_13;
                              case 617:
                                v18 = *v8;
                                v19 = "eanAvgInitTimeMs";
                                goto LABEL_13;
                              case 618:
                                v18 = *v8;
                                v19 = "eanAvgToFirstReadTimeMs";
                                goto LABEL_13;
                              case 619:
                                v18 = *v8;
                                v19 = "eanMaxBootReadTimeMs";
                                goto LABEL_13;
                              case 620:
                                v18 = *v8;
                                v19 = "eanAvgBootReadTimeMs";
                                goto LABEL_13;
                              case 621:
                                v20 = "eanBootReadsHist";
                                v21 = a1;
                                v22 = 621;
                                goto LABEL_11;
                              case 622:
                                v18 = *v8;
                                v19 = "maxBgInitTimeMs";
                                goto LABEL_13;
                              case 623:
                                v18 = *v8;
                                v19 = "avgBgInitTimeMs";
                                goto LABEL_13;
                              case 624:
                                v20 = "clogFailReason";
                                v21 = a1;
                                v22 = 624;
                                goto LABEL_85;
                              case 625:
                                v18 = *v8;
                                v19 = "eanMinBootReadMBPerSec";
                                goto LABEL_13;
                              case 626:
                                v18 = *v8;
                                v19 = "eanAvgBootReadMBPerSec";
                                goto LABEL_13;
                              case 627:
                                v18 = *v8;
                                v19 = "minSkinnyPECycles";
                                goto LABEL_13;
                              case 628:
                                v18 = *v8;
                                v19 = "maxSkinnyPECycles";
                                goto LABEL_13;
                              case 629:
                                v18 = *v8;
                                v19 = "averageSkinnyPECycles";
                                goto LABEL_13;
                              case 630:
                                v20 = "raidSuccessfulRecoEAN";
                                v21 = a1;
                                v22 = 630;
                                goto LABEL_463;
                              case 631:
                                v20 = "raidFailedRecoEAN";
                                v21 = a1;
                                v22 = 631;
                                goto LABEL_463;
                              case 632:
                                v20 = "eanFirstReadMode";
                                v21 = a1;
                                v22 = 632;
LABEL_463:
                                v14 = v8;
                                v15 = 6;
                                goto LABEL_12;
                              case 635:
                                v18 = *v8;
                                v19 = "oslcHwGC";
                                goto LABEL_13;
                              case 636:
                                v18 = *v8;
                                v19 = "oslcHwTT";
                                goto LABEL_13;
                              case 637:
                                v18 = *v8;
                                v19 = "oslcHwNRP";
                                goto LABEL_13;
                              case 638:
                                v20 = "oslcDemandBurstSize";
                                v21 = a1;
                                v22 = 638;
                                goto LABEL_11;
                              case 639:
                                v18 = *v8;
                                v19 = "raidReconstructSuccessBandFlowOslc";
                                goto LABEL_13;
                              case 640:
                                v18 = *v8;
                                v19 = "raidReconstructFailBandFlowOslc";
                                goto LABEL_13;
                              case 641:
                                v18 = *v8;
                                v19 = "raidFailSectors";
                                goto LABEL_13;
                              case 642:
                                v18 = *v8;
                                v19 = "eanFailSectors";
                                goto LABEL_13;
                              case 643:
                                v18 = *v8;
                                v19 = "bdrTimeMode";
                                goto LABEL_13;
                              case 644:
                                v18 = *v8;
                                v19 = "raidParityNotSavedP";
                                goto LABEL_13;
                              case 645:
                                v18 = *v8;
                                v19 = "raidParityNotSavedQ";
                                goto LABEL_13;
                              case 646:
                                v18 = *v8;
                                v19 = "raidParityInvalid";
                                goto LABEL_13;
                              case 647:
                                v18 = *v8;
                                v19 = "raidParityUnknown";
                                goto LABEL_13;
                              case 648:
                                v18 = *v8;
                                v19 = "raidParityUnmapped";
                                goto LABEL_13;
                              case 649:
                                v18 = *v8;
                                v19 = "raidParityGCUnc";
                                goto LABEL_13;
                              case 657:
                                v18 = *v8;
                                v19 = "AbortSkip_MPBXProbational";
                                goto LABEL_13;
                              case 659:
                                v18 = *v8;
                                v19 = "raidVerificationReads";
                                goto LABEL_13;
                              case 666:
                                v18 = *v8;
                                v19 = "nofDies";
                                goto LABEL_13;
                              case 671:
                                v18 = *v8;
                                v19 = "skinnyBandsNum";
                                goto LABEL_13;
                              case 672:
                                v18 = *v8;
                                v19 = "skinnyBandsNumDips";
                                goto LABEL_13;
                              case 674:
                                v20 = "oslcNoVotesHw";
                                v21 = a1;
                                v22 = 674;
                                goto LABEL_23;
                              case 675:
                                v18 = *v8;
                                v19 = "totalLbas";
                                goto LABEL_13;
                              case 676:
                                v18 = *v8;
                                v19 = "bdrHostPingExtra";
                                goto LABEL_13;
                              case 677:
                                v18 = *v8;
                                v19 = "magazineInstanceMeta";
                                goto LABEL_13;
                              default:
                                switch(v7)
                                {
                                  case 680:
                                    v20 = "magazineFWVersion";
                                    v21 = a1;
                                    v22 = 680;
                                    goto LABEL_21;
                                  case 681:
                                    v18 = *v8;
                                    v19 = "raidReconstructFailPMXUnsup";
                                    goto LABEL_13;
                                  case 682:
                                    v18 = *v8;
                                    v19 = "raidReconstructFailBMXUnsup";
                                    goto LABEL_13;
                                  case 683:
                                    v18 = *v8;
                                    v19 = "iBootNANDResets";
                                    goto LABEL_13;
                                  case 684:
                                    v18 = *v8;
                                    v19 = "pcieClkreqHighTimeout";
                                    goto LABEL_13;
                                  case 687:
                                    v20 = "cbdrInitSent";
                                    v21 = a1;
                                    v22 = 687;
LABEL_21:
                                    v14 = v8;
                                    v15 = 3;
                                    goto LABEL_12;
                                  case 688:
                                    v18 = *v8;
                                    v19 = "cbdrPauseSent";
                                    goto LABEL_13;
                                  case 689:
                                    v18 = *v8;
                                    v19 = "cbdrResumeSent";
                                    goto LABEL_13;
                                  case 690:
                                    v18 = *v8;
                                    v19 = "cbdrGetResultSent";
                                    goto LABEL_13;
                                  case 691:
                                    v18 = *v8;
                                    v19 = "cbdrEarlyExits";
                                    goto LABEL_13;
                                  case 694:
                                    v20 = "cbdrRefreshGrades";
                                    v21 = a1;
                                    v22 = 694;
                                    goto LABEL_11;
                                  case 695:
                                    v18 = *v8;
                                    v19 = "cbdrNotEnoughReads";
                                    goto LABEL_13;
                                  case 696:
                                    v18 = *v8;
                                    v19 = "cbdrAborts";
                                    goto LABEL_13;
                                  case 697:
                                    v18 = *v8;
                                    v19 = "TurboRaidHostClassifications";
                                    goto LABEL_13;
                                  case 698:
                                    v18 = *v8;
                                    v19 = "TurboRaidInternalClassifications";
                                    goto LABEL_13;
                                  case 699:
                                    v18 = *v8;
                                    v19 = "cbdrFullyDone";
                                    goto LABEL_13;
                                  case 702:
                                    v20 = "vcurve";
                                    v21 = a1;
                                    v22 = 702;
                                    goto LABEL_155;
                                  case 703:
                                    v20 = "injDepth";
                                    v21 = a1;
                                    v22 = 703;
                                    goto LABEL_153;
                                  case 704:
                                    v18 = *v8;
                                    v19 = "logical_disk_occupied_promiles";
                                    goto LABEL_13;
                                  case 711:
                                    v18 = *v8;
                                    v19 = "raidPrevFailedReconstructSkip";
                                    goto LABEL_13;
                                  case 712:
                                    v18 = *v8;
                                    v19 = "TurboRaidSuccessfulHostAuxReads";
                                    goto LABEL_13;
                                  case 713:
                                    v18 = *v8;
                                    v19 = "TurboRaidSuccessfulInternalAuxReads";
                                    goto LABEL_13;
                                  case 714:
                                    v18 = *v8;
                                    v19 = "turboRaidClassificationReliabilityHost";
                                    goto LABEL_13;
                                  case 715:
                                    v18 = *v8;
                                    v19 = "turboRaidClassificationReliabilityInternal";
                                    goto LABEL_13;
                                  case 716:
                                    v18 = *v8;
                                    v19 = "turboRaidClassificationQualityHost";
                                    goto LABEL_13;
                                  case 717:
                                    v18 = *v8;
                                    v19 = "turboRaidClassificationQualityInternal";
                                    goto LABEL_13;
                                  case 719:
                                    v18 = *v8;
                                    v19 = "skinnyBandErases";
                                    goto LABEL_13;
                                  case 721:
                                    v18 = *v8;
                                    v19 = "gcPDusterDestinations";
                                    goto LABEL_13;
                                  case 722:
                                    v18 = *v8;
                                    v19 = "gcPDusterWrites";
                                    goto LABEL_13;
                                  case 730:
                                    v18 = *v8;
                                    v19 = "rvFails";
                                    goto LABEL_13;
                                  case 737:
                                    v18 = *v8;
                                    v19 = "TurboRaidFailedHostAuxReads";
                                    goto LABEL_13;
                                  case 738:
                                    v18 = *v8;
                                    v19 = "TurboRaidFailedInternalAuxReads";
                                    goto LABEL_13;
                                  case 741:
                                    v18 = *v8;
                                    v19 = "autoSkipTriggers";
                                    goto LABEL_13;
                                  case 742:
                                    v18 = *v8;
                                    v19 = "autoSkipPlanes";
                                    goto LABEL_13;
                                  case 744:
                                    v20 = "raidReconstructDurationHisto";
                                    v21 = a1;
                                    v22 = 744;
                                    goto LABEL_23;
                                  case 745:
                                    v20 = "failsOnReconstructHisto";
                                    v21 = a1;
                                    v22 = 745;
                                    goto LABEL_23;
                                  case 746:
                                    v18 = *v8;
                                    v19 = "bandKill_userFlattenExcessive";
                                    goto LABEL_13;
                                  case 747:
                                    v18 = *v8;
                                    v19 = "bandKill_IntFlattenExcessive";
                                    goto LABEL_13;
                                  case 748:
                                    v18 = *v8;
                                    v19 = "bandKill_userFlattenBalance";
                                    goto LABEL_13;
                                  case 749:
                                    v18 = *v8;
                                    v19 = "bandKill_intFlattenBalance";
                                    goto LABEL_13;
                                  case 750:
                                    v18 = *v8;
                                    v19 = "bandKill_formatVertExcessive";
                                    goto LABEL_13;
                                  case 751:
                                    v18 = *v8;
                                    v19 = "bandKill_formatVertBalance";
                                    goto LABEL_13;
                                  case 753:
                                    v18 = *v8;
                                    v19 = "cbdrNumSlowRefreshes";
                                    goto LABEL_13;
                                  case 754:
                                    v18 = *v8;
                                    v19 = "cbdrNumFastRefreshes";
                                    goto LABEL_13;
                                  case 755:
                                    v18 = *v8;
                                    v19 = "cbdrTotalRefreshValidity";
                                    goto LABEL_13;
                                  case 756:
                                    v20 = "cbdrRefreshedAges";
                                    v21 = a1;
                                    v22 = 756;
                                    goto LABEL_544;
                                  case 758:
                                    v18 = *v8;
                                    v19 = "cbdrSkippedBlocks";
                                    goto LABEL_13;
                                  case 759:
                                    v20 = "cbdrScanPct";
                                    v21 = a1;
                                    v22 = 759;
                                    goto LABEL_19;
                                  case 760:
                                    v18 = *v8;
                                    v19 = "raidSuccessfulBMXReconstructionInternal";
                                    goto LABEL_13;
                                  case 761:
                                    v18 = *v8;
                                    v19 = "raidSuccessfulBMXReconstructionHost";
                                    goto LABEL_13;
                                  case 762:
                                    v18 = *v8;
                                    v19 = "raidFailedBMXReconstructionInternal";
                                    goto LABEL_13;
                                  case 763:
                                    v18 = *v8;
                                    v19 = "raidFailedBMXReconstructionHost";
                                    goto LABEL_13;
                                  case 764:
                                    v18 = *v8;
                                    v19 = "ricSPRVFail";
                                    goto LABEL_13;
                                  case 765:
                                    v18 = *v8;
                                    v19 = "ricMPRVFail";
                                    goto LABEL_13;
                                  case 768:
                                    v20 = "cbdrRefreshedAgesSLC";
                                    v21 = a1;
                                    v22 = 768;
LABEL_544:
                                    v14 = v8;
                                    v15 = 9;
                                    goto LABEL_12;
                                  case 770:
                                    v20 = "cpuBurstLength";
                                    v21 = a1;
                                    v22 = 770;
                                    goto LABEL_23;
                                  case 771:
                                    v18 = *v8;
                                    v19 = "autoSkipRaidRecoFail";
                                    goto LABEL_13;
                                  case 772:
                                    v20 = "dmReasonsSlc";
                                    v21 = a1;
                                    v22 = 772;
                                    goto LABEL_155;
                                  case 773:
                                    v20 = "dmReasonsTlc";
                                    v21 = a1;
                                    v22 = 773;
                                    goto LABEL_155;
                                  case 774:
                                    v18 = *v8;
                                    v19 = "raidReconstructFailBMXAbort";
                                    goto LABEL_13;
                                  case 775:
                                    v18 = *v8;
                                    v19 = "bandKill_fatBindingNoBlocks";
                                    goto LABEL_13;
                                  case 776:
                                    v18 = *v8;
                                    v19 = "bandKill_fatBindingFewBlocks";
                                    goto LABEL_13;
                                  case 777:
                                    v18 = *v8;
                                    v19 = "numBadBootBlocks";
                                    goto LABEL_13;
                                  case 778:
                                    v18 = *v8;
                                    v19 = "snapshotCPUHigh";
                                    goto LABEL_13;
                                  default:
                                    switch(v7)
                                    {
                                      case 779:
                                        v18 = *v8;
                                        v19 = "snapshotCPULow";
                                        goto LABEL_13;
                                      case 780:
                                        v18 = *v8;
                                        v19 = "gcWithoutBMs";
                                        goto LABEL_13;
                                      case 781:
                                        v20 = "gcSearchTimeHistory";
                                        v21 = a1;
                                        v22 = 781;
                                        goto LABEL_11;
                                      case 785:
                                        v20 = "gcSearchPortion";
                                        v21 = a1;
                                        v22 = 785;
                                        goto LABEL_85;
                                      case 786:
                                        v18 = *v8;
                                        v19 = "raidReconstructFailBmxMp";
                                        goto LABEL_13;
                                      case 787:
                                        v18 = *v8;
                                        v19 = "raidReconstructFailBmx";
                                        goto LABEL_13;
                                      case 788:
                                        v18 = *v8;
                                        v19 = "raidReconstructFailBMXUECC";
                                        goto LABEL_13;
                                      case 789:
                                        v18 = *v8;
                                        v19 = "raidReconstructFailBMXBlank";
                                        goto LABEL_13;
                                      case 790:
                                        v18 = *v8;
                                        v19 = "raidPrevFailedReconstructBmxMpSkip";
                                        goto LABEL_13;
                                      case 792:
                                        v18 = *v8;
                                        v19 = "numTLCFatBands";
                                        goto LABEL_13;
                                      case 793:
                                        v18 = *v8;
                                        v19 = "fatValidity";
                                        goto LABEL_13;
                                      case 794:
                                        v18 = *v8;
                                        v19 = "fatTotal";
                                        goto LABEL_13;
                                      case 798:
                                        v20 = "raidBMXFailP";
                                        v21 = a1;
                                        v22 = 798;
                                        goto LABEL_22;
                                      case 799:
                                        v20 = "raidBMXFailUECC";
                                        v21 = a1;
                                        v22 = 799;
                                        goto LABEL_22;
                                      case 804:
                                        v20 = "raidBMXFailNoSPBX";
                                        v21 = a1;
                                        v22 = 804;
                                        goto LABEL_22;
                                      case 806:
                                        v20 = "raidBMXFailBlank";
                                        v21 = a1;
                                        v22 = 806;
                                        goto LABEL_22;
                                      case 809:
                                        v20 = "raidBMXFailUnsup";
                                        v21 = a1;
                                        v22 = 809;
                                        goto LABEL_22;
                                      case 811:
                                        v20 = "raidBMXFailMpSkip";
                                        v21 = a1;
                                        v22 = 811;
                                        goto LABEL_22;
                                      case 812:
                                        v20 = "raidBMXFailAbort";
                                        v21 = a1;
                                        v22 = 812;
                                        goto LABEL_22;
                                      case 813:
                                        v18 = *v8;
                                        v19 = "TurboRaidIsEnabled";
                                        goto LABEL_13;
                                      case 814:
                                        v20 = "raidBMXFailOther";
                                        v21 = a1;
                                        v22 = 814;
                                        goto LABEL_22;
                                      case 815:
                                        v20 = "raidBMXSuccess";
                                        v21 = a1;
                                        v22 = 815;
                                        goto LABEL_22;
                                      case 816:
                                        v18 = *v8;
                                        v19 = "skinnyBandsExtraDip";
                                        goto LABEL_13;
                                      case 821:
                                        v18 = *v8;
                                        v19 = "writeAmp";
                                        goto LABEL_13;
                                      case 822:
                                        v18 = *v8;
                                        v19 = "ricMaxClogOnlyPages";
                                        goto LABEL_13;
                                      case 823:
                                        v20 = "readClassifyStatusesHisto";
                                        v21 = a1;
                                        v22 = 823;
                                        goto LABEL_21;
                                      case 824:
                                        v20 = "readWithAuxStatusesHisto";
                                        v21 = a1;
                                        v22 = 824;
                                        goto LABEL_11;
                                      case 825:
                                        v20 = "readReconstructStatusesHisto";
                                        v21 = a1;
                                        v22 = 825;
                                        goto LABEL_11;
                                      case 826:
                                        v18 = *v8;
                                        v19 = "bdrBackupChecks";
                                        goto LABEL_13;
                                      case 827:
                                        v18 = *v8;
                                        v19 = "ricExceedClogOnlyPagesTH";
                                        goto LABEL_13;
                                      case 828:
                                        v18 = *v8;
                                        v19 = "numDipFailures";
                                        goto LABEL_13;
                                      case 862:
                                        v18 = *v8;
                                        v19 = "raidSuccessfulSkip";
                                        goto LABEL_13;
                                      case 863:
                                        v18 = *v8;
                                        v19 = "raidFailedSkip";
                                        goto LABEL_13;
                                      case 864:
                                        v18 = *v8;
                                        v19 = "raidSkipAttempts";
                                        goto LABEL_13;
                                      case 865:
                                        v20 = "timeOfThrottlingPerLevel";
                                        v21 = a1;
                                        v22 = 865;
                                        goto LABEL_85;
                                      case 866:
                                        v20 = "timeOfThrottlingPerReadLevel";
                                        v21 = a1;
                                        v22 = 866;
                                        goto LABEL_85;
                                      case 867:
                                        v20 = "timeOfThrottlingPerWriteLevel";
                                        v21 = a1;
                                        v22 = 867;
                                        goto LABEL_85;
                                      case 868:
                                        v20 = "dmReasonsSlc_1bc";
                                        v21 = a1;
                                        v22 = 868;
                                        goto LABEL_155;
                                      case 869:
                                        v20 = "dmReasonsTlc_1bc";
                                        v21 = a1;
                                        v22 = 869;
                                        goto LABEL_155;
                                      case 870:
                                        v20 = "dmReasonsSlc_1bc_he";
                                        v21 = a1;
                                        v22 = 870;
                                        goto LABEL_155;
                                      case 871:
                                        v20 = "dmReasonsTlc_1bc_he";
                                        v21 = a1;
                                        v22 = 871;
                                        goto LABEL_155;
                                      case 876:
                                        v20 = "dmReasonsSlc_mbc";
                                        v21 = a1;
                                        v22 = 876;
                                        goto LABEL_155;
                                      case 877:
                                        v20 = "dmReasonsTlc_mbc";
                                        v21 = a1;
                                        v22 = 877;
                                        goto LABEL_155;
                                      case 883:
                                        v18 = *v8;
                                        v19 = "clogEmptyProgramms";
                                        goto LABEL_13;
                                      case 884:
                                        v18 = *v8;
                                        v19 = "oslcHwCloseBand";
                                        goto LABEL_13;
                                      case 891:
                                        v20 = "turboRaidSuccessAuxPartition";
                                        v21 = a1;
                                        v22 = 891;
                                        goto LABEL_20;
                                      case 892:
                                        v20 = "turboRaidFailAuxPartition";
                                        v21 = a1;
                                        v22 = 892;
                                        goto LABEL_20;
                                      case 893:
                                        v20 = "turboRaidClassifyQualPartition";
                                        v21 = a1;
                                        v22 = 893;
                                        goto LABEL_20;
                                      case 894:
                                        v20 = "turboRaidClassifyRelPartition";
                                        v21 = a1;
                                        v22 = 894;
                                        goto LABEL_20;
                                      case 895:
                                        v18 = *v8;
                                        v19 = "IND_pool_freeMinSilo";
                                        goto LABEL_13;
                                      case 896:
                                        v18 = *v8;
                                        v19 = "autoSweepBlocks";
                                        goto LABEL_13;
                                      case 897:
                                        v20 = "wcWrFragSizes";
                                        v21 = a1;
                                        v22 = 897;
                                        goto LABEL_85;
                                      case 898:
                                        v20 = "indStateAcrossGcDidNoL";
                                        v21 = a1;
                                        v22 = 898;
                                        goto LABEL_85;
                                      case 899:
                                        v20 = "indStateAcrossGcDidL";
                                        v21 = a1;
                                        v22 = 899;
                                        goto LABEL_85;
                                      case 900:
                                        v18 = *v8;
                                        v19 = "turboRaidNoClassifyDueToWasRetire";
                                        goto LABEL_13;
                                      case 901:
                                        v18 = *v8;
                                        v19 = "turboRaidNoClassifyDueToOpenBand";
                                        goto LABEL_13;
                                      case 902:
                                        v18 = *v8;
                                        v19 = "turboRaidNoClassifyDueToQualityBlock";
                                        goto LABEL_13;
                                      case 903:
                                        v18 = *v8;
                                        v19 = "turboRaidGbbOpenBand";
                                        goto LABEL_13;
                                      case 904:
                                        v18 = *v8;
                                        v19 = "turboRaidGbbShouldRetireOnRefresh";
                                        goto LABEL_13;
                                      case 905:
                                        v20 = "turboRaidRelPerBlock";
                                        v21 = a1;
                                        v22 = 905;
                                        goto LABEL_85;
                                      case 906:
                                        v20 = "turboRaidRelBetweenRefreshesPerBlock";
                                        v21 = a1;
                                        v22 = 906;
                                        goto LABEL_85;
                                      case 907:
                                        v20 = "turboRaidMaxRelBetweenRefreshesPerBlock";
                                        v21 = a1;
                                        v22 = 907;
                                        goto LABEL_85;
                                      case 908:
                                        v20 = "turboRaidMinRelBetweenRefreshesPerBlock";
                                        v21 = a1;
                                        v22 = 908;
                                        goto LABEL_85;
                                      case 918:
                                        v20 = "turboRaidMaxCyclesBetweenRel";
                                        v21 = a1;
                                        v22 = 918;
                                        goto LABEL_85;
                                      default:
                                        if (v7 <= 1039)
                                        {
                                          switch(v7)
                                          {
                                            case 919:
                                              v20 = "turboRaidMinCyclesBetweenRel";
                                              v21 = a1;
                                              v22 = 919;
                                              goto LABEL_85;
                                            case 920:
                                              v20 = "turboRaidAuxPerBlock";
                                              v21 = a1;
                                              v22 = 920;
                                              goto LABEL_85;
                                            case 921:
                                              v20 = "turboRaidAuxBetweenRefreshesPerBlock";
                                              v21 = a1;
                                              v22 = 921;
                                              goto LABEL_85;
                                            case 922:
                                              v18 = *v8;
                                              v19 = "turboRaidRelLockMark";
                                              goto LABEL_13;
                                            case 923:
                                              v18 = *v8;
                                              v19 = "turboRaidAuxLockMark";
                                              goto LABEL_13;
                                            case 924:
                                            case 925:
                                            case 926:
                                            case 927:
                                            case 928:
                                            case 929:
                                            case 936:
                                            case 941:
                                            case 945:
                                            case 946:
                                            case 947:
                                            case 949:
                                            case 950:
                                            case 952:
                                            case 954:
                                            case 955:
                                            case 956:
                                            case 957:
                                            case 958:
                                            case 959:
                                            case 960:
                                            case 963:
                                            case 964:
                                            case 965:
                                            case 966:
                                            case 968:
                                            case 969:
                                            case 970:
                                              goto LABEL_696;
                                            case 930:
                                              v20 = "turboRaidMaxCyclesBetweenAux";
                                              v21 = a1;
                                              v22 = 930;
                                              goto LABEL_85;
                                            case 931:
                                              v20 = "turboRaidMinCyclesBetweenAux";
                                              v21 = a1;
                                              v22 = 931;
                                              goto LABEL_85;
                                            case 932:
                                              v20 = "turboRaidLastRelPECycles";
                                              v21 = a1;
                                              v22 = 932;
                                              goto LABEL_85;
                                            case 933:
                                              v20 = "turboRaidRelQualPECycles";
                                              v21 = a1;
                                              v22 = 933;
                                              goto LABEL_85;
                                            case 934:
                                              v20 = "turboRaidLastAuxPECycles";
                                              v21 = a1;
                                              v22 = 934;
                                              goto LABEL_85;
                                            case 935:
                                              v20 = "turboRaidAuxQualPECycles";
                                              v21 = a1;
                                              v22 = 935;
                                              goto LABEL_85;
                                            case 937:
                                              v18 = *v8;
                                              v19 = "turboRaidPEFailAfterRel";
                                              goto LABEL_13;
                                            case 938:
                                              v18 = *v8;
                                              v19 = "turboRaidPEFailAfterAux";
                                              goto LABEL_13;
                                            case 939:
                                              v18 = *v8;
                                              v19 = "dvfmVotesCPU";
                                              goto LABEL_13;
                                            case 940:
                                              v18 = *v8;
                                              v19 = "dvfmVotesBandwidth";
                                              goto LABEL_13;
                                            case 942:
                                              v18 = *v8;
                                              v19 = "maxSLCEndurance";
                                              goto LABEL_13;
                                            case 943:
                                              v18 = *v8;
                                              v19 = "maxMixedEndurance";
                                              goto LABEL_13;
                                            case 944:
                                              v18 = *v8;
                                              v19 = "maxNativeEndurance";
                                              goto LABEL_13;
                                            case 948:
                                              v20 = "assertHistory";
                                              v21 = a1;
                                              v22 = 948;
                                              v14 = v8;
                                              v15 = 40;
                                              goto LABEL_12;
                                            case 951:
                                              v18 = *v8;
                                              v19 = "asp3Support";
                                              goto LABEL_13;
                                            case 953:
                                              v18 = *v8;
                                              v19 = "numCrossTempRaidUecc";
                                              goto LABEL_13;
                                            case 961:
                                              v18 = *v8;
                                              v19 = "osBuildStr";
                                              goto LABEL_13;
                                            case 962:
                                              v18 = *v8;
                                              v19 = "raidConfig";
                                              goto LABEL_13;
                                            case 967:
                                              v20 = "indTrimFrags";
                                              v21 = a1;
                                              v22 = 967;
                                              goto LABEL_153;
                                            case 971:
                                              v20 = "indUsedFrags";
                                              v21 = a1;
                                              v22 = 971;
                                              goto LABEL_153;
                                            default:
                                              switch(v7)
                                              {
                                                case 996:
                                                  v18 = *v8;
                                                  v16 = (_QWORD *)a1;
                                                  v19 = "clogFindFail";
                                                  goto LABEL_14;
                                                case 997:
                                                  v18 = *v8;
                                                  v16 = (_QWORD *)a1;
                                                  v19 = "clogFindBlank";
                                                  goto LABEL_14;
                                                case 998:
                                                  v18 = *v8;
                                                  v16 = (_QWORD *)a1;
                                                  v19 = "clogFindUnc";
                                                  goto LABEL_14;
                                                case 999:
                                                  v18 = *v8;
                                                  v16 = (_QWORD *)a1;
                                                  v19 = "clogFindUnexpected";
                                                  goto LABEL_14;
                                                case 1001:
                                                  v21 = a1;
                                                  v22 = 1001;
                                                  v20 = "clogReplayFailReason";
                                                  goto LABEL_23;
                                                case 1002:
                                                  v18 = *v8;
                                                  v16 = (_QWORD *)a1;
                                                  v19 = "clogReplayTransientError";
                                                  goto LABEL_14;
                                                case 1003:
                                                  v18 = *v8;
                                                  v16 = (_QWORD *)a1;
                                                  v19 = "clogReplaySpfError";
                                                  goto LABEL_14;
                                                case 1015:
                                                  v21 = a1;
                                                  v22 = 1015;
                                                  v20 = "eanEarlyBootUeccPage";
                                                  goto LABEL_22;
                                                case 1016:
                                                  v18 = *v8;
                                                  v16 = (_QWORD *)a1;
                                                  v19 = "eanEarlyBootNumUeccPages";
                                                  goto LABEL_14;
                                                case 1017:
                                                  v18 = *v8;
                                                  v16 = (_QWORD *)a1;
                                                  v19 = "eanEarlyBootUeccMultiplane";
                                                  goto LABEL_14;
                                                default:
                                                  goto LABEL_696;
                                              }
                                          }
                                        }
                                        if (v7 > 1146)
                                        {
                                          switch(v7)
                                          {
                                            case 1147:
                                              v21 = a1;
                                              v22 = 1147;
                                              v20 = "gc_concurrent_dw_gc12";
                                              goto LABEL_713;
                                            case 1148:
                                              v21 = a1;
                                              v22 = 1148;
                                              v20 = "gc_concurrent_dw_gc1";
                                              goto LABEL_713;
                                            case 1149:
                                              v21 = a1;
                                              v22 = 1149;
                                              v20 = "gc_concurrent_dw_gc2";
LABEL_713:
                                              v14 = v8;
                                              v15 = 24;
                                              goto LABEL_12;
                                            case 1150:
                                            case 1151:
                                            case 1152:
                                            case 1153:
                                            case 1154:
                                            case 1155:
                                            case 1156:
                                            case 1159:
                                            case 1160:
                                            case 1161:
                                            case 1162:
                                            case 1163:
                                            case 1164:
                                            case 1165:
                                            case 1166:
                                            case 1167:
                                            case 1170:
                                            case 1173:
                                            case 1174:
                                            case 1175:
                                            case 1176:
                                            case 1177:
                                            case 1178:
                                            case 1186:
                                            case 1187:
                                            case 1188:
                                              goto LABEL_696;
                                            case 1157:
                                              v18 = *v8;
                                              v16 = (_QWORD *)a1;
                                              v19 = "eanMaxForceROTimeMs";
                                              goto LABEL_14;
                                            case 1158:
                                              v18 = *v8;
                                              v16 = (_QWORD *)a1;
                                              v19 = "eanMaxForceRORecoTimeMs";
                                              goto LABEL_14;
                                            case 1168:
                                              v21 = a1;
                                              v22 = 1168;
                                              v20 = "poDetectPERemovalTotalCost";
                                              goto LABEL_20;
                                            case 1169:
                                              v21 = a1;
                                              v22 = 1169;
                                              v20 = "poDetectEmptySpotRemovalTotalCost";
                                              goto LABEL_20;
                                            case 1171:
                                              v21 = a1;
                                              v22 = 1171;
                                              v20 = "poDetectEmptySpotRemovalAge";
                                              break;
                                            case 1172:
                                              v21 = a1;
                                              v22 = 1172;
                                              v20 = "poDetectGBBedMostSevereCost";
                                              goto LABEL_21;
                                            case 1179:
                                              v21 = a1;
                                              v22 = 1179;
                                              v20 = "gc_cur_dw_gc1";
                                              goto LABEL_22;
                                            case 1180:
                                              v21 = a1;
                                              v22 = 1180;
                                              v20 = "gc_cur_dw_gc2";
                                              goto LABEL_22;
                                            case 1181:
                                              v21 = a1;
                                              v22 = 1181;
                                              v20 = "gc_cur_dw_gc3";
                                              goto LABEL_22;
                                            case 1182:
                                              v21 = a1;
                                              v22 = 1182;
                                              v20 = "gc_tot_dw_gc1";
                                              goto LABEL_22;
                                            case 1183:
                                              v21 = a1;
                                              v22 = 1183;
                                              v20 = "gc_tot_dw_gc2";
                                              goto LABEL_22;
                                            case 1184:
                                              v18 = *v8;
                                              v16 = (_QWORD *)a1;
                                              v19 = "unhappy_state";
                                              goto LABEL_14;
                                            case 1185:
                                              v18 = *v8;
                                              v16 = (_QWORD *)a1;
                                              v19 = "unhappy_level";
                                              goto LABEL_14;
                                            case 1189:
                                              v18 = *v8;
                                              v16 = (_QWORD *)a1;
                                              v19 = "lastLbaFormatTime";
                                              goto LABEL_14;
                                            case 1190:
                                              v21 = a1;
                                              v22 = 1190;
                                              v20 = "powerDownTime";
                                              goto LABEL_153;
                                            default:
                                              if (v7 == 1196)
                                              {
                                                v21 = a1;
                                                v22 = 1196;
                                                v20 = "poDetectGBBedTotalCost";
                                                goto LABEL_19;
                                              }
                                              if (v7 != 1197)
                                                goto LABEL_696;
                                              v21 = a1;
                                              v22 = 1197;
                                              v20 = "poDetectGBBedAge";
                                              break;
                                          }
LABEL_11:
                                          v14 = v8;
                                          v15 = 10;
                                          goto LABEL_12;
                                        }
                                        if (v7 > 1104)
                                        {
                                          if (v7 <= 1115)
                                          {
                                            if (v7 == 1105)
                                            {
                                              v21 = a1;
                                              v22 = 1105;
                                              v20 = "hostReadSequential";
                                              goto LABEL_705;
                                            }
                                            if (v7 == 1106)
                                            {
                                              v21 = a1;
                                              v22 = 1106;
                                              v20 = "GCReadSequential";
LABEL_705:
                                              v14 = v8;
                                              v15 = 14;
                                              goto LABEL_12;
                                            }
                                          }
                                          else
                                          {
                                            switch(v7)
                                            {
                                              case 1116:
                                                v21 = a1;
                                                v22 = 1116;
                                                v20 = "gcwamp";
                                                goto LABEL_155;
                                              case 1137:
                                                v18 = *v8;
                                                v16 = (_QWORD *)a1;
                                                v19 = "numOfToUnhappySwitches";
                                                goto LABEL_14;
                                              case 1138:
                                                v18 = *v8;
                                                v16 = (_QWORD *)a1;
                                                v19 = "numOfToHappySwitches";
                                                goto LABEL_14;
                                            }
                                          }
                                          goto LABEL_696;
                                        }
                                        if (v7 <= 1041)
                                        {
                                          v21 = a1;
                                          if (v7 == 1040)
                                          {
                                            v22 = 1040;
                                            v20 = "bandsAgeBinsV2";
                                          }
                                          else
                                          {
                                            v22 = 1041;
                                            v20 = "bandsAgeBinsSnapshot";
                                          }
                                          v14 = v8;
                                          v15 = 31;
                                          goto LABEL_12;
                                        }
                                        if (v7 == 1042)
                                        {
                                          v21 = a1;
                                          v22 = 1042;
                                          v20 = "bandsAgeBinsReadSectors";
                                          v14 = v8;
                                          v15 = 15;
LABEL_12:
                                          sub_100009660(v21, v22, v20, v14, v15);
                                          goto LABEL_15;
                                        }
                                        if (v7 == 1080)
                                        {
                                          v18 = *v8;
                                          v16 = (_QWORD *)a1;
                                          v19 = "raidForceClogLoad";
                                          goto LABEL_14;
                                        }
LABEL_696:
                                        if (v7 > 1231)
                                        {
                                          switch(v7)
                                          {
                                            case 1232:
                                              v18 = *v8;
                                              v16 = (_QWORD *)a1;
                                              v19 = "eanFastSize";
                                              goto LABEL_14;
                                            case 1233:
                                              v18 = *v8;
                                              v16 = (_QWORD *)a1;
                                              v19 = "eanNumSlcEvictions";
                                              goto LABEL_14;
                                            case 1234:
                                              v18 = *v8;
                                              v16 = (_QWORD *)a1;
                                              v19 = "eanNumForcedCompress";
                                              goto LABEL_14;
                                            case 1241:
                                              v21 = a1;
                                              v22 = 1241;
                                              v20 = "s2rTimeHisto";
                                              goto LABEL_11;
                                            case 1244:
                                              v18 = *v8;
                                              v16 = (_QWORD *)a1;
                                              v19 = "calendarTimeWentBackward";
                                              goto LABEL_14;
                                            case 1246:
                                              v21 = a1;
                                              v22 = 1246;
                                              v20 = "bandsUeccCrossTempHisto";
                                              goto LABEL_23;
                                            default:
                                              break;
                                          }
                                        }
                                        else
                                        {
                                          switch(v7)
                                          {
                                            case 1198:
                                              v21 = a1;
                                              v22 = 1198;
                                              v20 = "poDetectPERemovalMostSevereCost";
                                              goto LABEL_21;
                                            case 1199:
                                              v18 = *v8;
                                              v16 = (_QWORD *)a1;
                                              v19 = "poDetectCurrentSize";
                                              goto LABEL_14;
                                            case 1200:
                                              break;
                                            case 1201:
                                              v21 = a1;
                                              v22 = 1201;
                                              v20 = "gcVerticalSuccssfulAlignments";
                                              goto LABEL_22;
                                            case 1202:
                                              v21 = a1;
                                              v22 = 1202;
                                              v20 = "gcVerticalNoAlignmentDueToMissingSegs";
                                              goto LABEL_22;
                                            default:
                                              switch(v7)
                                              {
                                                case 1216:
                                                  v21 = a1;
                                                  v22 = 1216;
                                                  v20 = "tlcWLPerDipAvgPEC";
                                                  goto LABEL_713;
                                                case 1217:
                                                  v21 = a1;
                                                  v22 = 1217;
                                                  v20 = "tlcWLPerDipMaxPEC";
                                                  goto LABEL_713;
                                                case 1218:
                                                  v21 = a1;
                                                  v22 = 1218;
                                                  v20 = "tlcWLPerDipMinPEC";
                                                  goto LABEL_713;
                                                case 1219:
                                                case 1220:
                                                case 1221:
                                                case 1222:
                                                case 1223:
                                                  goto LABEL_15;
                                                case 1224:
                                                  v21 = a1;
                                                  v22 = 1224;
                                                  v20 = "apfsValidLbaOvershoot";
                                                  v14 = v8;
                                                  v15 = 20;
                                                  goto LABEL_12;
                                                default:
                                                  if (v7 != 1211)
                                                    goto LABEL_15;
                                                  v21 = a1;
                                                  v22 = 1211;
                                                  v20 = "forcedAllocationSmallEraseQ";
                                                  break;
                                              }
                                              goto LABEL_713;
                                          }
                                        }
LABEL_15:
                                        a2 = &v8[v10];
                                        v6 = v11 - v10;
                                        if (v11 != (_DWORD)v10)
                                          continue;
                                        return 1;
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

uint64_t sub_100009660(uint64_t result, int a2, const char *a3, uint64_t *a4, unsigned int a5)
{
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char __str[101];

  v7 = (_QWORD *)result;
  v8 = *a4;
  if (a2 <= 44)
  {
    switch(a2)
    {
      case 4:
        *(_QWORD *)(result + 72) = v8;
        if (a5)
          goto LABEL_42;
        return result;
      case 5:
      case 6:
      case 8:
      case 9:
      case 10:
      case 11:
      case 14:
      case 15:
      case 16:
        goto LABEL_41;
      case 7:
        *(_QWORD *)(result + 64) = v8;
        if (a5)
          goto LABEL_42;
        return result;
      case 12:
        *(_QWORD *)(result + 144) = v8;
        if (a5)
          goto LABEL_42;
        return result;
      case 13:
        *(_QWORD *)(result + 152) = v8;
        if (a5)
          goto LABEL_42;
        return result;
      case 17:
        *(_QWORD *)(result + 88) = v8;
        if (a5)
          goto LABEL_42;
        return result;
      case 18:
        *(_QWORD *)(result + 104) = v8;
        if (a5)
          goto LABEL_42;
        return result;
      case 19:
        *(_QWORD *)(result + 96) = v8;
        if (a5)
          goto LABEL_42;
        return result;
      case 20:
        *(_QWORD *)(result + 112) = v8;
        if (a5)
          goto LABEL_42;
        return result;
      default:
        if (a2 != 28)
          goto LABEL_41;
        *(_QWORD *)(result + 168) = v8;
        if (!a5)
          return result;
        goto LABEL_42;
    }
  }
  switch(a2)
  {
    case '-':
      *(_QWORD *)(result + 176) = v8;
      if (a5)
        goto LABEL_42;
      return result;
    case '.':
    case '/':
    case '6':
    case '7':
      goto LABEL_41;
    case '0':
      *(_QWORD *)(result + 80) = v8;
      if (!a5)
        return result;
      goto LABEL_42;
    case '1':
      *(_DWORD *)(result + 56) = v8;
      if (!a5)
        return result;
      goto LABEL_42;
    case '2':
      *(_DWORD *)(result + 52) = v8;
      if (!a5)
        return result;
      goto LABEL_42;
    case '3':
      *(_DWORD *)(result + 48) = v8;
      if (!a5)
        return result;
      goto LABEL_42;
    case '4':
      *(_DWORD *)(result + 44) = v8;
      if (!a5)
        return result;
      goto LABEL_42;
    case '5':
      *(_DWORD *)(result + 32) = v8;
      goto LABEL_41;
    case '8':
      *(_QWORD *)(result + 160) = v8;
      if (!a5)
        return result;
      goto LABEL_42;
    default:
      if (a2 != 265)
        goto LABEL_41;
      if (a5)
      {
        v9 = a5;
        v10 = (_QWORD *)(result + 184);
        v11 = a4;
        do
        {
          v12 = *v11++;
          *v10++ = v12;
          --v9;
        }
        while (v9);
LABEL_41:
        if (a5)
        {
LABEL_42:
          if (a5 == 1)
          {
            return sub_10001B208((_QWORD *)result, "", a3, v8);
          }
          else
          {
            v13 = 0;
            v14 = a5;
            do
            {
              snprintf(__str, 0x64uLL, "%d", v13);
              __str[100] = 0;
              result = sub_10001B208(v7, a3, __str, a4[v13++]);
            }
            while (v14 != v13);
          }
        }
      }
      return result;
  }
}

double sub_1000098A8(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  double result;

  v2 = *(_QWORD **)a1;
  if (v2)
  {
    do
    {
      v3 = (_QWORD *)v2[14];
      free(v2);
      v2 = v3;
    }
    while (v3);
  }
  v4 = *(_QWORD **)(a1 + 16);
  if (v4)
  {
    do
    {
      v5 = (_QWORD *)v4[14];
      free(v4);
      v4 = v5;
    }
    while (v5);
  }
  result = 0.0;
  *(_OWORD *)(a1 + 208) = 0u;
  *(_OWORD *)(a1 + 224) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  return result;
}

uint64_t sub_100009918(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  unint64_t *v8;
  uint64_t v10;
  unsigned int v11;
  int v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  unsigned int v20;
  const char *v22;
  char v23;
  char __str[16];
  __int128 v25;

  v8 = (unint64_t *)a2;
  v10 = 0;
  v11 = a3 >> 3;
  *(_OWORD *)__str = 0u;
  v25 = 0u;
  do
  {
LABEL_2:
    if (!v11)
      return v10;
    v13 = *v8++;
    v12 = v13;
    v14 = HIDWORD(v13);
    --v11;
  }
  while (!HIDWORD(v13));
  if (v12 == 0xFFFF || v12 > 0x30000000 || v11 < v14)
    return v10;
  v17 = (v12 - 1);
  if (v17 <= 0x47)
    __asm { BR              X9 }
  v18 = (v12 - 73);
  if (v18 <= 0x46)
    __asm { BR              X9 }
  switch(v12)
  {
    case 144:
      if ((sub_1000145F8(a1, "numMemExtreme", (uint64_t)v8, 8u, 1u) & 1) != 0)
        goto LABEL_16;
      v19 = "ASPFTLParseBufferToCxt: numMemExtreme(144) cannot add 1 element to context";
      goto LABEL_15;
    case 145:
      if ((sub_1000145F8(a1, "maxMemExtremeDuration", (uint64_t)v8, 8u, 1u) & 1) != 0)
        goto LABEL_16;
      v19 = "ASPFTLParseBufferToCxt: maxMemExtremeDuration(145) cannot add 1 element to context";
      goto LABEL_15;
    case 146:
      if ((sub_1000145F8(a1, "memExtremeDuration", (uint64_t)v8, 8u, 1u) & 1) != 0)
        goto LABEL_16;
      v19 = "ASPFTLParseBufferToCxt: memExtremeDuration(146) cannot add 1 element to context";
      goto LABEL_15;
    case 147:
      if ((sub_1000145F8(a1, "bandGetsExtreme", (uint64_t)v8, 8u, 1u) & 1) != 0)
        goto LABEL_16;
      v19 = "ASPFTLParseBufferToCxt: bandGetsExtreme(147) cannot add 1 element to context";
      goto LABEL_15;
    case 148:
      if ((sub_1000145F8(a1, "bandGetsLow", (uint64_t)v8, 8u, 1u) & 1) != 0)
        goto LABEL_16;
      v19 = "ASPFTLParseBufferToCxt: bandGetsLow(148) cannot add 1 element to context";
      goto LABEL_15;
    case 149:
      if ((sub_1000145F8(a1, "numHostChoke", (uint64_t)v8, 8u, 1u) & 1) != 0)
        goto LABEL_16;
      v19 = "ASPFTLParseBufferToCxt: numHostChoke(149) cannot add 1 element to context";
      goto LABEL_15;
    case 152:
      if ((sub_1000145F8(a1, "AbortSkip_ProgramError", (uint64_t)v8, 8u, 1u) & 1) != 0)
        goto LABEL_16;
      v19 = "ASPFTLParseBufferToCxt: AbortSkip_ProgramError(152) cannot add 1 element to context";
      goto LABEL_15;
    case 153:
      if ((sub_1000145F8(a1, "AbortSkip_ReadErrorOpenBand", (uint64_t)v8, 8u, 1u) & 1) != 0)
        goto LABEL_16;
      v19 = "ASPFTLParseBufferToCxt: AbortSkip_ReadErrorOpenBand(153) cannot add 1 element to context";
      goto LABEL_15;
    case 154:
      if ((sub_1000145F8(a1, "AbortSkip_FailedRebuildingParity", (uint64_t)v8, 8u, 1u) & 1) != 0)
        goto LABEL_16;
      v19 = "ASPFTLParseBufferToCxt: AbortSkip_FailedRebuildingParity(154) cannot add 1 element to context";
      goto LABEL_15;
    case 155:
      if ((sub_1000145F8(a1, "AbortPad_OpenRefreshBand", (uint64_t)v8, 8u, 1u) & 1) != 0)
        goto LABEL_16;
      v19 = "ASPFTLParseBufferToCxt: AbortPad_OpenRefreshBand(155) cannot add 1 element to context";
      goto LABEL_15;
    case 156:
      if ((sub_1000145F8(a1, "AbortPad_CloseBands", (uint64_t)v8, 8u, 1u) & 1) != 0)
        goto LABEL_16;
      v19 = "ASPFTLParseBufferToCxt: AbortPad_CloseBands(156) cannot add 1 element to context";
      goto LABEL_15;
    case 157:
      if ((sub_1000145F8(a1, "AbortPad_SetPhoto", (uint64_t)v8, 8u, 1u) & 1) != 0)
        goto LABEL_16;
      v19 = "ASPFTLParseBufferToCxt: AbortPad_SetPhoto(157) cannot add 1 element to context";
      goto LABEL_15;
    case 158:
      if ((sub_1000145F8(a1, "AbortPad_GcNoSource", (uint64_t)v8, 8u, 1u) & 1) != 0)
        goto LABEL_16;
      v19 = "ASPFTLParseBufferToCxt: AbortPad_GcNoSource(158) cannot add 1 element to context";
      goto LABEL_15;
    case 159:
      if ((sub_1000145F8(a1, "AbortPad_Format", (uint64_t)v8, 8u, 1u) & 1) != 0)
        goto LABEL_16;
      v19 = "ASPFTLParseBufferToCxt: AbortPad_Format(159) cannot add 1 element to context";
      goto LABEL_15;
    case 160:
      if ((sub_1000145F8(a1, "nandDiscoveryDuration", (uint64_t)v8, 8u, 1u) & 1) != 0)
        goto LABEL_16;
      v19 = "ASPFTLParseBufferToCxt: nandDiscoveryDuration(160) cannot add 1 element to context";
      goto LABEL_15;
    case 161:
      if ((sub_1000145F8(a1, "coreCCEnableDuration", (uint64_t)v8, 8u, 1u) & 1) != 0)
        goto LABEL_16;
      v19 = "ASPFTLParseBufferToCxt: coreCCEnableDuration(161) cannot add 1 element to context";
      goto LABEL_15;
    case 163:
      if ((sub_1000145F8(a1, "coreOpenDuration", (uint64_t)v8, 8u, 1u) & 1) != 0)
        goto LABEL_16;
      v19 = "ASPFTLParseBufferToCxt: coreOpenDuration(163) cannot add 1 element to context";
      goto LABEL_15;
    case 164:
      if ((sub_1000145F8(a1, "coreWritableDuration", (uint64_t)v8, 8u, 1u) & 1) != 0)
        goto LABEL_16;
      v19 = "ASPFTLParseBufferToCxt: coreWritableDuration(164) cannot add 1 element to context";
      goto LABEL_15;
    case 165:
      if ((sub_1000145F8(a1, "coreClogLoadDuration", (uint64_t)v8, 8u, 1u) & 1) != 0)
        goto LABEL_16;
      v19 = "ASPFTLParseBufferToCxt: coreClogLoadDuration(165) cannot add 1 element to context";
      goto LABEL_15;
    case 167:
      if ((sub_1000145F8(a1, "bulkPFail", (uint64_t)v8, 8u, 1u) & 1) != 0)
        goto LABEL_16;
      v19 = "ASPFTLParseBufferToCxt: bulkPFail(167) cannot add 1 element to context";
      goto LABEL_15;
    case 169:
      if ((sub_1000145F8(a1, "bulkRFail", (uint64_t)v8, 8u, 1u) & 1) != 0)
        goto LABEL_16;
      v19 = "ASPFTLParseBufferToCxt: bulkRFail(169) cannot add 1 element to context";
      goto LABEL_15;
    case 172:
      if ((sub_1000145F8(a1, "raidSmartErrors", (uint64_t)v8, 8u, 1u) & 1) != 0)
        goto LABEL_16;
      v19 = "ASPFTLParseBufferToCxt: raidSmartErrors(172) cannot add 1 element to context";
      goto LABEL_15;
    case 182:
      if ((sub_1000145F8(a1, "internalUeccs", (uint64_t)v8, 8u, 1u) & 1) != 0)
        goto LABEL_16;
      v19 = "ASPFTLParseBufferToCxt: internalUeccs(182) cannot add 1 element to context";
      goto LABEL_15;
    case 183:
      if ((sub_1000145F8(a1, "e2eFail", (uint64_t)v8, 8u, 1u) & 1) != 0)
        goto LABEL_16;
      v19 = "ASPFTLParseBufferToCxt: e2eFail(183) cannot add 1 element to context";
      goto LABEL_15;
    case 184:
      if ((sub_1000145F8(a1, "TempSensorMax", (uint64_t)v8, 8u, 1u) & 1) != 0)
        goto LABEL_16;
      v19 = "ASPFTLParseBufferToCxt: TempSensorMax(184) cannot add 1 element to context";
      goto LABEL_15;
    case 185:
      if ((sub_1000145F8(a1, "TempSensorMin", (uint64_t)v8, 8u, 1u) & 1) != 0)
        goto LABEL_16;
      v19 = "ASPFTLParseBufferToCxt: TempSensorMin(185) cannot add 1 element to context";
      goto LABEL_15;
    case 186:
      if ((sub_1000145F8(a1, "powerUpFromDDR", (uint64_t)v8, 8u, 1u) & 1) != 0)
        goto LABEL_16;
      v19 = "ASPFTLParseBufferToCxt: powerUpFromDDR(186) cannot add 1 element to context";
      goto LABEL_15;
    case 187:
      if ((sub_1000145F8(a1, "numMemLow", (uint64_t)v8, 8u, 1u) & 1) != 0)
        goto LABEL_16;
      v19 = "ASPFTLParseBufferToCxt: numMemLow(187) cannot add 1 element to context";
      goto LABEL_15;
    case 188:
      if ((sub_1000145F8(a1, "maxMemLowDuration", (uint64_t)v8, 8u, 1u) & 1) != 0)
        goto LABEL_16;
      v19 = "ASPFTLParseBufferToCxt: maxMemLowDuration(188) cannot add 1 element to context";
      goto LABEL_15;
    case 189:
      if ((sub_1000145F8(a1, "memLowDuration", (uint64_t)v8, 8u, 1u) & 1) != 0)
        goto LABEL_16;
      v19 = "ASPFTLParseBufferToCxt: memLowDuration(189) cannot add 1 element to context";
      goto LABEL_15;
    case 190:
      if ((sub_1000145F8(a1, "numFences", (uint64_t)v8, 8u, 1u) & 1) != 0)
        goto LABEL_16;
      v19 = "ASPFTLParseBufferToCxt: numFences(190) cannot add 1 element to context";
      goto LABEL_15;
    case 191:
      if ((sub_1000145F8(a1, "hostPassiveIO", (uint64_t)v8, 8u, 1u) & 1) != 0)
        goto LABEL_16;
      v19 = "ASPFTLParseBufferToCxt: hostPassiveIO(191) cannot add 1 element to context";
      goto LABEL_15;
    case 192:
      if ((sub_1000145F8(a1, "odtsMax", (uint64_t)v8, 8u, 1u) & 1) != 0)
        goto LABEL_16;
      v19 = "ASPFTLParseBufferToCxt: odtsMax(192) cannot add 1 element to context";
      goto LABEL_15;
    case 193:
      if ((sub_1000145F8(a1, "defragMFromOrphans", (uint64_t)v8, 8u, 1u) & 1) != 0)
        goto LABEL_16;
      v19 = "ASPFTLParseBufferToCxt: defragMFromOrphans(193) cannot add 1 element to context";
      goto LABEL_15;
    case 194:
      if ((sub_1000145F8(a1, "defragMFromFragments", (uint64_t)v8, 8u, 1u) & 1) != 0)
        goto LABEL_16;
      v19 = "ASPFTLParseBufferToCxt: defragMFromFragments(194) cannot add 1 element to context";
      goto LABEL_15;
    case 195:
      if ((sub_1000145F8(a1, "defragMTime", (uint64_t)v8, 8u, 1u) & 1) != 0)
        goto LABEL_16;
      v19 = "ASPFTLParseBufferToCxt: defragMTime(195) cannot add 1 element to context";
      goto LABEL_15;
    case 196:
      if ((sub_1000145F8(a1, "defragMMaxTime", (uint64_t)v8, 8u, 1u) & 1) != 0)
        goto LABEL_16;
      v19 = "ASPFTLParseBufferToCxt: defragMMaxTime(196) cannot add 1 element to context";
      goto LABEL_15;
    case 197:
      if ((sub_1000145F8(a1, "raidFailedLbaMismatch", (uint64_t)v8, 8u, 1u) & 1) != 0)
        goto LABEL_16;
      v19 = "ASPFTLParseBufferToCxt: raidFailedLbaMismatch(197) cannot add 1 element to context";
      goto LABEL_15;
    case 198:
      if ((sub_1000145F8(a1, "numSyscfgWrites", (uint64_t)v8, 8u, 1u) & 1) != 0)
        goto LABEL_16;
      v19 = "ASPFTLParseBufferToCxt: numSyscfgWrites(198) cannot add 1 element to context";
      goto LABEL_15;
    case 199:
      if ((sub_1000145F8(a1, "indmbUnitsXfer", (uint64_t)v8, 8u, 1u) & 1) != 0)
        goto LABEL_16;
      v19 = "ASPFTLParseBufferToCxt: indmbUnitsXfer(199) cannot add 1 element to context";
      goto LABEL_15;
    case 200:
      if ((sub_1000145F8(a1, "indmbUnitsCache", (uint64_t)v8, 8u, 1u) & 1) != 0)
        goto LABEL_16;
      v19 = "ASPFTLParseBufferToCxt: indmbUnitsCache(200) cannot add 1 element to context";
      goto LABEL_15;
    case 201:
      if ((sub_1000145F8(a1, "indmbUnitsInd", (uint64_t)v8, 8u, 1u) & 1) != 0)
        goto LABEL_16;
      v19 = "ASPFTLParseBufferToCxt: indmbUnitsInd(201) cannot add 1 element to context";
      goto LABEL_15;
    case 202:
      if ((sub_1000145F8(a1, "wcacheFS_Mbytes", (uint64_t)v8, 8u, 1u) & 1) != 0)
        goto LABEL_16;
      v19 = "ASPFTLParseBufferToCxt: wcacheFS_Mbytes(202) cannot add 1 element to context";
      goto LABEL_15;
    case 203:
      if ((sub_1000145F8(a1, "wcacheDS_Mbytes", (uint64_t)v8, 8u, 1u) & 1) != 0)
        goto LABEL_16;
      v19 = "ASPFTLParseBufferToCxt: wcacheDS_Mbytes(203) cannot add 1 element to context";
      goto LABEL_15;
    case 204:
      if ((sub_1000145F8(a1, "powerOnSeconds", (uint64_t)v8, 8u, 1u) & 1) != 0)
        goto LABEL_16;
      v19 = "ASPFTLParseBufferToCxt: powerOnSeconds(204) cannot add 1 element to context";
      goto LABEL_15;
    case 205:
      if ((sub_1000145F8(a1, "numUnknownTokenHostRead", (uint64_t)v8, 8u, 1u) & 1) != 0)
        goto LABEL_16;
      v19 = "ASPFTLParseBufferToCxt: numUnknownTokenHostRead(205) cannot add 1 element to context";
      goto LABEL_15;
    case 206:
      if ((sub_1000145F8(a1, "numUnmmapedTokenHostRead", (uint64_t)v8, 8u, 1u) & 1) != 0)
        goto LABEL_16;
      v19 = "ASPFTLParseBufferToCxt: numUnmmapedTokenHostRead(206) cannot add 1 element to context";
      goto LABEL_15;
    case 207:
      if ((_DWORD)v14 != 16)
        sub_10001B514("ASPFTLParseBufferToCxt: numOfThrottlingEntriesPerLevel(207): (#16) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
      if (v14 >= 0x10)
        v20 = 16;
      else
        v20 = v14;
      if ((sub_1000145F8(a1, "numOfThrottlingEntriesPerLevel_", (uint64_t)v8, 8u, v20) & 1) != 0)
        goto LABEL_14;
      v22 = "ASPFTLParseBufferToCxt: numOfThrottlingEntriesPerLevel(207): Cannot add 16 elements to context";
      goto LABEL_2228;
    case 208:
      if ((sub_1000145F8(a1, "wcacheFS_MbytesMin", (uint64_t)v8, 8u, 1u) & 1) != 0)
        goto LABEL_16;
      v19 = "ASPFTLParseBufferToCxt: wcacheFS_MbytesMin(208) cannot add 1 element to context";
      goto LABEL_15;
    case 209:
      if ((sub_1000145F8(a1, "wcacheFS_MbytesMax", (uint64_t)v8, 8u, 1u) & 1) != 0)
        goto LABEL_16;
      v19 = "ASPFTLParseBufferToCxt: wcacheFS_MbytesMax(209) cannot add 1 element to context";
      goto LABEL_15;
    case 210:
      if ((sub_1000145F8(a1, "prepareForShutdownFailCounter", (uint64_t)v8, 8u, 1u) & 1) != 0)
        goto LABEL_16;
      v19 = "ASPFTLParseBufferToCxt: prepareForShutdownFailCounter(210) cannot add 1 element to context";
      goto LABEL_15;
    case 211:
      if ((sub_1000145F8(a1, "lpsrEntry", (uint64_t)v8, 8u, 1u) & 1) != 0)
        goto LABEL_16;
      v19 = "ASPFTLParseBufferToCxt: lpsrEntry(211) cannot add 1 element to context";
      goto LABEL_15;
    case 212:
      if ((sub_1000145F8(a1, "lpsrExit", (uint64_t)v8, 8u, 1u) & 1) != 0)
        goto LABEL_16;
      v19 = "ASPFTLParseBufferToCxt: lpsrExit(212) cannot add 1 element to context";
      goto LABEL_15;
    case 213:
      if ((_DWORD)v14 != 8)
        sub_10001B514("ASPFTLParseBufferToCxt: crcInternalReadFail(213): (#8) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
      if (v14 >= 8)
        v20 = 8;
      else
        v20 = v14;
      if ((sub_1000145F8(a1, "crcInternalReadFail_", (uint64_t)v8, 8u, v20) & 1) != 0)
        goto LABEL_14;
      v22 = "ASPFTLParseBufferToCxt: crcInternalReadFail(213): Cannot add 8 elements to context";
      goto LABEL_2228;
    case 214:
      if ((sub_1000145F8(a1, "wcacheFSEvictCnt", (uint64_t)v8, 8u, 1u) & 1) != 0)
        goto LABEL_16;
      v19 = "ASPFTLParseBufferToCxt: wcacheFSEvictCnt(214) cannot add 1 element to context";
      goto LABEL_15;
    case 215:
      if ((sub_1000145F8(a1, "wcacheFSEvictSize", (uint64_t)v8, 8u, 1u) & 1) != 0)
        goto LABEL_16;
      v19 = "ASPFTLParseBufferToCxt: wcacheFSEvictSize(215) cannot add 1 element to context";
      goto LABEL_15;
    case 216:
      if ((sub_1000145F8(a1, "wcacheFSWr", (uint64_t)v8, 8u, 1u) & 1) != 0)
        goto LABEL_16;
      v19 = "ASPFTLParseBufferToCxt: wcacheFSWr(216) cannot add 1 element to context";
      goto LABEL_15;
    case 217:
      if ((sub_1000145F8(a1, "wcacheDSWr", (uint64_t)v8, 8u, 1u) & 1) != 0)
        goto LABEL_16;
      v19 = "ASPFTLParseBufferToCxt: wcacheDSWr(217) cannot add 1 element to context";
      goto LABEL_15;
    case 218:
      if ((_DWORD)v14 != 10)
        sub_10001B514("ASPFTLParseBufferToCxt: wcacheFSEvictSizeLogDist(218): (#10) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
      if (v14 >= 0xA)
        v20 = 10;
      else
        v20 = v14;
      if ((sub_1000145F8(a1, "wcacheFSEvictSizeLogDist_", (uint64_t)v8, 8u, v20) & 1) != 0)
        goto LABEL_14;
      v22 = "ASPFTLParseBufferToCxt: wcacheFSEvictSizeLogDist(218): Cannot add 10 elements to context";
      goto LABEL_2228;
    case 219:
      if ((sub_1000145F8(a1, "prepareForShutdownTimeoutCounter", (uint64_t)v8, 8u, 1u) & 1) != 0)
        goto LABEL_16;
      v19 = "ASPFTLParseBufferToCxt: prepareForShutdownTimeoutCounter(219) cannot add 1 element to context";
      goto LABEL_15;
    case 220:
      if ((sub_1000145F8(a1, "prepareForShutdownCancelCounter", (uint64_t)v8, 8u, 1u) & 1) != 0)
        goto LABEL_16;
      v19 = "ASPFTLParseBufferToCxt: prepareForShutdownCancelCounter(220) cannot add 1 element to context";
      goto LABEL_15;
    case 221:
      if ((sub_1000145F8(a1, "RD_openBandCount", (uint64_t)v8, 8u, 1u) & 1) != 0)
        goto LABEL_16;
      v19 = "ASPFTLParseBufferToCxt: RD_openBandCount(221) cannot add 1 element to context";
      goto LABEL_15;
    case 222:
      if ((sub_1000145F8(a1, "RD_openBandNops", (uint64_t)v8, 8u, 1u) & 1) != 0)
        goto LABEL_16;
      v19 = "ASPFTLParseBufferToCxt: RD_openBandNops(222) cannot add 1 element to context";
      goto LABEL_15;
    case 223:
      if ((sub_1000145F8(a1, "RD_closedBandEvictCount", (uint64_t)v8, 8u, 1u) & 1) != 0)
        goto LABEL_16;
      v19 = "ASPFTLParseBufferToCxt: RD_closedBandEvictCount(223) cannot add 1 element to context";
      goto LABEL_15;
    default:
      switch(v12)
      {
        case 224:
          if ((sub_1000145F8(a1, "RD_closedBandEvictSectors", (uint64_t)v8, 8u, 1u) & 1) != 0)
            goto LABEL_16;
          v19 = "ASPFTLParseBufferToCxt: RD_closedBandEvictSectors(224) cannot add 1 element to context";
          goto LABEL_15;
        case 225:
          if ((sub_1000145F8(a1, "RD_closedBandFragmentCount", (uint64_t)v8, 8u, 1u) & 1) != 0)
            goto LABEL_16;
          v19 = "ASPFTLParseBufferToCxt: RD_closedBandFragmentCount(225) cannot add 1 element to context";
          goto LABEL_15;
        case 226:
          if ((sub_1000145F8(a1, "RD_closedBandFragmentSectors", (uint64_t)v8, 8u, 1u) & 1) != 0)
            goto LABEL_16;
          v19 = "ASPFTLParseBufferToCxt: RD_closedBandFragmentSectors(226) cannot add 1 element to context";
          goto LABEL_15;
        case 227:
          if ((_DWORD)v14 != 10)
            sub_10001B514("ASPFTLParseBufferToCxt: wcacheFSOverWrLogSizeCnts(227): (#10) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
          if (v14 >= 0xA)
            v20 = 10;
          else
            v20 = v14;
          if ((sub_1000145F8(a1, "wcacheFSOverWrLogSizeCnts_", (uint64_t)v8, 8u, v20) & 1) != 0)
            goto LABEL_14;
          v22 = "ASPFTLParseBufferToCxt: wcacheFSOverWrLogSizeCnts(227): Cannot add 10 elements to context";
          goto LABEL_2228;
        case 228:
          if ((_DWORD)v14 != 4)
            sub_10001B514("ASPFTLParseBufferToCxt: wcacheFSOverWrSizeByFlow(228): (#4) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
          if (v14 >= 4)
            v20 = 4;
          else
            v20 = v14;
          if ((sub_1000145F8(a1, "wcacheFSOverWrSizeByFlow_", (uint64_t)v8, 8u, v20) & 1) != 0)
            goto LABEL_14;
          v22 = "ASPFTLParseBufferToCxt: wcacheFSOverWrSizeByFlow(228): Cannot add 4 elements to context";
          goto LABEL_2228;
        case 229:
          if ((_DWORD)v14 != 2)
            sub_10001B514("ASPFTLParseBufferToCxt: indmbXferCountTo(229): (#2) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
          if (v14 >= 2)
            v20 = 2;
          else
            v20 = v14;
          if ((sub_1000145F8(a1, "indmbXferCountTo_", (uint64_t)v8, 8u, v20) & 1) != 0)
            goto LABEL_14;
          v22 = "ASPFTLParseBufferToCxt: indmbXferCountTo(229): Cannot add 2 elements to context";
          goto LABEL_2228;
        case 230:
          if ((_DWORD)v14 != 2)
            sub_10001B514("ASPFTLParseBufferToCxt: indmbAccumulatedTimeBetweenXfers(230): (#2) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
          if (v14 >= 2)
            v20 = 2;
          else
            v20 = v14;
          if ((sub_1000145F8(a1, "indmbAccumulatedTimeBetweenXfers_", (uint64_t)v8, 8u, v20) & 1) != 0)
            goto LABEL_14;
          v22 = "ASPFTLParseBufferToCxt: indmbAccumulatedTimeBetweenXfers(230): Cannot add 2 elements to context";
          goto LABEL_2228;
        case 231:
          if ((sub_1000145F8(a1, "maxGracefulBootTimeMs", (uint64_t)v8, 8u, 1u) & 1) != 0)
            goto LABEL_16;
          v19 = "ASPFTLParseBufferToCxt: maxGracefulBootTimeMs(231) cannot add 1 element to context";
          goto LABEL_15;
        case 232:
          if ((sub_1000145F8(a1, "maxUngracefulBootTimeMs", (uint64_t)v8, 8u, 1u) & 1) != 0)
            goto LABEL_16;
          v19 = "ASPFTLParseBufferToCxt: maxUngracefulBootTimeMs(232) cannot add 1 element to context";
          goto LABEL_15;
        case 233:
          if ((sub_1000145F8(a1, "averageGracefulBootTimeMs", (uint64_t)v8, 8u, 1u) & 1) != 0)
            goto LABEL_16;
          v19 = "ASPFTLParseBufferToCxt: averageGracefulBootTimeMs(233) cannot add 1 element to context";
          goto LABEL_15;
        case 234:
          if ((sub_1000145F8(a1, "averageUngracefulBootTimeMs", (uint64_t)v8, 8u, 1u) & 1) != 0)
            goto LABEL_16;
          v19 = "ASPFTLParseBufferToCxt: averageUngracefulBootTimeMs(234) cannot add 1 element to context";
          goto LABEL_15;
        case 235:
          if ((_DWORD)v14 != 8)
            sub_10001B514("ASPFTLParseBufferToCxt: gracefulBootTimeLogMs(235): (#8) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
          if (v14 >= 8)
            v20 = 8;
          else
            v20 = v14;
          if ((sub_1000145F8(a1, "gracefulBootTimeLogMs_", (uint64_t)v8, 8u, v20) & 1) != 0)
            goto LABEL_14;
          v22 = "ASPFTLParseBufferToCxt: gracefulBootTimeLogMs(235): Cannot add 8 elements to context";
          goto LABEL_2228;
        case 236:
          if ((_DWORD)v14 != 8)
            sub_10001B514("ASPFTLParseBufferToCxt: ungracefulBootTimeLogMs(236): (#8) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
          if (v14 >= 8)
            v20 = 8;
          else
            v20 = v14;
          if ((sub_1000145F8(a1, "ungracefulBootTimeLogMs_", (uint64_t)v8, 8u, v20) & 1) != 0)
            goto LABEL_14;
          v22 = "ASPFTLParseBufferToCxt: ungracefulBootTimeLogMs(236): Cannot add 8 elements to context";
          goto LABEL_2228;
        case 237:
          if ((_DWORD)v14 != 4)
            sub_10001B514("ASPFTLParseBufferToCxt: CalibrationCount(237): (#4) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
          if (v14 >= 4)
            v20 = 4;
          else
            v20 = v14;
          if ((sub_1000145F8(a1, "CalibrationCount_", (uint64_t)v8, 8u, v20) & 1) != 0)
            goto LABEL_14;
          v22 = "ASPFTLParseBufferToCxt: CalibrationCount(237): Cannot add 4 elements to context";
          goto LABEL_2228;
        case 238:
          if ((sub_1000145F8(a1, "CalibrationLastTmp", (uint64_t)v8, 8u, 1u) & 1) != 0)
            goto LABEL_16;
          v19 = "ASPFTLParseBufferToCxt: CalibrationLastTmp(238) cannot add 1 element to context";
          goto LABEL_15;
        case 239:
          if ((sub_1000145F8(a1, "CalibrationMaxTmp", (uint64_t)v8, 8u, 1u) & 1) != 0)
            goto LABEL_16;
          v19 = "ASPFTLParseBufferToCxt: CalibrationMaxTmp(239) cannot add 1 element to context";
          goto LABEL_15;
        case 240:
          if ((sub_1000145F8(a1, "CalibrationMinTmp", (uint64_t)v8, 8u, 1u) & 1) != 0)
            goto LABEL_16;
          v19 = "ASPFTLParseBufferToCxt: CalibrationMinTmp(240) cannot add 1 element to context";
          goto LABEL_15;
        case 241:
          if ((sub_1000145F8(a1, "ungracefulBootWorstIndicator", (uint64_t)v8, 8u, 1u) & 1) != 0)
            goto LABEL_16;
          v19 = "ASPFTLParseBufferToCxt: ungracefulBootWorstIndicator(241) cannot add 1 element to context";
          goto LABEL_15;
        case 242:
          if ((sub_1000145F8(a1, "metaMismatchReread", (uint64_t)v8, 8u, 1u) & 1) != 0)
            goto LABEL_16;
          v19 = "ASPFTLParseBufferToCxt: metaMismatchReread(242) cannot add 1 element to context";
          goto LABEL_15;
        case 243:
          if ((sub_1000145F8(a1, "numS3SleepOps", (uint64_t)v8, 8u, 1u) & 1) != 0)
            goto LABEL_16;
          v19 = "ASPFTLParseBufferToCxt: numS3SleepOps(243) cannot add 1 element to context";
          goto LABEL_15;
        case 244:
          if ((sub_1000145F8(a1, "odtsCurrent", (uint64_t)v8, 8u, 1u) & 1) != 0)
            goto LABEL_16;
          v19 = "ASPFTLParseBufferToCxt: odtsCurrent(244) cannot add 1 element to context";
          goto LABEL_15;
        case 245:
          if ((sub_1000145F8(a1, "prefetchReads", (uint64_t)v8, 8u, 1u) & 1) != 0)
            goto LABEL_16;
          v19 = "ASPFTLParseBufferToCxt: prefetchReads(245) cannot add 1 element to context";
          goto LABEL_15;
        case 246:
          if ((sub_1000145F8(a1, "prefetchHits", (uint64_t)v8, 8u, 1u) & 1) != 0)
            goto LABEL_16;
          v19 = "ASPFTLParseBufferToCxt: prefetchHits(246) cannot add 1 element to context";
          goto LABEL_15;
        case 247:
          if ((sub_1000145F8(a1, "prefetchWritesInvalidation", (uint64_t)v8, 8u, 1u) & 1) != 0)
            goto LABEL_16;
          v19 = "ASPFTLParseBufferToCxt: prefetchWritesInvalidation(247) cannot add 1 element to context";
          goto LABEL_15;
        case 248:
          if ((sub_1000145F8(a1, "indmbUnitsTotal", (uint64_t)v8, 8u, 1u) & 1) != 0)
            goto LABEL_16;
          v19 = "ASPFTLParseBufferToCxt: indmbUnitsTotal(248) cannot add 1 element to context";
          goto LABEL_15;
        case 249:
          if ((sub_1000145F8(a1, "selfThrottlingEngage", (uint64_t)v8, 8u, 1u) & 1) != 0)
            goto LABEL_16;
          v19 = "ASPFTLParseBufferToCxt: selfThrottlingEngage(249) cannot add 1 element to context";
          goto LABEL_15;
        case 250:
          if ((sub_1000145F8(a1, "selfThrottlingDisengage", (uint64_t)v8, 8u, 1u) & 1) != 0)
            goto LABEL_16;
          v19 = "ASPFTLParseBufferToCxt: selfThrottlingDisengage(250) cannot add 1 element to context";
          goto LABEL_15;
        case 252:
          if ((sub_1000145F8(a1, "AbortSkip_WlpMode", (uint64_t)v8, 8u, 1u) & 1) != 0)
            goto LABEL_16;
          v19 = "ASPFTLParseBufferToCxt: AbortSkip_WlpMode(252) cannot add 1 element to context";
          goto LABEL_15;
        case 253:
          if ((sub_1000145F8(a1, "hostWritesWlpMode", (uint64_t)v8, 8u, 1u) & 1) != 0)
            goto LABEL_16;
          v19 = "ASPFTLParseBufferToCxt: hostWritesWlpMode(253) cannot add 1 element to context";
          goto LABEL_15;
        case 254:
          if ((sub_1000145F8(a1, "numClogDoubleUnc", (uint64_t)v8, 8u, 1u) & 1) != 0)
            goto LABEL_16;
          v19 = "ASPFTLParseBufferToCxt: numClogDoubleUnc(254) cannot add 1 element to context";
          goto LABEL_15;
        case 256:
          if ((sub_1000145F8(a1, "AbortPad_WlpMode", (uint64_t)v8, 8u, 1u) & 1) != 0)
            goto LABEL_16;
          v19 = "ASPFTLParseBufferToCxt: AbortPad_WlpMode(256) cannot add 1 element to context";
          goto LABEL_15;
        case 257:
          if ((sub_1000145F8(a1, "bonfireIntermediateBandErases", (uint64_t)v8, 8u, 1u) & 1) != 0)
            goto LABEL_16;
          v19 = "ASPFTLParseBufferToCxt: bonfireIntermediateBandErases(257) cannot add 1 element to context";
          goto LABEL_15;
        case 258:
          if ((sub_1000145F8(a1, "bonfireUserBandErases", (uint64_t)v8, 8u, 1u) & 1) != 0)
            goto LABEL_16;
          v19 = "ASPFTLParseBufferToCxt: bonfireUserBandErases(258) cannot add 1 element to context";
          goto LABEL_15;
        case 259:
          if ((sub_1000145F8(a1, "bonfireIntermediateBandProgs", (uint64_t)v8, 8u, 1u) & 1) != 0)
            goto LABEL_16;
          v19 = "ASPFTLParseBufferToCxt: bonfireIntermediateBandProgs(259) cannot add 1 element to context";
          goto LABEL_15;
        case 260:
          if ((sub_1000145F8(a1, "bonfireUserBandProgs", (uint64_t)v8, 8u, 1u) & 1) != 0)
            goto LABEL_16;
          v19 = "ASPFTLParseBufferToCxt: bonfireUserBandProgs(260) cannot add 1 element to context";
          goto LABEL_15;
        case 261:
          if ((sub_1000145F8(a1, "bonfireIntermediatePageReads", (uint64_t)v8, 8u, 1u) & 1) != 0)
            goto LABEL_16;
          v19 = "ASPFTLParseBufferToCxt: bonfireIntermediatePageReads(261) cannot add 1 element to context";
          goto LABEL_15;
        case 262:
          if ((sub_1000145F8(a1, "bonfireUserPageReads", (uint64_t)v8, 8u, 1u) & 1) != 0)
            goto LABEL_16;
          v19 = "ASPFTLParseBufferToCxt: bonfireUserPageReads(262) cannot add 1 element to context";
          goto LABEL_15;
        case 263:
          if ((sub_1000145F8(a1, "refreshUtil00", (uint64_t)v8, 8u, 1u) & 1) != 0)
            goto LABEL_16;
          v19 = "ASPFTLParseBufferToCxt: refreshUtil00(263) cannot add 1 element to context";
          goto LABEL_15;
        case 264:
          if ((sub_1000145F8(a1, "failToReadUtil00", (uint64_t)v8, 8u, 1u) & 1) != 0)
            goto LABEL_16;
          v19 = "ASPFTLParseBufferToCxt: failToReadUtil00(264) cannot add 1 element to context";
          goto LABEL_15;
        case 265:
          if ((_DWORD)v14 != 5)
            sub_10001B514("ASPFTLParseBufferToCxt: readCountHisto(265): (#5) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
          if (v14 >= 5)
            v20 = 5;
          else
            v20 = v14;
          if ((sub_1000145F8(a1, "readCountHisto_", (uint64_t)v8, 8u, v20) & 1) != 0)
            goto LABEL_14;
          v22 = "ASPFTLParseBufferToCxt: readCountHisto(265): Cannot add 5 elements to context";
          goto LABEL_2228;
        case 266:
          if ((_DWORD)v14 != 16)
            sub_10001B514("ASPFTLParseBufferToCxt: readAmpHisto(266): (#16) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
          if (v14 >= 0x10)
            v20 = 16;
          else
            v20 = v14;
          if ((sub_1000145F8(a1, "readAmpHisto_", (uint64_t)v8, 8u, v20) & 1) != 0)
            goto LABEL_14;
          v22 = "ASPFTLParseBufferToCxt: readAmpHisto(266): Cannot add 16 elements to context";
          goto LABEL_2228;
        case 267:
          if ((sub_1000145F8(a1, "totalReadAmp", (uint64_t)v8, 8u, 1u) & 1) != 0)
            goto LABEL_16;
          v19 = "ASPFTLParseBufferToCxt: totalReadAmp(267) cannot add 1 element to context";
          goto LABEL_15;
        case 268:
          if ((_DWORD)v14 != 4)
            sub_10001B514("ASPFTLParseBufferToCxt: nvmeModeSelect(268): (#4) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
          if (v14 >= 4)
            v20 = 4;
          else
            v20 = v14;
          if ((sub_1000145F8(a1, "nvmeModeSelect_", (uint64_t)v8, 8u, v20) & 1) != 0)
            goto LABEL_14;
          v22 = "ASPFTLParseBufferToCxt: nvmeModeSelect(268): Cannot add 4 elements to context";
          goto LABEL_2228;
        case 269:
          if ((_DWORD)v14 != 8)
            sub_10001B514("ASPFTLParseBufferToCxt: numBootBlockRefreshSuccess(269): (#8) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
          if (v14 >= 8)
            v20 = 8;
          else
            v20 = v14;
          if ((sub_1000145F8(a1, "numBootBlockRefreshSuccess_", (uint64_t)v8, 8u, v20) & 1) != 0)
            goto LABEL_14;
          v22 = "ASPFTLParseBufferToCxt: numBootBlockRefreshSuccess(269): Cannot add 8 elements to context";
          goto LABEL_2228;
        case 270:
          if ((_DWORD)v14 != 8)
            sub_10001B514("ASPFTLParseBufferToCxt: numBootBlockRefreshFail(270): (#8) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
          if (v14 >= 8)
            v20 = 8;
          else
            v20 = v14;
          if ((sub_1000145F8(a1, "numBootBlockRefreshFail_", (uint64_t)v8, 8u, v20) & 1) != 0)
            goto LABEL_14;
          v22 = "ASPFTLParseBufferToCxt: numBootBlockRefreshFail(270): Cannot add 8 elements to context";
          goto LABEL_2228;
        case 271:
          if ((sub_1000145F8(a1, "numUnsupportedAsi", (uint64_t)v8, 8u, 1u) & 1) != 0)
            goto LABEL_16;
          v19 = "ASPFTLParseBufferToCxt: numUnsupportedAsi(271) cannot add 1 element to context";
          goto LABEL_15;
        case 272:
          if ((sub_1000145F8(a1, "NumTerminatedProgramSegs", (uint64_t)v8, 8u, 1u) & 1) != 0)
            goto LABEL_16;
          v19 = "ASPFTLParseBufferToCxt: NumTerminatedProgramSegs(272) cannot add 1 element to context";
          goto LABEL_15;
        case 273:
          if ((sub_1000145F8(a1, "indParityPagesDrops", (uint64_t)v8, 8u, 1u) & 1) != 0)
            goto LABEL_16;
          v19 = "ASPFTLParseBufferToCxt: indParityPagesDrops(273) cannot add 1 element to context";
          goto LABEL_15;
        case 274:
          if ((sub_1000145F8(a1, "indFlowPrograms", (uint64_t)v8, 8u, 1u) & 1) != 0)
            goto LABEL_16;
          v19 = "ASPFTLParseBufferToCxt: indFlowPrograms(274) cannot add 1 element to context";
          goto LABEL_15;
        case 277:
          if ((_DWORD)v14 != 4)
            sub_10001B514("ASPFTLParseBufferToCxt: powerBudgetSelect(277): (#4) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
          if (v14 >= 4)
            v20 = 4;
          else
            v20 = v14;
          if ((sub_1000145F8(a1, "powerBudgetSelect_", (uint64_t)v8, 8u, v20) & 1) != 0)
            goto LABEL_14;
          v22 = "ASPFTLParseBufferToCxt: powerBudgetSelect(277): Cannot add 4 elements to context";
          goto LABEL_2228;
        case 279:
          if ((sub_1000145F8(a1, "RxBurnNandWrites", (uint64_t)v8, 8u, 1u) & 1) != 0)
            goto LABEL_16;
          v19 = "ASPFTLParseBufferToCxt: RxBurnNandWrites(279) cannot add 1 element to context";
          goto LABEL_15;
        case 280:
          if ((_DWORD)v14 != 12)
            sub_10001B514("ASPFTLParseBufferToCxt: E2EDPErrorCounters(280): (#12) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
          if (v14 >= 0xC)
            v20 = 12;
          else
            v20 = v14;
          if ((sub_1000145F8(a1, "E2EDPErrorCounters_", (uint64_t)v8, 8u, v20) & 1) != 0)
            goto LABEL_14;
          v22 = "ASPFTLParseBufferToCxt: E2EDPErrorCounters(280): Cannot add 12 elements to context";
          goto LABEL_2228;
        case 281:
          if ((sub_1000145F8(a1, "wcacheSectorsMax", (uint64_t)v8, 8u, 1u) & 1) != 0)
            goto LABEL_16;
          v19 = "ASPFTLParseBufferToCxt: wcacheSectorsMax(281) cannot add 1 element to context";
          goto LABEL_15;
        case 282:
          if ((sub_1000145F8(a1, "wcacheSectorsMin", (uint64_t)v8, 8u, 1u) & 1) != 0)
            goto LABEL_16;
          v19 = "ASPFTLParseBufferToCxt: wcacheSectorsMin(282) cannot add 1 element to context";
          goto LABEL_15;
        case 283:
          if ((sub_1000145F8(a1, "wcacheSectorsCur", (uint64_t)v8, 8u, 1u) & 1) != 0)
            goto LABEL_16;
          v19 = "ASPFTLParseBufferToCxt: wcacheSectorsCur(283) cannot add 1 element to context";
          goto LABEL_15;
        case 284:
          if ((sub_1000145F8(a1, "wcacheDS_SectorsMax", (uint64_t)v8, 8u, 1u) & 1) != 0)
            goto LABEL_16;
          v19 = "ASPFTLParseBufferToCxt: wcacheDS_SectorsMax(284) cannot add 1 element to context";
          goto LABEL_15;
        case 285:
          if ((sub_1000145F8(a1, "wcacheDS_SectorsMin", (uint64_t)v8, 8u, 1u) & 1) != 0)
            goto LABEL_16;
          v19 = "ASPFTLParseBufferToCxt: wcacheDS_SectorsMin(285) cannot add 1 element to context";
          goto LABEL_15;
        case 286:
          if ((sub_1000145F8(a1, "wcacheDS_SectorsCur", (uint64_t)v8, 8u, 1u) & 1) != 0)
            goto LABEL_16;
          v19 = "ASPFTLParseBufferToCxt: wcacheDS_SectorsCur(286) cannot add 1 element to context";
          goto LABEL_15;
        case 287:
          if ((sub_1000145F8(a1, "wcacheFS_Reads", (uint64_t)v8, 8u, 1u) & 1) != 0)
            goto LABEL_16;
          v19 = "ASPFTLParseBufferToCxt: wcacheFS_Reads(287) cannot add 1 element to context";
          goto LABEL_15;
        case 288:
          if ((sub_1000145F8(a1, "wcacheDS_Reads", (uint64_t)v8, 8u, 1u) & 1) != 0)
            goto LABEL_16;
          v19 = "ASPFTLParseBufferToCxt: wcacheDS_Reads(288) cannot add 1 element to context";
          goto LABEL_15;
        case 289:
          if ((_DWORD)v14 != 32)
            sub_10001B514("ASPFTLParseBufferToCxt: mspBootBlockReadFail(289): (#32) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
          if (v14 >= 0x20)
            v20 = 32;
          else
            v20 = v14;
          if ((sub_1000145F8(a1, "mspBootBlockReadFail_", (uint64_t)v8, 8u, v20) & 1) != 0)
            goto LABEL_14;
          v22 = "ASPFTLParseBufferToCxt: mspBootBlockReadFail(289): Cannot add 32 elements to context";
          goto LABEL_2228;
        case 290:
          if ((_DWORD)v14 != 32)
            sub_10001B514("ASPFTLParseBufferToCxt: mspBootBlockProgFail(290): (#32) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
          if (v14 >= 0x20)
            v20 = 32;
          else
            v20 = v14;
          if ((sub_1000145F8(a1, "mspBootBlockProgFail_", (uint64_t)v8, 8u, v20) & 1) != 0)
            goto LABEL_14;
          v22 = "ASPFTLParseBufferToCxt: mspBootBlockProgFail(290): Cannot add 32 elements to context";
          goto LABEL_2228;
        case 291:
          if ((_DWORD)v14 != 32)
            sub_10001B514("ASPFTLParseBufferToCxt: mspBootBlockEraseFail(291): (#32) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
          if (v14 >= 0x20)
            v20 = 32;
          else
            v20 = v14;
          if ((sub_1000145F8(a1, "mspBootBlockEraseFail_", (uint64_t)v8, 8u, v20) & 1) != 0)
            goto LABEL_14;
          v22 = "ASPFTLParseBufferToCxt: mspBootBlockEraseFail(291): Cannot add 32 elements to context";
          goto LABEL_2228;
        case 292:
          if ((sub_1000145F8(a1, "bandsRefreshedOnError", (uint64_t)v8, 8u, 1u) & 1) != 0)
            goto LABEL_16;
          v19 = "ASPFTLParseBufferToCxt: bandsRefreshedOnError(292) cannot add 1 element to context";
          goto LABEL_15;
        default:
          switch(v12)
          {
            case 298:
              if ((_DWORD)v14 != 2)
                sub_10001B514("ASPFTLParseBufferToCxt: perHostReads(298): (#2) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
              if (v14 >= 2)
                v20 = 2;
              else
                v20 = v14;
              if ((sub_1000145F8(a1, "perHostReads_", (uint64_t)v8, 8u, v20) & 1) != 0)
                goto LABEL_14;
              v22 = "ASPFTLParseBufferToCxt: perHostReads(298): Cannot add 2 elements to context";
              goto LABEL_2228;
            case 299:
              if ((_DWORD)v14 != 2)
                sub_10001B514("ASPFTLParseBufferToCxt: perHostReadXacts(299): (#2) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
              if (v14 >= 2)
                v20 = 2;
              else
                v20 = v14;
              if ((sub_1000145F8(a1, "perHostReadXacts_", (uint64_t)v8, 8u, v20) & 1) != 0)
                goto LABEL_14;
              v22 = "ASPFTLParseBufferToCxt: perHostReadXacts(299): Cannot add 2 elements to context";
              goto LABEL_2228;
            case 300:
              if ((_DWORD)v14 != 2)
                sub_10001B514("ASPFTLParseBufferToCxt: perHostWrites(300): (#2) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
              if (v14 >= 2)
                v20 = 2;
              else
                v20 = v14;
              if ((sub_1000145F8(a1, "perHostWrites_", (uint64_t)v8, 8u, v20) & 1) != 0)
                goto LABEL_14;
              v22 = "ASPFTLParseBufferToCxt: perHostWrites(300): Cannot add 2 elements to context";
              goto LABEL_2228;
            case 301:
              if ((_DWORD)v14 != 2)
                sub_10001B514("ASPFTLParseBufferToCxt: perHostWriteXacts(301): (#2) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
              if (v14 >= 2)
                v20 = 2;
              else
                v20 = v14;
              if ((sub_1000145F8(a1, "perHostWriteXacts_", (uint64_t)v8, 8u, v20) & 1) != 0)
                goto LABEL_14;
              v22 = "ASPFTLParseBufferToCxt: perHostWriteXacts(301): Cannot add 2 elements to context";
              goto LABEL_2228;
            case 302:
              if ((_DWORD)v14 != 2)
                sub_10001B514("ASPFTLParseBufferToCxt: perHostNumFlushes(302): (#2) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
              if (v14 >= 2)
                v20 = 2;
              else
                v20 = v14;
              if ((sub_1000145F8(a1, "perHostNumFlushes_", (uint64_t)v8, 8u, v20) & 1) != 0)
                goto LABEL_14;
              v22 = "ASPFTLParseBufferToCxt: perHostNumFlushes(302): Cannot add 2 elements to context";
              goto LABEL_2228;
            case 303:
              if ((_DWORD)v14 != 2)
                sub_10001B514("ASPFTLParseBufferToCxt: perHostNumFences(303): (#2) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
              if (v14 >= 2)
                v20 = 2;
              else
                v20 = v14;
              if ((sub_1000145F8(a1, "perHostNumFences_", (uint64_t)v8, 8u, v20) & 1) != 0)
                goto LABEL_14;
              v22 = "ASPFTLParseBufferToCxt: perHostNumFences(303): Cannot add 2 elements to context";
              goto LABEL_2228;
            case 304:
              if ((_DWORD)v14 != 10)
                sub_10001B514("ASPFTLParseBufferToCxt: commitPadSectorsPerFlow(304): (#10) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
              if (v14 >= 0xA)
                v20 = 10;
              else
                v20 = v14;
              if ((sub_1000145F8(a1, "commitPadSectorsPerFlow_", (uint64_t)v8, 8u, v20) & 1) != 0)
                goto LABEL_14;
              v22 = "ASPFTLParseBufferToCxt: commitPadSectorsPerFlow(304): Cannot add 10 elements to context";
              goto LABEL_2228;
            case 305:
              if ((_DWORD)v14 != 10)
                sub_10001B514("ASPFTLParseBufferToCxt: wcacheDSOverWrLogSizeCnts(305): (#10) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
              if (v14 >= 0xA)
                v20 = 10;
              else
                v20 = v14;
              if ((sub_1000145F8(a1, "wcacheDSOverWrLogSizeCnts_", (uint64_t)v8, 8u, v20) & 1) != 0)
                goto LABEL_14;
              v22 = "ASPFTLParseBufferToCxt: wcacheDSOverWrLogSizeCnts(305): Cannot add 10 elements to context";
              goto LABEL_2228;
            case 306:
              if ((_DWORD)v14 != 4)
                sub_10001B514("ASPFTLParseBufferToCxt: wcacheDSOverWrSizeByFlow(306): (#4) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
              if (v14 >= 4)
                v20 = 4;
              else
                v20 = v14;
              if ((sub_1000145F8(a1, "wcacheDSOverWrSizeByFlow_", (uint64_t)v8, 8u, v20) & 1) != 0)
                goto LABEL_14;
              v22 = "ASPFTLParseBufferToCxt: wcacheDSOverWrSizeByFlow(306): Cannot add 4 elements to context";
              goto LABEL_2228;
            case 307:
              if ((_DWORD)v14 != 10)
                sub_10001B514("ASPFTLParseBufferToCxt: CmdRaisePrioiryEvents(307): (#10) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
              if (v14 >= 0xA)
                v20 = 10;
              else
                v20 = v14;
              if ((sub_1000145F8(a1, "CmdRaisePrioiryEvents_", (uint64_t)v8, 8u, v20) & 1) != 0)
                goto LABEL_14;
              v22 = "ASPFTLParseBufferToCxt: CmdRaisePrioiryEvents(307): Cannot add 10 elements to context";
              goto LABEL_2228;
            case 308:
              if ((sub_1000145F8(a1, "utilNumVerification", (uint64_t)v8, 8u, 1u) & 1) != 0)
                goto LABEL_16;
              v19 = "ASPFTLParseBufferToCxt: utilNumVerification(308) cannot add 1 element to context";
              goto LABEL_15;
            case 309:
              if ((sub_1000145F8(a1, "utilRefreshes", (uint64_t)v8, 8u, 1u) & 1) != 0)
                goto LABEL_16;
              v19 = "ASPFTLParseBufferToCxt: utilRefreshes(309) cannot add 1 element to context";
              goto LABEL_15;
            case 310:
              if ((sub_1000145F8(a1, "utilBDRErrors", (uint64_t)v8, 8u, 1u) & 1) != 0)
                goto LABEL_16;
              v19 = "ASPFTLParseBufferToCxt: utilBDRErrors(310) cannot add 1 element to context";
              goto LABEL_15;
            case 311:
              if ((sub_1000145F8(a1, "indBandsPerFlow", (uint64_t)v8, 8u, 1u) & 1) != 0)
                goto LABEL_16;
              v19 = "ASPFTLParseBufferToCxt: indBandsPerFlow(311) cannot add 1 element to context";
              goto LABEL_15;
            case 312:
              if ((sub_1000145F8(a1, "secsPerIndFlow", (uint64_t)v8, 8u, 1u) & 1) != 0)
                goto LABEL_16;
              v19 = "ASPFTLParseBufferToCxt: secsPerIndFlow(312) cannot add 1 element to context";
              goto LABEL_15;
            case 313:
              if ((sub_1000145F8(a1, "indDecodedECC", (uint64_t)v8, 8u, 1u) & 1) != 0)
                goto LABEL_16;
              v19 = "ASPFTLParseBufferToCxt: indDecodedECC(313) cannot add 1 element to context";
              goto LABEL_15;
            case 314:
              if ((_DWORD)v14 != 8)
                sub_10001B514("ASPFTLParseBufferToCxt: numBootBlockValidateSuccess(314): (#8) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
              if (v14 >= 8)
                v20 = 8;
              else
                v20 = v14;
              if ((sub_1000145F8(a1, "numBootBlockValidateSuccess_", (uint64_t)v8, 8u, v20) & 1) != 0)
                goto LABEL_14;
              v22 = "ASPFTLParseBufferToCxt: numBootBlockValidateSuccess(314): Cannot add 8 elements to context";
              goto LABEL_2228;
            case 315:
              if ((_DWORD)v14 != 8)
                sub_10001B514("ASPFTLParseBufferToCxt: numBootBlockValidateFail(315): (#8) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
              if (v14 >= 8)
                v20 = 8;
              else
                v20 = v14;
              if ((sub_1000145F8(a1, "numBootBlockValidateFail_", (uint64_t)v8, 8u, v20) & 1) != 0)
                goto LABEL_14;
              v22 = "ASPFTLParseBufferToCxt: numBootBlockValidateFail(315): Cannot add 8 elements to context";
              goto LABEL_2228;
            case 316:
              if ((_DWORD)v14 != 4)
                sub_10001B514("ASPFTLParseBufferToCxt: clogPagesFillingPercentage(316): (#4) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
              if (v14 >= 4)
                v20 = 4;
              else
                v20 = v14;
              if ((sub_1000145F8(a1, "clogPagesFillingPercentage_", (uint64_t)v8, 8u, v20) & 1) != 0)
                goto LABEL_14;
              v22 = "ASPFTLParseBufferToCxt: clogPagesFillingPercentage(316): Cannot add 4 elements to context";
              goto LABEL_2228;
            case 317:
              if ((sub_1000145F8(a1, "bdrCalTimeAccFactor", (uint64_t)v8, 8u, 1u) & 1) != 0)
                goto LABEL_16;
              v19 = "ASPFTLParseBufferToCxt: bdrCalTimeAccFactor(317) cannot add 1 element to context";
              goto LABEL_15;
            case 318:
              if ((sub_1000145F8(a1, "bootChainRdError", (uint64_t)v8, 8u, 1u) & 1) != 0)
                goto LABEL_16;
              v19 = "ASPFTLParseBufferToCxt: bootChainRdError(318) cannot add 1 element to context";
              goto LABEL_15;
            case 319:
              if ((sub_1000145F8(a1, "bootChainBlankError", (uint64_t)v8, 8u, 1u) & 1) != 0)
                goto LABEL_16;
              v19 = "ASPFTLParseBufferToCxt: bootChainBlankError(319) cannot add 1 element to context";
              goto LABEL_15;
            case 320:
              if ((sub_1000145F8(a1, "bootChainRefreshError", (uint64_t)v8, 8u, 1u) & 1) != 0)
                goto LABEL_16;
              v19 = "ASPFTLParseBufferToCxt: bootChainRefreshError(320) cannot add 1 element to context";
              goto LABEL_15;
            case 321:
              if ((sub_1000145F8(a1, "bootChainVersionError", (uint64_t)v8, 8u, 1u) & 1) != 0)
                goto LABEL_16;
              v19 = "ASPFTLParseBufferToCxt: bootChainVersionError(321) cannot add 1 element to context";
              goto LABEL_15;
            case 322:
              if ((sub_1000145F8(a1, "mspBootBlockMismatch", (uint64_t)v8, 8u, 1u) & 1) != 0)
                goto LABEL_16;
              v19 = "ASPFTLParseBufferToCxt: mspBootBlockMismatch(322) cannot add 1 element to context";
              goto LABEL_15;
            case 323:
              if ((sub_1000145F8(a1, "mspBootBlockMismatchErr", (uint64_t)v8, 8u, 1u) & 1) != 0)
                goto LABEL_16;
              v19 = "ASPFTLParseBufferToCxt: mspBootBlockMismatchErr(323) cannot add 1 element to context";
              goto LABEL_15;
            case 324:
              if ((_DWORD)v14 != 5)
                sub_10001B514("ASPFTLParseBufferToCxt: bitflipAddr(324): (#5) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
              if (v14 >= 5)
                v20 = 5;
              else
                v20 = v14;
              if ((sub_1000145F8(a1, "bitflipAddr_", (uint64_t)v8, 8u, v20) & 1) != 0)
                goto LABEL_14;
              v22 = "ASPFTLParseBufferToCxt: bitflipAddr(324): Cannot add 5 elements to context";
              goto LABEL_2228;
            case 325:
              if ((_DWORD)v14 != 5)
                sub_10001B514("ASPFTLParseBufferToCxt: bitflipCount(325): (#5) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
              if (v14 >= 5)
                v20 = 5;
              else
                v20 = v14;
              if ((sub_1000145F8(a1, "bitflipCount_", (uint64_t)v8, 8u, v20) & 1) != 0)
                goto LABEL_14;
              v22 = "ASPFTLParseBufferToCxt: bitflipCount(325): Cannot add 5 elements to context";
              goto LABEL_2228;
            case 326:
              if ((_DWORD)v14 != 5)
                sub_10001B514("ASPFTLParseBufferToCxt: bitflipDupes(326): (#5) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
              if (v14 >= 5)
                v20 = 5;
              else
                v20 = v14;
              if ((sub_1000145F8(a1, "bitflipDupes_", (uint64_t)v8, 8u, v20) & 1) != 0)
                goto LABEL_14;
              v22 = "ASPFTLParseBufferToCxt: bitflipDupes(326): Cannot add 5 elements to context";
              goto LABEL_2228;
            case 327:
              if ((_DWORD)v14 != 22)
                sub_10001B514("ASPFTLParseBufferToCxt: bandsMaxTempHisto(327): (#22) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
              if (v14 >= 0x16)
                v20 = 22;
              else
                v20 = v14;
              if ((sub_1000145F8(a1, "bandsMaxTempHisto_", (uint64_t)v8, 8u, v20) & 1) != 0)
                goto LABEL_14;
              v22 = "ASPFTLParseBufferToCxt: bandsMaxTempHisto(327): Cannot add 22 elements to context";
              goto LABEL_2228;
            case 328:
              if ((_DWORD)v14 != 22)
                sub_10001B514("ASPFTLParseBufferToCxt: bandsMinTempHisto(328): (#22) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
              if (v14 >= 0x16)
                v20 = 22;
              else
                v20 = v14;
              if ((sub_1000145F8(a1, "bandsMinTempHisto_", (uint64_t)v8, 8u, v20) & 1) != 0)
                goto LABEL_14;
              v22 = "ASPFTLParseBufferToCxt: bandsMinTempHisto(328): Cannot add 22 elements to context";
              goto LABEL_2228;
            case 329:
              if ((_DWORD)v14 != 30)
                sub_10001B514("ASPFTLParseBufferToCxt: bandsLifeTimeTempHisto(329): (#30) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
              if (v14 >= 0x1E)
                v20 = 30;
              else
                v20 = v14;
              if ((sub_1000145F8(a1, "bandsLifeTimeTempHisto_", (uint64_t)v8, 8u, v20) & 1) != 0)
                goto LABEL_14;
              v22 = "ASPFTLParseBufferToCxt: bandsLifeTimeTempHisto(329): Cannot add 30 elements to context";
              goto LABEL_2228;
            case 330:
              if ((_DWORD)v14 != 22)
                sub_10001B514("ASPFTLParseBufferToCxt: bandsDeltaTempHisto(330): (#22) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
              if (v14 >= 0x16)
                v20 = 22;
              else
                v20 = v14;
              if ((sub_1000145F8(a1, "bandsDeltaTempHisto_", (uint64_t)v8, 8u, v20) & 1) != 0)
                goto LABEL_14;
              v22 = "ASPFTLParseBufferToCxt: bandsDeltaTempHisto(330): Cannot add 22 elements to context";
              goto LABEL_2228;
            case 331:
              if ((_DWORD)v14 != 45)
                sub_10001B514("ASPFTLParseBufferToCxt: bandsCrossTempHisto(331): (#45) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
              if (v14 >= 0x2D)
                v20 = 45;
              else
                v20 = v14;
              if ((sub_1000145F8(a1, "bandsCrossTempHisto_", (uint64_t)v8, 8u, v20) & 1) != 0)
                goto LABEL_14;
              v22 = "ASPFTLParseBufferToCxt: bandsCrossTempHisto(331): Cannot add 45 elements to context";
              goto LABEL_2228;
            case 332:
              if ((_DWORD)v14 != 10)
                sub_10001B514("ASPFTLParseBufferToCxt: wcacheWaitLogMs(332): (#10) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
              if (v14 >= 0xA)
                v20 = 10;
              else
                v20 = v14;
              if ((sub_1000145F8(a1, "wcacheWaitLogMs_", (uint64_t)v8, 8u, v20) & 1) != 0)
                goto LABEL_14;
              v22 = "ASPFTLParseBufferToCxt: wcacheWaitLogMs(332): Cannot add 10 elements to context";
              goto LABEL_2228;
            case 333:
              if ((_DWORD)v14 != 10)
                sub_10001B514("ASPFTLParseBufferToCxt: wcacheDS_segsSortedLogSize(333): (#10) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
              if (v14 >= 0xA)
                v20 = 10;
              else
                v20 = v14;
              if ((sub_1000145F8(a1, "wcacheDS_segsSortedLogSize_", (uint64_t)v8, 8u, v20) & 1) != 0)
                goto LABEL_14;
              v22 = "ASPFTLParseBufferToCxt: wcacheDS_segsSortedLogSize(333): Cannot add 10 elements to context";
              goto LABEL_2228;
            case 334:
              if ((sub_1000145F8(a1, "numFirmwareWrites", (uint64_t)v8, 8u, 1u) & 1) != 0)
                goto LABEL_16;
              v19 = "ASPFTLParseBufferToCxt: numFirmwareWrites(334) cannot add 1 element to context";
              goto LABEL_15;
            case 335:
              if ((sub_1000145F8(a1, "numBisWrites", (uint64_t)v8, 8u, 1u) & 1) != 0)
                goto LABEL_16;
              v19 = "ASPFTLParseBufferToCxt: numBisWrites(335) cannot add 1 element to context";
              goto LABEL_15;
            case 336:
              if ((sub_1000145F8(a1, "numBootChainUpdates", (uint64_t)v8, 8u, 1u) & 1) != 0)
                goto LABEL_16;
              v19 = "ASPFTLParseBufferToCxt: numBootChainUpdates(336) cannot add 1 element to context";
              goto LABEL_15;
            case 337:
              if ((sub_1000145F8(a1, "cntCalTimeWentBackWard", (uint64_t)v8, 8u, 1u) & 1) != 0)
                goto LABEL_16;
              v19 = "ASPFTLParseBufferToCxt: cntCalTimeWentBackWard(337) cannot add 1 element to context";
              goto LABEL_15;
            case 338:
              if ((sub_1000145F8(a1, "indBoRecoveries", (uint64_t)v8, 8u, 1u) & 1) != 0)
                goto LABEL_16;
              v19 = "ASPFTLParseBufferToCxt: indBoRecoveries(338) cannot add 1 element to context";
              goto LABEL_15;
            case 340:
              if ((sub_1000145F8(a1, "numCrossTempUecc", (uint64_t)v8, 8u, 1u) & 1) != 0)
                goto LABEL_16;
              v19 = "ASPFTLParseBufferToCxt: numCrossTempUecc(340) cannot add 1 element to context";
              goto LABEL_15;
            case 341:
              if ((sub_1000145F8(a1, "latencyMonitorError", (uint64_t)v8, 8u, 1u) & 1) != 0)
                goto LABEL_16;
              v19 = "ASPFTLParseBufferToCxt: latencyMonitorError(341) cannot add 1 element to context";
              goto LABEL_15;
            case 343:
              if ((sub_1000145F8(a1, "utilUeccReads", (uint64_t)v8, 8u, 1u) & 1) != 0)
                goto LABEL_16;
              v19 = "ASPFTLParseBufferToCxt: utilUeccReads(343) cannot add 1 element to context";
              goto LABEL_15;
            case 344:
              if ((sub_1000145F8(a1, "numOfAvoidedGCDueToTemp", (uint64_t)v8, 8u, 1u) & 1) != 0)
                goto LABEL_16;
              v19 = "ASPFTLParseBufferToCxt: numOfAvoidedGCDueToTemp(344) cannot add 1 element to context";
              goto LABEL_15;
            case 345:
              if ((sub_1000145F8(a1, "forceShutdowns", (uint64_t)v8, 8u, 1u) & 1) != 0)
                goto LABEL_16;
              v19 = "ASPFTLParseBufferToCxt: forceShutdowns(345) cannot add 1 element to context";
              goto LABEL_15;
            case 346:
              if ((sub_1000145F8(a1, "gcSlcDestinations", (uint64_t)v8, 8u, 1u) & 1) != 0)
                goto LABEL_16;
              v19 = "ASPFTLParseBufferToCxt: gcSlcDestinations(346) cannot add 1 element to context";
              goto LABEL_15;
            case 347:
              if ((sub_1000145F8(a1, "indReplayExtUsed", (uint64_t)v8, 8u, 1u) & 1) != 0)
                goto LABEL_16;
              v19 = "ASPFTLParseBufferToCxt: indReplayExtUsed(347) cannot add 1 element to context";
              goto LABEL_15;
            case 348:
              if ((sub_1000145F8(a1, "defectsPerPackageOverflow", (uint64_t)v8, 8u, 1u) & 1) != 0)
                goto LABEL_16;
              v19 = "ASPFTLParseBufferToCxt: defectsPerPackageOverflow(348) cannot add 1 element to context";
              goto LABEL_15;
            case 349:
              if ((sub_1000145F8(a1, "RxBurnIntBandsProgrammed", (uint64_t)v8, 8u, 1u) & 1) != 0)
                goto LABEL_16;
              v19 = "ASPFTLParseBufferToCxt: RxBurnIntBandsProgrammed(349) cannot add 1 element to context";
              goto LABEL_15;
            case 350:
              if ((sub_1000145F8(a1, "RxBurnUsrBandsProgrammed", (uint64_t)v8, 8u, 1u) & 1) != 0)
                goto LABEL_16;
              v19 = "ASPFTLParseBufferToCxt: RxBurnUsrBandsProgrammed(350) cannot add 1 element to context";
              goto LABEL_15;
            case 351:
              if ((sub_1000145F8(a1, "RxBurnIntNandWrites", (uint64_t)v8, 8u, 1u) & 1) != 0)
                goto LABEL_16;
              v19 = "ASPFTLParseBufferToCxt: RxBurnIntNandWrites(351) cannot add 1 element to context";
              goto LABEL_15;
            case 352:
              if ((sub_1000145F8(a1, "RxBurnUsrNandWrites", (uint64_t)v8, 8u, 1u) & 1) != 0)
                goto LABEL_16;
              v19 = "ASPFTLParseBufferToCxt: RxBurnUsrNandWrites(352) cannot add 1 element to context";
              goto LABEL_15;
            case 353:
              if ((sub_1000145F8(a1, "clogLastStripeUeccs", (uint64_t)v8, 8u, 1u) & 1) != 0)
                goto LABEL_16;
              v19 = "ASPFTLParseBufferToCxt: clogLastStripeUeccs(353) cannot add 1 element to context";
              goto LABEL_15;
            case 354:
              if ((sub_1000145F8(a1, "GC_MidDestSrcSwitchSLC2TLC", (uint64_t)v8, 8u, 1u) & 1) != 0)
                goto LABEL_16;
              v19 = "ASPFTLParseBufferToCxt: GC_MidDestSrcSwitchSLC2TLC(354) cannot add 1 element to context";
              goto LABEL_15;
            case 355:
              if ((sub_1000145F8(a1, "GC_MidDestSrcSwitchTLC2SLC", (uint64_t)v8, 8u, 1u) & 1) != 0)
                goto LABEL_16;
              v19 = "ASPFTLParseBufferToCxt: GC_MidDestSrcSwitchTLC2SLC(355) cannot add 1 element to context";
              goto LABEL_15;
            case 356:
              if ((sub_1000145F8(a1, "nvme_stats_shutdown_count_host0_normal", (uint64_t)v8, 8u, 1u) & 1) != 0)
                goto LABEL_16;
              v19 = "ASPFTLParseBufferToCxt: nvme_stats_shutdown_count_host0_normal(356) cannot add 1 element to context";
              goto LABEL_15;
            case 357:
              if ((sub_1000145F8(a1, "nvme_stats_shutdown_count_host1_normal", (uint64_t)v8, 8u, 1u) & 1) != 0)
                goto LABEL_16;
              v19 = "ASPFTLParseBufferToCxt: nvme_stats_shutdown_count_host1_normal(357) cannot add 1 element to context";
              goto LABEL_15;
            case 358:
              if ((sub_1000145F8(a1, "nvme_stats_shutdown_count_host0_s2r", (uint64_t)v8, 8u, 1u) & 1) != 0)
                goto LABEL_16;
              v19 = "ASPFTLParseBufferToCxt: nvme_stats_shutdown_count_host0_s2r(358) cannot add 1 element to context";
              goto LABEL_15;
            case 359:
              if ((sub_1000145F8(a1, "nvme_stats_shutdown_count_host1_s2r", (uint64_t)v8, 8u, 1u) & 1) != 0)
                goto LABEL_16;
              v19 = "ASPFTLParseBufferToCxt: nvme_stats_shutdown_count_host1_s2r(359) cannot add 1 element to context";
              goto LABEL_15;
            case 360:
              if ((_DWORD)v14 != 16)
                sub_10001B514("ASPFTLParseBufferToCxt: gcPDusterIntrSrcValidityHisto(360): (#16) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
              if (v14 >= 0x10)
                v20 = 16;
              else
                v20 = v14;
              if ((sub_1000145F8(a1, "gcPDusterIntrSrcValidityHisto_", (uint64_t)v8, 8u, v20) & 1) != 0)
                goto LABEL_14;
              v22 = "ASPFTLParseBufferToCxt: gcPDusterIntrSrcValidityHisto(360): Cannot add 16 elements to context";
              goto LABEL_2228;
            case 361:
              if ((_DWORD)v14 != 16)
                sub_10001B514("ASPFTLParseBufferToCxt: gcPDusterUserSrcValidityHisto(361): (#16) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
              if (v14 >= 0x10)
                v20 = 16;
              else
                v20 = v14;
              if ((sub_1000145F8(a1, "gcPDusterUserSrcValidityHisto_", (uint64_t)v8, 8u, v20) & 1) != 0)
                goto LABEL_14;
              v22 = "ASPFTLParseBufferToCxt: gcPDusterUserSrcValidityHisto(361): Cannot add 16 elements to context";
              goto LABEL_2228;
            case 362:
              if ((sub_1000145F8(a1, "raidFailedReadParity", (uint64_t)v8, 8u, 1u) & 1) != 0)
                goto LABEL_16;
              v19 = "ASPFTLParseBufferToCxt: raidFailedReadParity(362) cannot add 1 element to context";
              goto LABEL_15;
            case 364:
              if ((sub_1000145F8(a1, "lhotNumSkipes", (uint64_t)v8, 8u, 1u) & 1) != 0)
                goto LABEL_16;
              v19 = "ASPFTLParseBufferToCxt: lhotNumSkipes(364) cannot add 1 element to context";
              goto LABEL_15;
            default:
              switch(v12)
              {
                case 365:
                  if ((sub_1000145F8(a1, "lhotNumIsHotCalls", (uint64_t)v8, 8u, 1u) & 1) != 0)
                    goto LABEL_16;
                  v19 = "ASPFTLParseBufferToCxt: lhotNumIsHotCalls(365) cannot add 1 element to context";
                  goto LABEL_15;
                case 366:
                  if ((sub_1000145F8(a1, "lhotFullLap", (uint64_t)v8, 8u, 1u) & 1) != 0)
                    goto LABEL_16;
                  v19 = "ASPFTLParseBufferToCxt: lhotFullLap(366) cannot add 1 element to context";
                  goto LABEL_15;
                case 367:
                  if ((sub_1000145F8(a1, "lhotSkipPrecent", (uint64_t)v8, 8u, 1u) & 1) != 0)
                    goto LABEL_16;
                  v19 = "ASPFTLParseBufferToCxt: lhotSkipPrecent(367) cannot add 1 element to context";
                  goto LABEL_15;
                case 368:
                  if ((sub_1000145F8(a1, "eraseSuspendEvents", (uint64_t)v8, 8u, 1u) & 1) != 0)
                    goto LABEL_16;
                  v19 = "ASPFTLParseBufferToCxt: eraseSuspendEvents(368) cannot add 1 element to context";
                  goto LABEL_15;
                case 369:
                  if ((sub_1000145F8(a1, "eraseSuspendedStatuses", (uint64_t)v8, 8u, 1u) & 1) != 0)
                    goto LABEL_16;
                  v19 = "ASPFTLParseBufferToCxt: eraseSuspendedStatuses(369) cannot add 1 element to context";
                  goto LABEL_15;
                case 370:
                  if ((sub_1000145F8(a1, "eraseSuspendedBands", (uint64_t)v8, 8u, 1u) & 1) != 0)
                    goto LABEL_16;
                  v19 = "ASPFTLParseBufferToCxt: eraseSuspendedBands(370) cannot add 1 element to context";
                  goto LABEL_15;
                case 371:
                  if ((sub_1000145F8(a1, "eraseSuspendSituationsBelowThreshold", (uint64_t)v8, 8u, 1u) & 1) != 0)
                    goto LABEL_16;
                  v19 = "ASPFTLParseBufferToCxt: eraseSuspendSituationsBelowThreshold(371) cannot add 1 element to context";
                  goto LABEL_15;
                case 372:
                  if ((sub_1000145F8(a1, "eraseSuspendSituationsAboveThreshold", (uint64_t)v8, 8u, 1u) & 1) != 0)
                    goto LABEL_16;
                  v19 = "ASPFTLParseBufferToCxt: eraseSuspendSituationsAboveThreshold(372) cannot add 1 element to context";
                  goto LABEL_15;
                case 373:
                  if ((sub_1000145F8(a1, "eraseSuspendReadChainsProcessed", (uint64_t)v8, 8u, 1u) & 1) != 0)
                    goto LABEL_16;
                  v19 = "ASPFTLParseBufferToCxt: eraseSuspendReadChainsProcessed(373) cannot add 1 element to context";
                  goto LABEL_15;
                case 374:
                  if ((sub_1000145F8(a1, "bdrLastDoneHr", (uint64_t)v8, 8u, 1u) & 1) != 0)
                    goto LABEL_16;
                  v19 = "ASPFTLParseBufferToCxt: bdrLastDoneHr(374) cannot add 1 element to context";
                  goto LABEL_15;
                case 375:
                  if ((sub_1000145F8(a1, "bdrBackupThreshHrs", (uint64_t)v8, 8u, 1u) & 1) != 0)
                    goto LABEL_16;
                  v19 = "ASPFTLParseBufferToCxt: bdrBackupThreshHrs(375) cannot add 1 element to context";
                  goto LABEL_15;
                case 376:
                  if ((sub_1000145F8(a1, "clogPortableProgBufs", (uint64_t)v8, 8u, 1u) & 1) != 0)
                    goto LABEL_16;
                  v19 = "ASPFTLParseBufferToCxt: clogPortableProgBufs(376) cannot add 1 element to context";
                  goto LABEL_15;
                case 377:
                  if ((sub_1000145F8(a1, "clogPortableDropBufs", (uint64_t)v8, 8u, 1u) & 1) != 0)
                    goto LABEL_16;
                  v19 = "ASPFTLParseBufferToCxt: clogPortableDropBufs(377) cannot add 1 element to context";
                  goto LABEL_15;
                case 378:
                  if ((sub_1000145F8(a1, "clogPortablePadSectors", (uint64_t)v8, 8u, 1u) & 1) != 0)
                    goto LABEL_16;
                  v19 = "ASPFTLParseBufferToCxt: clogPortablePadSectors(378) cannot add 1 element to context";
                  goto LABEL_15;
                case 379:
                  if ((sub_1000145F8(a1, "numRetiredBlocks", (uint64_t)v8, 8u, 1u) & 1) != 0)
                    goto LABEL_16;
                  v19 = "ASPFTLParseBufferToCxt: numRetiredBlocks(379) cannot add 1 element to context";
                  goto LABEL_15;
                case 381:
                  if ((sub_1000145F8(a1, "numRefreshOnErrNandRefreshPerf", (uint64_t)v8, 8u, 1u) & 1) != 0)
                    goto LABEL_16;
                  v19 = "ASPFTLParseBufferToCxt: numRefreshOnErrNandRefreshPerf(381) cannot add 1 element to context";
                  goto LABEL_15;
                case 382:
                  if ((sub_1000145F8(a1, "raidReconstructReads", (uint64_t)v8, 8u, 1u) & 1) != 0)
                    goto LABEL_16;
                  v19 = "ASPFTLParseBufferToCxt: raidReconstructReads(382) cannot add 1 element to context";
                  goto LABEL_15;
                case 383:
                  if ((sub_1000145F8(a1, "gcReadsNoBlog", (uint64_t)v8, 8u, 1u) & 1) != 0)
                    goto LABEL_16;
                  v19 = "ASPFTLParseBufferToCxt: gcReadsNoBlog(383) cannot add 1 element to context";
                  goto LABEL_15;
                case 384:
                  if ((sub_1000145F8(a1, "AbortSkip_MPBXReadVerifyClosedBand", (uint64_t)v8, 8u, 1u) & 1) != 0)
                    goto LABEL_16;
                  v19 = "ASPFTLParseBufferToCxt: AbortSkip_MPBXReadVerifyClosedBand(384) cannot add 1 element to context";
                  goto LABEL_15;
                case 385:
                  if ((sub_1000145F8(a1, "openBandReadFail", (uint64_t)v8, 8u, 1u) & 1) != 0)
                    goto LABEL_16;
                  v19 = "ASPFTLParseBufferToCxt: openBandReadFail(385) cannot add 1 element to context";
                  goto LABEL_15;
                case 386:
                  if ((sub_1000145F8(a1, "AbortSkip_MPBXReadVerifyOpenBand", (uint64_t)v8, 8u, 1u) & 1) != 0)
                    goto LABEL_16;
                  v19 = "ASPFTLParseBufferToCxt: AbortSkip_MPBXReadVerifyOpenBand(386) cannot add 1 element to context";
                  goto LABEL_15;
                case 387:
                  if ((sub_1000145F8(a1, "AbortSkip_MBPXFailedRebuildingParity", (uint64_t)v8, 8u, 1u) & 1) != 0)
                    goto LABEL_16;
                  v19 = "ASPFTLParseBufferToCxt: AbortSkip_MBPXFailedRebuildingParity(387) cannot add 1 element to context";
                  goto LABEL_15;
                case 388:
                  if ((sub_1000145F8(a1, "raidSuccessfulPMXReconstructionInternal", (uint64_t)v8, 8u, 1u) & 1) != 0)
                    goto LABEL_16;
                  v19 = "ASPFTLParseBufferToCxt: raidSuccessfulPMXReconstructionInternal(388) cannot add 1 element to context";
                  goto LABEL_15;
                case 389:
                  if ((sub_1000145F8(a1, "raidSuccessfulPMXReconstructionHost", (uint64_t)v8, 8u, 1u) & 1) != 0)
                    goto LABEL_16;
                  v19 = "ASPFTLParseBufferToCxt: raidSuccessfulPMXReconstructionHost(389) cannot add 1 element to context";
                  goto LABEL_15;
                case 390:
                  if ((sub_1000145F8(a1, "raidFailedPMXReconstructionInternal", (uint64_t)v8, 8u, 1u) & 1) != 0)
                    goto LABEL_16;
                  v19 = "ASPFTLParseBufferToCxt: raidFailedPMXReconstructionInternal(390) cannot add 1 element to context";
                  goto LABEL_15;
                case 391:
                  if ((sub_1000145F8(a1, "raidFailedPMXReconstructionHost", (uint64_t)v8, 8u, 1u) & 1) != 0)
                    goto LABEL_16;
                  v19 = "ASPFTLParseBufferToCxt: raidFailedPMXReconstructionHost(391) cannot add 1 element to context";
                  goto LABEL_15;
                case 392:
                  if ((sub_1000145F8(a1, "raidSuccessfulRMXReconstructionInternal", (uint64_t)v8, 8u, 1u) & 1) != 0)
                    goto LABEL_16;
                  v19 = "ASPFTLParseBufferToCxt: raidSuccessfulRMXReconstructionInternal(392) cannot add 1 element to context";
                  goto LABEL_15;
                case 393:
                  if ((sub_1000145F8(a1, "raidSuccessfulRMXReconstructionHost", (uint64_t)v8, 8u, 1u) & 1) != 0)
                    goto LABEL_16;
                  v19 = "ASPFTLParseBufferToCxt: raidSuccessfulRMXReconstructionHost(393) cannot add 1 element to context";
                  goto LABEL_15;
                case 394:
                  if ((sub_1000145F8(a1, "raidFailedRMXReconstructionInternal", (uint64_t)v8, 8u, 1u) & 1) != 0)
                    goto LABEL_16;
                  v19 = "ASPFTLParseBufferToCxt: raidFailedRMXReconstructionInternal(394) cannot add 1 element to context";
                  goto LABEL_15;
                case 395:
                  if ((sub_1000145F8(a1, "raidFailedRMXReconstructionHost", (uint64_t)v8, 8u, 1u) & 1) != 0)
                    goto LABEL_16;
                  v19 = "ASPFTLParseBufferToCxt: raidFailedRMXReconstructionHost(395) cannot add 1 element to context";
                  goto LABEL_15;
                case 396:
                  if ((sub_1000145F8(a1, "raidFailedReadParityInternal", (uint64_t)v8, 8u, 1u) & 1) != 0)
                    goto LABEL_16;
                  v19 = "ASPFTLParseBufferToCxt: raidFailedReadParityInternal(396) cannot add 1 element to context";
                  goto LABEL_15;
                case 397:
                  if ((sub_1000145F8(a1, "raidFailedReadQParityInternal", (uint64_t)v8, 8u, 1u) & 1) != 0)
                    goto LABEL_16;
                  v19 = "ASPFTLParseBufferToCxt: raidFailedReadQParityInternal(397) cannot add 1 element to context";
                  goto LABEL_15;
                case 398:
                  if ((sub_1000145F8(a1, "raidFailedReadQParity", (uint64_t)v8, 8u, 1u) & 1) != 0)
                    goto LABEL_16;
                  v19 = "ASPFTLParseBufferToCxt: raidFailedReadQParity(398) cannot add 1 element to context";
                  goto LABEL_15;
                case 399:
                  if ((sub_1000145F8(a1, "raidFailedReadQCopy", (uint64_t)v8, 8u, 1u) & 1) != 0)
                    goto LABEL_16;
                  v19 = "ASPFTLParseBufferToCxt: raidFailedReadQCopy(399) cannot add 1 element to context";
                  goto LABEL_15;
                case 400:
                  if ((sub_1000145F8(a1, "raidFailedReconstructionQParity", (uint64_t)v8, 8u, 1u) & 1) != 0)
                    goto LABEL_16;
                  v19 = "ASPFTLParseBufferToCxt: raidFailedReconstructionQParity(400) cannot add 1 element to context";
                  goto LABEL_15;
                case 401:
                  if ((sub_1000145F8(a1, "offlineBlocksCnt", (uint64_t)v8, 8u, 1u) & 1) != 0)
                    goto LABEL_16;
                  v19 = "ASPFTLParseBufferToCxt: offlineBlocksCnt(401) cannot add 1 element to context";
                  goto LABEL_15;
                case 402:
                  if ((sub_1000145F8(a1, "bork0Revectors", (uint64_t)v8, 8u, 1u) & 1) != 0)
                    goto LABEL_16;
                  v19 = "ASPFTLParseBufferToCxt: bork0Revectors(402) cannot add 1 element to context";
                  goto LABEL_15;
                case 403:
                  if ((sub_1000145F8(a1, "raidFailedReadBlog", (uint64_t)v8, 8u, 1u) & 1) != 0)
                    goto LABEL_16;
                  v19 = "ASPFTLParseBufferToCxt: raidFailedReadBlog(403) cannot add 1 element to context";
                  goto LABEL_15;
                case 404:
                  if ((sub_1000145F8(a1, "numReliabilityRefreshes", (uint64_t)v8, 8u, 1u) & 1) != 0)
                    goto LABEL_16;
                  v19 = "ASPFTLParseBufferToCxt: numReliabilityRefreshes(404) cannot add 1 element to context";
                  goto LABEL_15;
                case 405:
                  if ((sub_1000145F8(a1, "raidFailedReadQCopyInternal", (uint64_t)v8, 8u, 1u) & 1) != 0)
                    goto LABEL_16;
                  v19 = "ASPFTLParseBufferToCxt: raidFailedReadQCopyInternal(405) cannot add 1 element to context";
                  goto LABEL_15;
                case 406:
                  if ((_DWORD)v14 != 5)
                    sub_10001B514("ASPFTLParseBufferToCxt: raidReconstructSuccessFlow(406): (#5) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                  if (v14 >= 5)
                    v20 = 5;
                  else
                    v20 = v14;
                  if ((sub_1000145F8(a1, "raidReconstructSuccessFlow_", (uint64_t)v8, 8u, v20) & 1) != 0)
                    goto LABEL_14;
                  v22 = "ASPFTLParseBufferToCxt: raidReconstructSuccessFlow(406): Cannot add 5 elements to context";
                  goto LABEL_2228;
                case 407:
                  if ((_DWORD)v14 != 5)
                    sub_10001B514("ASPFTLParseBufferToCxt: raidReconstructFailFlow(407): (#5) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                  if (v14 >= 5)
                    v20 = 5;
                  else
                    v20 = v14;
                  if ((sub_1000145F8(a1, "raidReconstructFailFlow_", (uint64_t)v8, 8u, v20) & 1) != 0)
                    goto LABEL_14;
                  v22 = "ASPFTLParseBufferToCxt: raidReconstructFailFlow(407): Cannot add 5 elements to context";
                  goto LABEL_2228;
                case 408:
                  if ((sub_1000145F8(a1, "raidReconstructFailP", (uint64_t)v8, 8u, 1u) & 1) != 0)
                    goto LABEL_16;
                  v19 = "ASPFTLParseBufferToCxt: raidReconstructFailP(408) cannot add 1 element to context";
                  goto LABEL_15;
                case 409:
                  if ((sub_1000145F8(a1, "raidReconstructFailQ", (uint64_t)v8, 8u, 1u) & 1) != 0)
                    goto LABEL_16;
                  v19 = "ASPFTLParseBufferToCxt: raidReconstructFailQ(409) cannot add 1 element to context";
                  goto LABEL_15;
                case 410:
                  if ((sub_1000145F8(a1, "raidReconstructFailUECC", (uint64_t)v8, 8u, 1u) & 1) != 0)
                    goto LABEL_16;
                  v19 = "ASPFTLParseBufferToCxt: raidReconstructFailUECC(410) cannot add 1 element to context";
                  goto LABEL_15;
                case 411:
                  if ((sub_1000145F8(a1, "raidReconstructFailUnsupp", (uint64_t)v8, 8u, 1u) & 1) != 0)
                    goto LABEL_16;
                  v19 = "ASPFTLParseBufferToCxt: raidReconstructFailUnsupp(411) cannot add 1 element to context";
                  goto LABEL_15;
                case 412:
                  if ((sub_1000145F8(a1, "raidUECCOpenBand", (uint64_t)v8, 8u, 1u) & 1) != 0)
                    goto LABEL_16;
                  v19 = "ASPFTLParseBufferToCxt: raidUECCOpenBand(412) cannot add 1 element to context";
                  goto LABEL_15;
                case 414:
                  if ((sub_1000145F8(a1, "ueccReads", (uint64_t)v8, 8u, 1u) & 1) != 0)
                    goto LABEL_16;
                  v19 = "ASPFTLParseBufferToCxt: ueccReads(414) cannot add 1 element to context";
                  goto LABEL_15;
                case 416:
                  if ((sub_1000145F8(a1, "raidSuccessfulVerify", (uint64_t)v8, 8u, 1u) & 1) != 0)
                    goto LABEL_16;
                  v19 = "ASPFTLParseBufferToCxt: raidSuccessfulVerify(416) cannot add 1 element to context";
                  goto LABEL_15;
                case 417:
                  if ((sub_1000145F8(a1, "raidFailedVerify", (uint64_t)v8, 8u, 1u) & 1) != 0)
                    goto LABEL_16;
                  v19 = "ASPFTLParseBufferToCxt: raidFailedVerify(417) cannot add 1 element to context";
                  goto LABEL_15;
                case 418:
                  if ((sub_1000145F8(a1, "numBandsVerified", (uint64_t)v8, 8u, 1u) & 1) != 0)
                    goto LABEL_16;
                  v19 = "ASPFTLParseBufferToCxt: numBandsVerified(418) cannot add 1 element to context";
                  goto LABEL_15;
                case 419:
                  if ((sub_1000145F8(a1, "cache_heads", (uint64_t)v8, 8u, 1u) & 1) != 0)
                    goto LABEL_16;
                  v19 = "ASPFTLParseBufferToCxt: cache_heads(419) cannot add 1 element to context";
                  goto LABEL_15;
                case 420:
                  if ((sub_1000145F8(a1, "AbortSkip_RMXtoMPBX", (uint64_t)v8, 8u, 1u) & 1) != 0)
                    goto LABEL_16;
                  v19 = "ASPFTLParseBufferToCxt: AbortSkip_RMXtoMPBX(420) cannot add 1 element to context";
                  goto LABEL_15;
                case 421:
                  if ((sub_1000145F8(a1, "s3eFwVer", (uint64_t)v8, 8u, 1u) & 1) != 0)
                    goto LABEL_16;
                  v19 = "ASPFTLParseBufferToCxt: s3eFwVer(421) cannot add 1 element to context";
                  goto LABEL_15;
                case 422:
                  if ((sub_1000145F8(a1, "readVerifyNative", (uint64_t)v8, 8u, 1u) & 1) != 0)
                    goto LABEL_16;
                  v19 = "ASPFTLParseBufferToCxt: readVerifyNative(422) cannot add 1 element to context";
                  goto LABEL_15;
                case 423:
                  if ((sub_1000145F8(a1, "reducedReadVerifyNative", (uint64_t)v8, 8u, 1u) & 1) != 0)
                    goto LABEL_16;
                  v19 = "ASPFTLParseBufferToCxt: reducedReadVerifyNative(423) cannot add 1 element to context";
                  goto LABEL_15;
                case 424:
                  if ((sub_1000145F8(a1, "readVerifySlc", (uint64_t)v8, 8u, 1u) & 1) != 0)
                    goto LABEL_16;
                  v19 = "ASPFTLParseBufferToCxt: readVerifySlc(424) cannot add 1 element to context";
                  goto LABEL_15;
                case 425:
                  if ((sub_1000145F8(a1, "reducedReadVerifySlc", (uint64_t)v8, 8u, 1u) & 1) != 0)
                    goto LABEL_16;
                  v19 = "ASPFTLParseBufferToCxt: reducedReadVerifySlc(425) cannot add 1 element to context";
                  goto LABEL_15;
                case 426:
                  if ((sub_1000145F8(a1, "RxBurnEvictions", (uint64_t)v8, 8u, 1u) & 1) != 0)
                    goto LABEL_16;
                  v19 = "ASPFTLParseBufferToCxt: RxBurnEvictions(426) cannot add 1 element to context";
                  goto LABEL_15;
                case 427:
                  if ((sub_1000145F8(a1, "directToTLCBands", (uint64_t)v8, 8u, 1u) & 1) != 0)
                    goto LABEL_16;
                  v19 = "ASPFTLParseBufferToCxt: directToTLCBands(427) cannot add 1 element to context";
                  goto LABEL_15;
                case 428:
                  if ((sub_1000145F8(a1, "nandDesc", (uint64_t)v8, 8u, 1u) & 1) != 0)
                    goto LABEL_16;
                  v19 = "ASPFTLParseBufferToCxt: nandDesc(428) cannot add 1 element to context";
                  goto LABEL_15;
                case 429:
                  if ((sub_1000145F8(a1, "fwUpdatesPercentUsed", (uint64_t)v8, 8u, 1u) & 1) != 0)
                    goto LABEL_16;
                  v19 = "ASPFTLParseBufferToCxt: fwUpdatesPercentUsed(429) cannot add 1 element to context";
                  goto LABEL_15;
                case 430:
                  if ((sub_1000145F8(a1, "slcPercentUsed", (uint64_t)v8, 8u, 1u) & 1) != 0)
                    goto LABEL_16;
                  v19 = "ASPFTLParseBufferToCxt: slcPercentUsed(430) cannot add 1 element to context";
                  goto LABEL_15;
                case 431:
                  if ((sub_1000145F8(a1, "percentUsed", (uint64_t)v8, 8u, 1u) & 1) != 0)
                    goto LABEL_16;
                  v19 = "ASPFTLParseBufferToCxt: percentUsed(431) cannot add 1 element to context";
                  goto LABEL_15;
                default:
                  switch(v12)
                  {
                    case 432:
                      if ((sub_1000145F8(a1, "hostAutoWrites", (uint64_t)v8, 8u, 1u) & 1) != 0)
                        goto LABEL_16;
                      v19 = "ASPFTLParseBufferToCxt: hostAutoWrites(432) cannot add 1 element to context";
                      goto LABEL_15;
                    case 433:
                      if ((sub_1000145F8(a1, "hostAutoWriteXacts", (uint64_t)v8, 8u, 1u) & 1) != 0)
                        goto LABEL_16;
                      v19 = "ASPFTLParseBufferToCxt: hostAutoWriteXacts(433) cannot add 1 element to context";
                      goto LABEL_15;
                    case 434:
                      if ((sub_1000145F8(a1, "gcDestDynamic", (uint64_t)v8, 8u, 1u) & 1) != 0)
                        goto LABEL_16;
                      v19 = "ASPFTLParseBufferToCxt: gcDestDynamic(434) cannot add 1 element to context";
                      goto LABEL_15;
                    case 435:
                      if ((sub_1000145F8(a1, "gcDestStatic", (uint64_t)v8, 8u, 1u) & 1) != 0)
                        goto LABEL_16;
                      v19 = "ASPFTLParseBufferToCxt: gcDestStatic(435) cannot add 1 element to context";
                      goto LABEL_15;
                    case 436:
                      if ((sub_1000145F8(a1, "gcDestWearlevel", (uint64_t)v8, 8u, 1u) & 1) != 0)
                        goto LABEL_16;
                      v19 = "ASPFTLParseBufferToCxt: gcDestWearlevel(436) cannot add 1 element to context";
                      goto LABEL_15;
                    case 437:
                      if ((sub_1000145F8(a1, "gcDestParity", (uint64_t)v8, 8u, 1u) & 1) != 0)
                        goto LABEL_16;
                      v19 = "ASPFTLParseBufferToCxt: gcDestParity(437) cannot add 1 element to context";
                      goto LABEL_15;
                    case 438:
                      if ((sub_1000145F8(a1, "AbortSkip_Format", (uint64_t)v8, 8u, 1u) & 1) != 0)
                        goto LABEL_16;
                      v19 = "ASPFTLParseBufferToCxt: AbortSkip_Format(438) cannot add 1 element to context";
                      goto LABEL_15;
                    case 440:
                      if ((sub_1000145F8(a1, "raidSLCPadding", (uint64_t)v8, 8u, 1u) & 1) != 0)
                        goto LABEL_16;
                      v19 = "ASPFTLParseBufferToCxt: raidSLCPadding(440) cannot add 1 element to context";
                      goto LABEL_15;
                    case 441:
                      if ((sub_1000145F8(a1, "raidGCBands", (uint64_t)v8, 8u, 1u) & 1) != 0)
                        goto LABEL_16;
                      v19 = "ASPFTLParseBufferToCxt: raidGCBands(441) cannot add 1 element to context";
                      goto LABEL_15;
                    case 442:
                      if ((sub_1000145F8(a1, "raidGCSectors", (uint64_t)v8, 8u, 1u) & 1) != 0)
                        goto LABEL_16;
                      v19 = "ASPFTLParseBufferToCxt: raidGCSectors(442) cannot add 1 element to context";
                      goto LABEL_15;
                    case 443:
                      if ((sub_1000145F8(a1, "raidGCPadding", (uint64_t)v8, 8u, 1u) & 1) != 0)
                        goto LABEL_16;
                      v19 = "ASPFTLParseBufferToCxt: raidGCPadding(443) cannot add 1 element to context";
                      goto LABEL_15;
                    case 444:
                      if ((sub_1000145F8(a1, "raidSLCBandsPerHostFlow", (uint64_t)v8, 8u, 1u) & 1) != 0)
                        goto LABEL_16;
                      v19 = "ASPFTLParseBufferToCxt: raidSLCBandsPerHostFlow(444) cannot add 1 element to context";
                      goto LABEL_15;
                    case 445:
                      if ((sub_1000145F8(a1, "raidSLCSecsPerHostFlow", (uint64_t)v8, 8u, 1u) & 1) != 0)
                        goto LABEL_16;
                      v19 = "ASPFTLParseBufferToCxt: raidSLCSecsPerHostFlow(445) cannot add 1 element to context";
                      goto LABEL_15;
                    case 446:
                      if ((sub_1000145F8(a1, "rxBurnMinCycleRuns", (uint64_t)v8, 8u, 1u) & 1) != 0)
                        goto LABEL_16;
                      v19 = "ASPFTLParseBufferToCxt: rxBurnMinCycleRuns(446) cannot add 1 element to context";
                      goto LABEL_15;
                    case 447:
                      if ((sub_1000145F8(a1, "clogNumFastCxt", (uint64_t)v8, 8u, 1u) & 1) != 0)
                        goto LABEL_16;
                      v19 = "ASPFTLParseBufferToCxt: clogNumFastCxt(447) cannot add 1 element to context";
                      goto LABEL_15;
                    case 448:
                      if ((sub_1000145F8(a1, "clogNumRapidReboots", (uint64_t)v8, 8u, 1u) & 1) != 0)
                        goto LABEL_16;
                      v19 = "ASPFTLParseBufferToCxt: clogNumRapidReboots(448) cannot add 1 element to context";
                      goto LABEL_15;
                    case 449:
                      if ((sub_1000145F8(a1, "clogFastCxtAbvThr", (uint64_t)v8, 8u, 1u) & 1) != 0)
                        goto LABEL_16;
                      v19 = "ASPFTLParseBufferToCxt: clogFastCxtAbvThr(449) cannot add 1 element to context";
                      goto LABEL_15;
                    case 450:
                      if ((sub_1000145F8(a1, "rxBurnDiffModeRuns", (uint64_t)v8, 8u, 1u) & 1) != 0)
                        goto LABEL_16;
                      v19 = "ASPFTLParseBufferToCxt: rxBurnDiffModeRuns(450) cannot add 1 element to context";
                      goto LABEL_15;
                    case 452:
                      if ((sub_1000145F8(a1, "indReadVerifyFail", (uint64_t)v8, 8u, 1u) & 1) != 0)
                        goto LABEL_16;
                      v19 = "ASPFTLParseBufferToCxt: indReadVerifyFail(452) cannot add 1 element to context";
                      goto LABEL_15;
                    case 453:
                      if ((_DWORD)v14 != 16)
                        sub_10001B514("ASPFTLParseBufferToCxt: numOfThrottlingEntriesPerReadLevel(453): (#16) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                      if (v14 >= 0x10)
                        v20 = 16;
                      else
                        v20 = v14;
                      if ((sub_1000145F8(a1, "numOfThrottlingEntriesPerReadLevel_", (uint64_t)v8, 8u, v20) & 1) != 0)
                        goto LABEL_14;
                      v22 = "ASPFTLParseBufferToCxt: numOfThrottlingEntriesPerReadLevel(453): Cannot add 16 elements to context";
                      goto LABEL_2228;
                    case 454:
                      if ((_DWORD)v14 != 16)
                        sub_10001B514("ASPFTLParseBufferToCxt: numOfThrottlingEntriesPerWriteLevel(454): (#16) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                      if (v14 >= 0x10)
                        v20 = 16;
                      else
                        v20 = v14;
                      if ((sub_1000145F8(a1, "numOfThrottlingEntriesPerWriteLevel_", (uint64_t)v8, 8u, v20) & 1) != 0)
                        goto LABEL_14;
                      v22 = "ASPFTLParseBufferToCxt: numOfThrottlingEntriesPerWriteLevel(454): Cannot add 16 elements to context";
                      goto LABEL_2228;
                    case 456:
                      if ((_DWORD)v14 != 10)
                        sub_10001B514("ASPFTLParseBufferToCxt: slcFifoDepth(456): (#10) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                      if (v14 >= 0xA)
                        v20 = 10;
                      else
                        v20 = v14;
                      if ((sub_1000145F8(a1, "slcFifoDepth_", (uint64_t)v8, 8u, v20) & 1) != 0)
                        goto LABEL_14;
                      v22 = "ASPFTLParseBufferToCxt: slcFifoDepth(456): Cannot add 10 elements to context";
                      goto LABEL_2228;
                    case 457:
                      if ((sub_1000145F8(a1, "wcacheSectorsDirtyIdle", (uint64_t)v8, 8u, 1u) & 1) != 0)
                        goto LABEL_16;
                      v19 = "ASPFTLParseBufferToCxt: wcacheSectorsDirtyIdle(457) cannot add 1 element to context";
                      goto LABEL_15;
                    case 458:
                      if ((sub_1000145F8(a1, "wcacheDS_SectorsDirtyIdle", (uint64_t)v8, 8u, 1u) & 1) != 0)
                        goto LABEL_16;
                      v19 = "ASPFTLParseBufferToCxt: wcacheDS_SectorsDirtyIdle(458) cannot add 1 element to context";
                      goto LABEL_15;
                    case 459:
                      if ((sub_1000145F8(a1, "wcacheFS_MbytesDirtyIdle", (uint64_t)v8, 8u, 1u) & 1) != 0)
                        goto LABEL_16;
                      v19 = "ASPFTLParseBufferToCxt: wcacheFS_MbytesDirtyIdle(459) cannot add 1 element to context";
                      goto LABEL_15;
                    case 460:
                      if ((_DWORD)v14 != 256)
                        sub_10001B514("ASPFTLParseBufferToCxt: CacheDepthVsThroughput(460): (#256) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                      if (v14 >= 0x100)
                        v20 = 256;
                      else
                        v20 = v14;
                      if ((sub_1000145F8(a1, "CacheDepthVsThroughput_", (uint64_t)v8, 8u, v20) & 1) != 0)
                        goto LABEL_14;
                      v22 = "ASPFTLParseBufferToCxt: CacheDepthVsThroughput(460): Cannot add 256 elements to context";
                      goto LABEL_2228;
                    case 461:
                      if ((sub_1000145F8(a1, "directToTLCSectors", (uint64_t)v8, 8u, 1u) & 1) != 0)
                        goto LABEL_16;
                      v19 = "ASPFTLParseBufferToCxt: directToTLCSectors(461) cannot add 1 element to context";
                      goto LABEL_15;
                    case 462:
                      if ((sub_1000145F8(a1, "fallbackToWaterfall", (uint64_t)v8, 8u, 1u) & 1) != 0)
                        goto LABEL_16;
                      v19 = "ASPFTLParseBufferToCxt: fallbackToWaterfall(462) cannot add 1 element to context";
                      goto LABEL_15;
                    case 463:
                      if ((_DWORD)v14 != 11)
                        sub_10001B514("ASPFTLParseBufferToCxt: balanceProportionBucketsHistogram(463): (#11) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                      if (v14 >= 0xB)
                        v20 = 11;
                      else
                        v20 = v14;
                      if ((sub_1000145F8(a1, "balanceProportionBucketsHistogram_", (uint64_t)v8, 8u, v20) & 1) != 0)
                        goto LABEL_14;
                      v22 = "ASPFTLParseBufferToCxt: balanceProportionBucketsHistogram(463): Cannot add 11 elements to context";
                      goto LABEL_2228;
                    case 464:
                      if ((sub_1000145F8(a1, "lockToTlc", (uint64_t)v8, 8u, 1u) & 1) != 0)
                        goto LABEL_16;
                      v19 = "ASPFTLParseBufferToCxt: lockToTlc(464) cannot add 1 element to context";
                      goto LABEL_15;
                    case 465:
                      if ((_DWORD)v14 != 10)
                        sub_10001B514("ASPFTLParseBufferToCxt: burstSizeHistogram(465): (#10) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                      if (v14 >= 0xA)
                        v20 = 10;
                      else
                        v20 = v14;
                      if ((sub_1000145F8(a1, "burstSizeHistogram_", (uint64_t)v8, 8u, v20) & 1) != 0)
                        goto LABEL_14;
                      v22 = "ASPFTLParseBufferToCxt: burstSizeHistogram(465): Cannot add 10 elements to context";
                      goto LABEL_2228;
                    case 466:
                      if ((_DWORD)v14 != 64)
                        sub_10001B514("ASPFTLParseBufferToCxt: qosDirectToTLC(466): (#64) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                      if (v14 >= 0x40)
                        v20 = 64;
                      else
                        v20 = v14;
                      if ((sub_1000145F8(a1, "qosDirectToTLC_", (uint64_t)v8, 8u, v20) & 1) != 0)
                        goto LABEL_14;
                      v22 = "ASPFTLParseBufferToCxt: qosDirectToTLC(466): Cannot add 64 elements to context";
                      goto LABEL_2228;
                    case 467:
                      if ((_DWORD)v14 != 4)
                        sub_10001B514("ASPFTLParseBufferToCxt: maxQosDirectToTLC(467): (#4) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                      if (v14 >= 4)
                        v20 = 4;
                      else
                        v20 = v14;
                      if ((sub_1000145F8(a1, "maxQosDirectToTLC_", (uint64_t)v8, 8u, v20) & 1) != 0)
                        goto LABEL_14;
                      v22 = "ASPFTLParseBufferToCxt: maxQosDirectToTLC(467): Cannot add 4 elements to context";
                      goto LABEL_2228;
                    case 468:
                      if ((_DWORD)v14 != 16)
                        sub_10001B514("ASPFTLParseBufferToCxt: wcacheDirtyAtFlush(468): (#16) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                      if (v14 >= 0x10)
                        v20 = 16;
                      else
                        v20 = v14;
                      if ((sub_1000145F8(a1, "wcacheDirtyAtFlush_", (uint64_t)v8, 8u, v20) & 1) != 0)
                        goto LABEL_14;
                      v22 = "ASPFTLParseBufferToCxt: wcacheDirtyAtFlush(468): Cannot add 16 elements to context";
                      goto LABEL_2228;
                    case 469:
                      if ((_DWORD)v14 != 2)
                        sub_10001B514("ASPFTLParseBufferToCxt: raidReconstructSuccessPartition(469): (#2) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                      if (v14 >= 2)
                        v20 = 2;
                      else
                        v20 = v14;
                      if ((sub_1000145F8(a1, "raidReconstructSuccessPartition_", (uint64_t)v8, 8u, v20) & 1) != 0)
                        goto LABEL_14;
                      v22 = "ASPFTLParseBufferToCxt: raidReconstructSuccessPartition(469): Cannot add 2 elements to context";
                      goto LABEL_2228;
                    case 470:
                      if ((_DWORD)v14 != 2)
                        sub_10001B514("ASPFTLParseBufferToCxt: raidReconstructFailPartition(470): (#2) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                      if (v14 >= 2)
                        v20 = 2;
                      else
                        v20 = v14;
                      if ((sub_1000145F8(a1, "raidReconstructFailPartition_", (uint64_t)v8, 8u, v20) & 1) != 0)
                        goto LABEL_14;
                      v22 = "ASPFTLParseBufferToCxt: raidReconstructFailPartition(470): Cannot add 2 elements to context";
                      goto LABEL_2228;
                    case 471:
                      if ((sub_1000145F8(a1, "raidUncleanBootBandFail", (uint64_t)v8, 8u, 1u) & 1) != 0)
                        goto LABEL_16;
                      v19 = "ASPFTLParseBufferToCxt: raidUncleanBootBandFail(471) cannot add 1 element to context";
                      goto LABEL_15;
                    case 472:
                      if ((sub_1000145F8(a1, "raidReconstructFailBandFlowHost", (uint64_t)v8, 8u, 1u) & 1) != 0)
                        goto LABEL_16;
                      v19 = "ASPFTLParseBufferToCxt: raidReconstructFailBandFlowHost(472) cannot add 1 element to context";
                      goto LABEL_15;
                    case 473:
                      if ((sub_1000145F8(a1, "raidReconstructFailBandFlowGC", (uint64_t)v8, 8u, 1u) & 1) != 0)
                        goto LABEL_16;
                      v19 = "ASPFTLParseBufferToCxt: raidReconstructFailBandFlowGC(473) cannot add 1 element to context";
                      goto LABEL_15;
                    case 476:
                      if ((_DWORD)v14 != 2)
                        sub_10001B514("ASPFTLParseBufferToCxt: raidSuccessfulRecoLbaRange(476): (#2) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                      if (v14 >= 2)
                        v20 = 2;
                      else
                        v20 = v14;
                      if ((sub_1000145F8(a1, "raidSuccessfulRecoLbaRange_", (uint64_t)v8, 8u, v20) & 1) != 0)
                        goto LABEL_14;
                      v22 = "ASPFTLParseBufferToCxt: raidSuccessfulRecoLbaRange(476): Cannot add 2 elements to context";
                      goto LABEL_2228;
                    case 477:
                      if ((_DWORD)v14 != 2)
                        sub_10001B514("ASPFTLParseBufferToCxt: raidFailedRecoLbaRange(477): (#2) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                      if (v14 >= 2)
                        v20 = 2;
                      else
                        v20 = v14;
                      if ((sub_1000145F8(a1, "raidFailedRecoLbaRange_", (uint64_t)v8, 8u, v20) & 1) != 0)
                        goto LABEL_14;
                      v22 = "ASPFTLParseBufferToCxt: raidFailedRecoLbaRange(477): Cannot add 2 elements to context";
                      goto LABEL_2228;
                    case 481:
                      if ((_DWORD)v14 != 32)
                        sub_10001B514("ASPFTLParseBufferToCxt: skinnyBandErases_481(481): (#32) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                      if (v14 >= 0x20)
                        v20 = 32;
                      else
                        v20 = v14;
                      if ((sub_1000145F8(a1, "skinnyBandErases_481_", (uint64_t)v8, 8u, v20) & 1) != 0)
                        goto LABEL_14;
                      v22 = "ASPFTLParseBufferToCxt: skinnyBandErases_481(481): Cannot add 32 elements to context";
                      goto LABEL_2228;
                    case 483:
                      if ((sub_1000145F8(a1, "tlcOverHeatWaterfall", (uint64_t)v8, 8u, 1u) & 1) != 0)
                        goto LABEL_16;
                      v19 = "ASPFTLParseBufferToCxt: tlcOverHeatWaterfall(483) cannot add 1 element to context";
                      goto LABEL_15;
                    case 484:
                      if ((sub_1000145F8(a1, "skinnyCyclesConvert", (uint64_t)v8, 8u, 1u) & 1) != 0)
                        goto LABEL_16;
                      v19 = "ASPFTLParseBufferToCxt: skinnyCyclesConvert(484) cannot add 1 element to context";
                      goto LABEL_15;
                    case 485:
                      if ((sub_1000145F8(a1, "non_proportional_directToTLCSectors", (uint64_t)v8, 8u, 1u) & 1) != 0)
                        goto LABEL_16;
                      v19 = "ASPFTLParseBufferToCxt: non_proportional_directToTLCSectors(485) cannot add 1 element to context";
                      goto LABEL_15;
                    case 486:
                      if ((sub_1000145F8(a1, "maxFailedFastCxtSync", (uint64_t)v8, 8u, 1u) & 1) != 0)
                        goto LABEL_16;
                      v19 = "ASPFTLParseBufferToCxt: maxFailedFastCxtSync(486) cannot add 1 element to context";
                      goto LABEL_15;
                    case 487:
                      if ((sub_1000145F8(a1, "numFormatUserArea", (uint64_t)v8, 8u, 1u) & 1) != 0)
                        goto LABEL_16;
                      v19 = "ASPFTLParseBufferToCxt: numFormatUserArea(487) cannot add 1 element to context";
                      goto LABEL_15;
                    case 488:
                      if ((sub_1000145F8(a1, "clogFastCxtSyncAborted", (uint64_t)v8, 8u, 1u) & 1) != 0)
                        goto LABEL_16;
                      v19 = "ASPFTLParseBufferToCxt: clogFastCxtSyncAborted(488) cannot add 1 element to context";
                      goto LABEL_15;
                    case 489:
                      if ((_DWORD)v14 != 5)
                        sub_10001B514("ASPFTLParseBufferToCxt: clogOccupationSectors(489): (#5) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                      if (v14 >= 5)
                        v20 = 5;
                      else
                        v20 = v14;
                      if ((sub_1000145F8(a1, "clogOccupationSectors_", (uint64_t)v8, 8u, v20) & 1) != 0)
                        goto LABEL_14;
                      v22 = "ASPFTLParseBufferToCxt: clogOccupationSectors(489): Cannot add 5 elements to context";
                      goto LABEL_2228;
                    case 490:
                      if ((_DWORD)v14 != 64)
                        sub_10001B514("ASPFTLParseBufferToCxt: bdrTmpHist(490): (#64) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                      if (v14 >= 0x40)
                        v20 = 64;
                      else
                        v20 = v14;
                      if ((sub_1000145F8(a1, "bdrTmpHist_", (uint64_t)v8, 8u, v20) & 1) != 0)
                        goto LABEL_14;
                      v22 = "ASPFTLParseBufferToCxt: bdrTmpHist(490): Cannot add 64 elements to context";
                      goto LABEL_2228;
                    case 491:
                      if ((sub_1000145F8(a1, "numFWUpdates", (uint64_t)v8, 8u, 1u) & 1) != 0)
                        goto LABEL_16;
                      v19 = "ASPFTLParseBufferToCxt: numFWUpdates(491) cannot add 1 element to context";
                      goto LABEL_15;
                    case 492:
                      if ((sub_1000145F8(a1, "numClogLoadFails", (uint64_t)v8, 8u, 1u) & 1) != 0)
                        goto LABEL_16;
                      v19 = "ASPFTLParseBufferToCxt: numClogLoadFails(492) cannot add 1 element to context";
                      goto LABEL_15;
                    case 493:
                      if ((sub_1000145F8(a1, "rxBurnNumForcedDiffMode", (uint64_t)v8, 8u, 1u) & 1) != 0)
                        goto LABEL_16;
                      v19 = "ASPFTLParseBufferToCxt: rxBurnNumForcedDiffMode(493) cannot add 1 element to context";
                      goto LABEL_15;
                    case 494:
                      if ((sub_1000145F8(a1, "RD_numSaves", (uint64_t)v8, 8u, 1u) & 1) != 0)
                        goto LABEL_16;
                      v19 = "ASPFTLParseBufferToCxt: RD_numSaves(494) cannot add 1 element to context";
                      goto LABEL_15;
                    case 495:
                      if ((sub_1000145F8(a1, "eanCompressWrites", (uint64_t)v8, 8u, 1u) & 1) != 0)
                        goto LABEL_16;
                      v19 = "ASPFTLParseBufferToCxt: eanCompressWrites(495) cannot add 1 element to context";
                      goto LABEL_15;
                    case 496:
                      if ((sub_1000145F8(a1, "eanHostWrites", (uint64_t)v8, 8u, 1u) & 1) != 0)
                        goto LABEL_16;
                      v19 = "ASPFTLParseBufferToCxt: eanHostWrites(496) cannot add 1 element to context";
                      goto LABEL_15;
                    case 497:
                      if ((sub_1000145F8(a1, "bandPreErases", (uint64_t)v8, 8u, 1u) & 1) != 0)
                        goto LABEL_16;
                      v19 = "ASPFTLParseBufferToCxt: bandPreErases(497) cannot add 1 element to context";
                      goto LABEL_15;
                    case 498:
                      if ((sub_1000145F8(a1, "eanHostUnmaps", (uint64_t)v8, 8u, 1u) & 1) != 0)
                        goto LABEL_16;
                      v19 = "ASPFTLParseBufferToCxt: eanHostUnmaps(498) cannot add 1 element to context";
                      goto LABEL_15;
                    case 499:
                      if ((sub_1000145F8(a1, "eanHostFlushes", (uint64_t)v8, 8u, 1u) & 1) != 0)
                        goto LABEL_16;
                      v19 = "ASPFTLParseBufferToCxt: eanHostFlushes(499) cannot add 1 element to context";
                      goto LABEL_15;
                    case 500:
                      if ((sub_1000145F8(a1, "eanFastWrites", (uint64_t)v8, 8u, 1u) & 1) != 0)
                        goto LABEL_16;
                      v19 = "ASPFTLParseBufferToCxt: eanFastWrites(500) cannot add 1 element to context";
                      goto LABEL_15;
                    case 501:
                      if ((sub_1000145F8(a1, "autowriteDS2FSCollisions", (uint64_t)v8, 8u, 1u) & 1) != 0)
                        goto LABEL_16;
                      v19 = "ASPFTLParseBufferToCxt: autowriteDS2FSCollisions(501) cannot add 1 element to context";
                      goto LABEL_15;
                    case 502:
                      if ((sub_1000145F8(a1, "autowriteWaitTransferTaskBlocks", (uint64_t)v8, 8u, 1u) & 1) != 0)
                        goto LABEL_16;
                      v19 = "ASPFTLParseBufferToCxt: autowriteWaitTransferTaskBlocks(502) cannot add 1 element to context";
                      goto LABEL_15;
                    case 503:
                      if ((_DWORD)v14 != 2)
                        sub_10001B514("ASPFTLParseBufferToCxt: avgCycle(503): (#2) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                      if (v14 >= 2)
                        v20 = 2;
                      else
                        v20 = v14;
                      if ((sub_1000145F8(a1, "avgCycle_", (uint64_t)v8, 8u, v20) & 1) != 0)
                        goto LABEL_14;
                      v22 = "ASPFTLParseBufferToCxt: avgCycle(503): Cannot add 2 elements to context";
                      goto LABEL_2228;
                    case 504:
                      if ((sub_1000145F8(a1, "RD_DeferredClearsOverflowCnt", (uint64_t)v8, 8u, 1u) & 1) != 0)
                        goto LABEL_16;
                      v19 = "ASPFTLParseBufferToCxt: RD_DeferredClearsOverflowCnt(504) cannot add 1 element to context";
                      goto LABEL_15;
                    default:
                      switch(v12)
                      {
                        case 505:
                          if ((sub_1000145F8(a1, "maxVerticsInBand", (uint64_t)v8, 8u, 1u) & 1) != 0)
                            goto LABEL_16;
                          v19 = "ASPFTLParseBufferToCxt: maxVerticsInBand(505) cannot add 1 element to context";
                          goto LABEL_15;
                        case 506:
                          if ((sub_1000145F8(a1, "numVertics", (uint64_t)v8, 8u, 1u) & 1) != 0)
                            goto LABEL_16;
                          v19 = "ASPFTLParseBufferToCxt: numVertics(506) cannot add 1 element to context";
                          goto LABEL_15;
                        case 507:
                          if ((sub_1000145F8(a1, "exceededCVertics", (uint64_t)v8, 8u, 1u) & 1) != 0)
                            goto LABEL_16;
                          v19 = "ASPFTLParseBufferToCxt: exceededCVertics(507) cannot add 1 element to context";
                          goto LABEL_15;
                        case 510:
                          if ((sub_1000145F8(a1, "raidReconstructFailMismatch", (uint64_t)v8, 8u, 1u) & 1) != 0)
                            goto LABEL_16;
                          v19 = "ASPFTLParseBufferToCxt: raidReconstructFailMismatch(510) cannot add 1 element to context";
                          goto LABEL_15;
                        case 511:
                          if ((_DWORD)v14 != 32)
                            sub_10001B514("ASPFTLParseBufferToCxt: mspbootBlockRefreshCnt(511): (#32) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                          if (v14 >= 0x20)
                            v20 = 32;
                          else
                            v20 = v14;
                          if ((sub_1000145F8(a1, "mspbootBlockRefreshCnt_", (uint64_t)v8, 8u, v20) & 1) != 0)
                            goto LABEL_14;
                          v22 = "ASPFTLParseBufferToCxt: mspbootBlockRefreshCnt(511): Cannot add 32 elements to context";
                          goto LABEL_2228;
                        case 516:
                          if ((_DWORD)v14 != 32)
                            sub_10001B514("ASPFTLParseBufferToCxt: mspBootBlockRefreshTime(516): (#32) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                          if (v14 >= 0x20)
                            v20 = 32;
                          else
                            v20 = v14;
                          if ((sub_1000145F8(a1, "mspBootBlockRefreshTime_", (uint64_t)v8, 8u, v20) & 1) != 0)
                            goto LABEL_14;
                          v22 = "ASPFTLParseBufferToCxt: mspBootBlockRefreshTime(516): Cannot add 32 elements to context";
                          goto LABEL_2228;
                        case 517:
                          if ((sub_1000145F8(a1, "mspBootBlockCountPerMsp", (uint64_t)v8, 8u, 1u) & 1) != 0)
                            goto LABEL_16;
                          v19 = "ASPFTLParseBufferToCxt: mspBootBlockCountPerMsp(517) cannot add 1 element to context";
                          goto LABEL_15;
                        case 518:
                          if ((sub_1000145F8(a1, "skinnyRevectorSLC", (uint64_t)v8, 8u, 1u) & 1) != 0)
                            goto LABEL_16;
                          v19 = "ASPFTLParseBufferToCxt: skinnyRevectorSLC(518) cannot add 1 element to context";
                          goto LABEL_15;
                        case 519:
                          if ((sub_1000145F8(a1, "skinnyRevectorTLC", (uint64_t)v8, 8u, 1u) & 1) != 0)
                            goto LABEL_16;
                          v19 = "ASPFTLParseBufferToCxt: skinnyRevectorTLC(519) cannot add 1 element to context";
                          goto LABEL_15;
                        case 520:
                          if ((sub_1000145F8(a1, "perfSetupAttempts", (uint64_t)v8, 8u, 1u) & 1) != 0)
                            goto LABEL_16;
                          v19 = "ASPFTLParseBufferToCxt: perfSetupAttempts(520) cannot add 1 element to context";
                          goto LABEL_15;
                        case 521:
                          if ((sub_1000145F8(a1, "perfSetupSuccesses", (uint64_t)v8, 8u, 1u) & 1) != 0)
                            goto LABEL_16;
                          v19 = "ASPFTLParseBufferToCxt: perfSetupSuccesses(521) cannot add 1 element to context";
                          goto LABEL_15;
                        case 522:
                          if ((sub_1000145F8(a1, "perfWriteAttempts", (uint64_t)v8, 8u, 1u) & 1) != 0)
                            goto LABEL_16;
                          v19 = "ASPFTLParseBufferToCxt: perfWriteAttempts(522) cannot add 1 element to context";
                          goto LABEL_15;
                        case 523:
                          if ((sub_1000145F8(a1, "perfWriteSuccesses", (uint64_t)v8, 8u, 1u) & 1) != 0)
                            goto LABEL_16;
                          v19 = "ASPFTLParseBufferToCxt: perfWriteSuccesses(523) cannot add 1 element to context";
                          goto LABEL_15;
                        case 524:
                          if ((sub_1000145F8(a1, "perfReadAttempts", (uint64_t)v8, 8u, 1u) & 1) != 0)
                            goto LABEL_16;
                          v19 = "ASPFTLParseBufferToCxt: perfReadAttempts(524) cannot add 1 element to context";
                          goto LABEL_15;
                        case 525:
                          if ((sub_1000145F8(a1, "perfReadSuccesses", (uint64_t)v8, 8u, 1u) & 1) != 0)
                            goto LABEL_16;
                          v19 = "ASPFTLParseBufferToCxt: perfReadSuccesses(525) cannot add 1 element to context";
                          goto LABEL_15;
                        case 526:
                          if ((sub_1000145F8(a1, "perfCleanupAttempts", (uint64_t)v8, 8u, 1u) & 1) != 0)
                            goto LABEL_16;
                          v19 = "ASPFTLParseBufferToCxt: perfCleanupAttempts(526) cannot add 1 element to context";
                          goto LABEL_15;
                        case 527:
                          if ((sub_1000145F8(a1, "perfCleanupSuccesses", (uint64_t)v8, 8u, 1u) & 1) != 0)
                            goto LABEL_16;
                          v19 = "ASPFTLParseBufferToCxt: perfCleanupSuccesses(527) cannot add 1 element to context";
                          goto LABEL_15;
                        case 530:
                          if ((sub_1000145F8(a1, "firstFailedDieId", (uint64_t)v8, 8u, 1u) & 1) != 0)
                            goto LABEL_16;
                          v19 = "ASPFTLParseBufferToCxt: firstFailedDieId(530) cannot add 1 element to context";
                          goto LABEL_15;
                        case 531:
                          if ((sub_1000145F8(a1, "numDieFailures", (uint64_t)v8, 8u, 1u) & 1) != 0)
                            goto LABEL_16;
                          v19 = "ASPFTLParseBufferToCxt: numDieFailures(531) cannot add 1 element to context";
                          goto LABEL_15;
                        case 532:
                          if ((sub_1000145F8(a1, "spareAvailablePercent", (uint64_t)v8, 8u, 1u) & 1) != 0)
                            goto LABEL_16;
                          v19 = "ASPFTLParseBufferToCxt: spareAvailablePercent(532) cannot add 1 element to context";
                          goto LABEL_15;
                        case 533:
                          if ((sub_1000145F8(a1, "dataFabricErr", (uint64_t)v8, 8u, 1u) & 1) != 0)
                            goto LABEL_16;
                          v19 = "ASPFTLParseBufferToCxt: dataFabricErr(533) cannot add 1 element to context";
                          goto LABEL_15;
                        case 534:
                          if ((sub_1000145F8(a1, "downlinkFabricErr", (uint64_t)v8, 8u, 1u) & 1) != 0)
                            goto LABEL_16;
                          v19 = "ASPFTLParseBufferToCxt: downlinkFabricErr(534) cannot add 1 element to context";
                          goto LABEL_15;
                        case 535:
                          if ((sub_1000145F8(a1, "prpAccTimeoutErr", (uint64_t)v8, 8u, 1u) & 1) != 0)
                            goto LABEL_16;
                          v19 = "ASPFTLParseBufferToCxt: prpAccTimeoutErr(535) cannot add 1 element to context";
                          goto LABEL_15;
                        case 537:
                          if ((sub_1000145F8(a1, "uplinkFabricErr", (uint64_t)v8, 8u, 1u) & 1) != 0)
                            goto LABEL_16;
                          v19 = "ASPFTLParseBufferToCxt: uplinkFabricErr(537) cannot add 1 element to context";
                          goto LABEL_15;
                        case 538:
                          if ((sub_1000145F8(a1, "skinnyBandsGBB", (uint64_t)v8, 8u, 1u) & 1) != 0)
                            goto LABEL_16;
                          v19 = "ASPFTLParseBufferToCxt: skinnyBandsGBB(538) cannot add 1 element to context";
                          goto LABEL_15;
                        case 539:
                          if ((sub_1000145F8(a1, "AbortPad_GcMustPadBand", (uint64_t)v8, 8u, 1u) & 1) != 0)
                            goto LABEL_16;
                          v19 = "ASPFTLParseBufferToCxt: AbortPad_GcMustPadBand(539) cannot add 1 element to context";
                          goto LABEL_15;
                        case 540:
                          if ((sub_1000145F8(a1, "AbortPad_GcMustPadSkinny", (uint64_t)v8, 8u, 1u) & 1) != 0)
                            goto LABEL_16;
                          v19 = "ASPFTLParseBufferToCxt: AbortPad_GcMustPadSkinny(540) cannot add 1 element to context";
                          goto LABEL_15;
                        case 541:
                          if ((sub_1000145F8(a1, "bdrHostPingInitial", (uint64_t)v8, 8u, 1u) & 1) != 0)
                            goto LABEL_16;
                          v19 = "ASPFTLParseBufferToCxt: bdrHostPingInitial(541) cannot add 1 element to context";
                          goto LABEL_15;
                        case 542:
                          if ((sub_1000145F8(a1, "bdrHostPingMoreNeeded", (uint64_t)v8, 8u, 1u) & 1) != 0)
                            goto LABEL_16;
                          v19 = "ASPFTLParseBufferToCxt: bdrHostPingMoreNeeded(542) cannot add 1 element to context";
                          goto LABEL_15;
                        case 543:
                          if ((sub_1000145F8(a1, "bandParityAllocationFailed", (uint64_t)v8, 8u, 1u) & 1) != 0)
                            goto LABEL_16;
                          v19 = "ASPFTLParseBufferToCxt: bandParityAllocationFailed(543) cannot add 1 element to context";
                          goto LABEL_15;
                        case 544:
                          if ((sub_1000145F8(a1, "fastHwBurstToSlc", (uint64_t)v8, 8u, 1u) & 1) != 0)
                            goto LABEL_16;
                          v19 = "ASPFTLParseBufferToCxt: fastHwBurstToSlc(544) cannot add 1 element to context";
                          goto LABEL_15;
                        case 545:
                          if ((sub_1000145F8(a1, "slowHwToTlc", (uint64_t)v8, 8u, 1u) & 1) != 0)
                            goto LABEL_16;
                          v19 = "ASPFTLParseBufferToCxt: slowHwToTlc(545) cannot add 1 element to context";
                          goto LABEL_15;
                        case 546:
                          if ((_DWORD)v14 != 10)
                            sub_10001B514("ASPFTLParseBufferToCxt: slcDemandBurstSizeDetected(546): (#10) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                          if (v14 >= 0xA)
                            v20 = 10;
                          else
                            v20 = v14;
                          if ((sub_1000145F8(a1, "slcDemandBurstSizeDetected_", (uint64_t)v8, 8u, v20) & 1) != 0)
                            goto LABEL_14;
                          v22 = "ASPFTLParseBufferToCxt: slcDemandBurstSizeDetected(546): Cannot add 10 elements to context";
                          goto LABEL_2228;
                        case 547:
                          if ((_DWORD)v14 != 10)
                            sub_10001B514("ASPFTLParseBufferToCxt: slcDemandBurstDur(547): (#10) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                          if (v14 >= 0xA)
                            v20 = 10;
                          else
                            v20 = v14;
                          if ((sub_1000145F8(a1, "slcDemandBurstDur_", (uint64_t)v8, 8u, v20) & 1) != 0)
                            goto LABEL_14;
                          v22 = "ASPFTLParseBufferToCxt: slcDemandBurstDur(547): Cannot add 10 elements to context";
                          goto LABEL_2228;
                        case 548:
                          if ((sub_1000145F8(a1, "fastHwToTlcBurst", (uint64_t)v8, 8u, 1u) & 1) != 0)
                            goto LABEL_16;
                          v19 = "ASPFTLParseBufferToCxt: fastHwToTlcBurst(548) cannot add 1 element to context";
                          goto LABEL_15;
                        case 549:
                          if ((_DWORD)v14 != 10)
                            sub_10001B514("ASPFTLParseBufferToCxt: slcDemandBurstSizeSlc(549): (#10) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                          if (v14 >= 0xA)
                            v20 = 10;
                          else
                            v20 = v14;
                          if ((sub_1000145F8(a1, "slcDemandBurstSizeSlc_", (uint64_t)v8, 8u, v20) & 1) != 0)
                            goto LABEL_14;
                          v22 = "ASPFTLParseBufferToCxt: slcDemandBurstSizeSlc(549): Cannot add 10 elements to context";
                          goto LABEL_2228;
                        case 551:
                          if ((_DWORD)v14 != 11)
                            sub_10001B514("ASPFTLParseBufferToCxt: balanceProportionBucketsHistogramTlc(551): (#11) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                          if (v14 >= 0xB)
                            v20 = 11;
                          else
                            v20 = v14;
                          if ((sub_1000145F8(a1, "balanceProportionBucketsHistogramTlc_", (uint64_t)v8, 8u, v20) & 1) != 0)
                            goto LABEL_14;
                          v22 = "ASPFTLParseBufferToCxt: balanceProportionBucketsHistogramTlc(551): Cannot add 11 elements to context";
                          goto LABEL_2228;
                        case 553:
                          if ((sub_1000145F8(a1, "slowHwFlushToSlc", (uint64_t)v8, 8u, 1u) & 1) != 0)
                            goto LABEL_16;
                          v19 = "ASPFTLParseBufferToCxt: slowHwFlushToSlc(553) cannot add 1 element to context";
                          goto LABEL_15;
                        case 557:
                          if ((sub_1000145F8(a1, "slowHwToSlc", (uint64_t)v8, 8u, 1u) & 1) != 0)
                            goto LABEL_16;
                          v19 = "ASPFTLParseBufferToCxt: slowHwToSlc(557) cannot add 1 element to context";
                          goto LABEL_15;
                        case 558:
                          if ((sub_1000145F8(a1, "flushNwToSlc", (uint64_t)v8, 8u, 1u) & 1) != 0)
                            goto LABEL_16;
                          v19 = "ASPFTLParseBufferToCxt: flushNwToSlc(558) cannot add 1 element to context";
                          goto LABEL_15;
                        case 559:
                          if ((sub_1000145F8(a1, "flushNwToTlc", (uint64_t)v8, 8u, 1u) & 1) != 0)
                            goto LABEL_16;
                          v19 = "ASPFTLParseBufferToCxt: flushNwToTlc(559) cannot add 1 element to context";
                          goto LABEL_15;
                        case 560:
                          if ((sub_1000145F8(a1, "oslcHw", (uint64_t)v8, 8u, 1u) & 1) != 0)
                            goto LABEL_16;
                          v19 = "ASPFTLParseBufferToCxt: oslcHw(560) cannot add 1 element to context";
                          goto LABEL_15;
                        case 561:
                          if ((sub_1000145F8(a1, "oslcTransitions", (uint64_t)v8, 8u, 1u) & 1) != 0)
                            goto LABEL_16;
                          v19 = "ASPFTLParseBufferToCxt: oslcTransitions(561) cannot add 1 element to context";
                          goto LABEL_15;
                        case 563:
                          if ((sub_1000145F8(a1, "slcDemandFlushCount", (uint64_t)v8, 8u, 1u) & 1) != 0)
                            goto LABEL_16;
                          v19 = "ASPFTLParseBufferToCxt: slcDemandFlushCount(563) cannot add 1 element to context";
                          goto LABEL_15;
                        case 564:
                          if ((sub_1000145F8(a1, "slcDemandBurstCount", (uint64_t)v8, 8u, 1u) & 1) != 0)
                            goto LABEL_16;
                          v19 = "ASPFTLParseBufferToCxt: slcDemandBurstCount(564) cannot add 1 element to context";
                          goto LABEL_15;
                        case 565:
                          if ((sub_1000145F8(a1, "oslcBaseAvgPE", (uint64_t)v8, 8u, 1u) & 1) != 0)
                            goto LABEL_16;
                          v19 = "ASPFTLParseBufferToCxt: oslcBaseAvgPE(565) cannot add 1 element to context";
                          goto LABEL_15;
                        case 566:
                          if ((sub_1000145F8(a1, "raidReconstructFailNoSPBX", (uint64_t)v8, 8u, 1u) & 1) != 0)
                            goto LABEL_16;
                          v19 = "ASPFTLParseBufferToCxt: raidReconstructFailNoSPBX(566) cannot add 1 element to context";
                          goto LABEL_15;
                        case 567:
                          if ((sub_1000145F8(a1, "raidReconstructFailDouble", (uint64_t)v8, 8u, 1u) & 1) != 0)
                            goto LABEL_16;
                          v19 = "ASPFTLParseBufferToCxt: raidReconstructFailDouble(567) cannot add 1 element to context";
                          goto LABEL_15;
                        case 568:
                          if ((sub_1000145F8(a1, "oslcFastWAmpUOnOff", (uint64_t)v8, 8u, 1u) & 1) != 0)
                            goto LABEL_16;
                          v19 = "ASPFTLParseBufferToCxt: oslcFastWAmpUOnOff(568) cannot add 1 element to context";
                          goto LABEL_15;
                        case 569:
                          if ((sub_1000145F8(a1, "oslcSlowWAmpUOnOff", (uint64_t)v8, 8u, 1u) & 1) != 0)
                            goto LABEL_16;
                          v19 = "ASPFTLParseBufferToCxt: oslcSlowWAmpUOnOff(569) cannot add 1 element to context";
                          goto LABEL_15;
                        case 570:
                          if ((sub_1000145F8(a1, "raidReconstructFailInvalid", (uint64_t)v8, 8u, 1u) & 1) != 0)
                            goto LABEL_16;
                          v19 = "ASPFTLParseBufferToCxt: raidReconstructFailInvalid(570) cannot add 1 element to context";
                          goto LABEL_15;
                        case 572:
                          if ((sub_1000145F8(a1, "oslcLastWAmpUx10", (uint64_t)v8, 8u, 1u) & 1) != 0)
                            goto LABEL_16;
                          v19 = "ASPFTLParseBufferToCxt: oslcLastWAmpUx10(572) cannot add 1 element to context";
                          goto LABEL_15;
                        case 573:
                          if ((sub_1000145F8(a1, "raidFailedReadNoBlog", (uint64_t)v8, 8u, 1u) & 1) != 0)
                            goto LABEL_16;
                          v19 = "ASPFTLParseBufferToCxt: raidFailedReadNoBlog(573) cannot add 1 element to context";
                          goto LABEL_15;
                        case 574:
                          if ((sub_1000145F8(a1, "raidReconstructFailBlank", (uint64_t)v8, 8u, 1u) & 1) != 0)
                            goto LABEL_16;
                          v19 = "ASPFTLParseBufferToCxt: raidReconstructFailBlank(574) cannot add 1 element to context";
                          goto LABEL_15;
                        case 575:
                          if ((sub_1000145F8(a1, "oslcHotTLCOnOff", (uint64_t)v8, 8u, 1u) & 1) != 0)
                            goto LABEL_16;
                          v19 = "ASPFTLParseBufferToCxt: oslcHotTLCOnOff(575) cannot add 1 element to context";
                          goto LABEL_15;
                        case 576:
                          if ((sub_1000145F8(a1, "gcVPackDestinations", (uint64_t)v8, 8u, 1u) & 1) != 0)
                            goto LABEL_16;
                          v19 = "ASPFTLParseBufferToCxt: gcVPackDestinations(576) cannot add 1 element to context";
                          goto LABEL_15;
                        case 581:
                          if ((sub_1000145F8(a1, "averageTLCPECycles", (uint64_t)v8, 8u, 1u) & 1) != 0)
                            goto LABEL_16;
                          v19 = "ASPFTLParseBufferToCxt: averageTLCPECycles(581) cannot add 1 element to context";
                          goto LABEL_15;
                        case 582:
                          if ((sub_1000145F8(a1, "averageSLCPECycles", (uint64_t)v8, 8u, 1u) & 1) != 0)
                            goto LABEL_16;
                          v19 = "ASPFTLParseBufferToCxt: averageSLCPECycles(582) cannot add 1 element to context";
                          goto LABEL_15;
                        case 583:
                          if ((sub_1000145F8(a1, "numAtomicBoots", (uint64_t)v8, 8u, 1u) & 1) != 0)
                            goto LABEL_16;
                          v19 = "ASPFTLParseBufferToCxt: numAtomicBoots(583) cannot add 1 element to context";
                          goto LABEL_15;
                        case 584:
                          if ((sub_1000145F8(a1, "clogMinorMismatch", (uint64_t)v8, 8u, 1u) & 1) != 0)
                            goto LABEL_16;
                          v19 = "ASPFTLParseBufferToCxt: clogMinorMismatch(584) cannot add 1 element to context";
                          goto LABEL_15;
                        case 586:
                          if ((sub_1000145F8(a1, "raidExpectedFailRMXReconstructionInternal", (uint64_t)v8, 8u, 1u) & 1) != 0)
                            goto LABEL_16;
                          v19 = "ASPFTLParseBufferToCxt: raidExpectedFailRMXReconstructionInternal(586) cannot add 1 element to context";
                          goto LABEL_15;
                        case 587:
                          if ((sub_1000145F8(a1, "raidExpectedFailRMXReconstructionHost", (uint64_t)v8, 8u, 1u) & 1) != 0)
                            goto LABEL_16;
                          v19 = "ASPFTLParseBufferToCxt: raidExpectedFailRMXReconstructionHost(587) cannot add 1 element to context";
                          goto LABEL_15;
                        case 588:
                          if ((sub_1000145F8(a1, "oslcGCinvalidations", (uint64_t)v8, 8u, 1u) & 1) != 0)
                            goto LABEL_16;
                          v19 = "ASPFTLParseBufferToCxt: oslcGCinvalidations(588) cannot add 1 element to context";
                          goto LABEL_15;
                        case 589:
                          if ((sub_1000145F8(a1, "oslcGCActivateReason", (uint64_t)v8, 8u, 1u) & 1) != 0)
                            goto LABEL_16;
                          v19 = "ASPFTLParseBufferToCxt: oslcGCActivateReason(589) cannot add 1 element to context";
                          goto LABEL_15;
                        default:
                          switch(v12)
                          {
                            case 590:
                              if ((sub_1000145F8(a1, "oslcLowCleanBandsUOnOff", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                goto LABEL_16;
                              v19 = "ASPFTLParseBufferToCxt: oslcLowCleanBandsUOnOff(590) cannot add 1 element to context";
                              goto LABEL_15;
                            case 591:
                              if ((sub_1000145F8(a1, "oslcTooManyGCMustOnOff", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                goto LABEL_16;
                              v19 = "ASPFTLParseBufferToCxt: oslcTooManyGCMustOnOff(591) cannot add 1 element to context";
                              goto LABEL_15;
                            case 592:
                              if ((sub_1000145F8(a1, "oslcBaseHostWrites", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                goto LABEL_16;
                              v19 = "ASPFTLParseBufferToCxt: oslcBaseHostWrites(592) cannot add 1 element to context";
                              goto LABEL_15;
                            case 593:
                              if ((sub_1000145F8(a1, "oslcBaseBandErases", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                goto LABEL_16;
                              v19 = "ASPFTLParseBufferToCxt: oslcBaseBandErases(593) cannot add 1 element to context";
                              goto LABEL_15;
                            case 594:
                              if ((sub_1000145F8(a1, "oslcBdrBands", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                goto LABEL_16;
                              v19 = "ASPFTLParseBufferToCxt: oslcBdrBands(594) cannot add 1 element to context";
                              goto LABEL_15;
                            case 595:
                              if ((sub_1000145F8(a1, "oslcBdrValid", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                goto LABEL_16;
                              v19 = "ASPFTLParseBufferToCxt: oslcBdrValid(595) cannot add 1 element to context";
                              goto LABEL_15;
                            case 596:
                              if ((sub_1000145F8(a1, "unexpectedBlanks", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                goto LABEL_16;
                              v19 = "ASPFTLParseBufferToCxt: unexpectedBlanks(596) cannot add 1 element to context";
                              goto LABEL_15;
                            case 597:
                              if ((sub_1000145F8(a1, "unexpectedBlanksOnRV", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                goto LABEL_16;
                              v19 = "ASPFTLParseBufferToCxt: unexpectedBlanksOnRV(597) cannot add 1 element to context";
                              goto LABEL_15;
                            case 601:
                              if ((sub_1000145F8(a1, "waterfallLockSectors", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                goto LABEL_16;
                              v19 = "ASPFTLParseBufferToCxt: waterfallLockSectors(601) cannot add 1 element to context";
                              goto LABEL_15;
                            case 602:
                              if ((sub_1000145F8(a1, "oslcGCActiveWrites", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                goto LABEL_16;
                              v19 = "ASPFTLParseBufferToCxt: oslcGCActiveWrites(602) cannot add 1 element to context";
                              goto LABEL_15;
                            case 603:
                              if ((sub_1000145F8(a1, "chipIdTemperatureSample", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                goto LABEL_16;
                              v19 = "ASPFTLParseBufferToCxt: chipIdTemperatureSample(603) cannot add 1 element to context";
                              goto LABEL_15;
                            case 604:
                              if ((sub_1000145F8(a1, "gcVPackWrites", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                goto LABEL_16;
                              v19 = "ASPFTLParseBufferToCxt: gcVPackWrites(604) cannot add 1 element to context";
                              goto LABEL_15;
                            case 605:
                              if ((_DWORD)v14 != 10)
                                sub_10001B514("ASPFTLParseBufferToCxt: gcActiveReasons(605): (#10) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                              if (v14 >= 0xA)
                                v20 = 10;
                              else
                                v20 = v14;
                              if ((sub_1000145F8(a1, "gcActiveReasons_", (uint64_t)v8, 8u, v20) & 1) != 0)
                                goto LABEL_14;
                              v22 = "ASPFTLParseBufferToCxt: gcActiveReasons(605): Cannot add 10 elements to context";
                              goto LABEL_2228;
                            case 606:
                              if ((sub_1000145F8(a1, "eanMaxInitTimeMs", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                goto LABEL_16;
                              v19 = "ASPFTLParseBufferToCxt: eanMaxInitTimeMs(606) cannot add 1 element to context";
                              goto LABEL_15;
                            case 607:
                              if ((sub_1000145F8(a1, "eanMinToFirstReadTimeMs", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                goto LABEL_16;
                              v19 = "ASPFTLParseBufferToCxt: eanMinToFirstReadTimeMs(607) cannot add 1 element to context";
                              goto LABEL_15;
                            case 608:
                              if ((sub_1000145F8(a1, "skinnyAPGMRetire", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                goto LABEL_16;
                              v19 = "ASPFTLParseBufferToCxt: skinnyAPGMRetire(608) cannot add 1 element to context";
                              goto LABEL_15;
                            case 609:
                              if ((sub_1000145F8(a1, "unexpectedBlanksHost", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                goto LABEL_16;
                              v19 = "ASPFTLParseBufferToCxt: unexpectedBlanksHost(609) cannot add 1 element to context";
                              goto LABEL_15;
                            case 610:
                              if ((_DWORD)v14 != 64)
                                sub_10001B514("ASPFTLParseBufferToCxt: pcieAerCounters(610): (#64) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                              if (v14 >= 0x40)
                                v20 = 64;
                              else
                                v20 = v14;
                              if ((sub_1000145F8(a1, "pcieAerCounters_", (uint64_t)v8, 8u, v20) & 1) != 0)
                                goto LABEL_14;
                              v22 = "ASPFTLParseBufferToCxt: pcieAerCounters(610): Cannot add 64 elements to context";
                              goto LABEL_2228;
                            case 611:
                              if ((sub_1000145F8(a1, "fastHwToTlcBalance", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                goto LABEL_16;
                              v19 = "ASPFTLParseBufferToCxt: fastHwToTlcBalance(611) cannot add 1 element to context";
                              goto LABEL_15;
                            case 612:
                              if ((sub_1000145F8(a1, "perfOSLCRuns", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                goto LABEL_16;
                              v19 = "ASPFTLParseBufferToCxt: perfOSLCRuns(612) cannot add 1 element to context";
                              goto LABEL_15;
                            case 613:
                              if ((sub_1000145F8(a1, "slcDemandBurstWritesInGC", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                goto LABEL_16;
                              v19 = "ASPFTLParseBufferToCxt: slcDemandBurstWritesInGC(613) cannot add 1 element to context";
                              goto LABEL_15;
                            case 614:
                              if ((sub_1000145F8(a1, "slcDemandBurstWritesInTT", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                goto LABEL_16;
                              v19 = "ASPFTLParseBufferToCxt: slcDemandBurstWritesInTT(614) cannot add 1 element to context";
                              goto LABEL_15;
                            case 615:
                              if ((sub_1000145F8(a1, "slcDemandBurstWritesInNRP", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                goto LABEL_16;
                              v19 = "ASPFTLParseBufferToCxt: slcDemandBurstWritesInNRP(615) cannot add 1 element to context";
                              goto LABEL_15;
                            case 616:
                              if ((sub_1000145F8(a1, "perfTotalDmaMb", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                goto LABEL_16;
                              v19 = "ASPFTLParseBufferToCxt: perfTotalDmaMb(616) cannot add 1 element to context";
                              goto LABEL_15;
                            case 617:
                              if ((sub_1000145F8(a1, "eanAvgInitTimeMs", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                goto LABEL_16;
                              v19 = "ASPFTLParseBufferToCxt: eanAvgInitTimeMs(617) cannot add 1 element to context";
                              goto LABEL_15;
                            case 618:
                              if ((sub_1000145F8(a1, "eanAvgToFirstReadTimeMs", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                goto LABEL_16;
                              v19 = "ASPFTLParseBufferToCxt: eanAvgToFirstReadTimeMs(618) cannot add 1 element to context";
                              goto LABEL_15;
                            case 619:
                              if ((sub_1000145F8(a1, "eanMaxBootReadTimeMs", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                goto LABEL_16;
                              v19 = "ASPFTLParseBufferToCxt: eanMaxBootReadTimeMs(619) cannot add 1 element to context";
                              goto LABEL_15;
                            case 620:
                              if ((sub_1000145F8(a1, "eanAvgBootReadTimeMs", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                goto LABEL_16;
                              v19 = "ASPFTLParseBufferToCxt: eanAvgBootReadTimeMs(620) cannot add 1 element to context";
                              goto LABEL_15;
                            case 621:
                              if ((_DWORD)v14 != 10)
                                sub_10001B514("ASPFTLParseBufferToCxt: eanBootReadsHist(621): (#10) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                              if (v14 >= 0xA)
                                v20 = 10;
                              else
                                v20 = v14;
                              if ((sub_1000145F8(a1, "eanBootReadsHist_", (uint64_t)v8, 8u, v20) & 1) != 0)
                                goto LABEL_14;
                              v22 = "ASPFTLParseBufferToCxt: eanBootReadsHist(621): Cannot add 10 elements to context";
                              goto LABEL_2228;
                            case 622:
                              if ((sub_1000145F8(a1, "maxBgInitTimeMs", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                goto LABEL_16;
                              v19 = "ASPFTLParseBufferToCxt: maxBgInitTimeMs(622) cannot add 1 element to context";
                              goto LABEL_15;
                            case 623:
                              if ((sub_1000145F8(a1, "avgBgInitTimeMs", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                goto LABEL_16;
                              v19 = "ASPFTLParseBufferToCxt: avgBgInitTimeMs(623) cannot add 1 element to context";
                              goto LABEL_15;
                            case 624:
                              if ((_DWORD)v14 != 16)
                                sub_10001B514("ASPFTLParseBufferToCxt: clogFailReason(624): (#16) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                              if (v14 >= 0x10)
                                v20 = 16;
                              else
                                v20 = v14;
                              if ((sub_1000145F8(a1, "clogFailReason_", (uint64_t)v8, 8u, v20) & 1) != 0)
                                goto LABEL_14;
                              v22 = "ASPFTLParseBufferToCxt: clogFailReason(624): Cannot add 16 elements to context";
                              goto LABEL_2228;
                            case 625:
                              if ((sub_1000145F8(a1, "eanMinBootReadMBPerSec", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                goto LABEL_16;
                              v19 = "ASPFTLParseBufferToCxt: eanMinBootReadMBPerSec(625) cannot add 1 element to context";
                              goto LABEL_15;
                            case 626:
                              if ((sub_1000145F8(a1, "eanAvgBootReadMBPerSec", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                goto LABEL_16;
                              v19 = "ASPFTLParseBufferToCxt: eanAvgBootReadMBPerSec(626) cannot add 1 element to context";
                              goto LABEL_15;
                            case 627:
                              if ((sub_1000145F8(a1, "minSkinnyPECycles", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                goto LABEL_16;
                              v19 = "ASPFTLParseBufferToCxt: minSkinnyPECycles(627) cannot add 1 element to context";
                              goto LABEL_15;
                            case 628:
                              if ((sub_1000145F8(a1, "maxSkinnyPECycles", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                goto LABEL_16;
                              v19 = "ASPFTLParseBufferToCxt: maxSkinnyPECycles(628) cannot add 1 element to context";
                              goto LABEL_15;
                            case 629:
                              if ((sub_1000145F8(a1, "averageSkinnyPECycles", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                goto LABEL_16;
                              v19 = "ASPFTLParseBufferToCxt: averageSkinnyPECycles(629) cannot add 1 element to context";
                              goto LABEL_15;
                            case 630:
                              if ((_DWORD)v14 != 6)
                                sub_10001B514("ASPFTLParseBufferToCxt: raidSuccessfulRecoEAN(630): (#6) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                              if (v14 >= 6)
                                v20 = 6;
                              else
                                v20 = v14;
                              if ((sub_1000145F8(a1, "raidSuccessfulRecoEAN_", (uint64_t)v8, 8u, v20) & 1) != 0)
                                goto LABEL_14;
                              v22 = "ASPFTLParseBufferToCxt: raidSuccessfulRecoEAN(630): Cannot add 6 elements to context";
                              goto LABEL_2228;
                            case 631:
                              if ((_DWORD)v14 != 6)
                                sub_10001B514("ASPFTLParseBufferToCxt: raidFailedRecoEAN(631): (#6) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                              if (v14 >= 6)
                                v20 = 6;
                              else
                                v20 = v14;
                              if ((sub_1000145F8(a1, "raidFailedRecoEAN_", (uint64_t)v8, 8u, v20) & 1) != 0)
                                goto LABEL_14;
                              v22 = "ASPFTLParseBufferToCxt: raidFailedRecoEAN(631): Cannot add 6 elements to context";
                              goto LABEL_2228;
                            case 632:
                              if ((_DWORD)v14 != 6)
                                sub_10001B514("ASPFTLParseBufferToCxt: eanFirstReadMode(632): (#6) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                              if (v14 >= 6)
                                v20 = 6;
                              else
                                v20 = v14;
                              if ((sub_1000145F8(a1, "eanFirstReadMode_", (uint64_t)v8, 8u, v20) & 1) != 0)
                                goto LABEL_14;
                              v22 = "ASPFTLParseBufferToCxt: eanFirstReadMode(632): Cannot add 6 elements to context";
                              goto LABEL_2228;
                            case 635:
                              if ((sub_1000145F8(a1, "oslcHwGC", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                goto LABEL_16;
                              v19 = "ASPFTLParseBufferToCxt: oslcHwGC(635) cannot add 1 element to context";
                              goto LABEL_15;
                            case 636:
                              if ((sub_1000145F8(a1, "oslcHwTT", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                goto LABEL_16;
                              v19 = "ASPFTLParseBufferToCxt: oslcHwTT(636) cannot add 1 element to context";
                              goto LABEL_15;
                            case 637:
                              if ((sub_1000145F8(a1, "oslcHwNRP", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                goto LABEL_16;
                              v19 = "ASPFTLParseBufferToCxt: oslcHwNRP(637) cannot add 1 element to context";
                              goto LABEL_15;
                            case 638:
                              if ((_DWORD)v14 != 10)
                                sub_10001B514("ASPFTLParseBufferToCxt: oslcDemandBurstSize(638): (#10) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                              if (v14 >= 0xA)
                                v20 = 10;
                              else
                                v20 = v14;
                              if ((sub_1000145F8(a1, "oslcDemandBurstSize_", (uint64_t)v8, 8u, v20) & 1) != 0)
                                goto LABEL_14;
                              v22 = "ASPFTLParseBufferToCxt: oslcDemandBurstSize(638): Cannot add 10 elements to context";
                              goto LABEL_2228;
                            case 639:
                              if ((sub_1000145F8(a1, "raidReconstructSuccessBandFlowOslc", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                goto LABEL_16;
                              v19 = "ASPFTLParseBufferToCxt: raidReconstructSuccessBandFlowOslc(639) cannot add 1 element to context";
                              goto LABEL_15;
                            case 640:
                              if ((sub_1000145F8(a1, "raidReconstructFailBandFlowOslc", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                goto LABEL_16;
                              v19 = "ASPFTLParseBufferToCxt: raidReconstructFailBandFlowOslc(640) cannot add 1 element to context";
                              goto LABEL_15;
                            case 641:
                              if ((sub_1000145F8(a1, "raidFailSectors", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                goto LABEL_16;
                              v19 = "ASPFTLParseBufferToCxt: raidFailSectors(641) cannot add 1 element to context";
                              goto LABEL_15;
                            case 642:
                              if ((sub_1000145F8(a1, "eanFailSectors", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                goto LABEL_16;
                              v19 = "ASPFTLParseBufferToCxt: eanFailSectors(642) cannot add 1 element to context";
                              goto LABEL_15;
                            case 643:
                              if ((sub_1000145F8(a1, "bdrTimeMode", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                goto LABEL_16;
                              v19 = "ASPFTLParseBufferToCxt: bdrTimeMode(643) cannot add 1 element to context";
                              goto LABEL_15;
                            case 644:
                              if ((sub_1000145F8(a1, "raidParityNotSavedP", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                goto LABEL_16;
                              v19 = "ASPFTLParseBufferToCxt: raidParityNotSavedP(644) cannot add 1 element to context";
                              goto LABEL_15;
                            case 645:
                              if ((sub_1000145F8(a1, "raidParityNotSavedQ", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                goto LABEL_16;
                              v19 = "ASPFTLParseBufferToCxt: raidParityNotSavedQ(645) cannot add 1 element to context";
                              goto LABEL_15;
                            case 646:
                              if ((sub_1000145F8(a1, "raidParityInvalid", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                goto LABEL_16;
                              v19 = "ASPFTLParseBufferToCxt: raidParityInvalid(646) cannot add 1 element to context";
                              goto LABEL_15;
                            case 647:
                              if ((sub_1000145F8(a1, "raidParityUnknown", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                goto LABEL_16;
                              v19 = "ASPFTLParseBufferToCxt: raidParityUnknown(647) cannot add 1 element to context";
                              goto LABEL_15;
                            case 648:
                              if ((sub_1000145F8(a1, "raidParityUnmapped", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                goto LABEL_16;
                              v19 = "ASPFTLParseBufferToCxt: raidParityUnmapped(648) cannot add 1 element to context";
                              goto LABEL_15;
                            case 649:
                              if ((sub_1000145F8(a1, "raidParityGCUnc", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                goto LABEL_16;
                              v19 = "ASPFTLParseBufferToCxt: raidParityGCUnc(649) cannot add 1 element to context";
                              goto LABEL_15;
                            case 657:
                              if ((sub_1000145F8(a1, "AbortSkip_MPBXProbational", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                goto LABEL_16;
                              v19 = "ASPFTLParseBufferToCxt: AbortSkip_MPBXProbational(657) cannot add 1 element to context";
                              goto LABEL_15;
                            case 659:
                              if ((sub_1000145F8(a1, "raidVerificationReads", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                goto LABEL_16;
                              v19 = "ASPFTLParseBufferToCxt: raidVerificationReads(659) cannot add 1 element to context";
                              goto LABEL_15;
                            case 666:
                              if ((sub_1000145F8(a1, "nofDies", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                goto LABEL_16;
                              v19 = "ASPFTLParseBufferToCxt: nofDies(666) cannot add 1 element to context";
                              goto LABEL_15;
                            case 671:
                              if ((sub_1000145F8(a1, "skinnyBandsNum", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                goto LABEL_16;
                              v19 = "ASPFTLParseBufferToCxt: skinnyBandsNum(671) cannot add 1 element to context";
                              goto LABEL_15;
                            case 672:
                              if ((sub_1000145F8(a1, "skinnyBandsNumDips", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                goto LABEL_16;
                              v19 = "ASPFTLParseBufferToCxt: skinnyBandsNumDips(672) cannot add 1 element to context";
                              goto LABEL_15;
                            case 674:
                              if ((_DWORD)v14 != 8)
                                sub_10001B514("ASPFTLParseBufferToCxt: oslcNoVotesHw(674): (#8) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                              if (v14 >= 8)
                                v20 = 8;
                              else
                                v20 = v14;
                              if ((sub_1000145F8(a1, "oslcNoVotesHw_", (uint64_t)v8, 8u, v20) & 1) != 0)
                                goto LABEL_14;
                              v22 = "ASPFTLParseBufferToCxt: oslcNoVotesHw(674): Cannot add 8 elements to context";
                              goto LABEL_2228;
                            case 675:
                              if ((sub_1000145F8(a1, "totalLbas", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                goto LABEL_16;
                              v19 = "ASPFTLParseBufferToCxt: totalLbas(675) cannot add 1 element to context";
                              goto LABEL_15;
                            case 676:
                              if ((sub_1000145F8(a1, "bdrHostPingExtra", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                goto LABEL_16;
                              v19 = "ASPFTLParseBufferToCxt: bdrHostPingExtra(676) cannot add 1 element to context";
                              goto LABEL_15;
                            case 677:
                              if ((sub_1000145F8(a1, "magazineInstanceMeta", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                goto LABEL_16;
                              v19 = "ASPFTLParseBufferToCxt: magazineInstanceMeta(677) cannot add 1 element to context";
                              goto LABEL_15;
                            default:
                              switch(v12)
                              {
                                case 680:
                                  if ((_DWORD)v14 != 3)
                                    sub_10001B514("ASPFTLParseBufferToCxt: magazineFWVersion(680): (#3) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                  if (v14 >= 3)
                                    v20 = 3;
                                  else
                                    v20 = v14;
                                  if ((sub_1000145F8(a1, "magazineFWVersion_", (uint64_t)v8, 8u, v20) & 1) != 0)
                                    goto LABEL_14;
                                  v22 = "ASPFTLParseBufferToCxt: magazineFWVersion(680): Cannot add 3 elements to context";
                                  goto LABEL_2228;
                                case 681:
                                  if ((sub_1000145F8(a1, "raidReconstructFailPMXUnsup", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                    goto LABEL_16;
                                  v19 = "ASPFTLParseBufferToCxt: raidReconstructFailPMXUnsup(681) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 682:
                                  if ((sub_1000145F8(a1, "raidReconstructFailBMXUnsup", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                    goto LABEL_16;
                                  v19 = "ASPFTLParseBufferToCxt: raidReconstructFailBMXUnsup(682) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 683:
                                  if ((sub_1000145F8(a1, "iBootNANDResets", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                    goto LABEL_16;
                                  v19 = "ASPFTLParseBufferToCxt: iBootNANDResets(683) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 684:
                                  if ((sub_1000145F8(a1, "pcieClkreqHighTimeout", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                    goto LABEL_16;
                                  v19 = "ASPFTLParseBufferToCxt: pcieClkreqHighTimeout(684) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 687:
                                  if ((_DWORD)v14 != 3)
                                    sub_10001B514("ASPFTLParseBufferToCxt: cbdrInitSent(687): (#3) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                  if (v14 >= 3)
                                    v20 = 3;
                                  else
                                    v20 = v14;
                                  if ((sub_1000145F8(a1, "cbdrInitSent_", (uint64_t)v8, 8u, v20) & 1) != 0)
                                    goto LABEL_14;
                                  v22 = "ASPFTLParseBufferToCxt: cbdrInitSent(687): Cannot add 3 elements to context";
                                  goto LABEL_2228;
                                case 688:
                                  if ((sub_1000145F8(a1, "cbdrPauseSent", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                    goto LABEL_16;
                                  v19 = "ASPFTLParseBufferToCxt: cbdrPauseSent(688) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 689:
                                  if ((sub_1000145F8(a1, "cbdrResumeSent", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                    goto LABEL_16;
                                  v19 = "ASPFTLParseBufferToCxt: cbdrResumeSent(689) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 690:
                                  if ((sub_1000145F8(a1, "cbdrGetResultSent", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                    goto LABEL_16;
                                  v19 = "ASPFTLParseBufferToCxt: cbdrGetResultSent(690) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 691:
                                  if ((sub_1000145F8(a1, "cbdrEarlyExits", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                    goto LABEL_16;
                                  v19 = "ASPFTLParseBufferToCxt: cbdrEarlyExits(691) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 694:
                                  if ((_DWORD)v14 != 10)
                                    sub_10001B514("ASPFTLParseBufferToCxt: cbdrRefreshGrades(694): (#10) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                  if (v14 >= 0xA)
                                    v20 = 10;
                                  else
                                    v20 = v14;
                                  if ((sub_1000145F8(a1, "cbdrRefreshGrades_", (uint64_t)v8, 8u, v20) & 1) != 0)
                                    goto LABEL_14;
                                  v22 = "ASPFTLParseBufferToCxt: cbdrRefreshGrades(694): Cannot add 10 elements to context";
                                  goto LABEL_2228;
                                case 695:
                                  if ((sub_1000145F8(a1, "cbdrNotEnoughReads", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                    goto LABEL_16;
                                  v19 = "ASPFTLParseBufferToCxt: cbdrNotEnoughReads(695) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 696:
                                  if ((sub_1000145F8(a1, "cbdrAborts", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                    goto LABEL_16;
                                  v19 = "ASPFTLParseBufferToCxt: cbdrAborts(696) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 697:
                                  if ((sub_1000145F8(a1, "TurboRaidHostClassifications", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                    goto LABEL_16;
                                  v19 = "ASPFTLParseBufferToCxt: TurboRaidHostClassifications(697) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 698:
                                  if ((sub_1000145F8(a1, "TurboRaidInternalClassifications", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                    goto LABEL_16;
                                  v19 = "ASPFTLParseBufferToCxt: TurboRaidInternalClassifications(698) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 699:
                                  if ((sub_1000145F8(a1, "cbdrFullyDone", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                    goto LABEL_16;
                                  v19 = "ASPFTLParseBufferToCxt: cbdrFullyDone(699) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 702:
                                  if ((_DWORD)v14 != 32)
                                    sub_10001B514("ASPFTLParseBufferToCxt: vcurve(702): (#32) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                  if (v14 >= 0x20)
                                    v20 = 32;
                                  else
                                    v20 = v14;
                                  if ((sub_1000145F8(a1, "vcurve_", (uint64_t)v8, 8u, v20) & 1) != 0)
                                    goto LABEL_14;
                                  v22 = "ASPFTLParseBufferToCxt: vcurve(702): Cannot add 32 elements to context";
                                  goto LABEL_2228;
                                case 703:
                                  if ((_DWORD)v14 != 12)
                                    sub_10001B514("ASPFTLParseBufferToCxt: injDepth(703): (#12) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                  if (v14 >= 0xC)
                                    v20 = 12;
                                  else
                                    v20 = v14;
                                  if ((sub_1000145F8(a1, "injDepth_", (uint64_t)v8, 8u, v20) & 1) != 0)
                                    goto LABEL_14;
                                  v22 = "ASPFTLParseBufferToCxt: injDepth(703): Cannot add 12 elements to context";
                                  goto LABEL_2228;
                                case 704:
                                  if ((sub_1000145F8(a1, "logical_disk_occupied_promiles", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                    goto LABEL_16;
                                  v19 = "ASPFTLParseBufferToCxt: logical_disk_occupied_promiles(704) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 711:
                                  if ((sub_1000145F8(a1, "raidPrevFailedReconstructSkip", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                    goto LABEL_16;
                                  v19 = "ASPFTLParseBufferToCxt: raidPrevFailedReconstructSkip(711) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 712:
                                  if ((sub_1000145F8(a1, "TurboRaidSuccessfulHostAuxReads", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                    goto LABEL_16;
                                  v19 = "ASPFTLParseBufferToCxt: TurboRaidSuccessfulHostAuxReads(712) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 713:
                                  if ((sub_1000145F8(a1, "TurboRaidSuccessfulInternalAuxReads", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                    goto LABEL_16;
                                  v19 = "ASPFTLParseBufferToCxt: TurboRaidSuccessfulInternalAuxReads(713) cannot add 1 el"
                                        "ement to context";
                                  goto LABEL_15;
                                case 714:
                                  if ((sub_1000145F8(a1, "turboRaidClassificationReliabilityHost", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                    goto LABEL_16;
                                  v19 = "ASPFTLParseBufferToCxt: turboRaidClassificationReliabilityHost(714) cannot add 1"
                                        " element to context";
                                  goto LABEL_15;
                                case 715:
                                  if ((sub_1000145F8(a1, "turboRaidClassificationReliabilityInternal", (uint64_t)v8, 8u, 1u) & 1) != 0)goto LABEL_16;
                                  v19 = "ASPFTLParseBufferToCxt: turboRaidClassificationReliabilityInternal(715) cannot a"
                                        "dd 1 element to context";
                                  goto LABEL_15;
                                case 716:
                                  if ((sub_1000145F8(a1, "turboRaidClassificationQualityHost", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                    goto LABEL_16;
                                  v19 = "ASPFTLParseBufferToCxt: turboRaidClassificationQualityHost(716) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 717:
                                  if ((sub_1000145F8(a1, "turboRaidClassificationQualityInternal", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                    goto LABEL_16;
                                  v19 = "ASPFTLParseBufferToCxt: turboRaidClassificationQualityInternal(717) cannot add 1"
                                        " element to context";
                                  goto LABEL_15;
                                case 719:
                                  if ((sub_1000145F8(a1, "skinnyBandErases", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                    goto LABEL_16;
                                  v19 = "ASPFTLParseBufferToCxt: skinnyBandErases(719) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 721:
                                  if ((sub_1000145F8(a1, "gcPDusterDestinations", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                    goto LABEL_16;
                                  v19 = "ASPFTLParseBufferToCxt: gcPDusterDestinations(721) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 722:
                                  if ((sub_1000145F8(a1, "gcPDusterWrites", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                    goto LABEL_16;
                                  v19 = "ASPFTLParseBufferToCxt: gcPDusterWrites(722) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 730:
                                  if ((sub_1000145F8(a1, "rvFails", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                    goto LABEL_16;
                                  v19 = "ASPFTLParseBufferToCxt: rvFails(730) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 737:
                                  if ((sub_1000145F8(a1, "TurboRaidFailedHostAuxReads", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                    goto LABEL_16;
                                  v19 = "ASPFTLParseBufferToCxt: TurboRaidFailedHostAuxReads(737) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 738:
                                  if ((sub_1000145F8(a1, "TurboRaidFailedInternalAuxReads", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                    goto LABEL_16;
                                  v19 = "ASPFTLParseBufferToCxt: TurboRaidFailedInternalAuxReads(738) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 741:
                                  if ((sub_1000145F8(a1, "autoSkipTriggers", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                    goto LABEL_16;
                                  v19 = "ASPFTLParseBufferToCxt: autoSkipTriggers(741) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 742:
                                  if ((sub_1000145F8(a1, "autoSkipPlanes", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                    goto LABEL_16;
                                  v19 = "ASPFTLParseBufferToCxt: autoSkipPlanes(742) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 744:
                                  if ((_DWORD)v14 != 8)
                                    sub_10001B514("ASPFTLParseBufferToCxt: raidReconstructDurationHisto(744): (#8) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                  if (v14 >= 8)
                                    v20 = 8;
                                  else
                                    v20 = v14;
                                  if ((sub_1000145F8(a1, "raidReconstructDurationHisto_", (uint64_t)v8, 8u, v20) & 1) != 0)
                                    goto LABEL_14;
                                  v22 = "ASPFTLParseBufferToCxt: raidReconstructDurationHisto(744): Cannot add 8 elements to context";
                                  goto LABEL_2228;
                                case 745:
                                  if ((_DWORD)v14 != 8)
                                    sub_10001B514("ASPFTLParseBufferToCxt: failsOnReconstructHisto(745): (#8) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                  if (v14 >= 8)
                                    v20 = 8;
                                  else
                                    v20 = v14;
                                  if ((sub_1000145F8(a1, "failsOnReconstructHisto_", (uint64_t)v8, 8u, v20) & 1) != 0)
                                    goto LABEL_14;
                                  v22 = "ASPFTLParseBufferToCxt: failsOnReconstructHisto(745): Cannot add 8 elements to context";
                                  goto LABEL_2228;
                                case 746:
                                  if ((sub_1000145F8(a1, "bandKill_userFlattenExcessive", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                    goto LABEL_16;
                                  v19 = "ASPFTLParseBufferToCxt: bandKill_userFlattenExcessive(746) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 747:
                                  if ((sub_1000145F8(a1, "bandKill_IntFlattenExcessive", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                    goto LABEL_16;
                                  v19 = "ASPFTLParseBufferToCxt: bandKill_IntFlattenExcessive(747) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 748:
                                  if ((sub_1000145F8(a1, "bandKill_userFlattenBalance", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                    goto LABEL_16;
                                  v19 = "ASPFTLParseBufferToCxt: bandKill_userFlattenBalance(748) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 749:
                                  if ((sub_1000145F8(a1, "bandKill_intFlattenBalance", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                    goto LABEL_16;
                                  v19 = "ASPFTLParseBufferToCxt: bandKill_intFlattenBalance(749) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 750:
                                  if ((sub_1000145F8(a1, "bandKill_formatVertExcessive", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                    goto LABEL_16;
                                  v19 = "ASPFTLParseBufferToCxt: bandKill_formatVertExcessive(750) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 751:
                                  if ((sub_1000145F8(a1, "bandKill_formatVertBalance", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                    goto LABEL_16;
                                  v19 = "ASPFTLParseBufferToCxt: bandKill_formatVertBalance(751) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 753:
                                  if ((sub_1000145F8(a1, "cbdrNumSlowRefreshes", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                    goto LABEL_16;
                                  v19 = "ASPFTLParseBufferToCxt: cbdrNumSlowRefreshes(753) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 754:
                                  if ((sub_1000145F8(a1, "cbdrNumFastRefreshes", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                    goto LABEL_16;
                                  v19 = "ASPFTLParseBufferToCxt: cbdrNumFastRefreshes(754) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 755:
                                  if ((sub_1000145F8(a1, "cbdrTotalRefreshValidity", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                    goto LABEL_16;
                                  v19 = "ASPFTLParseBufferToCxt: cbdrTotalRefreshValidity(755) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 756:
                                  if ((_DWORD)v14 != 9)
                                    sub_10001B514("ASPFTLParseBufferToCxt: cbdrRefreshedAges(756): (#9) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                  if (v14 >= 9)
                                    v20 = 9;
                                  else
                                    v20 = v14;
                                  if ((sub_1000145F8(a1, "cbdrRefreshedAges_", (uint64_t)v8, 8u, v20) & 1) != 0)
                                    goto LABEL_14;
                                  v22 = "ASPFTLParseBufferToCxt: cbdrRefreshedAges(756): Cannot add 9 elements to context";
                                  goto LABEL_2228;
                                case 758:
                                  if ((sub_1000145F8(a1, "cbdrSkippedBlocks", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                    goto LABEL_16;
                                  v19 = "ASPFTLParseBufferToCxt: cbdrSkippedBlocks(758) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 759:
                                  if ((_DWORD)v14 != 5)
                                    sub_10001B514("ASPFTLParseBufferToCxt: cbdrScanPct(759): (#5) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                  if (v14 >= 5)
                                    v20 = 5;
                                  else
                                    v20 = v14;
                                  if ((sub_1000145F8(a1, "cbdrScanPct_", (uint64_t)v8, 8u, v20) & 1) != 0)
                                    goto LABEL_14;
                                  v22 = "ASPFTLParseBufferToCxt: cbdrScanPct(759): Cannot add 5 elements to context";
                                  goto LABEL_2228;
                                case 760:
                                  if ((sub_1000145F8(a1, "raidSuccessfulBMXReconstructionInternal", (uint64_t)v8, 8u, 1u) & 1) != 0)goto LABEL_16;
                                  v19 = "ASPFTLParseBufferToCxt: raidSuccessfulBMXReconstructionInternal(760) cannot add "
                                        "1 element to context";
                                  goto LABEL_15;
                                case 761:
                                  if ((sub_1000145F8(a1, "raidSuccessfulBMXReconstructionHost", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                    goto LABEL_16;
                                  v19 = "ASPFTLParseBufferToCxt: raidSuccessfulBMXReconstructionHost(761) cannot add 1 el"
                                        "ement to context";
                                  goto LABEL_15;
                                case 762:
                                  if ((sub_1000145F8(a1, "raidFailedBMXReconstructionInternal", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                    goto LABEL_16;
                                  v19 = "ASPFTLParseBufferToCxt: raidFailedBMXReconstructionInternal(762) cannot add 1 el"
                                        "ement to context";
                                  goto LABEL_15;
                                case 763:
                                  if ((sub_1000145F8(a1, "raidFailedBMXReconstructionHost", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                    goto LABEL_16;
                                  v19 = "ASPFTLParseBufferToCxt: raidFailedBMXReconstructionHost(763) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 764:
                                  if ((sub_1000145F8(a1, "ricSPRVFail", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                    goto LABEL_16;
                                  v19 = "ASPFTLParseBufferToCxt: ricSPRVFail(764) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 765:
                                  if ((sub_1000145F8(a1, "ricMPRVFail", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                    goto LABEL_16;
                                  v19 = "ASPFTLParseBufferToCxt: ricMPRVFail(765) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 768:
                                  if ((_DWORD)v14 != 9)
                                    sub_10001B514("ASPFTLParseBufferToCxt: cbdrRefreshedAgesSLC(768): (#9) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                  if (v14 >= 9)
                                    v20 = 9;
                                  else
                                    v20 = v14;
                                  if ((sub_1000145F8(a1, "cbdrRefreshedAgesSLC_", (uint64_t)v8, 8u, v20) & 1) != 0)
                                    goto LABEL_14;
                                  v22 = "ASPFTLParseBufferToCxt: cbdrRefreshedAgesSLC(768): Cannot add 9 elements to context";
                                  goto LABEL_2228;
                                case 770:
                                  if ((_DWORD)v14 != 8)
                                    sub_10001B514("ASPFTLParseBufferToCxt: cpuBurstLength(770): (#8) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                  if (v14 >= 8)
                                    v20 = 8;
                                  else
                                    v20 = v14;
                                  if ((sub_1000145F8(a1, "cpuBurstLength_", (uint64_t)v8, 8u, v20) & 1) != 0)
                                    goto LABEL_14;
                                  v22 = "ASPFTLParseBufferToCxt: cpuBurstLength(770): Cannot add 8 elements to context";
                                  goto LABEL_2228;
                                case 771:
                                  if ((sub_1000145F8(a1, "autoSkipRaidRecoFail", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                    goto LABEL_16;
                                  v19 = "ASPFTLParseBufferToCxt: autoSkipRaidRecoFail(771) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 772:
                                  if ((_DWORD)v14 != 32)
                                    sub_10001B514("ASPFTLParseBufferToCxt: dmReasonsSlc(772): (#32) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                  if (v14 >= 0x20)
                                    v20 = 32;
                                  else
                                    v20 = v14;
                                  if ((sub_1000145F8(a1, "dmReasonsSlc_", (uint64_t)v8, 8u, v20) & 1) != 0)
                                    goto LABEL_14;
                                  v22 = "ASPFTLParseBufferToCxt: dmReasonsSlc(772): Cannot add 32 elements to context";
                                  goto LABEL_2228;
                                case 773:
                                  if ((_DWORD)v14 != 32)
                                    sub_10001B514("ASPFTLParseBufferToCxt: dmReasonsTlc(773): (#32) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                  if (v14 >= 0x20)
                                    v20 = 32;
                                  else
                                    v20 = v14;
                                  if ((sub_1000145F8(a1, "dmReasonsTlc_", (uint64_t)v8, 8u, v20) & 1) != 0)
                                    goto LABEL_14;
                                  v22 = "ASPFTLParseBufferToCxt: dmReasonsTlc(773): Cannot add 32 elements to context";
                                  goto LABEL_2228;
                                case 774:
                                  if ((sub_1000145F8(a1, "raidReconstructFailBMXAbort", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                    goto LABEL_16;
                                  v19 = "ASPFTLParseBufferToCxt: raidReconstructFailBMXAbort(774) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 775:
                                  if ((sub_1000145F8(a1, "bandKill_fatBindingNoBlocks", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                    goto LABEL_16;
                                  v19 = "ASPFTLParseBufferToCxt: bandKill_fatBindingNoBlocks(775) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 776:
                                  if ((sub_1000145F8(a1, "bandKill_fatBindingFewBlocks", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                    goto LABEL_16;
                                  v19 = "ASPFTLParseBufferToCxt: bandKill_fatBindingFewBlocks(776) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 777:
                                  if ((sub_1000145F8(a1, "numBadBootBlocks", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                    goto LABEL_16;
                                  v19 = "ASPFTLParseBufferToCxt: numBadBootBlocks(777) cannot add 1 element to context";
                                  goto LABEL_15;
                                case 778:
                                  if ((sub_1000145F8(a1, "snapshotCPUHigh", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                    goto LABEL_16;
                                  v19 = "ASPFTLParseBufferToCxt: snapshotCPUHigh(778) cannot add 1 element to context";
                                  goto LABEL_15;
                                default:
                                  switch(v12)
                                  {
                                    case 779:
                                      if ((sub_1000145F8(a1, "snapshotCPULow", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                        goto LABEL_16;
                                      v19 = "ASPFTLParseBufferToCxt: snapshotCPULow(779) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 780:
                                      if ((sub_1000145F8(a1, "gcWithoutBMs", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                        goto LABEL_16;
                                      v19 = "ASPFTLParseBufferToCxt: gcWithoutBMs(780) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 781:
                                      if ((_DWORD)v14 != 10)
                                        sub_10001B514("ASPFTLParseBufferToCxt: gcSearchTimeHistory(781): (#10) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                      if (v14 >= 0xA)
                                        v20 = 10;
                                      else
                                        v20 = v14;
                                      if ((sub_1000145F8(a1, "gcSearchTimeHistory_", (uint64_t)v8, 8u, v20) & 1) != 0)
                                        goto LABEL_14;
                                      v22 = "ASPFTLParseBufferToCxt: gcSearchTimeHistory(781): Cannot add 10 elements to context";
                                      goto LABEL_2228;
                                    case 785:
                                      if ((_DWORD)v14 != 16)
                                        sub_10001B514("ASPFTLParseBufferToCxt: gcSearchPortion(785): (#16) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                      if (v14 >= 0x10)
                                        v20 = 16;
                                      else
                                        v20 = v14;
                                      if ((sub_1000145F8(a1, "gcSearchPortion_", (uint64_t)v8, 8u, v20) & 1) != 0)
                                        goto LABEL_14;
                                      v22 = "ASPFTLParseBufferToCxt: gcSearchPortion(785): Cannot add 16 elements to context";
                                      goto LABEL_2228;
                                    case 786:
                                      if ((sub_1000145F8(a1, "raidReconstructFailBmxMp", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                        goto LABEL_16;
                                      v19 = "ASPFTLParseBufferToCxt: raidReconstructFailBmxMp(786) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 787:
                                      if ((sub_1000145F8(a1, "raidReconstructFailBmx", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                        goto LABEL_16;
                                      v19 = "ASPFTLParseBufferToCxt: raidReconstructFailBmx(787) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 788:
                                      if ((sub_1000145F8(a1, "raidReconstructFailBMXUECC", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                        goto LABEL_16;
                                      v19 = "ASPFTLParseBufferToCxt: raidReconstructFailBMXUECC(788) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 789:
                                      if ((sub_1000145F8(a1, "raidReconstructFailBMXBlank", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                        goto LABEL_16;
                                      v19 = "ASPFTLParseBufferToCxt: raidReconstructFailBMXBlank(789) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 790:
                                      if ((sub_1000145F8(a1, "raidPrevFailedReconstructBmxMpSkip", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                        goto LABEL_16;
                                      v19 = "ASPFTLParseBufferToCxt: raidPrevFailedReconstructBmxMpSkip(790) cannot add 1"
                                            " element to context";
                                      goto LABEL_15;
                                    case 792:
                                      if ((sub_1000145F8(a1, "numTLCFatBands", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                        goto LABEL_16;
                                      v19 = "ASPFTLParseBufferToCxt: numTLCFatBands(792) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 793:
                                      if ((sub_1000145F8(a1, "fatValidity", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                        goto LABEL_16;
                                      v19 = "ASPFTLParseBufferToCxt: fatValidity(793) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 794:
                                      if ((sub_1000145F8(a1, "fatTotal", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                        goto LABEL_16;
                                      v19 = "ASPFTLParseBufferToCxt: fatTotal(794) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 798:
                                      if ((_DWORD)v14 != 4)
                                        sub_10001B514("ASPFTLParseBufferToCxt: raidBMXFailP(798): (#4) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                      if (v14 >= 4)
                                        v20 = 4;
                                      else
                                        v20 = v14;
                                      if ((sub_1000145F8(a1, "raidBMXFailP_", (uint64_t)v8, 8u, v20) & 1) != 0)
                                        goto LABEL_14;
                                      v22 = "ASPFTLParseBufferToCxt: raidBMXFailP(798): Cannot add 4 elements to context";
                                      goto LABEL_2228;
                                    case 799:
                                      if ((_DWORD)v14 != 4)
                                        sub_10001B514("ASPFTLParseBufferToCxt: raidBMXFailUECC(799): (#4) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                      if (v14 >= 4)
                                        v20 = 4;
                                      else
                                        v20 = v14;
                                      if ((sub_1000145F8(a1, "raidBMXFailUECC_", (uint64_t)v8, 8u, v20) & 1) != 0)
                                        goto LABEL_14;
                                      v22 = "ASPFTLParseBufferToCxt: raidBMXFailUECC(799): Cannot add 4 elements to context";
                                      goto LABEL_2228;
                                    case 804:
                                      if ((_DWORD)v14 != 4)
                                        sub_10001B514("ASPFTLParseBufferToCxt: raidBMXFailNoSPBX(804): (#4) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                      if (v14 >= 4)
                                        v20 = 4;
                                      else
                                        v20 = v14;
                                      if ((sub_1000145F8(a1, "raidBMXFailNoSPBX_", (uint64_t)v8, 8u, v20) & 1) != 0)
                                        goto LABEL_14;
                                      v22 = "ASPFTLParseBufferToCxt: raidBMXFailNoSPBX(804): Cannot add 4 elements to context";
                                      goto LABEL_2228;
                                    case 806:
                                      if ((_DWORD)v14 != 4)
                                        sub_10001B514("ASPFTLParseBufferToCxt: raidBMXFailBlank(806): (#4) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                      if (v14 >= 4)
                                        v20 = 4;
                                      else
                                        v20 = v14;
                                      if ((sub_1000145F8(a1, "raidBMXFailBlank_", (uint64_t)v8, 8u, v20) & 1) != 0)
                                        goto LABEL_14;
                                      v22 = "ASPFTLParseBufferToCxt: raidBMXFailBlank(806): Cannot add 4 elements to context";
                                      goto LABEL_2228;
                                    case 809:
                                      if ((_DWORD)v14 != 4)
                                        sub_10001B514("ASPFTLParseBufferToCxt: raidBMXFailUnsup(809): (#4) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                      if (v14 >= 4)
                                        v20 = 4;
                                      else
                                        v20 = v14;
                                      if ((sub_1000145F8(a1, "raidBMXFailUnsup_", (uint64_t)v8, 8u, v20) & 1) != 0)
                                        goto LABEL_14;
                                      v22 = "ASPFTLParseBufferToCxt: raidBMXFailUnsup(809): Cannot add 4 elements to context";
                                      goto LABEL_2228;
                                    case 811:
                                      if ((_DWORD)v14 != 4)
                                        sub_10001B514("ASPFTLParseBufferToCxt: raidBMXFailMpSkip(811): (#4) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                      if (v14 >= 4)
                                        v20 = 4;
                                      else
                                        v20 = v14;
                                      if ((sub_1000145F8(a1, "raidBMXFailMpSkip_", (uint64_t)v8, 8u, v20) & 1) != 0)
                                        goto LABEL_14;
                                      v22 = "ASPFTLParseBufferToCxt: raidBMXFailMpSkip(811): Cannot add 4 elements to context";
                                      goto LABEL_2228;
                                    case 812:
                                      if ((_DWORD)v14 != 4)
                                        sub_10001B514("ASPFTLParseBufferToCxt: raidBMXFailAbort(812): (#4) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                      if (v14 >= 4)
                                        v20 = 4;
                                      else
                                        v20 = v14;
                                      if ((sub_1000145F8(a1, "raidBMXFailAbort_", (uint64_t)v8, 8u, v20) & 1) != 0)
                                        goto LABEL_14;
                                      v22 = "ASPFTLParseBufferToCxt: raidBMXFailAbort(812): Cannot add 4 elements to context";
                                      goto LABEL_2228;
                                    case 813:
                                      if ((sub_1000145F8(a1, "TurboRaidIsEnabled", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                        goto LABEL_16;
                                      v19 = "ASPFTLParseBufferToCxt: TurboRaidIsEnabled(813) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 814:
                                      if ((_DWORD)v14 != 4)
                                        sub_10001B514("ASPFTLParseBufferToCxt: raidBMXFailOther(814): (#4) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                      if (v14 >= 4)
                                        v20 = 4;
                                      else
                                        v20 = v14;
                                      if ((sub_1000145F8(a1, "raidBMXFailOther_", (uint64_t)v8, 8u, v20) & 1) != 0)
                                        goto LABEL_14;
                                      v22 = "ASPFTLParseBufferToCxt: raidBMXFailOther(814): Cannot add 4 elements to context";
                                      goto LABEL_2228;
                                    case 815:
                                      if ((_DWORD)v14 != 4)
                                        sub_10001B514("ASPFTLParseBufferToCxt: raidBMXSuccess(815): (#4) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                      if (v14 >= 4)
                                        v20 = 4;
                                      else
                                        v20 = v14;
                                      if ((sub_1000145F8(a1, "raidBMXSuccess_", (uint64_t)v8, 8u, v20) & 1) != 0)
                                        goto LABEL_14;
                                      v22 = "ASPFTLParseBufferToCxt: raidBMXSuccess(815): Cannot add 4 elements to context";
                                      goto LABEL_2228;
                                    case 816:
                                      if ((sub_1000145F8(a1, "skinnyBandsExtraDip", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                        goto LABEL_16;
                                      v19 = "ASPFTLParseBufferToCxt: skinnyBandsExtraDip(816) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 821:
                                      if ((sub_1000145F8(a1, "writeAmp", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                        goto LABEL_16;
                                      v19 = "ASPFTLParseBufferToCxt: writeAmp(821) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 822:
                                      if ((sub_1000145F8(a1, "ricMaxClogOnlyPages", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                        goto LABEL_16;
                                      v19 = "ASPFTLParseBufferToCxt: ricMaxClogOnlyPages(822) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 823:
                                      if ((_DWORD)v14 != 3)
                                        sub_10001B514("ASPFTLParseBufferToCxt: readClassifyStatusesHisto(823): (#3) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                      if (v14 >= 3)
                                        v20 = 3;
                                      else
                                        v20 = v14;
                                      if ((sub_1000145F8(a1, "readClassifyStatusesHisto_", (uint64_t)v8, 8u, v20) & 1) != 0)
                                        goto LABEL_14;
                                      v22 = "ASPFTLParseBufferToCxt: readClassifyStatusesHisto(823): Cannot add 3 elements to context";
                                      goto LABEL_2228;
                                    case 824:
                                      if ((_DWORD)v14 != 10)
                                        sub_10001B514("ASPFTLParseBufferToCxt: readWithAuxStatusesHisto(824): (#10) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                      if (v14 >= 0xA)
                                        v20 = 10;
                                      else
                                        v20 = v14;
                                      if ((sub_1000145F8(a1, "readWithAuxStatusesHisto_", (uint64_t)v8, 8u, v20) & 1) != 0)
                                        goto LABEL_14;
                                      v22 = "ASPFTLParseBufferToCxt: readWithAuxStatusesHisto(824): Cannot add 10 elements to context";
                                      goto LABEL_2228;
                                    case 825:
                                      if ((_DWORD)v14 != 10)
                                        sub_10001B514("ASPFTLParseBufferToCxt: readReconstructStatusesHisto(825): (#10) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                      if (v14 >= 0xA)
                                        v20 = 10;
                                      else
                                        v20 = v14;
                                      if ((sub_1000145F8(a1, "readReconstructStatusesHisto_", (uint64_t)v8, 8u, v20) & 1) != 0)
                                        goto LABEL_14;
                                      v22 = "ASPFTLParseBufferToCxt: readReconstructStatusesHisto(825): Cannot add 10 ele"
                                            "ments to context";
                                      goto LABEL_2228;
                                    case 826:
                                      if ((sub_1000145F8(a1, "bdrBackupChecks", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                        goto LABEL_16;
                                      v19 = "ASPFTLParseBufferToCxt: bdrBackupChecks(826) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 827:
                                      if ((sub_1000145F8(a1, "ricExceedClogOnlyPagesTH", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                        goto LABEL_16;
                                      v19 = "ASPFTLParseBufferToCxt: ricExceedClogOnlyPagesTH(827) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 828:
                                      if ((sub_1000145F8(a1, "numDipFailures", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                        goto LABEL_16;
                                      v19 = "ASPFTLParseBufferToCxt: numDipFailures(828) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 862:
                                      if ((sub_1000145F8(a1, "raidSuccessfulSkip", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                        goto LABEL_16;
                                      v19 = "ASPFTLParseBufferToCxt: raidSuccessfulSkip(862) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 863:
                                      if ((sub_1000145F8(a1, "raidFailedSkip", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                        goto LABEL_16;
                                      v19 = "ASPFTLParseBufferToCxt: raidFailedSkip(863) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 864:
                                      if ((sub_1000145F8(a1, "raidSkipAttempts", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                        goto LABEL_16;
                                      v19 = "ASPFTLParseBufferToCxt: raidSkipAttempts(864) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 865:
                                      if ((_DWORD)v14 != 16)
                                        sub_10001B514("ASPFTLParseBufferToCxt: timeOfThrottlingPerLevel(865): (#16) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                      if (v14 >= 0x10)
                                        v20 = 16;
                                      else
                                        v20 = v14;
                                      if ((sub_1000145F8(a1, "timeOfThrottlingPerLevel_", (uint64_t)v8, 8u, v20) & 1) != 0)
                                        goto LABEL_14;
                                      v22 = "ASPFTLParseBufferToCxt: timeOfThrottlingPerLevel(865): Cannot add 16 elements to context";
                                      goto LABEL_2228;
                                    case 866:
                                      if ((_DWORD)v14 != 16)
                                        sub_10001B514("ASPFTLParseBufferToCxt: timeOfThrottlingPerReadLevel(866): (#16) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                      if (v14 >= 0x10)
                                        v20 = 16;
                                      else
                                        v20 = v14;
                                      if ((sub_1000145F8(a1, "timeOfThrottlingPerReadLevel_", (uint64_t)v8, 8u, v20) & 1) != 0)
                                        goto LABEL_14;
                                      v22 = "ASPFTLParseBufferToCxt: timeOfThrottlingPerReadLevel(866): Cannot add 16 ele"
                                            "ments to context";
                                      goto LABEL_2228;
                                    case 867:
                                      if ((_DWORD)v14 != 16)
                                        sub_10001B514("ASPFTLParseBufferToCxt: timeOfThrottlingPerWriteLevel(867): (#16) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                      if (v14 >= 0x10)
                                        v20 = 16;
                                      else
                                        v20 = v14;
                                      if ((sub_1000145F8(a1, "timeOfThrottlingPerWriteLevel_", (uint64_t)v8, 8u, v20) & 1) != 0)
                                        goto LABEL_14;
                                      v22 = "ASPFTLParseBufferToCxt: timeOfThrottlingPerWriteLevel(867): Cannot add 16 el"
                                            "ements to context";
                                      goto LABEL_2228;
                                    case 868:
                                      if ((_DWORD)v14 != 32)
                                        sub_10001B514("ASPFTLParseBufferToCxt: dmReasonsSlc_1bc(868): (#32) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                      if (v14 >= 0x20)
                                        v20 = 32;
                                      else
                                        v20 = v14;
                                      if ((sub_1000145F8(a1, "dmReasonsSlc_1bc_", (uint64_t)v8, 8u, v20) & 1) != 0)
                                        goto LABEL_14;
                                      v22 = "ASPFTLParseBufferToCxt: dmReasonsSlc_1bc(868): Cannot add 32 elements to context";
                                      goto LABEL_2228;
                                    case 869:
                                      if ((_DWORD)v14 != 32)
                                        sub_10001B514("ASPFTLParseBufferToCxt: dmReasonsTlc_1bc(869): (#32) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                      if (v14 >= 0x20)
                                        v20 = 32;
                                      else
                                        v20 = v14;
                                      if ((sub_1000145F8(a1, "dmReasonsTlc_1bc_", (uint64_t)v8, 8u, v20) & 1) != 0)
                                        goto LABEL_14;
                                      v22 = "ASPFTLParseBufferToCxt: dmReasonsTlc_1bc(869): Cannot add 32 elements to context";
                                      goto LABEL_2228;
                                    case 870:
                                      if ((_DWORD)v14 != 32)
                                        sub_10001B514("ASPFTLParseBufferToCxt: dmReasonsSlc_1bc_he(870): (#32) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                      if (v14 >= 0x20)
                                        v20 = 32;
                                      else
                                        v20 = v14;
                                      if ((sub_1000145F8(a1, "dmReasonsSlc_1bc_he_", (uint64_t)v8, 8u, v20) & 1) != 0)
                                        goto LABEL_14;
                                      v22 = "ASPFTLParseBufferToCxt: dmReasonsSlc_1bc_he(870): Cannot add 32 elements to context";
                                      goto LABEL_2228;
                                    case 871:
                                      if ((_DWORD)v14 != 32)
                                        sub_10001B514("ASPFTLParseBufferToCxt: dmReasonsTlc_1bc_he(871): (#32) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                      if (v14 >= 0x20)
                                        v20 = 32;
                                      else
                                        v20 = v14;
                                      if ((sub_1000145F8(a1, "dmReasonsTlc_1bc_he_", (uint64_t)v8, 8u, v20) & 1) != 0)
                                        goto LABEL_14;
                                      v22 = "ASPFTLParseBufferToCxt: dmReasonsTlc_1bc_he(871): Cannot add 32 elements to context";
                                      goto LABEL_2228;
                                    case 876:
                                      if ((_DWORD)v14 != 32)
                                        sub_10001B514("ASPFTLParseBufferToCxt: dmReasonsSlc_mbc(876): (#32) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                      if (v14 >= 0x20)
                                        v20 = 32;
                                      else
                                        v20 = v14;
                                      if ((sub_1000145F8(a1, "dmReasonsSlc_mbc_", (uint64_t)v8, 8u, v20) & 1) != 0)
                                        goto LABEL_14;
                                      v22 = "ASPFTLParseBufferToCxt: dmReasonsSlc_mbc(876): Cannot add 32 elements to context";
                                      goto LABEL_2228;
                                    case 877:
                                      if ((_DWORD)v14 != 32)
                                        sub_10001B514("ASPFTLParseBufferToCxt: dmReasonsTlc_mbc(877): (#32) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                      if (v14 >= 0x20)
                                        v20 = 32;
                                      else
                                        v20 = v14;
                                      if ((sub_1000145F8(a1, "dmReasonsTlc_mbc_", (uint64_t)v8, 8u, v20) & 1) != 0)
                                        goto LABEL_14;
                                      v22 = "ASPFTLParseBufferToCxt: dmReasonsTlc_mbc(877): Cannot add 32 elements to context";
                                      goto LABEL_2228;
                                    case 883:
                                      if ((sub_1000145F8(a1, "clogEmptyProgramms", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                        goto LABEL_16;
                                      v19 = "ASPFTLParseBufferToCxt: clogEmptyProgramms(883) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 884:
                                      if ((sub_1000145F8(a1, "oslcHwCloseBand", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                        goto LABEL_16;
                                      v19 = "ASPFTLParseBufferToCxt: oslcHwCloseBand(884) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 891:
                                      if ((_DWORD)v14 != 2)
                                        sub_10001B514("ASPFTLParseBufferToCxt: turboRaidSuccessAuxPartition(891): (#2) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                      if (v14 >= 2)
                                        v20 = 2;
                                      else
                                        v20 = v14;
                                      if ((sub_1000145F8(a1, "turboRaidSuccessAuxPartition_", (uint64_t)v8, 8u, v20) & 1) != 0)
                                        goto LABEL_14;
                                      v22 = "ASPFTLParseBufferToCxt: turboRaidSuccessAuxPartition(891): Cannot add 2 elements to context";
                                      goto LABEL_2228;
                                    case 892:
                                      if ((_DWORD)v14 != 2)
                                        sub_10001B514("ASPFTLParseBufferToCxt: turboRaidFailAuxPartition(892): (#2) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                      if (v14 >= 2)
                                        v20 = 2;
                                      else
                                        v20 = v14;
                                      if ((sub_1000145F8(a1, "turboRaidFailAuxPartition_", (uint64_t)v8, 8u, v20) & 1) != 0)
                                        goto LABEL_14;
                                      v22 = "ASPFTLParseBufferToCxt: turboRaidFailAuxPartition(892): Cannot add 2 elements to context";
                                      goto LABEL_2228;
                                    case 893:
                                      if ((_DWORD)v14 != 2)
                                        sub_10001B514("ASPFTLParseBufferToCxt: turboRaidClassifyQualPartition(893): (#2) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                      if (v14 >= 2)
                                        v20 = 2;
                                      else
                                        v20 = v14;
                                      if ((sub_1000145F8(a1, "turboRaidClassifyQualPartition_", (uint64_t)v8, 8u, v20) & 1) != 0)
                                        goto LABEL_14;
                                      v22 = "ASPFTLParseBufferToCxt: turboRaidClassifyQualPartition(893): Cannot add 2 el"
                                            "ements to context";
                                      goto LABEL_2228;
                                    case 894:
                                      if ((_DWORD)v14 != 2)
                                        sub_10001B514("ASPFTLParseBufferToCxt: turboRaidClassifyRelPartition(894): (#2) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                      if (v14 >= 2)
                                        v20 = 2;
                                      else
                                        v20 = v14;
                                      if ((sub_1000145F8(a1, "turboRaidClassifyRelPartition_", (uint64_t)v8, 8u, v20) & 1) != 0)
                                        goto LABEL_14;
                                      v22 = "ASPFTLParseBufferToCxt: turboRaidClassifyRelPartition(894): Cannot add 2 ele"
                                            "ments to context";
                                      goto LABEL_2228;
                                    case 895:
                                      if ((sub_1000145F8(a1, "IND_pool_freeMinSilo", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                        goto LABEL_16;
                                      v19 = "ASPFTLParseBufferToCxt: IND_pool_freeMinSilo(895) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 896:
                                      if ((sub_1000145F8(a1, "autoSweepBlocks", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                        goto LABEL_16;
                                      v19 = "ASPFTLParseBufferToCxt: autoSweepBlocks(896) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 897:
                                      if ((_DWORD)v14 != 16)
                                        sub_10001B514("ASPFTLParseBufferToCxt: wcWrFragSizes(897): (#16) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                      if (v14 >= 0x10)
                                        v20 = 16;
                                      else
                                        v20 = v14;
                                      if ((sub_1000145F8(a1, "wcWrFragSizes_", (uint64_t)v8, 8u, v20) & 1) != 0)
                                        goto LABEL_14;
                                      v22 = "ASPFTLParseBufferToCxt: wcWrFragSizes(897): Cannot add 16 elements to context";
                                      goto LABEL_2228;
                                    case 898:
                                      if ((_DWORD)v14 != 16)
                                        sub_10001B514("ASPFTLParseBufferToCxt: indStateAcrossGcDidNoL(898): (#16) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                      if (v14 >= 0x10)
                                        v20 = 16;
                                      else
                                        v20 = v14;
                                      if ((sub_1000145F8(a1, "indStateAcrossGcDidNoL_", (uint64_t)v8, 8u, v20) & 1) != 0)
                                        goto LABEL_14;
                                      v22 = "ASPFTLParseBufferToCxt: indStateAcrossGcDidNoL(898): Cannot add 16 elements to context";
                                      goto LABEL_2228;
                                    case 899:
                                      if ((_DWORD)v14 != 16)
                                        sub_10001B514("ASPFTLParseBufferToCxt: indStateAcrossGcDidL(899): (#16) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                      if (v14 >= 0x10)
                                        v20 = 16;
                                      else
                                        v20 = v14;
                                      if ((sub_1000145F8(a1, "indStateAcrossGcDidL_", (uint64_t)v8, 8u, v20) & 1) != 0)
                                        goto LABEL_14;
                                      v22 = "ASPFTLParseBufferToCxt: indStateAcrossGcDidL(899): Cannot add 16 elements to context";
                                      goto LABEL_2228;
                                    case 900:
                                      if ((sub_1000145F8(a1, "turboRaidNoClassifyDueToWasRetire", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                        goto LABEL_16;
                                      v19 = "ASPFTLParseBufferToCxt: turboRaidNoClassifyDueToWasRetire(900) cannot add 1 "
                                            "element to context";
                                      goto LABEL_15;
                                    case 901:
                                      if ((sub_1000145F8(a1, "turboRaidNoClassifyDueToOpenBand", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                        goto LABEL_16;
                                      v19 = "ASPFTLParseBufferToCxt: turboRaidNoClassifyDueToOpenBand(901) cannot add 1 e"
                                            "lement to context";
                                      goto LABEL_15;
                                    case 902:
                                      if ((sub_1000145F8(a1, "turboRaidNoClassifyDueToQualityBlock", (uint64_t)v8, 8u, 1u) & 1) != 0)goto LABEL_16;
                                      v19 = "ASPFTLParseBufferToCxt: turboRaidNoClassifyDueToQualityBlock(902) cannot add"
                                            " 1 element to context";
                                      goto LABEL_15;
                                    case 903:
                                      if ((sub_1000145F8(a1, "turboRaidGbbOpenBand", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                        goto LABEL_16;
                                      v19 = "ASPFTLParseBufferToCxt: turboRaidGbbOpenBand(903) cannot add 1 element to context";
                                      goto LABEL_15;
                                    case 904:
                                      if ((sub_1000145F8(a1, "turboRaidGbbShouldRetireOnRefresh", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                        goto LABEL_16;
                                      v19 = "ASPFTLParseBufferToCxt: turboRaidGbbShouldRetireOnRefresh(904) cannot add 1 "
                                            "element to context";
                                      goto LABEL_15;
                                    case 905:
                                      if ((_DWORD)v14 != 16)
                                        sub_10001B514("ASPFTLParseBufferToCxt: turboRaidRelPerBlock(905): (#16) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                      if (v14 >= 0x10)
                                        v20 = 16;
                                      else
                                        v20 = v14;
                                      if ((sub_1000145F8(a1, "turboRaidRelPerBlock_", (uint64_t)v8, 8u, v20) & 1) != 0)
                                        goto LABEL_14;
                                      v22 = "ASPFTLParseBufferToCxt: turboRaidRelPerBlock(905): Cannot add 16 elements to context";
                                      goto LABEL_2228;
                                    case 906:
                                      if ((_DWORD)v14 != 16)
                                        sub_10001B514("ASPFTLParseBufferToCxt: turboRaidRelBetweenRefreshesPerBlock(906): (#16) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                      if (v14 >= 0x10)
                                        v20 = 16;
                                      else
                                        v20 = v14;
                                      if ((sub_1000145F8(a1, "turboRaidRelBetweenRefreshesPerBlock_", (uint64_t)v8, 8u, v20) & 1) != 0)goto LABEL_14;
                                      v22 = "ASPFTLParseBufferToCxt: turboRaidRelBetweenRefreshesPerBlock(906): Cannot ad"
                                            "d 16 elements to context";
                                      goto LABEL_2228;
                                    case 907:
                                      if ((_DWORD)v14 != 16)
                                        sub_10001B514("ASPFTLParseBufferToCxt: turboRaidMaxRelBetweenRefreshesPerBlock(907): (#16) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                      if (v14 >= 0x10)
                                        v20 = 16;
                                      else
                                        v20 = v14;
                                      if ((sub_1000145F8(a1, "turboRaidMaxRelBetweenRefreshesPerBlock_", (uint64_t)v8, 8u, v20) & 1) != 0)goto LABEL_14;
                                      v22 = "ASPFTLParseBufferToCxt: turboRaidMaxRelBetweenRefreshesPerBlock(907): Cannot"
                                            " add 16 elements to context";
                                      goto LABEL_2228;
                                    case 908:
                                      if ((_DWORD)v14 != 16)
                                        sub_10001B514("ASPFTLParseBufferToCxt: turboRaidMinRelBetweenRefreshesPerBlock(908): (#16) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                      if (v14 >= 0x10)
                                        v20 = 16;
                                      else
                                        v20 = v14;
                                      if ((sub_1000145F8(a1, "turboRaidMinRelBetweenRefreshesPerBlock_", (uint64_t)v8, 8u, v20) & 1) != 0)goto LABEL_14;
                                      v22 = "ASPFTLParseBufferToCxt: turboRaidMinRelBetweenRefreshesPerBlock(908): Cannot"
                                            " add 16 elements to context";
                                      goto LABEL_2228;
                                    case 918:
                                      if ((_DWORD)v14 != 16)
                                        sub_10001B514("ASPFTLParseBufferToCxt: turboRaidMaxCyclesBetweenRel(918): (#16) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                      if (v14 >= 0x10)
                                        v20 = 16;
                                      else
                                        v20 = v14;
                                      if ((sub_1000145F8(a1, "turboRaidMaxCyclesBetweenRel_", (uint64_t)v8, 8u, v20) & 1) != 0)
                                        goto LABEL_14;
                                      v22 = "ASPFTLParseBufferToCxt: turboRaidMaxCyclesBetweenRel(918): Cannot add 16 ele"
                                            "ments to context";
                                      goto LABEL_2228;
                                    default:
                                      if (v12 <= 1039)
                                      {
                                        switch(v12)
                                        {
                                          case 919:
                                            if ((_DWORD)v14 != 16)
                                              sub_10001B514("ASPFTLParseBufferToCxt: turboRaidMinCyclesBetweenRel(919): (#16) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                            if (v14 >= 0x10)
                                              v20 = 16;
                                            else
                                              v20 = v14;
                                            if ((sub_1000145F8(a1, "turboRaidMinCyclesBetweenRel_", (uint64_t)v8, 8u, v20) & 1) != 0)goto LABEL_14;
                                            v22 = "ASPFTLParseBufferToCxt: turboRaidMinCyclesBetweenRel(919): Cannot add "
                                                  "16 elements to context";
                                            goto LABEL_2228;
                                          case 920:
                                            if ((_DWORD)v14 != 16)
                                              sub_10001B514("ASPFTLParseBufferToCxt: turboRaidAuxPerBlock(920): (#16) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                            if (v14 >= 0x10)
                                              v20 = 16;
                                            else
                                              v20 = v14;
                                            if ((sub_1000145F8(a1, "turboRaidAuxPerBlock_", (uint64_t)v8, 8u, v20) & 1) != 0)
                                              goto LABEL_14;
                                            v22 = "ASPFTLParseBufferToCxt: turboRaidAuxPerBlock(920): Cannot add 16 elements to context";
                                            goto LABEL_2228;
                                          case 921:
                                            if ((_DWORD)v14 != 16)
                                              sub_10001B514("ASPFTLParseBufferToCxt: turboRaidAuxBetweenRefreshesPerBlock(921): (#16) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                            if (v14 >= 0x10)
                                              v20 = 16;
                                            else
                                              v20 = v14;
                                            if ((sub_1000145F8(a1, "turboRaidAuxBetweenRefreshesPerBlock_", (uint64_t)v8, 8u, v20) & 1) != 0)goto LABEL_14;
                                            v22 = "ASPFTLParseBufferToCxt: turboRaidAuxBetweenRefreshesPerBlock(921): Can"
                                                  "not add 16 elements to context";
                                            goto LABEL_2228;
                                          case 922:
                                            if ((sub_1000145F8(a1, "turboRaidRelLockMark", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                              goto LABEL_16;
                                            v19 = "ASPFTLParseBufferToCxt: turboRaidRelLockMark(922) cannot add 1 element to context";
                                            goto LABEL_15;
                                          case 923:
                                            if ((sub_1000145F8(a1, "turboRaidAuxLockMark", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                              goto LABEL_16;
                                            v19 = "ASPFTLParseBufferToCxt: turboRaidAuxLockMark(923) cannot add 1 element to context";
                                            goto LABEL_15;
                                          case 924:
                                          case 925:
                                          case 926:
                                          case 927:
                                          case 928:
                                          case 929:
                                          case 936:
                                          case 941:
                                          case 945:
                                          case 946:
                                          case 947:
                                          case 949:
                                          case 950:
                                          case 952:
                                          case 954:
                                          case 955:
                                          case 956:
                                          case 957:
                                          case 958:
                                          case 959:
                                          case 960:
                                          case 963:
                                          case 964:
                                          case 965:
                                          case 966:
                                          case 968:
                                          case 969:
                                          case 970:
                                            goto LABEL_2116;
                                          case 930:
                                            if ((_DWORD)v14 != 16)
                                              sub_10001B514("ASPFTLParseBufferToCxt: turboRaidMaxCyclesBetweenAux(930): (#16) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                            if (v14 >= 0x10)
                                              v20 = 16;
                                            else
                                              v20 = v14;
                                            if ((sub_1000145F8(a1, "turboRaidMaxCyclesBetweenAux_", (uint64_t)v8, 8u, v20) & 1) != 0)goto LABEL_14;
                                            v22 = "ASPFTLParseBufferToCxt: turboRaidMaxCyclesBetweenAux(930): Cannot add "
                                                  "16 elements to context";
                                            goto LABEL_2228;
                                          case 931:
                                            if ((_DWORD)v14 != 16)
                                              sub_10001B514("ASPFTLParseBufferToCxt: turboRaidMinCyclesBetweenAux(931): (#16) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                            if (v14 >= 0x10)
                                              v20 = 16;
                                            else
                                              v20 = v14;
                                            if ((sub_1000145F8(a1, "turboRaidMinCyclesBetweenAux_", (uint64_t)v8, 8u, v20) & 1) != 0)goto LABEL_14;
                                            v22 = "ASPFTLParseBufferToCxt: turboRaidMinCyclesBetweenAux(931): Cannot add "
                                                  "16 elements to context";
                                            goto LABEL_2228;
                                          case 932:
                                            if ((_DWORD)v14 != 16)
                                              sub_10001B514("ASPFTLParseBufferToCxt: turboRaidLastRelPECycles(932): (#16) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                            if (v14 >= 0x10)
                                              v20 = 16;
                                            else
                                              v20 = v14;
                                            if ((sub_1000145F8(a1, "turboRaidLastRelPECycles_", (uint64_t)v8, 8u, v20) & 1) != 0)
                                              goto LABEL_14;
                                            v22 = "ASPFTLParseBufferToCxt: turboRaidLastRelPECycles(932): Cannot add 16 e"
                                                  "lements to context";
                                            goto LABEL_2228;
                                          case 933:
                                            if ((_DWORD)v14 != 16)
                                              sub_10001B514("ASPFTLParseBufferToCxt: turboRaidRelQualPECycles(933): (#16) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                            if (v14 >= 0x10)
                                              v20 = 16;
                                            else
                                              v20 = v14;
                                            if ((sub_1000145F8(a1, "turboRaidRelQualPECycles_", (uint64_t)v8, 8u, v20) & 1) != 0)
                                              goto LABEL_14;
                                            v22 = "ASPFTLParseBufferToCxt: turboRaidRelQualPECycles(933): Cannot add 16 e"
                                                  "lements to context";
                                            goto LABEL_2228;
                                          case 934:
                                            if ((_DWORD)v14 != 16)
                                              sub_10001B514("ASPFTLParseBufferToCxt: turboRaidLastAuxPECycles(934): (#16) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                            if (v14 >= 0x10)
                                              v20 = 16;
                                            else
                                              v20 = v14;
                                            if ((sub_1000145F8(a1, "turboRaidLastAuxPECycles_", (uint64_t)v8, 8u, v20) & 1) != 0)
                                              goto LABEL_14;
                                            v22 = "ASPFTLParseBufferToCxt: turboRaidLastAuxPECycles(934): Cannot add 16 e"
                                                  "lements to context";
                                            goto LABEL_2228;
                                          case 935:
                                            if ((_DWORD)v14 != 16)
                                              sub_10001B514("ASPFTLParseBufferToCxt: turboRaidAuxQualPECycles(935): (#16) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                            if (v14 >= 0x10)
                                              v20 = 16;
                                            else
                                              v20 = v14;
                                            if ((sub_1000145F8(a1, "turboRaidAuxQualPECycles_", (uint64_t)v8, 8u, v20) & 1) != 0)
                                              goto LABEL_14;
                                            v22 = "ASPFTLParseBufferToCxt: turboRaidAuxQualPECycles(935): Cannot add 16 e"
                                                  "lements to context";
                                            goto LABEL_2228;
                                          case 937:
                                            if ((sub_1000145F8(a1, "turboRaidPEFailAfterRel", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                              goto LABEL_16;
                                            v19 = "ASPFTLParseBufferToCxt: turboRaidPEFailAfterRel(937) cannot add 1 element to context";
                                            goto LABEL_15;
                                          case 938:
                                            if ((sub_1000145F8(a1, "turboRaidPEFailAfterAux", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                              goto LABEL_16;
                                            v19 = "ASPFTLParseBufferToCxt: turboRaidPEFailAfterAux(938) cannot add 1 element to context";
                                            goto LABEL_15;
                                          case 939:
                                            if ((sub_1000145F8(a1, "dvfmVotesCPU", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                              goto LABEL_16;
                                            v19 = "ASPFTLParseBufferToCxt: dvfmVotesCPU(939) cannot add 1 element to context";
                                            goto LABEL_15;
                                          case 940:
                                            if ((sub_1000145F8(a1, "dvfmVotesBandwidth", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                              goto LABEL_16;
                                            v19 = "ASPFTLParseBufferToCxt: dvfmVotesBandwidth(940) cannot add 1 element to context";
                                            goto LABEL_15;
                                          case 942:
                                            if ((sub_1000145F8(a1, "maxSLCEndurance", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                              goto LABEL_16;
                                            v19 = "ASPFTLParseBufferToCxt: maxSLCEndurance(942) cannot add 1 element to context";
                                            goto LABEL_15;
                                          case 943:
                                            if ((sub_1000145F8(a1, "maxMixedEndurance", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                              goto LABEL_16;
                                            v19 = "ASPFTLParseBufferToCxt: maxMixedEndurance(943) cannot add 1 element to context";
                                            goto LABEL_15;
                                          case 944:
                                            if ((sub_1000145F8(a1, "maxNativeEndurance", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                              goto LABEL_16;
                                            v19 = "ASPFTLParseBufferToCxt: maxNativeEndurance(944) cannot add 1 element to context";
                                            goto LABEL_15;
                                          case 948:
                                            if ((_DWORD)v14 != 40)
                                              sub_10001B514("ASPFTLParseBufferToCxt: assertHistory(948): (#40) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                            if (v14 >= 0x28)
                                              v20 = 40;
                                            else
                                              v20 = v14;
                                            if ((sub_1000145F8(a1, "assertHistory_", (uint64_t)v8, 8u, v20) & 1) != 0)
                                              goto LABEL_14;
                                            v22 = "ASPFTLParseBufferToCxt: assertHistory(948): Cannot add 40 elements to context";
                                            goto LABEL_2228;
                                          case 951:
                                            if ((sub_1000145F8(a1, "asp3Support", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                              goto LABEL_16;
                                            v19 = "ASPFTLParseBufferToCxt: asp3Support(951) cannot add 1 element to context";
                                            goto LABEL_15;
                                          case 953:
                                            if ((sub_1000145F8(a1, "numCrossTempRaidUecc", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                              goto LABEL_16;
                                            v19 = "ASPFTLParseBufferToCxt: numCrossTempRaidUecc(953) cannot add 1 element to context";
                                            goto LABEL_15;
                                          case 961:
                                            if ((sub_1000145F8(a1, "osBuildStr", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                              goto LABEL_16;
                                            v19 = "ASPFTLParseBufferToCxt: osBuildStr(961) cannot add 1 element to context";
                                            goto LABEL_15;
                                          case 962:
                                            if ((sub_1000145F8(a1, "raidConfig", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                              goto LABEL_16;
                                            v19 = "ASPFTLParseBufferToCxt: raidConfig(962) cannot add 1 element to context";
                                            goto LABEL_15;
                                          case 967:
                                            if ((_DWORD)v14 != 12)
                                              sub_10001B514("ASPFTLParseBufferToCxt: indTrimFrags(967): (#12) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                            if (v14 >= 0xC)
                                              v20 = 12;
                                            else
                                              v20 = v14;
                                            if ((sub_1000145F8(a1, "indTrimFrags_", (uint64_t)v8, 8u, v20) & 1) != 0)
                                              goto LABEL_14;
                                            v22 = "ASPFTLParseBufferToCxt: indTrimFrags(967): Cannot add 12 elements to context";
                                            goto LABEL_2228;
                                          case 971:
                                            if ((_DWORD)v14 != 12)
                                              sub_10001B514("ASPFTLParseBufferToCxt: indUsedFrags(971): (#12) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                            if (v14 >= 0xC)
                                              v20 = 12;
                                            else
                                              v20 = v14;
                                            if ((sub_1000145F8(a1, "indUsedFrags_", (uint64_t)v8, 8u, v20) & 1) != 0)
                                              goto LABEL_14;
                                            v22 = "ASPFTLParseBufferToCxt: indUsedFrags(971): Cannot add 12 elements to context";
                                            goto LABEL_2228;
                                          default:
                                            switch(v12)
                                            {
                                              case 996:
                                                if ((sub_1000145F8(a1, "clogFindFail", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                                  goto LABEL_16;
                                                v19 = "ASPFTLParseBufferToCxt: clogFindFail(996) cannot add 1 element to context";
                                                goto LABEL_15;
                                              case 997:
                                                if ((sub_1000145F8(a1, "clogFindBlank", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                                  goto LABEL_16;
                                                v19 = "ASPFTLParseBufferToCxt: clogFindBlank(997) cannot add 1 element to context";
                                                goto LABEL_15;
                                              case 998:
                                                if ((sub_1000145F8(a1, "clogFindUnc", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                                  goto LABEL_16;
                                                v19 = "ASPFTLParseBufferToCxt: clogFindUnc(998) cannot add 1 element to context";
                                                goto LABEL_15;
                                              case 999:
                                                if ((sub_1000145F8(a1, "clogFindUnexpected", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                                  goto LABEL_16;
                                                v19 = "ASPFTLParseBufferToCxt: clogFindUnexpected(999) cannot add 1 element to context";
                                                goto LABEL_15;
                                              case 1001:
                                                if ((_DWORD)v14 != 8)
                                                  sub_10001B514("ASPFTLParseBufferToCxt: clogReplayFailReason(1001): (#8) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                                if (v14 >= 8)
                                                  v20 = 8;
                                                else
                                                  v20 = v14;
                                                if ((sub_1000145F8(a1, "clogReplayFailReason_", (uint64_t)v8, 8u, v20) & 1) != 0)
                                                  goto LABEL_14;
                                                v22 = "ASPFTLParseBufferToCxt: clogReplayFailReason(1001): Cannot add 8 e"
                                                      "lements to context";
                                                goto LABEL_2228;
                                              case 1002:
                                                if ((sub_1000145F8(a1, "clogReplayTransientError", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                                  goto LABEL_16;
                                                v19 = "ASPFTLParseBufferToCxt: clogReplayTransientError(1002) cannot add "
                                                      "1 element to context";
                                                goto LABEL_15;
                                              case 1003:
                                                if ((sub_1000145F8(a1, "clogReplaySpfError", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                                  goto LABEL_16;
                                                v19 = "ASPFTLParseBufferToCxt: clogReplaySpfError(1003) cannot add 1 element to context";
                                                goto LABEL_15;
                                              case 1015:
                                                if ((_DWORD)v14 != 4)
                                                  sub_10001B514("ASPFTLParseBufferToCxt: eanEarlyBootUeccPage(1015): (#4) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                                if (v14 >= 4)
                                                  v20 = 4;
                                                else
                                                  v20 = v14;
                                                if ((sub_1000145F8(a1, "eanEarlyBootUeccPage_", (uint64_t)v8, 8u, v20) & 1) != 0)
                                                  goto LABEL_14;
                                                v22 = "ASPFTLParseBufferToCxt: eanEarlyBootUeccPage(1015): Cannot add 4 e"
                                                      "lements to context";
                                                goto LABEL_2228;
                                              case 1016:
                                                if ((sub_1000145F8(a1, "eanEarlyBootNumUeccPages", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                                  goto LABEL_16;
                                                v19 = "ASPFTLParseBufferToCxt: eanEarlyBootNumUeccPages(1016) cannot add "
                                                      "1 element to context";
                                                goto LABEL_15;
                                              case 1017:
                                                if ((sub_1000145F8(a1, "eanEarlyBootUeccMultiplane", (uint64_t)v8, 8u, 1u) & 1) != 0)goto LABEL_16;
                                                v19 = "ASPFTLParseBufferToCxt: eanEarlyBootUeccMultiplane(1017) cannot ad"
                                                      "d 1 element to context";
                                                goto LABEL_15;
                                              default:
                                                goto LABEL_2116;
                                            }
                                        }
                                      }
                                      if (v12 <= 1146)
                                      {
                                        if (v12 <= 1104)
                                        {
                                          if (v12 <= 1041)
                                          {
                                            if (v12 == 1040)
                                            {
                                              if ((_DWORD)v14 != 31)
                                                sub_10001B514("ASPFTLParseBufferToCxt: bandsAgeBinsV2(1040): (#31) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                              if (v14 >= 0x1F)
                                                v20 = 31;
                                              else
                                                v20 = v14;
                                              if ((sub_1000145F8(a1, "bandsAgeBinsV2_", (uint64_t)v8, 8u, v20) & 1) == 0)
                                              {
                                                v22 = "ASPFTLParseBufferToCxt: bandsAgeBinsV2(1040): Cannot add 31 elements to context";
                                                goto LABEL_2228;
                                              }
                                            }
                                            else
                                            {
                                              if ((_DWORD)v14 != 31)
                                                sub_10001B514("ASPFTLParseBufferToCxt: bandsAgeBinsSnapshot(1041): (#31) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                              if (v14 >= 0x1F)
                                                v20 = 31;
                                              else
                                                v20 = v14;
                                              if ((sub_1000145F8(a1, "bandsAgeBinsSnapshot_", (uint64_t)v8, 8u, v20) & 1) == 0)
                                              {
                                                v22 = "ASPFTLParseBufferToCxt: bandsAgeBinsSnapshot(1041): Cannot add 31 "
                                                      "elements to context";
                                                goto LABEL_2228;
                                              }
                                            }
                                            goto LABEL_14;
                                          }
                                          if (v12 == 1042)
                                          {
                                            if ((_DWORD)v14 != 15)
                                              sub_10001B514("ASPFTLParseBufferToCxt: bandsAgeBinsReadSectors(1042): (#15) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                            if (v14 >= 0xF)
                                              v20 = 15;
                                            else
                                              v20 = v14;
                                            if ((sub_1000145F8(a1, "bandsAgeBinsReadSectors_", (uint64_t)v8, 8u, v20) & 1) == 0)
                                            {
                                              v22 = "ASPFTLParseBufferToCxt: bandsAgeBinsReadSectors(1042): Cannot add 15"
                                                    " elements to context";
                                              goto LABEL_2228;
                                            }
                                            goto LABEL_14;
                                          }
                                          if (v12 == 1080)
                                          {
                                            if ((sub_1000145F8(a1, "raidForceClogLoad", (uint64_t)v8, 8u, 1u) & 1) == 0)
                                            {
                                              v19 = "ASPFTLParseBufferToCxt: raidForceClogLoad(1080) cannot add 1 element to context";
LABEL_15:
                                              sub_10001B514(v19, a2, a3, a4, a5, a6, a7, a8, v23);
                                            }
LABEL_16:
                                            v10 = (v10 + 1);
                                            goto LABEL_17;
                                          }
                                        }
                                        else if (v12 <= 1115)
                                        {
                                          if (v12 == 1105)
                                          {
                                            if ((_DWORD)v14 != 14)
                                              sub_10001B514("ASPFTLParseBufferToCxt: hostReadSequential(1105): (#14) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                            if (v14 >= 0xE)
                                              v20 = 14;
                                            else
                                              v20 = v14;
                                            if ((sub_1000145F8(a1, "hostReadSequential_", (uint64_t)v8, 8u, v20) & 1) == 0)
                                            {
                                              v22 = "ASPFTLParseBufferToCxt: hostReadSequential(1105): Cannot add 14 elements to context";
                                              goto LABEL_2228;
                                            }
                                            goto LABEL_14;
                                          }
                                          if (v12 == 1106)
                                          {
                                            if ((_DWORD)v14 != 14)
                                              sub_10001B514("ASPFTLParseBufferToCxt: GCReadSequential(1106): (#14) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                            if (v14 >= 0xE)
                                              v20 = 14;
                                            else
                                              v20 = v14;
                                            if ((sub_1000145F8(a1, "GCReadSequential_", (uint64_t)v8, 8u, v20) & 1) == 0)
                                            {
                                              v22 = "ASPFTLParseBufferToCxt: GCReadSequential(1106): Cannot add 14 elements to context";
                                              goto LABEL_2228;
                                            }
                                            goto LABEL_14;
                                          }
                                        }
                                        else
                                        {
                                          switch(v12)
                                          {
                                            case 1116:
                                              if ((_DWORD)v14 != 32)
                                                sub_10001B514("ASPFTLParseBufferToCxt: gcwamp(1116): (#32) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                              if (v14 >= 0x20)
                                                v20 = 32;
                                              else
                                                v20 = v14;
                                              if ((sub_1000145F8(a1, "gcwamp_", (uint64_t)v8, 8u, v20) & 1) == 0)
                                              {
                                                v22 = "ASPFTLParseBufferToCxt: gcwamp(1116): Cannot add 32 elements to context";
                                                goto LABEL_2228;
                                              }
                                              goto LABEL_14;
                                            case 1137:
                                              if ((sub_1000145F8(a1, "numOfToUnhappySwitches", (uint64_t)v8, 8u, 1u) & 1) == 0)
                                              {
                                                v19 = "ASPFTLParseBufferToCxt: numOfToUnhappySwitches(1137) cannot add 1 "
                                                      "element to context";
                                                goto LABEL_15;
                                              }
                                              goto LABEL_16;
                                            case 1138:
                                              if ((sub_1000145F8(a1, "numOfToHappySwitches", (uint64_t)v8, 8u, 1u) & 1) == 0)
                                              {
                                                v19 = "ASPFTLParseBufferToCxt: numOfToHappySwitches(1138) cannot add 1 el"
                                                      "ement to context";
                                                goto LABEL_15;
                                              }
                                              goto LABEL_16;
                                          }
                                        }
LABEL_2116:
                                        if (v12 <= 1231)
                                        {
                                          switch(v12)
                                          {
                                            case 1198:
                                              if ((_DWORD)v14 != 3)
                                                sub_10001B514("ASPFTLParseBufferToCxt: poDetectPERemovalMostSevereCost(1198): (#3) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                              if (v14 >= 3)
                                                v20 = 3;
                                              else
                                                v20 = v14;
                                              if ((sub_1000145F8(a1, "poDetectPERemovalMostSevereCost_", (uint64_t)v8, 8u, v20) & 1) != 0)goto LABEL_14;
                                              v22 = "ASPFTLParseBufferToCxt: poDetectPERemovalMostSevereCost(1198): Canno"
                                                    "t add 3 elements to context";
                                              goto LABEL_2228;
                                            case 1199:
                                              if ((sub_1000145F8(a1, "poDetectCurrentSize", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                                goto LABEL_16;
                                              v19 = "ASPFTLParseBufferToCxt: poDetectCurrentSize(1199) cannot add 1 element to context";
                                              goto LABEL_15;
                                            case 1200:
                                              goto LABEL_2166;
                                            case 1201:
                                              if ((_DWORD)v14 != 4)
                                                sub_10001B514("ASPFTLParseBufferToCxt: gcVerticalSuccssfulAlignments(1201): (#4) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                              if (v14 >= 4)
                                                v20 = 4;
                                              else
                                                v20 = v14;
                                              if ((sub_1000145F8(a1, "gcVerticalSuccssfulAlignments_", (uint64_t)v8, 8u, v20) & 1) != 0)goto LABEL_14;
                                              v22 = "ASPFTLParseBufferToCxt: gcVerticalSuccssfulAlignments(1201): Cannot "
                                                    "add 4 elements to context";
                                              goto LABEL_2228;
                                            case 1202:
                                              if ((_DWORD)v14 != 4)
                                                sub_10001B514("ASPFTLParseBufferToCxt: gcVerticalNoAlignmentDueToMissingSegs(1202): (#4) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                              if (v14 >= 4)
                                                v20 = 4;
                                              else
                                                v20 = v14;
                                              if ((sub_1000145F8(a1, "gcVerticalNoAlignmentDueToMissingSegs_", (uint64_t)v8, 8u, v20) & 1) != 0)goto LABEL_14;
                                              v22 = "ASPFTLParseBufferToCxt: gcVerticalNoAlignmentDueToMissingSegs(1202):"
                                                    " Cannot add 4 elements to context";
                                              goto LABEL_2228;
                                            default:
                                              switch(v12)
                                              {
                                                case 1216:
                                                  if ((_DWORD)v14 != 24)
                                                    sub_10001B514("ASPFTLParseBufferToCxt: tlcWLPerDipAvgPEC(1216): (#24) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                                  if (v14 >= 0x18)
                                                    v20 = 24;
                                                  else
                                                    v20 = v14;
                                                  if ((sub_1000145F8(a1, "tlcWLPerDipAvgPEC_", (uint64_t)v8, 8u, v20) & 1) != 0)
                                                    goto LABEL_14;
                                                  v22 = "ASPFTLParseBufferToCxt: tlcWLPerDipAvgPEC(1216): Cannot add 24 e"
                                                        "lements to context";
                                                  goto LABEL_2228;
                                                case 1217:
                                                  if ((_DWORD)v14 != 24)
                                                    sub_10001B514("ASPFTLParseBufferToCxt: tlcWLPerDipMaxPEC(1217): (#24) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                                  if (v14 >= 0x18)
                                                    v20 = 24;
                                                  else
                                                    v20 = v14;
                                                  if ((sub_1000145F8(a1, "tlcWLPerDipMaxPEC_", (uint64_t)v8, 8u, v20) & 1) != 0)
                                                    goto LABEL_14;
                                                  v22 = "ASPFTLParseBufferToCxt: tlcWLPerDipMaxPEC(1217): Cannot add 24 e"
                                                        "lements to context";
                                                  goto LABEL_2228;
                                                case 1218:
                                                  if ((_DWORD)v14 != 24)
                                                    sub_10001B514("ASPFTLParseBufferToCxt: tlcWLPerDipMinPEC(1218): (#24) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                                  if (v14 >= 0x18)
                                                    v20 = 24;
                                                  else
                                                    v20 = v14;
                                                  if ((sub_1000145F8(a1, "tlcWLPerDipMinPEC_", (uint64_t)v8, 8u, v20) & 1) != 0)
                                                    goto LABEL_14;
                                                  v22 = "ASPFTLParseBufferToCxt: tlcWLPerDipMinPEC(1218): Cannot add 24 e"
                                                        "lements to context";
                                                  goto LABEL_2228;
                                                case 1219:
                                                case 1220:
                                                case 1221:
                                                case 1222:
                                                case 1223:
                                                  goto LABEL_2166;
                                                case 1224:
                                                  if ((_DWORD)v14 != 20)
                                                    sub_10001B514("ASPFTLParseBufferToCxt: apfsValidLbaOvershoot(1224): (#20) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                                  if (v14 >= 0x14)
                                                    v20 = 20;
                                                  else
                                                    v20 = v14;
                                                  if ((sub_1000145F8(a1, "apfsValidLbaOvershoot_", (uint64_t)v8, 8u, v20) & 1) != 0)goto LABEL_14;
                                                  v22 = "ASPFTLParseBufferToCxt: apfsValidLbaOvershoot(1224): Cannot add "
                                                        "20 elements to context";
                                                  goto LABEL_2228;
                                                default:
                                                  if (v12 != 1211)
                                                    goto LABEL_2166;
                                                  if ((_DWORD)v14 != 24)
                                                    sub_10001B514("ASPFTLParseBufferToCxt: forcedAllocationSmallEraseQ(1211): (#24) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                                  if (v14 >= 0x18)
                                                    v20 = 24;
                                                  else
                                                    v20 = v14;
                                                  if ((sub_1000145F8(a1, "forcedAllocationSmallEraseQ_", (uint64_t)v8, 8u, v20) & 1) != 0)goto LABEL_14;
                                                  v22 = "ASPFTLParseBufferToCxt: forcedAllocationSmallEraseQ(1211): Canno"
                                                        "t add 24 elements to context";
                                                  break;
                                              }
                                              goto LABEL_2228;
                                          }
                                        }
                                        switch(v12)
                                        {
                                          case 1232:
                                            if ((sub_1000145F8(a1, "eanFastSize", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                              goto LABEL_16;
                                            v19 = "ASPFTLParseBufferToCxt: eanFastSize(1232) cannot add 1 element to context";
                                            goto LABEL_15;
                                          case 1233:
                                            if ((sub_1000145F8(a1, "eanNumSlcEvictions", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                              goto LABEL_16;
                                            v19 = "ASPFTLParseBufferToCxt: eanNumSlcEvictions(1233) cannot add 1 element to context";
                                            goto LABEL_15;
                                          case 1234:
                                            if ((sub_1000145F8(a1, "eanNumForcedCompress", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                              goto LABEL_16;
                                            v19 = "ASPFTLParseBufferToCxt: eanNumForcedCompress(1234) cannot add 1 element to context";
                                            goto LABEL_15;
                                          case 1241:
                                            if ((_DWORD)v14 != 10)
                                              sub_10001B514("ASPFTLParseBufferToCxt: s2rTimeHisto(1241): (#10) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                            if (v14 >= 0xA)
                                              v20 = 10;
                                            else
                                              v20 = v14;
                                            if ((sub_1000145F8(a1, "s2rTimeHisto_", (uint64_t)v8, 8u, v20) & 1) != 0)
                                              goto LABEL_14;
                                            v22 = "ASPFTLParseBufferToCxt: s2rTimeHisto(1241): Cannot add 10 elements to context";
                                            goto LABEL_2228;
                                          case 1244:
                                            if ((sub_1000145F8(a1, "calendarTimeWentBackward", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                              goto LABEL_16;
                                            v19 = "ASPFTLParseBufferToCxt: calendarTimeWentBackward(1244) cannot add 1 el"
                                                  "ement to context";
                                            goto LABEL_15;
                                          case 1246:
                                            if ((_DWORD)v14 != 8)
                                              sub_10001B514("ASPFTLParseBufferToCxt: bandsUeccCrossTempHisto(1246): (#8) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                            if (v14 >= 8)
                                              v20 = 8;
                                            else
                                              v20 = v14;
                                            if ((sub_1000145F8(a1, "bandsUeccCrossTempHisto_", (uint64_t)v8, 8u, v20) & 1) != 0)
                                              goto LABEL_14;
                                            v22 = "ASPFTLParseBufferToCxt: bandsUeccCrossTempHisto(1246): Cannot add 8 el"
                                                  "ements to context";
                                            goto LABEL_2228;
                                          default:
LABEL_2166:
                                            if (v14 <= 1)
                                              snprintf(__str, 0x20uLL, "Stat_%d");
                                            else
                                              snprintf(__str, 0x20uLL, "Stat_%d_");
                                            if ((sub_1000145F8(a1, __str, (uint64_t)v8, 8u, v14) & 1) == 0)
                                            {
                                              sub_10001B514("ASPFTLParseBufferToCxt %d: Cannot add %d elements to context", a2, a3, a4, a5, a6, a7, a8, v12);
                                              return v10;
                                            }
                                            v10 = (v10 + v14);
                                            break;
                                        }
LABEL_17:
                                        v8 += v14;
                                        v11 -= v14;
                                        goto LABEL_2;
                                      }
                                      switch(v12)
                                      {
                                        case 1147:
                                          if ((_DWORD)v14 != 24)
                                            sub_10001B514("ASPFTLParseBufferToCxt: gc_concurrent_dw_gc12(1147): (#24) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                          if (v14 >= 0x18)
                                            v20 = 24;
                                          else
                                            v20 = v14;
                                          if ((sub_1000145F8(a1, "gc_concurrent_dw_gc12_", (uint64_t)v8, 8u, v20) & 1) != 0)
                                            goto LABEL_14;
                                          v22 = "ASPFTLParseBufferToCxt: gc_concurrent_dw_gc12(1147): Cannot add 24 elements to context";
                                          goto LABEL_2228;
                                        case 1148:
                                          if ((_DWORD)v14 != 24)
                                            sub_10001B514("ASPFTLParseBufferToCxt: gc_concurrent_dw_gc1(1148): (#24) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                          if (v14 >= 0x18)
                                            v20 = 24;
                                          else
                                            v20 = v14;
                                          if ((sub_1000145F8(a1, "gc_concurrent_dw_gc1_", (uint64_t)v8, 8u, v20) & 1) != 0)
                                            goto LABEL_14;
                                          v22 = "ASPFTLParseBufferToCxt: gc_concurrent_dw_gc1(1148): Cannot add 24 elements to context";
                                          goto LABEL_2228;
                                        case 1149:
                                          if ((_DWORD)v14 != 24)
                                            sub_10001B514("ASPFTLParseBufferToCxt: gc_concurrent_dw_gc2(1149): (#24) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                          if (v14 >= 0x18)
                                            v20 = 24;
                                          else
                                            v20 = v14;
                                          if ((sub_1000145F8(a1, "gc_concurrent_dw_gc2_", (uint64_t)v8, 8u, v20) & 1) != 0)
                                            goto LABEL_14;
                                          v22 = "ASPFTLParseBufferToCxt: gc_concurrent_dw_gc2(1149): Cannot add 24 elements to context";
                                          goto LABEL_2228;
                                        case 1150:
                                        case 1151:
                                        case 1152:
                                        case 1153:
                                        case 1154:
                                        case 1155:
                                        case 1156:
                                        case 1159:
                                        case 1160:
                                        case 1161:
                                        case 1162:
                                        case 1163:
                                        case 1164:
                                        case 1165:
                                        case 1166:
                                        case 1167:
                                        case 1170:
                                        case 1173:
                                        case 1174:
                                        case 1175:
                                        case 1176:
                                        case 1177:
                                        case 1178:
                                        case 1186:
                                        case 1187:
                                        case 1188:
                                          goto LABEL_2116;
                                        case 1157:
                                          if ((sub_1000145F8(a1, "eanMaxForceROTimeMs", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                            goto LABEL_16;
                                          v19 = "ASPFTLParseBufferToCxt: eanMaxForceROTimeMs(1157) cannot add 1 element to context";
                                          goto LABEL_15;
                                        case 1158:
                                          if ((sub_1000145F8(a1, "eanMaxForceRORecoTimeMs", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                            goto LABEL_16;
                                          v19 = "ASPFTLParseBufferToCxt: eanMaxForceRORecoTimeMs(1158) cannot add 1 element to context";
                                          goto LABEL_15;
                                        case 1168:
                                          if ((_DWORD)v14 != 2)
                                            sub_10001B514("ASPFTLParseBufferToCxt: poDetectPERemovalTotalCost(1168): (#2) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                          if (v14 >= 2)
                                            v20 = 2;
                                          else
                                            v20 = v14;
                                          if ((sub_1000145F8(a1, "poDetectPERemovalTotalCost_", (uint64_t)v8, 8u, v20) & 1) != 0)
                                            goto LABEL_14;
                                          v22 = "ASPFTLParseBufferToCxt: poDetectPERemovalTotalCost(1168): Cannot add 2 e"
                                                "lements to context";
                                          goto LABEL_2228;
                                        case 1169:
                                          if ((_DWORD)v14 != 2)
                                            sub_10001B514("ASPFTLParseBufferToCxt: poDetectEmptySpotRemovalTotalCost(1169): (#2) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                          if (v14 >= 2)
                                            v20 = 2;
                                          else
                                            v20 = v14;
                                          if ((sub_1000145F8(a1, "poDetectEmptySpotRemovalTotalCost_", (uint64_t)v8, 8u, v20) & 1) != 0)goto LABEL_14;
                                          v22 = "ASPFTLParseBufferToCxt: poDetectEmptySpotRemovalTotalCost(1169): Cannot "
                                                "add 2 elements to context";
                                          goto LABEL_2228;
                                        case 1171:
                                          if ((_DWORD)v14 != 10)
                                            sub_10001B514("ASPFTLParseBufferToCxt: poDetectEmptySpotRemovalAge(1171): (#10) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                          if (v14 >= 0xA)
                                            v20 = 10;
                                          else
                                            v20 = v14;
                                          if ((sub_1000145F8(a1, "poDetectEmptySpotRemovalAge_", (uint64_t)v8, 8u, v20) & 1) != 0)
                                            goto LABEL_14;
                                          v22 = "ASPFTLParseBufferToCxt: poDetectEmptySpotRemovalAge(1171): Cannot add 10"
                                                " elements to context";
                                          goto LABEL_2228;
                                        case 1172:
                                          if ((_DWORD)v14 != 3)
                                            sub_10001B514("ASPFTLParseBufferToCxt: poDetectGBBedMostSevereCost(1172): (#3) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                          if (v14 >= 3)
                                            v20 = 3;
                                          else
                                            v20 = v14;
                                          if ((sub_1000145F8(a1, "poDetectGBBedMostSevereCost_", (uint64_t)v8, 8u, v20) & 1) != 0)
                                            goto LABEL_14;
                                          v22 = "ASPFTLParseBufferToCxt: poDetectGBBedMostSevereCost(1172): Cannot add 3 "
                                                "elements to context";
                                          goto LABEL_2228;
                                        case 1179:
                                          if ((_DWORD)v14 != 4)
                                            sub_10001B514("ASPFTLParseBufferToCxt: gc_cur_dw_gc1(1179): (#4) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                          if (v14 >= 4)
                                            v20 = 4;
                                          else
                                            v20 = v14;
                                          if ((sub_1000145F8(a1, "gc_cur_dw_gc1_", (uint64_t)v8, 8u, v20) & 1) != 0)
                                            goto LABEL_14;
                                          v22 = "ASPFTLParseBufferToCxt: gc_cur_dw_gc1(1179): Cannot add 4 elements to context";
                                          goto LABEL_2228;
                                        case 1180:
                                          if ((_DWORD)v14 != 4)
                                            sub_10001B514("ASPFTLParseBufferToCxt: gc_cur_dw_gc2(1180): (#4) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                          if (v14 >= 4)
                                            v20 = 4;
                                          else
                                            v20 = v14;
                                          if ((sub_1000145F8(a1, "gc_cur_dw_gc2_", (uint64_t)v8, 8u, v20) & 1) != 0)
                                            goto LABEL_14;
                                          v22 = "ASPFTLParseBufferToCxt: gc_cur_dw_gc2(1180): Cannot add 4 elements to context";
                                          goto LABEL_2228;
                                        case 1181:
                                          if ((_DWORD)v14 != 4)
                                            sub_10001B514("ASPFTLParseBufferToCxt: gc_cur_dw_gc3(1181): (#4) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                          if (v14 >= 4)
                                            v20 = 4;
                                          else
                                            v20 = v14;
                                          if ((sub_1000145F8(a1, "gc_cur_dw_gc3_", (uint64_t)v8, 8u, v20) & 1) != 0)
                                            goto LABEL_14;
                                          v22 = "ASPFTLParseBufferToCxt: gc_cur_dw_gc3(1181): Cannot add 4 elements to context";
                                          goto LABEL_2228;
                                        case 1182:
                                          if ((_DWORD)v14 != 4)
                                            sub_10001B514("ASPFTLParseBufferToCxt: gc_tot_dw_gc1(1182): (#4) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                          if (v14 >= 4)
                                            v20 = 4;
                                          else
                                            v20 = v14;
                                          if ((sub_1000145F8(a1, "gc_tot_dw_gc1_", (uint64_t)v8, 8u, v20) & 1) != 0)
                                            goto LABEL_14;
                                          v22 = "ASPFTLParseBufferToCxt: gc_tot_dw_gc1(1182): Cannot add 4 elements to context";
                                          goto LABEL_2228;
                                        case 1183:
                                          if ((_DWORD)v14 != 4)
                                            sub_10001B514("ASPFTLParseBufferToCxt: gc_tot_dw_gc2(1183): (#4) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                          if (v14 >= 4)
                                            v20 = 4;
                                          else
                                            v20 = v14;
                                          if ((sub_1000145F8(a1, "gc_tot_dw_gc2_", (uint64_t)v8, 8u, v20) & 1) != 0)
                                            goto LABEL_14;
                                          v22 = "ASPFTLParseBufferToCxt: gc_tot_dw_gc2(1183): Cannot add 4 elements to context";
                                          goto LABEL_2228;
                                        case 1184:
                                          if ((sub_1000145F8(a1, "unhappy_state", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                            goto LABEL_16;
                                          v19 = "ASPFTLParseBufferToCxt: unhappy_state(1184) cannot add 1 element to context";
                                          goto LABEL_15;
                                        case 1185:
                                          if ((sub_1000145F8(a1, "unhappy_level", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                            goto LABEL_16;
                                          v19 = "ASPFTLParseBufferToCxt: unhappy_level(1185) cannot add 1 element to context";
                                          goto LABEL_15;
                                        case 1189:
                                          if ((sub_1000145F8(a1, "lastLbaFormatTime", (uint64_t)v8, 8u, 1u) & 1) != 0)
                                            goto LABEL_16;
                                          v19 = "ASPFTLParseBufferToCxt: lastLbaFormatTime(1189) cannot add 1 element to context";
                                          goto LABEL_15;
                                        case 1190:
                                          if ((_DWORD)v14 != 12)
                                            sub_10001B514("ASPFTLParseBufferToCxt: powerDownTime(1190): (#12) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                          if (v14 >= 0xC)
                                            v20 = 12;
                                          else
                                            v20 = v14;
                                          if ((sub_1000145F8(a1, "powerDownTime_", (uint64_t)v8, 8u, v20) & 1) != 0)
                                            goto LABEL_14;
                                          v22 = "ASPFTLParseBufferToCxt: powerDownTime(1190): Cannot add 12 elements to context";
                                          goto LABEL_2228;
                                        default:
                                          if (v12 != 1196)
                                          {
                                            if (v12 == 1197)
                                            {
                                              if ((_DWORD)v14 != 10)
                                                sub_10001B514("ASPFTLParseBufferToCxt: poDetectGBBedAge(1197): (#10) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                              if (v14 >= 0xA)
                                                v20 = 10;
                                              else
                                                v20 = v14;
                                              if ((sub_1000145F8(a1, "poDetectGBBedAge_", (uint64_t)v8, 8u, v20) & 1) == 0)
                                              {
                                                v22 = "ASPFTLParseBufferToCxt: poDetectGBBedAge(1197): Cannot add 10 elements to context";
                                                goto LABEL_2228;
                                              }
                                              goto LABEL_14;
                                            }
                                            goto LABEL_2116;
                                          }
                                          if ((_DWORD)v14 != 5)
                                            sub_10001B514("ASPFTLParseBufferToCxt: poDetectGBBedTotalCost(1196): (#5) cfg elements != (%d) buffer elements", a2, a3, a4, a5, a6, a7, a8, v14);
                                          if (v14 >= 5)
                                            v20 = 5;
                                          else
                                            v20 = v14;
                                          if ((sub_1000145F8(a1, "poDetectGBBedTotalCost_", (uint64_t)v8, 8u, v20) & 1) != 0)
                                          {
LABEL_14:
                                            v10 = v20 + v10;
                                            goto LABEL_17;
                                          }
                                          v22 = "ASPFTLParseBufferToCxt: poDetectGBBedTotalCost(1196): Cannot add 5 elements to context";
LABEL_2228:
                                          sub_10001B514(v22, a2, a3, a4, a5, a6, a7, a8, v23);
                                          return v10;
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

uint64_t sub_1000145F8(uint64_t a1, const char *a2, uint64_t a3, unsigned int a4, unsigned int a5)
{
  uint64_t v5;
  int v11;
  int v12;
  uint64_t v14;
  char __str[101];

  v14 = 0;
  v5 = 1;
  if (a4 && a5)
  {
    if (a5 == 1)
    {
      if (a4 <= 8)
      {
        __memmove_chk(&v14, a3, a4, 8);
        return sub_10001B08C(a1, "", a2, v14);
      }
      else
      {
        return 0;
      }
    }
    else
    {
      v11 = 0;
      v12 = 0;
      do
      {
        v14 = 0;
        if (a4 <= 8)
        {
          __memmove_chk(&v14, a3 + v11 * a4, a4, 8);
          snprintf(__str, 0x64uLL, "%d", v11);
          __str[100] = 0;
          v5 = sub_10001B08C(a1, a2, __str, v14) & v5;
        }
        else
        {
          v5 = 0;
        }
        v11 = (unsigned __int16)++v12;
      }
      while ((unsigned __int16)v12 < a5);
    }
  }
  return v5;
}

uint64_t sub_100014758(uint64_t a1, unint64_t *a2, unsigned int a3)
{
  uint64_t v5;
  unsigned int v6;
  int v7;
  unsigned int v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char __str[16];
  __int128 v22;

  v5 = 0;
  v6 = a3 >> 3;
  *(_OWORD *)__str = 0u;
  v22 = 0u;
LABEL_2:
  v7 = -v6;
  while (v7)
  {
    v9 = *a2++;
    v8 = v9;
    v10 = HIDWORD(v9);
    ++v7;
    if (HIDWORD(v9))
    {
      if (v8 != 0xFFFF && v8 <= 0x30000000 && -v7 >= v10)
      {
        if (v10 <= 1)
          snprintf(__str, 0x20uLL, "Stat_%d");
        else
          snprintf(__str, 0x20uLL, "Stat_%d_");
        if ((sub_1000145F8(a1, __str, (uint64_t)a2, 8u, v10) & 1) != 0)
        {
          v5 = (v5 + v10);
          a2 += v10;
          v6 = -v7 - v10;
          goto LABEL_2;
        }
        sub_10001B514("ASPFTLParseBufferToCxt %d: Cannot add %d elements to context", v13, v14, v15, v16, v17, v18, v19, v8);
      }
      return v5;
    }
  }
  return v5;
}

uint64_t sub_100014880(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  const char *v9;
  unsigned int v10;
  uint64_t v11;
  __int16 *v13;
  const char *v14;
  unsigned __int16 *v15;
  uint64_t v16;
  int v17;
  const char *v19;
  __int16 *v20;
  unsigned int v21;
  unsigned int v22;
  char v24;

  v8 = 0;
  v9 = "ASPMSPParseBufferToCxt: Passed in invalid buffer or empty buffer";
  if (!a2)
    goto LABEL_1981;
  v10 = a3;
  if (!(_DWORD)a3)
    goto LABEL_1981;
  v11 = a2;
  v8 = 0;
  v13 = &jpt_1000189D4;
  v14 = "ASPMSPParseBufferToCxt: fs1_4b_fail(4279): Error adding 4 elements to context";
  v9 = "ASPMSPParseBufferToCxt: cbdr_step_5(4256): Error adding 10 elements to context";
  while (1)
  {
    do
    {
      if (!v10)
        return v8;
      v15 = (unsigned __int16 *)v11;
      v16 = *(unsigned __int16 *)(v11 + 2);
      v11 += 4;
      v10 -= 4;
    }
    while (!(_DWORD)v16);
    v17 = *v15;
    if (v17 != 12286)
      break;
LABEL_461:
    v11 += v16;
    v10 -= v16;
  }
  if (v17 == 12287 || v10 < v16)
    return v8;
  switch(v17)
  {
    case 4096:
      v19 = v14;
      v20 = v13;
      if ((_DWORD)v16 != 4)
        sub_10001B514("ASPMSPParseBufferToCxt: passWithTmodeHard(4096): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      if (v16 >= 8)
        v21 = 1;
      else
        v21 = v16 >> 2;
      if (sub_1000145F8(a1, "passWithTmodeHard", v11, 4u, v21))
        goto LABEL_460;
      v9 = "ASPMSPParseBufferToCxt: passWithTmodeHard(4096): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4097:
      v19 = v14;
      v20 = v13;
      if ((_DWORD)v16 != 4)
        sub_10001B514("ASPMSPParseBufferToCxt: passWithTmodeFS1_2b(4097): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      if (v16 >= 8)
        v21 = 1;
      else
        v21 = v16 >> 2;
      if (sub_1000145F8(a1, "passWithTmodeFS1_2b", v11, 4u, v21))
        goto LABEL_460;
      v9 = "ASPMSPParseBufferToCxt: passWithTmodeFS1_2b(4097): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4098:
      v19 = v14;
      v20 = v13;
      if ((_DWORD)v16 != 4)
        sub_10001B514("ASPMSPParseBufferToCxt: passWithTmodeFS1_4b(4098): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      if (v16 >= 8)
        v21 = 1;
      else
        v21 = v16 >> 2;
      if (sub_1000145F8(a1, "passWithTmodeFS1_4b", v11, 4u, v21))
        goto LABEL_460;
      v9 = "ASPMSPParseBufferToCxt: passWithTmodeFS1_4b(4098): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4099:
      v19 = v14;
      v20 = v13;
      if ((_DWORD)v16 != 4)
        sub_10001B514("ASPMSPParseBufferToCxt: passWithTmodeHard_fast(4099): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      if (v16 >= 8)
        v21 = 1;
      else
        v21 = v16 >> 2;
      if (sub_1000145F8(a1, "passWithTmodeHard_fast", v11, 4u, v21))
        goto LABEL_460;
      v9 = "ASPMSPParseBufferToCxt: passWithTmodeHard_fast(4099): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4100:
      v19 = v14;
      v20 = v13;
      if ((_DWORD)v16 != 4)
        sub_10001B514("ASPMSPParseBufferToCxt: passWithTmodeFS1_2b_fast(4100): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      if (v16 >= 8)
        v21 = 1;
      else
        v21 = v16 >> 2;
      if (sub_1000145F8(a1, "passWithTmodeFS1_2b_fast", v11, 4u, v21))
        goto LABEL_460;
      v9 = "ASPMSPParseBufferToCxt: passWithTmodeFS1_2b_fast(4100): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4101:
      v19 = v14;
      v20 = v13;
      if ((_DWORD)v16 != 4)
        sub_10001B514("ASPMSPParseBufferToCxt: passWithTmodeFS1_4b_fast(4101): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      if (v16 >= 8)
        v21 = 1;
      else
        v21 = v16 >> 2;
      if (sub_1000145F8(a1, "passWithTmodeFS1_4b_fast", v11, 4u, v21))
        goto LABEL_460;
      v9 = "ASPMSPParseBufferToCxt: passWithTmodeFS1_4b_fast(4101): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4102:
      v19 = v14;
      v20 = v13;
      if ((_DWORD)v16 != 4)
        sub_10001B514("ASPMSPParseBufferToCxt: numOfCwFailedInTmodeFS2_EOL(4102): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      if (v16 >= 8)
        v21 = 1;
      else
        v21 = v16 >> 2;
      if (sub_1000145F8(a1, "numOfCwFailedInTmodeFS2_EOL", v11, 4u, v21))
        goto LABEL_460;
      v9 = "ASPMSPParseBufferToCxt: numOfCwFailedInTmodeFS2_EOL(4102): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4103:
      v19 = v14;
      v20 = v13;
      if ((_DWORD)v16 != 4)
        sub_10001B514("ASPMSPParseBufferToCxt: numOfCwFailedInTmodeFS2_DSP_EOL(4103): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      if (v16 >= 8)
        v21 = 1;
      else
        v21 = v16 >> 2;
      if (sub_1000145F8(a1, "numOfCwFailedInTmodeFS2_DSP_EOL", v11, 4u, v21))
        goto LABEL_460;
      v9 = "ASPMSPParseBufferToCxt: numOfCwFailedInTmodeFS2_DSP_EOL(4103): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4104:
      v19 = v14;
      v20 = v13;
      if ((_DWORD)v16 != 4)
        sub_10001B514("ASPMSPParseBufferToCxt: readAlgoPassWithHardAfterAcq(4104): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      if (v16 >= 8)
        v21 = 1;
      else
        v21 = v16 >> 2;
      if (sub_1000145F8(a1, "readAlgoPassWithHardAfterAcq", v11, 4u, v21))
        goto LABEL_460;
      v9 = "ASPMSPParseBufferToCxt: readAlgoPassWithHardAfterAcq(4104): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4105:
      v19 = v14;
      v20 = v13;
      if ((_DWORD)v16 != 4)
        sub_10001B514("ASPMSPParseBufferToCxt: firstReadWasHardWithDefaultBDBFastRead(4105): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      if (v16 >= 8)
        v21 = 1;
      else
        v21 = v16 >> 2;
      if (sub_1000145F8(a1, "firstReadWasHardWithDefaultBDBFastRead", v11, 4u, v21))
        goto LABEL_460;
      v9 = "ASPMSPParseBufferToCxt: firstReadWasHardWithDefaultBDBFastRead(4105): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4106:
      v19 = v14;
      v20 = v13;
      if ((_DWORD)v16 != 4)
        sub_10001B514("ASPMSPParseBufferToCxt: readalgoPassWithDS1(4106): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      if (v16 >= 8)
        v21 = 1;
      else
        v21 = v16 >> 2;
      if (sub_1000145F8(a1, "readalgoPassWithDS1", v11, 4u, v21))
        goto LABEL_460;
      v9 = "ASPMSPParseBufferToCxt: readalgoPassWithDS1(4106): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4107:
      v19 = v14;
      v20 = v13;
      if ((_DWORD)v16 != 4)
        sub_10001B514("ASPMSPParseBufferToCxt: readalgoPassWithDYCE1(4107): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      if (v16 >= 8)
        v21 = 1;
      else
        v21 = v16 >> 2;
      if (sub_1000145F8(a1, "readalgoPassWithDYCE1", v11, 4u, v21))
        goto LABEL_460;
      v9 = "ASPMSPParseBufferToCxt: readalgoPassWithDYCE1(4107): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4108:
      v19 = v14;
      v20 = v13;
      if ((_DWORD)v16 != 4)
        sub_10001B514("ASPMSPParseBufferToCxt: readalgoPassWithDS2(4108): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      if (v16 >= 8)
        v21 = 1;
      else
        v21 = v16 >> 2;
      if (sub_1000145F8(a1, "readalgoPassWithDS2", v11, 4u, v21))
        goto LABEL_460;
      v9 = "ASPMSPParseBufferToCxt: readalgoPassWithDS2(4108): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4109:
      v19 = v14;
      v20 = v13;
      if ((_DWORD)v16 != 4)
        sub_10001B514("ASPMSPParseBufferToCxt: readalgoPassWithDYCE2(4109): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      if (v16 >= 8)
        v21 = 1;
      else
        v21 = v16 >> 2;
      if (sub_1000145F8(a1, "readalgoPassWithDYCE2", v11, 4u, v21))
        goto LABEL_460;
      v9 = "ASPMSPParseBufferToCxt: readalgoPassWithDYCE2(4109): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4110:
      v19 = v14;
      v20 = v13;
      if ((_DWORD)v16 != 4)
        sub_10001B514("ASPMSPParseBufferToCxt: firstReadWasHardWithAcq(4110): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      if (v16 >= 8)
        v21 = 1;
      else
        v21 = v16 >> 2;
      if (sub_1000145F8(a1, "firstReadWasHardWithAcq", v11, 4u, v21))
        goto LABEL_460;
      v9 = "ASPMSPParseBufferToCxt: firstReadWasHardWithAcq(4110): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4111:
      v19 = v14;
      v20 = v13;
      if ((_DWORD)v16 != 4)
        sub_10001B514("ASPMSPParseBufferToCxt: bdbDynamicMovedToEOL_LSB(4111): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      if (v16 >= 8)
        v21 = 1;
      else
        v21 = v16 >> 2;
      if (sub_1000145F8(a1, "bdbDynamicMovedToEOL_LSB", v11, 4u, v21))
        goto LABEL_460;
      v9 = "ASPMSPParseBufferToCxt: bdbDynamicMovedToEOL_LSB(4111): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4112:
      v19 = v14;
      v20 = v13;
      if ((_DWORD)v16 != 4)
        sub_10001B514("ASPMSPParseBufferToCxt: bdbDynamicMovedToEOL_MSB(4112): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      if (v16 >= 8)
        v21 = 1;
      else
        v21 = v16 >> 2;
      if (sub_1000145F8(a1, "bdbDynamicMovedToEOL_MSB", v11, 4u, v21))
        goto LABEL_460;
      v9 = "ASPMSPParseBufferToCxt: bdbDynamicMovedToEOL_MSB(4112): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4113:
      v19 = v14;
      v20 = v13;
      if ((_DWORD)v16 != 4)
        sub_10001B514("ASPMSPParseBufferToCxt: bdbDynamicMovedToEOL_USB(4113): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      if (v16 >= 8)
        v21 = 1;
      else
        v21 = v16 >> 2;
      if (sub_1000145F8(a1, "bdbDynamicMovedToEOL_USB", v11, 4u, v21))
        goto LABEL_460;
      v9 = "ASPMSPParseBufferToCxt: bdbDynamicMovedToEOL_USB(4113): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4114:
      v19 = v14;
      v20 = v13;
      if ((_DWORD)v16 != 4)
        sub_10001B514("ASPMSPParseBufferToCxt: bdbDynamicMovedToSOL_LSB(4114): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      if (v16 >= 8)
        v21 = 1;
      else
        v21 = v16 >> 2;
      if (sub_1000145F8(a1, "bdbDynamicMovedToSOL_LSB", v11, 4u, v21))
        goto LABEL_460;
      v9 = "ASPMSPParseBufferToCxt: bdbDynamicMovedToSOL_LSB(4114): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4115:
      v19 = v14;
      v20 = v13;
      if ((_DWORD)v16 != 4)
        sub_10001B514("ASPMSPParseBufferToCxt: bdbDynamicMovedToSOL_MSB(4115): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      if (v16 >= 8)
        v21 = 1;
      else
        v21 = v16 >> 2;
      if (sub_1000145F8(a1, "bdbDynamicMovedToSOL_MSB", v11, 4u, v21))
        goto LABEL_460;
      v9 = "ASPMSPParseBufferToCxt: bdbDynamicMovedToSOL_MSB(4115): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4116:
      v19 = v14;
      v20 = v13;
      if ((_DWORD)v16 != 4)
        sub_10001B514("ASPMSPParseBufferToCxt: bdbDynamicMovedToSOL_USB(4116): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      if (v16 >= 8)
        v21 = 1;
      else
        v21 = v16 >> 2;
      if (sub_1000145F8(a1, "bdbDynamicMovedToSOL_USB", v11, 4u, v21))
        goto LABEL_460;
      v9 = "ASPMSPParseBufferToCxt: bdbDynamicMovedToSOL_USB(4116): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4117:
      v19 = v14;
      v20 = v13;
      if ((_DWORD)v16 != 4)
        sub_10001B514("ASPMSPParseBufferToCxt: firstReadWasHardWithDefaultBDB(4117): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      if (v16 >= 8)
        v21 = 1;
      else
        v21 = v16 >> 2;
      if (sub_1000145F8(a1, "firstReadWasHardWithDefaultBDB", v11, 4u, v21))
        goto LABEL_460;
      v9 = "ASPMSPParseBufferToCxt: firstReadWasHardWithDefaultBDB(4117): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4118:
      v19 = v14;
      v20 = v13;
      if ((_DWORD)v16 != 4)
        sub_10001B514("ASPMSPParseBufferToCxt: readAlgoPassedThroughSyndSumAcquisition(4118): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      if (v16 >= 8)
        v21 = 1;
      else
        v21 = v16 >> 2;
      if (sub_1000145F8(a1, "readAlgoPassedThroughSyndSumAcquisition", v11, 4u, v21))
        goto LABEL_460;
      v9 = "ASPMSPParseBufferToCxt: readAlgoPassedThroughSyndSumAcquisition(4118): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4119:
      v19 = v14;
      v20 = v13;
      if ((_DWORD)v16 != 4)
        sub_10001B514("ASPMSPParseBufferToCxt: readAlgoPassedThroughSlip(4119): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      if (v16 >= 8)
        v21 = 1;
      else
        v21 = v16 >> 2;
      if (sub_1000145F8(a1, "readAlgoPassedThroughSlip", v11, 4u, v21))
        goto LABEL_460;
      v9 = "ASPMSPParseBufferToCxt: readAlgoPassedThroughSlip(4119): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4120:
      v19 = v14;
      v20 = v13;
      if ((_DWORD)v16 != 44)
        sub_10001B514("ASPMSPParseBufferToCxt: FS2decodedBitFlips(4120): cfg 11 elements; (11*4) cfg bytes != (%d) buffer bytes",
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      if (v16 >= 0x30)
        v21 = 11;
      else
        v21 = v16 >> 2;
      if (sub_1000145F8(a1, "FS2decodedBitFlips", v11, 4u, v21))
        goto LABEL_460;
      v9 = "ASPMSPParseBufferToCxt: FS2decodedBitFlips(4120): Error adding 11 elements to context";
      goto LABEL_1981;
    case 4121:
      v19 = v14;
      v20 = v13;
      if ((_DWORD)v16 != 16)
        sub_10001B514("ASPMSPParseBufferToCxt: slipTrackingAfterFs1ForceFailChangedVthInTicksHist(4121): cfg 4 elements; (4*4) cfg by"
          "tes != (%d) buffer bytes",
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      if (v16 >= 0x14)
        v21 = 4;
      else
        v21 = v16 >> 2;
      if (sub_1000145F8(a1, "slipTrackingAfterFs1ForceFailChangedVthInTicksHist", v11, 4u, v21))
        goto LABEL_460;
      v9 = "ASPMSPParseBufferToCxt: slipTrackingAfterFs1ForceFailChangedVthInTicksHist(4121): Error adding 4 elements to context";
      goto LABEL_1981;
    case 4122:
      v19 = v14;
      v20 = v13;
      if ((_DWORD)v16 != 4)
        sub_10001B514("ASPMSPParseBufferToCxt: readAlgoPassWithFS2_4b_fast(4122): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      if (v16 >= 8)
        v21 = 1;
      else
        v21 = v16 >> 2;
      if (sub_1000145F8(a1, "readAlgoPassWithFS2_4b_fast", v11, 4u, v21))
        goto LABEL_460;
      v9 = "ASPMSPParseBufferToCxt: readAlgoPassWithFS2_4b_fast(4122): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4123:
      v19 = v14;
      v20 = v13;
      if ((_DWORD)v16 != 4)
        sub_10001B514("ASPMSPParseBufferToCxt: readAlgoPassWithHardAfterSlip_fast(4123): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      if (v16 >= 8)
        v21 = 1;
      else
        v21 = v16 >> 2;
      if (sub_1000145F8(a1, "readAlgoPassWithHardAfterSlip_fast", v11, 4u, v21))
        goto LABEL_460;
      v9 = "ASPMSPParseBufferToCxt: readAlgoPassWithHardAfterSlip_fast(4123): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4124:
      v19 = v14;
      v20 = v13;
      if ((_DWORD)v16 != 4)
        sub_10001B514("ASPMSPParseBufferToCxt: readAlgoPassWithFS12BitAfterSlip_fast(4124): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      if (v16 >= 8)
        v21 = 1;
      else
        v21 = v16 >> 2;
      if (sub_1000145F8(a1, "readAlgoPassWithFS12BitAfterSlip_fast", v11, 4u, v21))
        goto LABEL_460;
      v9 = "ASPMSPParseBufferToCxt: readAlgoPassWithFS12BitAfterSlip_fast(4124): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4125:
      v19 = v14;
      v20 = v13;
      if ((_DWORD)v16 != 4)
        sub_10001B514("ASPMSPParseBufferToCxt: readAlgoPassWithFS14BitAfterSlip_fast(4125): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      if (v16 >= 8)
        v21 = 1;
      else
        v21 = v16 >> 2;
      if (sub_1000145F8(a1, "readAlgoPassWithFS14BitAfterSlip_fast", v11, 4u, v21))
        goto LABEL_460;
      v9 = "ASPMSPParseBufferToCxt: readAlgoPassWithFS14BitAfterSlip_fast(4125): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4126:
      v19 = v14;
      v20 = v13;
      if ((_DWORD)v16 != 4)
        sub_10001B514("ASPMSPParseBufferToCxt: readAlgoPassWithFS3_fast(4126): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      if (v16 >= 8)
        v21 = 1;
      else
        v21 = v16 >> 2;
      if (sub_1000145F8(a1, "readAlgoPassWithFS3_fast", v11, 4u, v21))
        goto LABEL_460;
      v9 = "ASPMSPParseBufferToCxt: readAlgoPassWithFS3_fast(4126): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4127:
      v19 = v14;
      v20 = v13;
      if ((_DWORD)v16 != 40)
        sub_10001B514("ASPMSPParseBufferToCxt: deepSoft1Decoded(4127): cfg 10 elements; (10*4) cfg bytes != (%d) buffer bytes",
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      if (v16 >= 0x2C)
        v21 = 10;
      else
        v21 = v16 >> 2;
      if (sub_1000145F8(a1, "deepSoft1Decoded", v11, 4u, v21))
        goto LABEL_460;
      v9 = "ASPMSPParseBufferToCxt: deepSoft1Decoded(4127): Error adding 10 elements to context";
      goto LABEL_1981;
    case 4128:
      v19 = v14;
      v20 = v13;
      if ((_DWORD)v16 != 40)
        sub_10001B514("ASPMSPParseBufferToCxt: deepSoft2Decoded(4128): cfg 10 elements; (10*4) cfg bytes != (%d) buffer bytes",
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      if (v16 >= 0x2C)
        v21 = 10;
      else
        v21 = v16 >> 2;
      if (sub_1000145F8(a1, "deepSoft2Decoded", v11, 4u, v21))
        goto LABEL_460;
      v9 = "ASPMSPParseBufferToCxt: deepSoft2Decoded(4128): Error adding 10 elements to context";
      goto LABEL_1981;
    case 4129:
      v19 = v14;
      v20 = v13;
      if ((_DWORD)v16 != 4)
        sub_10001B514("ASPMSPParseBufferToCxt: readAlgoPassedThroughFS2_2b_fast(4129): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      if (v16 >= 8)
        v21 = 1;
      else
        v21 = v16 >> 2;
      if (sub_1000145F8(a1, "readAlgoPassedThroughFS2_2b_fast", v11, 4u, v21))
        goto LABEL_460;
      v9 = "ASPMSPParseBufferToCxt: readAlgoPassedThroughFS2_2b_fast(4129): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4130:
      v19 = v14;
      v20 = v13;
      if ((_DWORD)v16 != 4)
        sub_10001B514("ASPMSPParseBufferToCxt: readAlgoPassedThroughFS2_4b_fast(4130): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      if (v16 >= 8)
        v21 = 1;
      else
        v21 = v16 >> 2;
      if (sub_1000145F8(a1, "readAlgoPassedThroughFS2_4b_fast", v11, 4u, v21))
        goto LABEL_460;
      v9 = "ASPMSPParseBufferToCxt: readAlgoPassedThroughFS2_4b_fast(4130): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4131:
      v19 = v14;
      v20 = v13;
      if ((_DWORD)v16 != 4)
        sub_10001B514("ASPMSPParseBufferToCxt: readAlgoPassedThroughSlip_fast(4131): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      if (v16 >= 8)
        v21 = 1;
      else
        v21 = v16 >> 2;
      if (sub_1000145F8(a1, "readAlgoPassedThroughSlip_fast", v11, 4u, v21))
        goto LABEL_460;
      v9 = "ASPMSPParseBufferToCxt: readAlgoPassedThroughSlip_fast(4131): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4132:
      v19 = v14;
      v20 = v13;
      if ((_DWORD)v16 != 4)
        sub_10001B514("ASPMSPParseBufferToCxt: readAlgoPassedThroughFS3_fast(4132): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      if (v16 >= 8)
        v21 = 1;
      else
        v21 = v16 >> 2;
      if (sub_1000145F8(a1, "readAlgoPassedThroughFS3_fast", v11, 4u, v21))
        goto LABEL_460;
      v9 = "ASPMSPParseBufferToCxt: readAlgoPassedThroughFS3_fast(4132): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4133:
      v19 = v14;
      v20 = v13;
      if ((_DWORD)v16 != 4)
        sub_10001B514("ASPMSPParseBufferToCxt: readalgoPassWithEXH(4133): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      if (v16 >= 8)
        v21 = 1;
      else
        v21 = v16 >> 2;
      if (sub_1000145F8(a1, "readalgoPassWithEXH", v11, 4u, v21))
        goto LABEL_460;
      v9 = "ASPMSPParseBufferToCxt: readalgoPassWithEXH(4133): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4134:
      v19 = v14;
      v20 = v13;
      if ((_DWORD)v16 != 44)
        sub_10001B514("ASPMSPParseBufferToCxt: FS1decodedbitflips(4134): cfg 11 elements; (11*4) cfg bytes != (%d) buffer bytes",
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      if (v16 >= 0x30)
        v21 = 11;
      else
        v21 = v16 >> 2;
      if (sub_1000145F8(a1, "FS1decodedbitflips", v11, 4u, v21))
        goto LABEL_460;
      v9 = "ASPMSPParseBufferToCxt: FS1decodedbitflips(4134): Error adding 11 elements to context";
      goto LABEL_1981;
    case 4135:
      v19 = v14;
      v20 = v13;
      if ((_DWORD)v16 != 4)
        sub_10001B514("ASPMSPParseBufferToCxt: readZeroPage(4135): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      if (v16 >= 8)
        v21 = 1;
      else
        v21 = v16 >> 2;
      if (sub_1000145F8(a1, "readZeroPage", v11, 4u, v21))
        goto LABEL_460;
      v9 = "ASPMSPParseBufferToCxt: readZeroPage(4135): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4136:
      v19 = v14;
      v20 = v13;
      if ((_DWORD)v16 != 4)
        sub_10001B514("ASPMSPParseBufferToCxt: readErasedPage(4136): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      if (v16 >= 8)
        v21 = 1;
      else
        v21 = v16 >> 2;
      if (sub_1000145F8(a1, "readErasedPage", v11, 4u, v21))
        goto LABEL_460;
      v9 = "ASPMSPParseBufferToCxt: readErasedPage(4136): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4137:
      v19 = v14;
      v20 = v13;
      if ((_DWORD)v16 != 4)
        sub_10001B514("ASPMSPParseBufferToCxt: readFail(4137): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      if (v16 >= 8)
        v21 = 1;
      else
        v21 = v16 >> 2;
      if (sub_1000145F8(a1, "readFail", v11, 4u, v21))
        goto LABEL_460;
      v9 = "ASPMSPParseBufferToCxt: readFail(4137): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4138:
      v19 = v14;
      v20 = v13;
      if ((_DWORD)v16 != 20)
        sub_10001B514("ASPMSPParseBufferToCxt: numOfSensesWereSentDuringSyndSumAcq(4138): cfg 5 elements; (5*4) cfg bytes != (%d) buffer bytes",
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      if (v16 >= 0x18)
        v21 = 5;
      else
        v21 = v16 >> 2;
      if (sub_1000145F8(a1, "numOfSensesWereSentDuringSyndSumAcq", v11, 4u, v21))
        goto LABEL_460;
      v9 = "ASPMSPParseBufferToCxt: numOfSensesWereSentDuringSyndSumAcq(4138): Error adding 5 elements to context";
      goto LABEL_1981;
    case 4139:
      v19 = v14;
      v20 = v13;
      if ((_DWORD)v16 != 12)
        sub_10001B514("ASPMSPParseBufferToCxt: numOfSensesWereSentDuringMiniAcq(4139): cfg 3 elements; (3*4) cfg bytes != (%d) buffer bytes",
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      if (v16 >= 0x10)
        v21 = 3;
      else
        v21 = v16 >> 2;
      if (sub_1000145F8(a1, "numOfSensesWereSentDuringMiniAcq", v11, 4u, v21))
        goto LABEL_460;
      v9 = "ASPMSPParseBufferToCxt: numOfSensesWereSentDuringMiniAcq(4139): Error adding 3 elements to context";
      goto LABEL_1981;
    case 4140:
      v19 = v14;
      v20 = v13;
      if ((_DWORD)v16 != 4)
        sub_10001B514("ASPMSPParseBufferToCxt: bdbDefaultMoveFastToNormal(4140): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      if (v16 >= 8)
        v21 = 1;
      else
        v21 = v16 >> 2;
      if (sub_1000145F8(a1, "bdbDefaultMoveFastToNormal", v11, 4u, v21))
        goto LABEL_460;
      v9 = "ASPMSPParseBufferToCxt: bdbDefaultMoveFastToNormal(4140): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4141:
      v19 = v14;
      v20 = v13;
      if ((_DWORD)v16 != 4)
        sub_10001B514("ASPMSPParseBufferToCxt: bdbDefaultMoveNormalToFast(4141): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      if (v16 >= 8)
        v21 = 1;
      else
        v21 = v16 >> 2;
      if (sub_1000145F8(a1, "bdbDefaultMoveNormalToFast", v11, 4u, v21))
        goto LABEL_460;
      v9 = "ASPMSPParseBufferToCxt: bdbDefaultMoveNormalToFast(4141): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4142:
      v19 = v14;
      v20 = v13;
      if ((_DWORD)v16 != 4)
        sub_10001B514("ASPMSPParseBufferToCxt: readalgoPassWithEXH_DSP(4142): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      if (v16 >= 8)
        v21 = 1;
      else
        v21 = v16 >> 2;
      if (sub_1000145F8(a1, "readalgoPassWithEXH_DSP", v11, 4u, v21))
        goto LABEL_460;
      v9 = "ASPMSPParseBufferToCxt: readalgoPassWithEXH_DSP(4142): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4143:
      v19 = v14;
      v20 = v13;
      if ((_DWORD)v16 != 4)
        sub_10001B514("ASPMSPParseBufferToCxt: readalgoPassWithDS1_DSP(4143): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      if (v16 >= 8)
        v21 = 1;
      else
        v21 = v16 >> 2;
      if (sub_1000145F8(a1, "readalgoPassWithDS1_DSP", v11, 4u, v21))
        goto LABEL_460;
      v9 = "ASPMSPParseBufferToCxt: readalgoPassWithDS1_DSP(4143): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4144:
      v19 = v14;
      v20 = v13;
      if ((_DWORD)v16 != 4)
        sub_10001B514("ASPMSPParseBufferToCxt: readalgoPassWithDYCE1_DSP(4144): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      if (v16 >= 8)
        v21 = 1;
      else
        v21 = v16 >> 2;
      if (sub_1000145F8(a1, "readalgoPassWithDYCE1_DSP", v11, 4u, v21))
        goto LABEL_460;
      v9 = "ASPMSPParseBufferToCxt: readalgoPassWithDYCE1_DSP(4144): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4145:
      v19 = v14;
      v20 = v13;
      if ((_DWORD)v16 != 4)
        sub_10001B514("ASPMSPParseBufferToCxt: firstReadWasFS2EOL_DSP(4145): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      if (v16 >= 8)
        v21 = 1;
      else
        v21 = v16 >> 2;
      if (sub_1000145F8(a1, "firstReadWasFS2EOL_DSP", v11, 4u, v21))
        goto LABEL_460;
      v9 = "ASPMSPParseBufferToCxt: firstReadWasFS2EOL_DSP(4145): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4146:
      v19 = v14;
      v20 = v13;
      if ((_DWORD)v16 != 4)
        sub_10001B514("ASPMSPParseBufferToCxt: firstReadWasFS2EOL(4146): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      if (v16 >= 8)
        v21 = 1;
      else
        v21 = v16 >> 2;
      if (sub_1000145F8(a1, "firstReadWasFS2EOL", v11, 4u, v21))
        goto LABEL_460;
      v9 = "ASPMSPParseBufferToCxt: firstReadWasFS2EOL(4146): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4147:
      v19 = v14;
      v20 = v13;
      if ((_DWORD)v16 != 4)
        sub_10001B514("ASPMSPParseBufferToCxt: readAlgoPassedThroughFS2_4b(4147): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      if (v16 >= 8)
        v21 = 1;
      else
        v21 = v16 >> 2;
      if (sub_1000145F8(a1, "readAlgoPassedThroughFS2_4b", v11, 4u, v21))
        goto LABEL_460;
      v9 = "ASPMSPParseBufferToCxt: readAlgoPassedThroughFS2_4b(4147): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4148:
      v19 = v14;
      v20 = v13;
      if ((_DWORD)v16 != 4)
        sub_10001B514("ASPMSPParseBufferToCxt: readAlgoPassWithFS2_4b(4148): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      if (v16 >= 8)
        v21 = 1;
      else
        v21 = v16 >> 2;
      if (sub_1000145F8(a1, "readAlgoPassWithFS2_4b", v11, 4u, v21))
        goto LABEL_460;
      v9 = "ASPMSPParseBufferToCxt: readAlgoPassWithFS2_4b(4148): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4149:
      v19 = v14;
      v20 = v13;
      if ((_DWORD)v16 != 4)
        sub_10001B514("ASPMSPParseBufferToCxt: readAlgoPassedThroughFS2_2b(4149): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      if (v16 >= 8)
        v21 = 1;
      else
        v21 = v16 >> 2;
      if (sub_1000145F8(a1, "readAlgoPassedThroughFS2_2b", v11, 4u, v21))
        goto LABEL_460;
      v9 = "ASPMSPParseBufferToCxt: readAlgoPassedThroughFS2_2b(4149): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4150:
      v19 = v14;
      v20 = v13;
      if ((_DWORD)v16 != 4)
        sub_10001B514("ASPMSPParseBufferToCxt: readAlgoPassedThroughFS3(4150): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      if (v16 >= 8)
        v21 = 1;
      else
        v21 = v16 >> 2;
      if (sub_1000145F8(a1, "readAlgoPassedThroughFS3", v11, 4u, v21))
        goto LABEL_460;
      v9 = "ASPMSPParseBufferToCxt: readAlgoPassedThroughFS3(4150): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4151:
      v19 = v14;
      v20 = v13;
      if ((_DWORD)v16 != 4)
        sub_10001B514("ASPMSPParseBufferToCxt: readAlgoPassedThroughDS1(4151): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      if (v16 >= 8)
        v21 = 1;
      else
        v21 = v16 >> 2;
      if (sub_1000145F8(a1, "readAlgoPassedThroughDS1", v11, 4u, v21))
        goto LABEL_460;
      v9 = "ASPMSPParseBufferToCxt: readAlgoPassedThroughDS1(4151): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4152:
      v19 = v14;
      v20 = v13;
      if ((_DWORD)v16 != 4)
        sub_10001B514("ASPMSPParseBufferToCxt: readAlgoPassedThroughDS2(4152): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      if (v16 >= 8)
        v21 = 1;
      else
        v21 = v16 >> 2;
      if (sub_1000145F8(a1, "readAlgoPassedThroughDS2", v11, 4u, v21))
        goto LABEL_460;
      v9 = "ASPMSPParseBufferToCxt: readAlgoPassedThroughDS2(4152): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4153:
      v19 = v14;
      v20 = v13;
      if ((_DWORD)v16 != 4)
        sub_10001B514("ASPMSPParseBufferToCxt: readAlgoPassWithHardAfterSlip(4153): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      if (v16 >= 8)
        v21 = 1;
      else
        v21 = v16 >> 2;
      if (sub_1000145F8(a1, "readAlgoPassWithHardAfterSlip", v11, 4u, v21))
        goto LABEL_460;
      v9 = "ASPMSPParseBufferToCxt: readAlgoPassWithHardAfterSlip(4153): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4154:
      v19 = v14;
      v20 = v13;
      if ((_DWORD)v16 != 4)
        sub_10001B514("ASPMSPParseBufferToCxt: readAlgoPassWithFS12BitAfterSlip(4154): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      if (v16 >= 8)
        v21 = 1;
      else
        v21 = v16 >> 2;
      if (sub_1000145F8(a1, "readAlgoPassWithFS12BitAfterSlip", v11, 4u, v21))
        goto LABEL_460;
      v9 = "ASPMSPParseBufferToCxt: readAlgoPassWithFS12BitAfterSlip(4154): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4155:
      v19 = v14;
      v20 = v13;
      if ((_DWORD)v16 != 4)
        sub_10001B514("ASPMSPParseBufferToCxt: readAlgoPassWithFS14BitAfterSlip(4155): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      if (v16 >= 8)
        v21 = 1;
      else
        v21 = v16 >> 2;
      if (sub_1000145F8(a1, "readAlgoPassWithFS14BitAfterSlip", v11, 4u, v21))
        goto LABEL_460;
      v9 = "ASPMSPParseBufferToCxt: readAlgoPassWithFS14BitAfterSlip(4155): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4156:
      v19 = v14;
      v20 = v13;
      if ((_DWORD)v16 != 4)
        sub_10001B514("ASPMSPParseBufferToCxt: readAlgoPassWithFS3(4156): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      if (v16 >= 8)
        v21 = 1;
      else
        v21 = v16 >> 2;
      if (sub_1000145F8(a1, "readAlgoPassWithFS3", v11, 4u, v21))
        goto LABEL_460;
      v9 = "ASPMSPParseBufferToCxt: readAlgoPassWithFS3(4156): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4157:
      v19 = v14;
      v20 = v13;
      if ((_DWORD)v16 != 4)
        sub_10001B514("ASPMSPParseBufferToCxt: readAlgoPassedThroughSyndSumAcquisition_DSP(4157): cfg 1 elements; (1*4) cfg bytes != "
          "(%d) buffer bytes",
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      if (v16 >= 8)
        v21 = 1;
      else
        v21 = v16 >> 2;
      if (sub_1000145F8(a1, "readAlgoPassedThroughSyndSumAcquisition_DSP", v11, 4u, v21))
        goto LABEL_460;
      v9 = "ASPMSPParseBufferToCxt: readAlgoPassedThroughSyndSumAcquisition_DSP(4157): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4158:
      v19 = v14;
      v20 = v13;
      if ((_DWORD)v16 != 4)
        sub_10001B514("ASPMSPParseBufferToCxt: readAlgoPassWithFS12BitAfterAcq(4158): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      if (v16 >= 8)
        v21 = 1;
      else
        v21 = v16 >> 2;
      if (sub_1000145F8(a1, "readAlgoPassWithFS12BitAfterAcq", v11, 4u, v21))
        goto LABEL_460;
      v9 = "ASPMSPParseBufferToCxt: readAlgoPassWithFS12BitAfterAcq(4158): Error adding 1 elements to context";
      goto LABEL_1981;
    case 4159:
      v19 = v14;
      v20 = v13;
      if ((_DWORD)v16 != 4)
        sub_10001B514("ASPMSPParseBufferToCxt: readAlgoPassWithFS14BitAfterAcq(4159): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
          a2,
          a3,
          a4,
          a5,
          a6,
          a7,
          a8,
          v16);
      if (v16 >= 8)
        v21 = 1;
      else
        v21 = v16 >> 2;
      if (sub_1000145F8(a1, "readAlgoPassWithFS14BitAfterAcq", v11, 4u, v21))
      {
LABEL_460:
        v8 = v8 + v21;
        v13 = v20;
        v14 = v19;
        goto LABEL_461;
      }
      v9 = "ASPMSPParseBufferToCxt: readAlgoPassWithFS14BitAfterAcq(4159): Error adding 1 elements to context";
LABEL_1981:
      sub_10001B514(v9, a2, a3, a4, a5, a6, a7, a8, v24);
      return v8;
    default:
      switch(v17)
      {
        case 4160:
          v19 = v14;
          v20 = v13;
          if ((_DWORD)v16 != 4)
            sub_10001B514("ASPMSPParseBufferToCxt: readAlgoPassedThroughDS1_DSP(4160): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          if (v16 >= 8)
            v21 = 1;
          else
            v21 = v16 >> 2;
          if (sub_1000145F8(a1, "readAlgoPassedThroughDS1_DSP", v11, 4u, v21))
            goto LABEL_460;
          v9 = "ASPMSPParseBufferToCxt: readAlgoPassedThroughDS1_DSP(4160): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4161:
          v19 = v14;
          v20 = v13;
          if ((_DWORD)v16 != 4)
            sub_10001B514("ASPMSPParseBufferToCxt: numOfSlipTracking(4161): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          if (v16 >= 8)
            v21 = 1;
          else
            v21 = v16 >> 2;
          if (sub_1000145F8(a1, "numOfSlipTracking", v11, 4u, v21))
            goto LABEL_460;
          v9 = "ASPMSPParseBufferToCxt: numOfSlipTracking(4161): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4162:
          v19 = v14;
          v20 = v13;
          if ((_DWORD)v16 != 4)
            sub_10001B514("ASPMSPParseBufferToCxt: bdbDynamicMovedToEOL_QSB(4162): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          if (v16 >= 8)
            v21 = 1;
          else
            v21 = v16 >> 2;
          if (sub_1000145F8(a1, "bdbDynamicMovedToEOL_QSB", v11, 4u, v21))
            goto LABEL_460;
          v9 = "ASPMSPParseBufferToCxt: bdbDynamicMovedToEOL_QSB(4162): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4163:
          v19 = v14;
          v20 = v13;
          if ((_DWORD)v16 != 4)
            sub_10001B514("ASPMSPParseBufferToCxt: bdbDynamicMovedToSOL_QSB(4163): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          if (v16 >= 8)
            v21 = 1;
          else
            v21 = v16 >> 2;
          if (sub_1000145F8(a1, "bdbDynamicMovedToSOL_QSB", v11, 4u, v21))
            goto LABEL_460;
          v9 = "ASPMSPParseBufferToCxt: bdbDynamicMovedToSOL_QSB(4163): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4196:
          v19 = v14;
          v20 = v13;
          if ((_DWORD)v16 != 4)
            sub_10001B514("ASPMSPParseBufferToCxt: readStageNumOfFails100(4196): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          if (v16 >= 8)
            v21 = 1;
          else
            v21 = v16 >> 2;
          if (sub_1000145F8(a1, "readStageNumOfFails100", v11, 4u, v21))
            goto LABEL_460;
          v9 = "ASPMSPParseBufferToCxt: readStageNumOfFails100(4196): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4197:
          v19 = v14;
          v20 = v13;
          if ((_DWORD)v16 != 4)
            sub_10001B514("ASPMSPParseBufferToCxt: readStageNumOfFails101(4197): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          if (v16 >= 8)
            v21 = 1;
          else
            v21 = v16 >> 2;
          if (sub_1000145F8(a1, "readStageNumOfFails101", v11, 4u, v21))
            goto LABEL_460;
          v9 = "ASPMSPParseBufferToCxt: readStageNumOfFails101(4197): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4198:
          v19 = v14;
          v20 = v13;
          if ((_DWORD)v16 != 4)
            sub_10001B514("ASPMSPParseBufferToCxt: readStage100(4198): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          if (v16 >= 8)
            v21 = 1;
          else
            v21 = v16 >> 2;
          if (sub_1000145F8(a1, "readStage100", v11, 4u, v21))
            goto LABEL_460;
          v9 = "ASPMSPParseBufferToCxt: readStage100(4198): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4199:
          v19 = v14;
          v20 = v13;
          if ((_DWORD)v16 != 16)
            sub_10001B514("ASPMSPParseBufferToCxt: readStage101(4199): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          if (v16 >= 0x14)
            v21 = 4;
          else
            v21 = v16 >> 2;
          if (sub_1000145F8(a1, "readStage101", v11, 4u, v21))
            goto LABEL_460;
          v9 = "ASPMSPParseBufferToCxt: readStage101(4199): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4200:
          v19 = v14;
          v20 = v13;
          if ((_DWORD)v16 != 4)
            sub_10001B514("ASPMSPParseBufferToCxt: initialReadStage100(4200): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          if (v16 >= 8)
            v21 = 1;
          else
            v21 = v16 >> 2;
          if (sub_1000145F8(a1, "initialReadStage100", v11, 4u, v21))
            goto LABEL_460;
          v9 = "ASPMSPParseBufferToCxt: initialReadStage100(4200): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4201:
          v19 = v14;
          v20 = v13;
          if ((_DWORD)v16 != 4)
            sub_10001B514("ASPMSPParseBufferToCxt: readStage102(4201): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          if (v16 >= 8)
            v21 = 1;
          else
            v21 = v16 >> 2;
          if (sub_1000145F8(a1, "readStage102", v11, 4u, v21))
            goto LABEL_460;
          v9 = "ASPMSPParseBufferToCxt: readStage102(4201): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4202:
          v19 = v14;
          v20 = v13;
          if ((_DWORD)v16 != 4)
            sub_10001B514("ASPMSPParseBufferToCxt: initialReadStage101(4202): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          if (v16 >= 8)
            v21 = 1;
          else
            v21 = v16 >> 2;
          if (sub_1000145F8(a1, "initialReadStage101", v11, 4u, v21))
            goto LABEL_460;
          v9 = "ASPMSPParseBufferToCxt: initialReadStage101(4202): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4203:
          v19 = v14;
          v20 = v13;
          if ((_DWORD)v16 != 4)
            sub_10001B514("ASPMSPParseBufferToCxt: nandStageOfLife100(4203): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          if (v16 >= 8)
            v21 = 1;
          else
            v21 = v16 >> 2;
          if (sub_1000145F8(a1, "nandStageOfLife100", v11, 4u, v21))
            goto LABEL_460;
          v9 = "ASPMSPParseBufferToCxt: nandStageOfLife100(4203): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4204:
          v19 = v14;
          v20 = v13;
          if ((_DWORD)v16 != 4)
            sub_10001B514("ASPMSPParseBufferToCxt: nandStageOfLife101(4204): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          if (v16 >= 8)
            v21 = 1;
          else
            v21 = v16 >> 2;
          if (sub_1000145F8(a1, "nandStageOfLife101", v11, 4u, v21))
            goto LABEL_460;
          v9 = "ASPMSPParseBufferToCxt: nandStageOfLife101(4204): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4205:
          v19 = v14;
          v20 = v13;
          if ((_DWORD)v16 != 16)
            sub_10001B514("ASPMSPParseBufferToCxt: readStageNumOfFails102(4205): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          if (v16 >= 0x14)
            v21 = 4;
          else
            v21 = v16 >> 2;
          if (sub_1000145F8(a1, "readStageNumOfFails102", v11, 4u, v21))
            goto LABEL_460;
          v9 = "ASPMSPParseBufferToCxt: readStageNumOfFails102(4205): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4206:
          v19 = v14;
          v20 = v13;
          if ((_DWORD)v16 != 4)
            sub_10001B514("ASPMSPParseBufferToCxt: initialReadStage102(4206): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          if (v16 >= 8)
            v21 = 1;
          else
            v21 = v16 >> 2;
          if (sub_1000145F8(a1, "initialReadStage102", v11, 4u, v21))
            goto LABEL_460;
          v9 = "ASPMSPParseBufferToCxt: initialReadStage102(4206): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4207:
          v19 = v14;
          v20 = v13;
          if ((_DWORD)v16 != 4)
            sub_10001B514("ASPMSPParseBufferToCxt: readStage103(4207): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          if (v16 >= 8)
            v21 = 1;
          else
            v21 = v16 >> 2;
          if (sub_1000145F8(a1, "readStage103", v11, 4u, v21))
            goto LABEL_460;
          v9 = "ASPMSPParseBufferToCxt: readStage103(4207): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4208:
          v19 = v14;
          v20 = v13;
          if ((_DWORD)v16 != 4)
            sub_10001B514("ASPMSPParseBufferToCxt: readStage104(4208): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          if (v16 >= 8)
            v21 = 1;
          else
            v21 = v16 >> 2;
          if (sub_1000145F8(a1, "readStage104", v11, 4u, v21))
            goto LABEL_460;
          v9 = "ASPMSPParseBufferToCxt: readStage104(4208): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4209:
          v19 = v14;
          v20 = v13;
          if ((_DWORD)v16 != 16)
            sub_10001B514("ASPMSPParseBufferToCxt: readStage105(4209): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          if (v16 >= 0x14)
            v21 = 4;
          else
            v21 = v16 >> 2;
          if (sub_1000145F8(a1, "readStage105", v11, 4u, v21))
            goto LABEL_460;
          v9 = "ASPMSPParseBufferToCxt: readStage105(4209): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4210:
          v19 = v14;
          v20 = v13;
          if ((_DWORD)v16 != 16)
            sub_10001B514("ASPMSPParseBufferToCxt: readStage106(4210): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          if (v16 >= 0x14)
            v21 = 4;
          else
            v21 = v16 >> 2;
          if (sub_1000145F8(a1, "readStage106", v11, 4u, v21))
            goto LABEL_460;
          v9 = "ASPMSPParseBufferToCxt: readStage106(4210): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4211:
          v19 = v14;
          v20 = v13;
          if ((_DWORD)v16 != 16)
            sub_10001B514("ASPMSPParseBufferToCxt: dspExceptionParameter100(4211): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          if (v16 >= 0x14)
            v21 = 4;
          else
            v21 = v16 >> 2;
          if (sub_1000145F8(a1, "dspExceptionParameter100", v11, 4u, v21))
            goto LABEL_460;
          v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter100(4211): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4212:
          v19 = v14;
          v20 = v13;
          if ((_DWORD)v16 != 16)
            sub_10001B514("ASPMSPParseBufferToCxt: dspExceptionParameter101(4212): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          if (v16 >= 0x14)
            v21 = 4;
          else
            v21 = v16 >> 2;
          if (sub_1000145F8(a1, "dspExceptionParameter101", v11, 4u, v21))
            goto LABEL_460;
          v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter101(4212): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4213:
          v19 = v14;
          v20 = v13;
          if ((_DWORD)v16 != 4)
            sub_10001B514("ASPMSPParseBufferToCxt: initialReadStage103(4213): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          if (v16 >= 8)
            v21 = 1;
          else
            v21 = v16 >> 2;
          if (sub_1000145F8(a1, "initialReadStage103", v11, 4u, v21))
            goto LABEL_460;
          v9 = "ASPMSPParseBufferToCxt: initialReadStage103(4213): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4214:
          v19 = v14;
          v20 = v13;
          if ((_DWORD)v16 != 4)
            sub_10001B514("ASPMSPParseBufferToCxt: initialReadStage104(4214): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          if (v16 >= 8)
            v21 = 1;
          else
            v21 = v16 >> 2;
          if (sub_1000145F8(a1, "initialReadStage104", v11, 4u, v21))
            goto LABEL_460;
          v9 = "ASPMSPParseBufferToCxt: initialReadStage104(4214): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4215:
          v19 = v14;
          v20 = v13;
          if ((_DWORD)v16 != 16)
            sub_10001B514("ASPMSPParseBufferToCxt: readStage107(4215): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          if (v16 >= 0x14)
            v21 = 4;
          else
            v21 = v16 >> 2;
          if (sub_1000145F8(a1, "readStage107", v11, 4u, v21))
            goto LABEL_460;
          v9 = "ASPMSPParseBufferToCxt: readStage107(4215): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4216:
          v19 = v14;
          v20 = v13;
          if ((_DWORD)v16 != 16)
            sub_10001B514("ASPMSPParseBufferToCxt: readStage108(4216): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          if (v16 >= 0x14)
            v21 = 4;
          else
            v21 = v16 >> 2;
          if (sub_1000145F8(a1, "readStage108", v11, 4u, v21))
            goto LABEL_460;
          v9 = "ASPMSPParseBufferToCxt: readStage108(4216): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4217:
          v19 = v14;
          v20 = v13;
          if ((_DWORD)v16 != 4)
            sub_10001B514("ASPMSPParseBufferToCxt: nandStageOfLife102(4217): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          if (v16 >= 8)
            v21 = 1;
          else
            v21 = v16 >> 2;
          if (sub_1000145F8(a1, "nandStageOfLife102", v11, 4u, v21))
            goto LABEL_460;
          v9 = "ASPMSPParseBufferToCxt: nandStageOfLife102(4217): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4218:
          v19 = v14;
          v20 = v13;
          if ((_DWORD)v16 != 4)
            sub_10001B514("ASPMSPParseBufferToCxt: nandStageOfLife103(4218): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          if (v16 >= 8)
            v21 = 1;
          else
            v21 = v16 >> 2;
          if (sub_1000145F8(a1, "nandStageOfLife103", v11, 4u, v21))
            goto LABEL_460;
          v9 = "ASPMSPParseBufferToCxt: nandStageOfLife103(4218): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4219:
          v19 = v14;
          v20 = v13;
          if ((_DWORD)v16 != 4)
            sub_10001B514("ASPMSPParseBufferToCxt: nandStageOfLife104(4219): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          if (v16 >= 8)
            v21 = 1;
          else
            v21 = v16 >> 2;
          if (sub_1000145F8(a1, "nandStageOfLife104", v11, 4u, v21))
            goto LABEL_460;
          v9 = "ASPMSPParseBufferToCxt: nandStageOfLife104(4219): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4220:
          v19 = v14;
          v20 = v13;
          if ((_DWORD)v16 != 16)
            sub_10001B514("ASPMSPParseBufferToCxt: dspExceptionParameter102(4220): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          if (v16 >= 0x14)
            v21 = 4;
          else
            v21 = v16 >> 2;
          if (sub_1000145F8(a1, "dspExceptionParameter102", v11, 4u, v21))
            goto LABEL_460;
          v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter102(4220): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4221:
          v19 = v14;
          v20 = v13;
          if ((_DWORD)v16 != 16)
            sub_10001B514("ASPMSPParseBufferToCxt: dspExceptionParameter103(4221): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          if (v16 >= 0x14)
            v21 = 4;
          else
            v21 = v16 >> 2;
          if (sub_1000145F8(a1, "dspExceptionParameter103", v11, 4u, v21))
            goto LABEL_460;
          v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter103(4221): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4222:
          v19 = v14;
          v20 = v13;
          if ((_DWORD)v16 != 16)
            sub_10001B514("ASPMSPParseBufferToCxt: dspExceptionParameter104(4222): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          if (v16 >= 0x14)
            v21 = 4;
          else
            v21 = v16 >> 2;
          if (sub_1000145F8(a1, "dspExceptionParameter104", v11, 4u, v21))
            goto LABEL_460;
          v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter104(4222): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4223:
          v19 = v14;
          v20 = v13;
          if ((_DWORD)v16 != 16)
            sub_10001B514("ASPMSPParseBufferToCxt: dspExceptionParameter105(4223): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          if (v16 >= 0x14)
            v21 = 4;
          else
            v21 = v16 >> 2;
          if (sub_1000145F8(a1, "dspExceptionParameter105", v11, 4u, v21))
            goto LABEL_460;
          v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter105(4223): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4224:
          v19 = v14;
          v20 = v13;
          if ((_DWORD)v16 != 16)
            sub_10001B514("ASPMSPParseBufferToCxt: dspExceptionParameter106(4224): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          if (v16 >= 0x14)
            v21 = 4;
          else
            v21 = v16 >> 2;
          if (sub_1000145F8(a1, "dspExceptionParameter106", v11, 4u, v21))
            goto LABEL_460;
          v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter106(4224): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4225:
          v19 = v14;
          v20 = v13;
          if ((_DWORD)v16 != 16)
            sub_10001B514("ASPMSPParseBufferToCxt: dspExceptionParameter107(4225): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          if (v16 >= 0x14)
            v21 = 4;
          else
            v21 = v16 >> 2;
          if (sub_1000145F8(a1, "dspExceptionParameter107", v11, 4u, v21))
            goto LABEL_460;
          v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter107(4225): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4226:
          v19 = v14;
          v20 = v13;
          if ((_DWORD)v16 != 16)
            sub_10001B514("ASPMSPParseBufferToCxt: dspExceptionParameter108(4226): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          if (v16 >= 0x14)
            v21 = 4;
          else
            v21 = v16 >> 2;
          if (sub_1000145F8(a1, "dspExceptionParameter108", v11, 4u, v21))
            goto LABEL_460;
          v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter108(4226): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4227:
          v19 = v14;
          v20 = v13;
          if ((_DWORD)v16 != 16)
            sub_10001B514("ASPMSPParseBufferToCxt: dspExceptionParameter109(4227): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          if (v16 >= 0x14)
            v21 = 4;
          else
            v21 = v16 >> 2;
          if (sub_1000145F8(a1, "dspExceptionParameter109", v11, 4u, v21))
            goto LABEL_460;
          v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter109(4227): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4228:
          v19 = v14;
          v20 = v13;
          if ((_DWORD)v16 != 16)
            sub_10001B514("ASPMSPParseBufferToCxt: dspExceptionParameter110(4228): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          if (v16 >= 0x14)
            v21 = 4;
          else
            v21 = v16 >> 2;
          if (sub_1000145F8(a1, "dspExceptionParameter110", v11, 4u, v21))
            goto LABEL_460;
          v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter110(4228): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4229:
          v19 = v14;
          v20 = v13;
          if ((_DWORD)v16 != 16)
            sub_10001B514("ASPMSPParseBufferToCxt: dspExceptionParameter111(4229): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          if (v16 >= 0x14)
            v21 = 4;
          else
            v21 = v16 >> 2;
          if (sub_1000145F8(a1, "dspExceptionParameter111", v11, 4u, v21))
            goto LABEL_460;
          v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter111(4229): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4230:
          v19 = v14;
          v20 = v13;
          if ((_DWORD)v16 != 16)
            sub_10001B514("ASPMSPParseBufferToCxt: dspExceptionParameter112(4230): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          if (v16 >= 0x14)
            v21 = 4;
          else
            v21 = v16 >> 2;
          if (sub_1000145F8(a1, "dspExceptionParameter112", v11, 4u, v21))
            goto LABEL_460;
          v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter112(4230): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4231:
          v19 = v14;
          v20 = v13;
          if ((_DWORD)v16 != 16)
            sub_10001B514("ASPMSPParseBufferToCxt: dspExceptionParameter113(4231): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          if (v16 >= 0x14)
            v21 = 4;
          else
            v21 = v16 >> 2;
          if (sub_1000145F8(a1, "dspExceptionParameter113", v11, 4u, v21))
            goto LABEL_460;
          v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter113(4231): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4232:
          v19 = v14;
          v20 = v13;
          if ((_DWORD)v16 != 256)
            sub_10001B514("ASPMSPParseBufferToCxt: readStageNumOfFails108(4232): cfg 64 elements; (64*4) cfg bytes != (%d) buffer bytes",
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          if (v16 >= 0x104)
            v21 = 64;
          else
            v21 = v16 >> 2;
          if (sub_1000145F8(a1, "readStageNumOfFails108", v11, 4u, v21))
            goto LABEL_460;
          v9 = "ASPMSPParseBufferToCxt: readStageNumOfFails108(4232): Error adding 64 elements to context";
          goto LABEL_1981;
        case 4233:
          v19 = v14;
          v20 = v13;
          if ((_DWORD)v16 != 256)
            sub_10001B514("ASPMSPParseBufferToCxt: readStageNumOfFails103(4233): cfg 64 elements; (64*4) cfg bytes != (%d) buffer bytes",
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          if (v16 >= 0x104)
            v21 = 64;
          else
            v21 = v16 >> 2;
          if (sub_1000145F8(a1, "readStageNumOfFails103", v11, 4u, v21))
            goto LABEL_460;
          v9 = "ASPMSPParseBufferToCxt: readStageNumOfFails103(4233): Error adding 64 elements to context";
          goto LABEL_1981;
        case 4234:
          v19 = v14;
          v20 = v13;
          if ((_DWORD)v16 != 16)
            sub_10001B514("ASPMSPParseBufferToCxt: readStageNumOfFails104(4234): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          if (v16 >= 0x14)
            v21 = 4;
          else
            v21 = v16 >> 2;
          if (sub_1000145F8(a1, "readStageNumOfFails104", v11, 4u, v21))
            goto LABEL_460;
          v9 = "ASPMSPParseBufferToCxt: readStageNumOfFails104(4234): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4235:
          v19 = v14;
          v20 = v13;
          if ((_DWORD)v16 != 16)
            sub_10001B514("ASPMSPParseBufferToCxt: readStageNumOfFails105(4235): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          if (v16 >= 0x14)
            v21 = 4;
          else
            v21 = v16 >> 2;
          if (sub_1000145F8(a1, "readStageNumOfFails105", v11, 4u, v21))
            goto LABEL_460;
          v9 = "ASPMSPParseBufferToCxt: readStageNumOfFails105(4235): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4236:
          v19 = v14;
          v20 = v13;
          if ((_DWORD)v16 != 16)
            sub_10001B514("ASPMSPParseBufferToCxt: readStageNumOfFails106(4236): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          if (v16 >= 0x14)
            v21 = 4;
          else
            v21 = v16 >> 2;
          if (sub_1000145F8(a1, "readStageNumOfFails106", v11, 4u, v21))
            goto LABEL_460;
          v9 = "ASPMSPParseBufferToCxt: readStageNumOfFails106(4236): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4237:
          v19 = v14;
          v20 = v13;
          if ((_DWORD)v16 != 16)
            sub_10001B514("ASPMSPParseBufferToCxt: readStageNumOfFails107(4237): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          if (v16 >= 0x14)
            v21 = 4;
          else
            v21 = v16 >> 2;
          if (sub_1000145F8(a1, "readStageNumOfFails107", v11, 4u, v21))
            goto LABEL_460;
          v9 = "ASPMSPParseBufferToCxt: readStageNumOfFails107(4237): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4238:
          v19 = v14;
          v20 = v13;
          if ((_DWORD)v16 != 16)
            sub_10001B514("ASPMSPParseBufferToCxt: readStage109(4238): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          if (v16 >= 0x14)
            v21 = 4;
          else
            v21 = v16 >> 2;
          if (sub_1000145F8(a1, "readStage109", v11, 4u, v21))
            goto LABEL_460;
          v9 = "ASPMSPParseBufferToCxt: readStage109(4238): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4239:
          v19 = v14;
          v20 = v13;
          if ((_DWORD)v16 != 16)
            sub_10001B514("ASPMSPParseBufferToCxt: readStage110(4239): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          if (v16 >= 0x14)
            v21 = 4;
          else
            v21 = v16 >> 2;
          if (sub_1000145F8(a1, "readStage110", v11, 4u, v21))
            goto LABEL_460;
          v9 = "ASPMSPParseBufferToCxt: readStage110(4239): Error adding 4 elements to context";
          goto LABEL_1981;
        case 4240:
          v19 = v14;
          v20 = v13;
          if ((_DWORD)v16 != 80)
            sub_10001B514("ASPMSPParseBufferToCxt: readStageNumOfErrorsBin100(4240): cfg 20 elements; (20*4) cfg bytes != (%d) buffer bytes",
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          if (v16 >= 0x54)
            v21 = 20;
          else
            v21 = v16 >> 2;
          if (sub_1000145F8(a1, "readStageNumOfErrorsBin100", v11, 4u, v21))
            goto LABEL_460;
          v9 = "ASPMSPParseBufferToCxt: readStageNumOfErrorsBin100(4240): Error adding 20 elements to context";
          goto LABEL_1981;
        case 4241:
          v19 = v14;
          v20 = v13;
          if ((_DWORD)v16 != 80)
            sub_10001B514("ASPMSPParseBufferToCxt: dspExceptionParameter114(4241): cfg 20 elements; (20*4) cfg bytes != (%d) buffer bytes",
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          if (v16 >= 0x54)
            v21 = 20;
          else
            v21 = v16 >> 2;
          if (sub_1000145F8(a1, "dspExceptionParameter114", v11, 4u, v21))
            goto LABEL_460;
          v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter114(4241): Error adding 20 elements to context";
          goto LABEL_1981;
        case 4242:
          v19 = v14;
          v20 = v13;
          if ((_DWORD)v16 != 4)
            sub_10001B514("ASPMSPParseBufferToCxt: dspExceptionParameter115(4242): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          if (v16 >= 8)
            v21 = 1;
          else
            v21 = v16 >> 2;
          if (sub_1000145F8(a1, "dspExceptionParameter115", v11, 4u, v21))
            goto LABEL_460;
          v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter115(4242): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4243:
          v19 = v14;
          v20 = v13;
          if ((_DWORD)v16 != 4)
            sub_10001B514("ASPMSPParseBufferToCxt: dspExceptionParameter116(4243): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          if (v16 >= 8)
            v21 = 1;
          else
            v21 = v16 >> 2;
          if (sub_1000145F8(a1, "dspExceptionParameter116", v11, 4u, v21))
            goto LABEL_460;
          v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter116(4243): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4244:
          v19 = v14;
          v20 = v13;
          if ((_DWORD)v16 != 4)
            sub_10001B514("ASPMSPParseBufferToCxt: dspExceptionParameter117(4244): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          if (v16 >= 8)
            v21 = 1;
          else
            v21 = v16 >> 2;
          if (sub_1000145F8(a1, "dspExceptionParameter117", v11, 4u, v21))
            goto LABEL_460;
          v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter117(4244): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4245:
          v19 = v14;
          v20 = v13;
          if ((_DWORD)v16 != 4)
            sub_10001B514("ASPMSPParseBufferToCxt: dspExceptionParameter118(4245): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          if (v16 >= 8)
            v21 = 1;
          else
            v21 = v16 >> 2;
          if (sub_1000145F8(a1, "dspExceptionParameter118", v11, 4u, v21))
            goto LABEL_460;
          v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter118(4245): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4246:
          v19 = v14;
          v20 = v13;
          if ((_DWORD)v16 != 4)
            sub_10001B514("ASPMSPParseBufferToCxt: dspExceptionParameter119(4246): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          if (v16 >= 8)
            v21 = 1;
          else
            v21 = v16 >> 2;
          if (sub_1000145F8(a1, "dspExceptionParameter119", v11, 4u, v21))
            goto LABEL_460;
          v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter119(4246): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4247:
          v19 = v14;
          v20 = v13;
          if ((_DWORD)v16 != 4)
            sub_10001B514("ASPMSPParseBufferToCxt: dspExceptionParameter120(4247): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          if (v16 >= 8)
            v21 = 1;
          else
            v21 = v16 >> 2;
          if (sub_1000145F8(a1, "dspExceptionParameter120", v11, 4u, v21))
            goto LABEL_460;
          v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter120(4247): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4248:
          v19 = v14;
          v20 = v13;
          if ((_DWORD)v16 != 4)
            sub_10001B514("ASPMSPParseBufferToCxt: dspExceptionParameter121(4248): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          if (v16 >= 8)
            v21 = 1;
          else
            v21 = v16 >> 2;
          if (sub_1000145F8(a1, "dspExceptionParameter121", v11, 4u, v21))
            goto LABEL_460;
          v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter121(4248): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4249:
          v19 = v14;
          v20 = v13;
          if ((_DWORD)v16 != 4)
            sub_10001B514("ASPMSPParseBufferToCxt: cbdr_ref_1(4249): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          if (v16 >= 8)
            v21 = 1;
          else
            v21 = v16 >> 2;
          if (sub_1000145F8(a1, "cbdr_ref_1", v11, 4u, v21))
            goto LABEL_460;
          v9 = "ASPMSPParseBufferToCxt: cbdr_ref_1(4249): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4250:
          v19 = v14;
          v20 = v13;
          if ((_DWORD)v16 != 4)
            sub_10001B514("ASPMSPParseBufferToCxt: cbdr_ref_2(4250): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          if (v16 >= 8)
            v21 = 1;
          else
            v21 = v16 >> 2;
          if (sub_1000145F8(a1, "cbdr_ref_2", v11, 4u, v21))
            goto LABEL_460;
          v9 = "ASPMSPParseBufferToCxt: cbdr_ref_2(4250): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4251:
          v19 = v14;
          v20 = v13;
          if ((_DWORD)v16 != 4)
            sub_10001B514("ASPMSPParseBufferToCxt: cbdr_outlier(4251): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          if (v16 >= 8)
            v21 = 1;
          else
            v21 = v16 >> 2;
          if (sub_1000145F8(a1, "cbdr_outlier", v11, 4u, v21))
            goto LABEL_460;
          v9 = "ASPMSPParseBufferToCxt: cbdr_outlier(4251): Error adding 1 elements to context";
          goto LABEL_1981;
        case 4252:
          v19 = v14;
          v20 = v13;
          if ((_DWORD)v16 != 40)
            sub_10001B514("ASPMSPParseBufferToCxt: cbdr_step_1(4252): cfg 10 elements; (10*4) cfg bytes != (%d) buffer bytes",
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          if (v16 >= 0x2C)
            v21 = 10;
          else
            v21 = v16 >> 2;
          if (sub_1000145F8(a1, "cbdr_step_1", v11, 4u, v21))
            goto LABEL_460;
          v9 = "ASPMSPParseBufferToCxt: cbdr_step_1(4252): Error adding 10 elements to context";
          goto LABEL_1981;
        case 4253:
          v19 = v14;
          v20 = v13;
          if ((_DWORD)v16 != 40)
            sub_10001B514("ASPMSPParseBufferToCxt: cbdr_step_2(4253): cfg 10 elements; (10*4) cfg bytes != (%d) buffer bytes",
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          if (v16 >= 0x2C)
            v21 = 10;
          else
            v21 = v16 >> 2;
          if (sub_1000145F8(a1, "cbdr_step_2", v11, 4u, v21))
            goto LABEL_460;
          v9 = "ASPMSPParseBufferToCxt: cbdr_step_2(4253): Error adding 10 elements to context";
          goto LABEL_1981;
        case 4254:
          v19 = v14;
          v20 = v13;
          if ((_DWORD)v16 != 40)
            sub_10001B514("ASPMSPParseBufferToCxt: cbdr_step_3(4254): cfg 10 elements; (10*4) cfg bytes != (%d) buffer bytes",
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          if (v16 >= 0x2C)
            v21 = 10;
          else
            v21 = v16 >> 2;
          if (sub_1000145F8(a1, "cbdr_step_3", v11, 4u, v21))
            goto LABEL_460;
          v9 = "ASPMSPParseBufferToCxt: cbdr_step_3(4254): Error adding 10 elements to context";
          goto LABEL_1981;
        case 4255:
          v19 = v14;
          v20 = v13;
          if ((_DWORD)v16 != 40)
            sub_10001B514("ASPMSPParseBufferToCxt: cbdr_step_4(4255): cfg 10 elements; (10*4) cfg bytes != (%d) buffer bytes",
              a2,
              a3,
              a4,
              a5,
              a6,
              a7,
              a8,
              v16);
          if (v16 >= 0x2C)
            v21 = 10;
          else
            v21 = v16 >> 2;
          if (sub_1000145F8(a1, "cbdr_step_4", v11, 4u, v21))
            goto LABEL_460;
          v9 = "ASPMSPParseBufferToCxt: cbdr_step_4(4255): Error adding 10 elements to context";
          goto LABEL_1981;
        default:
          switch(v17)
          {
            case 12288:
              if ((_DWORD)v16 != 8)
                sub_10001B514("ASPMSPParseBufferToCxt: readStageNumOfFails200(12288): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              if (v16 >= 0x10)
                v22 = 1;
              else
                v22 = v16 >> 3;
              if (sub_1000145F8(a1, "readStageNumOfFails200", v11, 8u, v22))
                goto LABEL_1372;
              v9 = "ASPMSPParseBufferToCxt: readStageNumOfFails200(12288): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12289:
              if ((_DWORD)v16 != 8)
                sub_10001B514("ASPMSPParseBufferToCxt: initialReadStage200(12289): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              if (v16 >= 0x10)
                v22 = 1;
              else
                v22 = v16 >> 3;
              if (sub_1000145F8(a1, "initialReadStage200", v11, 8u, v22))
                goto LABEL_1372;
              v9 = "ASPMSPParseBufferToCxt: initialReadStage200(12289): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12290:
              if ((_DWORD)v16 != 8)
                sub_10001B514("ASPMSPParseBufferToCxt: initialReadStage201(12290): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              if (v16 >= 0x10)
                v22 = 1;
              else
                v22 = v16 >> 3;
              if (sub_1000145F8(a1, "initialReadStage201", v11, 8u, v22))
                goto LABEL_1372;
              v9 = "ASPMSPParseBufferToCxt: initialReadStage201(12290): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12291:
              if ((_DWORD)v16 != 8)
                sub_10001B514("ASPMSPParseBufferToCxt: readStageNumOfFails201(12291): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              if (v16 >= 0x10)
                v22 = 1;
              else
                v22 = v16 >> 3;
              if (sub_1000145F8(a1, "readStageNumOfFails201", v11, 8u, v22))
                goto LABEL_1372;
              v9 = "ASPMSPParseBufferToCxt: readStageNumOfFails201(12291): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12292:
              if ((_DWORD)v16 != 8)
                sub_10001B514("ASPMSPParseBufferToCxt: initialReadStage202(12292): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              if (v16 >= 0x10)
                v22 = 1;
              else
                v22 = v16 >> 3;
              if (sub_1000145F8(a1, "initialReadStage202", v11, 8u, v22))
                goto LABEL_1372;
              v9 = "ASPMSPParseBufferToCxt: initialReadStage202(12292): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12293:
              if ((_DWORD)v16 != 8)
                sub_10001B514("ASPMSPParseBufferToCxt: initialReadStage203(12293): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              if (v16 >= 0x10)
                v22 = 1;
              else
                v22 = v16 >> 3;
              if (sub_1000145F8(a1, "initialReadStage203", v11, 8u, v22))
                goto LABEL_1372;
              v9 = "ASPMSPParseBufferToCxt: initialReadStage203(12293): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12294:
              if ((_DWORD)v16 != 8)
                sub_10001B514("ASPMSPParseBufferToCxt: readStageNumOfFails202(12294): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              if (v16 >= 0x10)
                v22 = 1;
              else
                v22 = v16 >> 3;
              if (sub_1000145F8(a1, "readStageNumOfFails202", v11, 8u, v22))
                goto LABEL_1372;
              v9 = "ASPMSPParseBufferToCxt: readStageNumOfFails202(12294): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12295:
              if ((_DWORD)v16 != 8)
                sub_10001B514("ASPMSPParseBufferToCxt: readStageNumOfFails203(12295): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              if (v16 >= 0x10)
                v22 = 1;
              else
                v22 = v16 >> 3;
              if (sub_1000145F8(a1, "readStageNumOfFails203", v11, 8u, v22))
                goto LABEL_1372;
              v9 = "ASPMSPParseBufferToCxt: readStageNumOfFails203(12295): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12296:
              if ((_DWORD)v16 != 8)
                sub_10001B514("ASPMSPParseBufferToCxt: initialReadStage204(12296): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              if (v16 >= 0x10)
                v22 = 1;
              else
                v22 = v16 >> 3;
              if (sub_1000145F8(a1, "initialReadStage204", v11, 8u, v22))
                goto LABEL_1372;
              v9 = "ASPMSPParseBufferToCxt: initialReadStage204(12296): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12297:
              if ((_DWORD)v16 != 8)
                sub_10001B514("ASPMSPParseBufferToCxt: initialReadStage205(12297): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              if (v16 >= 0x10)
                v22 = 1;
              else
                v22 = v16 >> 3;
              if (sub_1000145F8(a1, "initialReadStage205", v11, 8u, v22))
                goto LABEL_1372;
              v9 = "ASPMSPParseBufferToCxt: initialReadStage205(12297): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12298:
              if ((_DWORD)v16 != 8)
                sub_10001B514("ASPMSPParseBufferToCxt: initialReadStage206(12298): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              if (v16 >= 0x10)
                v22 = 1;
              else
                v22 = v16 >> 3;
              if (sub_1000145F8(a1, "initialReadStage206", v11, 8u, v22))
                goto LABEL_1372;
              v9 = "ASPMSPParseBufferToCxt: initialReadStage206(12298): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12299:
              if ((_DWORD)v16 != 8)
                sub_10001B514("ASPMSPParseBufferToCxt: initialReadStage207(12299): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              if (v16 >= 0x10)
                v22 = 1;
              else
                v22 = v16 >> 3;
              if (sub_1000145F8(a1, "initialReadStage207", v11, 8u, v22))
                goto LABEL_1372;
              v9 = "ASPMSPParseBufferToCxt: initialReadStage207(12299): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12300:
              if ((_DWORD)v16 != 8)
                sub_10001B514("ASPMSPParseBufferToCxt: initialReadStage208(12300): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              if (v16 >= 0x10)
                v22 = 1;
              else
                v22 = v16 >> 3;
              if (sub_1000145F8(a1, "initialReadStage208", v11, 8u, v22))
                goto LABEL_1372;
              v9 = "ASPMSPParseBufferToCxt: initialReadStage208(12300): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12301:
              if ((_DWORD)v16 != 8)
                sub_10001B514("ASPMSPParseBufferToCxt: initialReadStage209(12301): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              if (v16 >= 0x10)
                v22 = 1;
              else
                v22 = v16 >> 3;
              if (sub_1000145F8(a1, "initialReadStage209", v11, 8u, v22))
                goto LABEL_1372;
              v9 = "ASPMSPParseBufferToCxt: initialReadStage209(12301): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12302:
              if ((_DWORD)v16 != 8)
                sub_10001B514("ASPMSPParseBufferToCxt: readStage200(12302): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              if (v16 >= 0x10)
                v22 = 1;
              else
                v22 = v16 >> 3;
              if (sub_1000145F8(a1, "readStage200", v11, 8u, v22))
                goto LABEL_1372;
              v9 = "ASPMSPParseBufferToCxt: readStage200(12302): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12303:
              if ((_DWORD)v16 != 32)
                sub_10001B514("ASPMSPParseBufferToCxt: readStage201(12303): cfg 4 elements; (4*8) cfg bytes != (%d) buffer bytes",
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              if (v16 >= 0x28)
                v22 = 4;
              else
                v22 = v16 >> 3;
              if (sub_1000145F8(a1, "readStage201", v11, 8u, v22))
                goto LABEL_1372;
              v9 = "ASPMSPParseBufferToCxt: readStage201(12303): Error adding 4 elements to context";
              goto LABEL_1981;
            case 12304:
              if ((_DWORD)v16 != 32)
                sub_10001B514("ASPMSPParseBufferToCxt: readStage202(12304): cfg 4 elements; (4*8) cfg bytes != (%d) buffer bytes",
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              if (v16 >= 0x28)
                v22 = 4;
              else
                v22 = v16 >> 3;
              if (sub_1000145F8(a1, "readStage202", v11, 8u, v22))
                goto LABEL_1372;
              v9 = "ASPMSPParseBufferToCxt: readStage202(12304): Error adding 4 elements to context";
              goto LABEL_1981;
            case 12305:
              if ((_DWORD)v16 != 8)
                sub_10001B514("ASPMSPParseBufferToCxt: initialReadStage210(12305): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              if (v16 >= 0x10)
                v22 = 1;
              else
                v22 = v16 >> 3;
              if (sub_1000145F8(a1, "initialReadStage210", v11, 8u, v22))
                goto LABEL_1372;
              v9 = "ASPMSPParseBufferToCxt: initialReadStage210(12305): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12306:
              if ((_DWORD)v16 != 8)
                sub_10001B514("ASPMSPParseBufferToCxt: initialReadStage211(12306): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              if (v16 >= 0x10)
                v22 = 1;
              else
                v22 = v16 >> 3;
              if (sub_1000145F8(a1, "initialReadStage211", v11, 8u, v22))
                goto LABEL_1372;
              v9 = "ASPMSPParseBufferToCxt: initialReadStage211(12306): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12307:
              if ((_DWORD)v16 != 8)
                sub_10001B514("ASPMSPParseBufferToCxt: readStage203(12307): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              if (v16 >= 0x10)
                v22 = 1;
              else
                v22 = v16 >> 3;
              if (sub_1000145F8(a1, "readStage203", v11, 8u, v22))
                goto LABEL_1372;
              v9 = "ASPMSPParseBufferToCxt: readStage203(12307): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12308:
              if ((_DWORD)v16 != 8)
                sub_10001B514("ASPMSPParseBufferToCxt: readStage204(12308): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              if (v16 >= 0x10)
                v22 = 1;
              else
                v22 = v16 >> 3;
              if (sub_1000145F8(a1, "readStage204", v11, 8u, v22))
                goto LABEL_1372;
              v9 = "ASPMSPParseBufferToCxt: readStage204(12308): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12309:
              if ((_DWORD)v16 != 8)
                sub_10001B514("ASPMSPParseBufferToCxt: readStage205(12309): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              if (v16 >= 0x10)
                v22 = 1;
              else
                v22 = v16 >> 3;
              if (sub_1000145F8(a1, "readStage205", v11, 8u, v22))
                goto LABEL_1372;
              v9 = "ASPMSPParseBufferToCxt: readStage205(12309): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12310:
              if ((_DWORD)v16 != 8)
                sub_10001B514("ASPMSPParseBufferToCxt: readStage206(12310): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              if (v16 >= 0x10)
                v22 = 1;
              else
                v22 = v16 >> 3;
              if (sub_1000145F8(a1, "readStage206", v11, 8u, v22))
                goto LABEL_1372;
              v9 = "ASPMSPParseBufferToCxt: readStage206(12310): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12311:
              if ((_DWORD)v16 != 8)
                sub_10001B514("ASPMSPParseBufferToCxt: readStage207(12311): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              if (v16 >= 0x10)
                v22 = 1;
              else
                v22 = v16 >> 3;
              if (sub_1000145F8(a1, "readStage207", v11, 8u, v22))
                goto LABEL_1372;
              v9 = "ASPMSPParseBufferToCxt: readStage207(12311): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12312:
              if ((_DWORD)v16 != 8)
                sub_10001B514("ASPMSPParseBufferToCxt: readStage208(12312): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              if (v16 >= 0x10)
                v22 = 1;
              else
                v22 = v16 >> 3;
              if (sub_1000145F8(a1, "readStage208", v11, 8u, v22))
                goto LABEL_1372;
              v9 = "ASPMSPParseBufferToCxt: readStage208(12312): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12313:
              if ((_DWORD)v16 != 32)
                sub_10001B514("ASPMSPParseBufferToCxt: readStage209(12313): cfg 4 elements; (4*8) cfg bytes != (%d) buffer bytes",
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              if (v16 >= 0x28)
                v22 = 4;
              else
                v22 = v16 >> 3;
              if (sub_1000145F8(a1, "readStage209", v11, 8u, v22))
                goto LABEL_1372;
              v9 = "ASPMSPParseBufferToCxt: readStage209(12313): Error adding 4 elements to context";
              goto LABEL_1981;
            case 12314:
              if ((_DWORD)v16 != 32)
                sub_10001B514("ASPMSPParseBufferToCxt: readStage210(12314): cfg 4 elements; (4*8) cfg bytes != (%d) buffer bytes",
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              if (v16 >= 0x28)
                v22 = 4;
              else
                v22 = v16 >> 3;
              if (sub_1000145F8(a1, "readStage210", v11, 8u, v22))
                goto LABEL_1372;
              v9 = "ASPMSPParseBufferToCxt: readStage210(12314): Error adding 4 elements to context";
              goto LABEL_1981;
            case 12315:
              if ((_DWORD)v16 != 8)
                sub_10001B514("ASPMSPParseBufferToCxt: initialReadStage212(12315): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              if (v16 >= 0x10)
                v22 = 1;
              else
                v22 = v16 >> 3;
              if (sub_1000145F8(a1, "initialReadStage212", v11, 8u, v22))
                goto LABEL_1372;
              v9 = "ASPMSPParseBufferToCxt: initialReadStage212(12315): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12316:
              if ((_DWORD)v16 != 8)
                sub_10001B514("ASPMSPParseBufferToCxt: initialReadStage213(12316): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              if (v16 >= 0x10)
                v22 = 1;
              else
                v22 = v16 >> 3;
              if (sub_1000145F8(a1, "initialReadStage213", v11, 8u, v22))
                goto LABEL_1372;
              v9 = "ASPMSPParseBufferToCxt: initialReadStage213(12316): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12317:
              if ((_DWORD)v16 != 8)
                sub_10001B514("ASPMSPParseBufferToCxt: readStage211(12317): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              if (v16 >= 0x10)
                v22 = 1;
              else
                v22 = v16 >> 3;
              if (sub_1000145F8(a1, "readStage211", v11, 8u, v22))
                goto LABEL_1372;
              v9 = "ASPMSPParseBufferToCxt: readStage211(12317): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12318:
              if ((_DWORD)v16 != 8)
                sub_10001B514("ASPMSPParseBufferToCxt: readStage212(12318): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              if (v16 >= 0x10)
                v22 = 1;
              else
                v22 = v16 >> 3;
              if (sub_1000145F8(a1, "readStage212", v11, 8u, v22))
                goto LABEL_1372;
              v9 = "ASPMSPParseBufferToCxt: readStage212(12318): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12319:
              if ((_DWORD)v16 != 8)
                sub_10001B514("ASPMSPParseBufferToCxt: readStage213(12319): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              if (v16 >= 0x10)
                v22 = 1;
              else
                v22 = v16 >> 3;
              if (sub_1000145F8(a1, "readStage213", v11, 8u, v22))
                goto LABEL_1372;
              v9 = "ASPMSPParseBufferToCxt: readStage213(12319): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12320:
              if ((_DWORD)v16 != 8)
                sub_10001B514("ASPMSPParseBufferToCxt: readStage214(12320): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              if (v16 >= 0x10)
                v22 = 1;
              else
                v22 = v16 >> 3;
              if (sub_1000145F8(a1, "readStage214", v11, 8u, v22))
                goto LABEL_1372;
              v9 = "ASPMSPParseBufferToCxt: readStage214(12320): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12321:
              if ((_DWORD)v16 != 8)
                sub_10001B514("ASPMSPParseBufferToCxt: readStage215(12321): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              if (v16 >= 0x10)
                v22 = 1;
              else
                v22 = v16 >> 3;
              if (sub_1000145F8(a1, "readStage215", v11, 8u, v22))
                goto LABEL_1372;
              v9 = "ASPMSPParseBufferToCxt: readStage215(12321): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12322:
              if ((_DWORD)v16 != 8)
                sub_10001B514("ASPMSPParseBufferToCxt: dspExceptionParameter142(12322): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              if (v16 >= 0x10)
                v22 = 1;
              else
                v22 = v16 >> 3;
              if (sub_1000145F8(a1, "dspExceptionParameter142", v11, 8u, v22))
                goto LABEL_1372;
              v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter142(12322): Error adding 1 elements to context";
              goto LABEL_1981;
            case 12323:
              if ((_DWORD)v16 != 8)
                sub_10001B514("ASPMSPParseBufferToCxt: dspExceptionParameter143(12323): cfg 1 elements; (1*8) cfg bytes != (%d) buffer bytes",
                  a2,
                  a3,
                  a4,
                  a5,
                  a6,
                  a7,
                  a8,
                  v16);
              if (v16 >= 0x10)
                v22 = 1;
              else
                v22 = v16 >> 3;
              if (sub_1000145F8(a1, "dspExceptionParameter143", v11, 8u, v22))
                goto LABEL_1372;
              v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter143(12323): Error adding 1 elements to context";
              goto LABEL_1981;
            default:
              switch(v17)
              {
                case 4256:
                  if ((_DWORD)v16 != 40)
                    sub_10001B514("ASPMSPParseBufferToCxt: cbdr_step_5(4256): cfg 10 elements; (10*4) cfg bytes != (%d) buffer bytes",
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  if (v16 >= 0x2C)
                    v22 = 10;
                  else
                    v22 = v16 >> 2;
                  if (!sub_1000145F8(a1, "cbdr_step_5", v11, 4u, v22))
                    goto LABEL_1981;
                  goto LABEL_1372;
                case 4257:
                  if ((_DWORD)v16 != 40)
                    sub_10001B514("ASPMSPParseBufferToCxt: cbdr_step_6(4257): cfg 10 elements; (10*4) cfg bytes != (%d) buffer bytes",
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  if (v16 >= 0x2C)
                    v22 = 10;
                  else
                    v22 = v16 >> 2;
                  if (sub_1000145F8(a1, "cbdr_step_6", v11, 4u, v22))
                    goto LABEL_1372;
                  v9 = "ASPMSPParseBufferToCxt: cbdr_step_6(4257): Error adding 10 elements to context";
                  goto LABEL_1981;
                case 4258:
                  if ((_DWORD)v16 != 40)
                    sub_10001B514("ASPMSPParseBufferToCxt: cbdr_step_7(4258): cfg 10 elements; (10*4) cfg bytes != (%d) buffer bytes",
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  if (v16 >= 0x2C)
                    v22 = 10;
                  else
                    v22 = v16 >> 2;
                  if (sub_1000145F8(a1, "cbdr_step_7", v11, 4u, v22))
                    goto LABEL_1372;
                  v9 = "ASPMSPParseBufferToCxt: cbdr_step_7(4258): Error adding 10 elements to context";
                  goto LABEL_1981;
                case 4259:
                  if ((_DWORD)v16 != 80)
                    sub_10001B514("ASPMSPParseBufferToCxt: dspExceptionParameter122(4259): cfg 20 elements; (20*4) cfg bytes != (%d) buffer bytes",
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  if (v16 >= 0x54)
                    v22 = 20;
                  else
                    v22 = v16 >> 2;
                  if (sub_1000145F8(a1, "dspExceptionParameter122", v11, 4u, v22))
                    goto LABEL_1372;
                  v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter122(4259): Error adding 20 elements to context";
                  goto LABEL_1981;
                case 4260:
                  if ((_DWORD)v16 != 32)
                    sub_10001B514("ASPMSPParseBufferToCxt: dspExceptionParameter123(4260): cfg 8 elements; (8*4) cfg bytes != (%d) buffer bytes",
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  if (v16 >= 0x24)
                    v22 = 8;
                  else
                    v22 = v16 >> 2;
                  if (sub_1000145F8(a1, "dspExceptionParameter123", v11, 4u, v22))
                    goto LABEL_1372;
                  v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter123(4260): Error adding 8 elements to context";
                  goto LABEL_1981;
                case 4261:
                  if ((_DWORD)v16 != 4)
                    sub_10001B514("ASPMSPParseBufferToCxt: dspExceptionParameter124(4261): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  if (v16 >= 8)
                    v22 = 1;
                  else
                    v22 = v16 >> 2;
                  if (sub_1000145F8(a1, "dspExceptionParameter124", v11, 4u, v22))
                    goto LABEL_1372;
                  v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter124(4261): Error adding 1 elements to context";
                  goto LABEL_1981;
                case 4262:
                  if ((_DWORD)v16 != 4)
                    sub_10001B514("ASPMSPParseBufferToCxt: dspExceptionParameter125(4262): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  if (v16 >= 8)
                    v22 = 1;
                  else
                    v22 = v16 >> 2;
                  if (sub_1000145F8(a1, "dspExceptionParameter125", v11, 4u, v22))
                    goto LABEL_1372;
                  v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter125(4262): Error adding 1 elements to context";
                  goto LABEL_1981;
                case 4263:
                  if ((_DWORD)v16 != 4)
                    sub_10001B514("ASPMSPParseBufferToCxt: dspExceptionParameter126(4263): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  if (v16 >= 8)
                    v22 = 1;
                  else
                    v22 = v16 >> 2;
                  if (sub_1000145F8(a1, "dspExceptionParameter126", v11, 4u, v22))
                    goto LABEL_1372;
                  v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter126(4263): Error adding 1 elements to context";
                  goto LABEL_1981;
                case 4264:
                  if ((_DWORD)v16 != 16)
                    sub_10001B514("ASPMSPParseBufferToCxt: dspExceptionParameter127(4264): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  if (v16 >= 0x14)
                    v22 = 4;
                  else
                    v22 = v16 >> 2;
                  if (sub_1000145F8(a1, "dspExceptionParameter127", v11, 4u, v22))
                    goto LABEL_1372;
                  v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter127(4264): Error adding 4 elements to context";
                  goto LABEL_1981;
                case 4265:
                  if ((_DWORD)v16 != 16)
                    sub_10001B514("ASPMSPParseBufferToCxt: dspExceptionParameter128(4265): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  if (v16 >= 0x14)
                    v22 = 4;
                  else
                    v22 = v16 >> 2;
                  if (sub_1000145F8(a1, "dspExceptionParameter128", v11, 4u, v22))
                    goto LABEL_1372;
                  v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter128(4265): Error adding 4 elements to context";
                  goto LABEL_1981;
                case 4266:
                  if ((_DWORD)v16 != 16)
                    sub_10001B514("ASPMSPParseBufferToCxt: dspExceptionParameter129(4266): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  if (v16 >= 0x14)
                    v22 = 4;
                  else
                    v22 = v16 >> 2;
                  if (sub_1000145F8(a1, "dspExceptionParameter129", v11, 4u, v22))
                    goto LABEL_1372;
                  v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter129(4266): Error adding 4 elements to context";
                  goto LABEL_1981;
                case 4267:
                  if ((_DWORD)v16 != 16)
                    sub_10001B514("ASPMSPParseBufferToCxt: dspExceptionParameter130(4267): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  if (v16 >= 0x14)
                    v22 = 4;
                  else
                    v22 = v16 >> 2;
                  if (sub_1000145F8(a1, "dspExceptionParameter130", v11, 4u, v22))
                    goto LABEL_1372;
                  v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter130(4267): Error adding 4 elements to context";
                  goto LABEL_1981;
                case 4268:
                  if ((_DWORD)v16 != 16)
                    sub_10001B514("ASPMSPParseBufferToCxt: dspExceptionParameter131(4268): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  if (v16 >= 0x14)
                    v22 = 4;
                  else
                    v22 = v16 >> 2;
                  if (sub_1000145F8(a1, "dspExceptionParameter131", v11, 4u, v22))
                    goto LABEL_1372;
                  v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter131(4268): Error adding 4 elements to context";
                  goto LABEL_1981;
                case 4269:
                  if ((_DWORD)v16 != 40)
                    sub_10001B514("ASPMSPParseBufferToCxt: dspExceptionParameter132(4269): cfg 10 elements; (10*4) cfg bytes != (%d) buffer bytes",
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  if (v16 >= 0x2C)
                    v22 = 10;
                  else
                    v22 = v16 >> 2;
                  if (sub_1000145F8(a1, "dspExceptionParameter132", v11, 4u, v22))
                    goto LABEL_1372;
                  v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter132(4269): Error adding 10 elements to context";
                  goto LABEL_1981;
                case 4270:
                  if ((_DWORD)v16 != 40)
                    sub_10001B514("ASPMSPParseBufferToCxt: dspExceptionParameter133(4270): cfg 10 elements; (10*4) cfg bytes != (%d) buffer bytes",
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  if (v16 >= 0x2C)
                    v22 = 10;
                  else
                    v22 = v16 >> 2;
                  if (sub_1000145F8(a1, "dspExceptionParameter133", v11, 4u, v22))
                    goto LABEL_1372;
                  v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter133(4270): Error adding 10 elements to context";
                  goto LABEL_1981;
                case 4271:
                  if ((_DWORD)v16 != 4)
                    sub_10001B514("ASPMSPParseBufferToCxt: dspExceptionParameter134(4271): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  if (v16 >= 8)
                    v22 = 1;
                  else
                    v22 = v16 >> 2;
                  if (sub_1000145F8(a1, "dspExceptionParameter134", v11, 4u, v22))
                    goto LABEL_1372;
                  v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter134(4271): Error adding 1 elements to context";
                  goto LABEL_1981;
                case 4272:
                  if ((_DWORD)v16 != 4)
                    sub_10001B514("ASPMSPParseBufferToCxt: dspExceptionParameter135(4272): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  if (v16 >= 8)
                    v22 = 1;
                  else
                    v22 = v16 >> 2;
                  if (sub_1000145F8(a1, "dspExceptionParameter135", v11, 4u, v22))
                    goto LABEL_1372;
                  v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter135(4272): Error adding 1 elements to context";
                  goto LABEL_1981;
                case 4273:
                  if ((_DWORD)v16 != 4)
                    sub_10001B514("ASPMSPParseBufferToCxt: dspExceptionParameter136(4273): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  if (v16 >= 8)
                    v22 = 1;
                  else
                    v22 = v16 >> 2;
                  if (sub_1000145F8(a1, "dspExceptionParameter136", v11, 4u, v22))
                    goto LABEL_1372;
                  v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter136(4273): Error adding 1 elements to context";
                  goto LABEL_1981;
                case 4274:
                  if ((_DWORD)v16 != 4)
                    sub_10001B514("ASPMSPParseBufferToCxt: dspExceptionParameter137(4274): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  if (v16 >= 8)
                    v22 = 1;
                  else
                    v22 = v16 >> 2;
                  if (sub_1000145F8(a1, "dspExceptionParameter137", v11, 4u, v22))
                    goto LABEL_1372;
                  v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter137(4274): Error adding 1 elements to context";
                  goto LABEL_1981;
                case 4275:
                  if ((_DWORD)v16 != 4)
                    sub_10001B514("ASPMSPParseBufferToCxt: dspExceptionParameter138(4275): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  if (v16 >= 8)
                    v22 = 1;
                  else
                    v22 = v16 >> 2;
                  if (sub_1000145F8(a1, "dspExceptionParameter138", v11, 4u, v22))
                    goto LABEL_1372;
                  v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter138(4275): Error adding 1 elements to context";
                  goto LABEL_1981;
                case 4276:
                  if ((_DWORD)v16 != 16)
                    sub_10001B514("ASPMSPParseBufferToCxt: dspExceptionParameter139(4276): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  if (v16 >= 0x14)
                    v22 = 4;
                  else
                    v22 = v16 >> 2;
                  if (sub_1000145F8(a1, "dspExceptionParameter139", v11, 4u, v22))
                    goto LABEL_1372;
                  v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter139(4276): Error adding 4 elements to context";
                  goto LABEL_1981;
                case 4277:
                  if ((_DWORD)v16 != 4)
                    sub_10001B514("ASPMSPParseBufferToCxt: dspExceptionParameter140(4277): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  if (v16 >= 8)
                    v22 = 1;
                  else
                    v22 = v16 >> 2;
                  if (sub_1000145F8(a1, "dspExceptionParameter140", v11, 4u, v22))
                    goto LABEL_1372;
                  v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter140(4277): Error adding 1 elements to context";
                  goto LABEL_1981;
                case 4278:
                  if ((_DWORD)v16 != 4)
                    sub_10001B514("ASPMSPParseBufferToCxt: dspExceptionParameter141(4278): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
                      a2,
                      a3,
                      a4,
                      a5,
                      a6,
                      a7,
                      a8,
                      v16);
                  if (v16 >= 8)
                    v22 = 1;
                  else
                    v22 = v16 >> 2;
                  if (sub_1000145F8(a1, "dspExceptionParameter141", v11, 4u, v22))
                    goto LABEL_1372;
                  v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter141(4278): Error adding 1 elements to context";
                  goto LABEL_1981;
                default:
                  switch(v17)
                  {
                    case 4164:
                      if ((_DWORD)v16 != 4)
                        sub_10001B514("ASPMSPParseBufferToCxt: syndSumAcqConvergedToStaticWalls(4164): cfg 1 elements; (1*4) cfg byte"
                          "s != (%d) buffer bytes",
                          a2,
                          a3,
                          a4,
                          a5,
                          a6,
                          a7,
                          a8,
                          v16);
                      if (v16 >= 8)
                        v22 = 1;
                      else
                        v22 = v16 >> 2;
                      if (sub_1000145F8(a1, "syndSumAcqConvergedToStaticWalls", v11, 4u, v22))
                        goto LABEL_1372;
                      v9 = "ASPMSPParseBufferToCxt: syndSumAcqConvergedToStaticWalls(4164): Error adding 1 elements to context";
                      goto LABEL_1981;
                    case 4165:
                      if ((_DWORD)v16 != 60)
                        sub_10001B514("ASPMSPParseBufferToCxt: DYCE1_Decoded_Bitflips(4165): cfg 15 elements; (15*4) cfg bytes != (%d) buffer bytes",
                          a2,
                          a3,
                          a4,
                          a5,
                          a6,
                          a7,
                          a8,
                          v16);
                      if (v16 >= 0x40)
                        v22 = 15;
                      else
                        v22 = v16 >> 2;
                      if (sub_1000145F8(a1, "DYCE1_Decoded_Bitflips", v11, 4u, v22))
                        goto LABEL_1372;
                      v9 = "ASPMSPParseBufferToCxt: DYCE1_Decoded_Bitflips(4165): Error adding 15 elements to context";
                      goto LABEL_1981;
                    case 4166:
                      if ((_DWORD)v16 != 80)
                        sub_10001B514("ASPMSPParseBufferToCxt: DYCE1_Target_Bitflips(4166): cfg 20 elements; (20*4) cfg bytes != (%d) buffer bytes",
                          a2,
                          a3,
                          a4,
                          a5,
                          a6,
                          a7,
                          a8,
                          v16);
                      if (v16 >= 0x54)
                        v22 = 20;
                      else
                        v22 = v16 >> 2;
                      if (sub_1000145F8(a1, "DYCE1_Target_Bitflips", v11, 4u, v22))
                        goto LABEL_1372;
                      v9 = "ASPMSPParseBufferToCxt: DYCE1_Target_Bitflips(4166): Error adding 20 elements to context";
                      goto LABEL_1981;
                    case 4167:
                      if ((_DWORD)v16 != 60)
                        sub_10001B514("ASPMSPParseBufferToCxt: DYCE2_Decoded_Bitflips(4167): cfg 15 elements; (15*4) cfg bytes != (%d) buffer bytes",
                          a2,
                          a3,
                          a4,
                          a5,
                          a6,
                          a7,
                          a8,
                          v16);
                      if (v16 >= 0x40)
                        v22 = 15;
                      else
                        v22 = v16 >> 2;
                      if (sub_1000145F8(a1, "DYCE2_Decoded_Bitflips", v11, 4u, v22))
                        goto LABEL_1372;
                      v9 = "ASPMSPParseBufferToCxt: DYCE2_Decoded_Bitflips(4167): Error adding 15 elements to context";
                      goto LABEL_1981;
                    case 4168:
                      if ((_DWORD)v16 != 80)
                        sub_10001B514("ASPMSPParseBufferToCxt: DYCE2_Target_Bitflips(4168): cfg 20 elements; (20*4) cfg bytes != (%d) buffer bytes",
                          a2,
                          a3,
                          a4,
                          a5,
                          a6,
                          a7,
                          a8,
                          v16);
                      if (v16 >= 0x54)
                        v22 = 20;
                      else
                        v22 = v16 >> 2;
                      if (sub_1000145F8(a1, "DYCE2_Target_Bitflips", v11, 4u, v22))
                        goto LABEL_1372;
                      v9 = "ASPMSPParseBufferToCxt: DYCE2_Target_Bitflips(4168): Error adding 20 elements to context";
                      goto LABEL_1981;
                    default:
                      if (v17 <= 12323)
                      {
                        switch(v17)
                        {
                          case 8193:
                            if ((_DWORD)v16 != 20)
                              sub_10001B514("ASPMSPParseBufferToCxt: avg_rd_window_size(8193): cfg 5 elements; (5*4) cfg bytes != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            if (v16 >= 0x18)
                              v22 = 5;
                            else
                              v22 = v16 >> 2;
                            if (sub_1000145F8(a1, "avg_rd_window_size", v11, 4u, v22))
                              goto LABEL_1372;
                            v9 = "ASPMSPParseBufferToCxt: avg_rd_window_size(8193): Error adding 5 elements to context";
                            break;
                          case 8194:
                            if ((_DWORD)v16 != 4)
                              sub_10001B514("ASPMSPParseBufferToCxt: num_zq_failures(8194): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            if (v16 >= 8)
                              v22 = 1;
                            else
                              v22 = v16 >> 2;
                            if (sub_1000145F8(a1, "num_zq_failures", v11, 4u, v22))
                              goto LABEL_1372;
                            v9 = "ASPMSPParseBufferToCxt: num_zq_failures(8194): Error adding 1 elements to context";
                            break;
                          case 8195:
                            if ((_DWORD)v16 != 64)
                              sub_10001B514("ASPMSPParseBufferToCxt: lower_die_temperature(8195): cfg 16 elements; (16*4) cfg bytes !"
                                "= (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            if (v16 >= 0x44)
                              v22 = 16;
                            else
                              v22 = v16 >> 2;
                            if (sub_1000145F8(a1, "lower_die_temperature", v11, 4u, v22))
                              goto LABEL_1372;
                            v9 = "ASPMSPParseBufferToCxt: lower_die_temperature(8195): Error adding 16 elements to context";
                            break;
                          case 8196:
                            if ((_DWORD)v16 != 64)
                              sub_10001B514("ASPMSPParseBufferToCxt: higher_die_temperature(8196): cfg 16 elements; (16*4) cfg bytes "
                                "!= (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            if (v16 >= 0x44)
                              v22 = 16;
                            else
                              v22 = v16 >> 2;
                            if (sub_1000145F8(a1, "higher_die_temperature", v11, 4u, v22))
                              goto LABEL_1372;
                            v9 = "ASPMSPParseBufferToCxt: higher_die_temperature(8196): Error adding 16 elements to context";
                            break;
                          case 8197:
                            if ((_DWORD)v16 != 4)
                              sub_10001B514("ASPMSPParseBufferToCxt: number_of_sram_flips(8197): cfg 1 elements; (1*4) cfg bytes != ("
                                "%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            if (v16 >= 8)
                              v22 = 1;
                            else
                              v22 = v16 >> 2;
                            if (sub_1000145F8(a1, "number_of_sram_flips", v11, 4u, v22))
                              goto LABEL_1372;
                            v9 = "ASPMSPParseBufferToCxt: number_of_sram_flips(8197): Error adding 1 elements to context";
                            break;
                          case 8198:
                            if ((_DWORD)v16 != 4)
                              sub_10001B514("ASPMSPParseBufferToCxt: number_of_reset_failures(8198): cfg 1 elements; (1*4) cfg bytes "
                                "!= (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            if (v16 >= 8)
                              v22 = 1;
                            else
                              v22 = v16 >> 2;
                            if (sub_1000145F8(a1, "number_of_reset_failures", v11, 4u, v22))
                              goto LABEL_1372;
                            v9 = "ASPMSPParseBufferToCxt: number_of_reset_failures(8198): Error adding 1 elements to context";
                            break;
                          case 8199:
                            if ((_DWORD)v16 != 4)
                              sub_10001B514("ASPMSPParseBufferToCxt: device_config(8199): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            if (v16 >= 8)
                              v22 = 1;
                            else
                              v22 = v16 >> 2;
                            if (sub_1000145F8(a1, "device_config", v11, 4u, v22))
                              goto LABEL_1372;
                            v9 = "ASPMSPParseBufferToCxt: device_config(8199): Error adding 1 elements to context";
                            break;
                          case 8200:
                            if ((_DWORD)v16 != 4)
                              sub_10001B514("ASPMSPParseBufferToCxt: number_of_throttling_events(8200): cfg 1 elements; (1*4) cfg byt"
                                "es != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            if (v16 >= 8)
                              v22 = 1;
                            else
                              v22 = v16 >> 2;
                            if (sub_1000145F8(a1, "number_of_throttling_events", v11, 4u, v22))
                              goto LABEL_1372;
                            v9 = "ASPMSPParseBufferToCxt: number_of_throttling_events(8200): Error adding 1 elements to context";
                            break;
                          case 8201:
                            if ((_DWORD)v16 != 4)
                              sub_10001B514("ASPMSPParseBufferToCxt: link_speed_recoveries(8201): cfg 1 elements; (1*4) cfg bytes != "
                                "(%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            if (v16 >= 8)
                              v22 = 1;
                            else
                              v22 = v16 >> 2;
                            if (sub_1000145F8(a1, "link_speed_recoveries", v11, 4u, v22))
                              goto LABEL_1372;
                            v9 = "ASPMSPParseBufferToCxt: link_speed_recoveries(8201): Error adding 1 elements to context";
                            break;
                          case 8202:
                            if ((_DWORD)v16 != 4)
                              sub_10001B514("ASPMSPParseBufferToCxt: fw_updates(8202): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            if (v16 >= 8)
                              v22 = 1;
                            else
                              v22 = v16 >> 2;
                            if (sub_1000145F8(a1, "fw_updates", v11, 4u, v22))
                              goto LABEL_1372;
                            v9 = "ASPMSPParseBufferToCxt: fw_updates(8202): Error adding 1 elements to context";
                            break;
                          case 8203:
                            if ((_DWORD)v16 != 4)
                              sub_10001B514("ASPMSPParseBufferToCxt: maintenance_backup_to_main(8203): cfg 1 elements; (1*4) cfg byte"
                                "s != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            if (v16 >= 8)
                              v22 = 1;
                            else
                              v22 = v16 >> 2;
                            if (sub_1000145F8(a1, "maintenance_backup_to_main", v11, 4u, v22))
                              goto LABEL_1372;
                            v9 = "ASPMSPParseBufferToCxt: maintenance_backup_to_main(8203): Error adding 1 elements to context";
                            break;
                          case 8204:
                            if ((_DWORD)v16 != 4)
                              sub_10001B514("ASPMSPParseBufferToCxt: maintenance_main_to_backup(8204): cfg 1 elements; (1*4) cfg byte"
                                "s != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            if (v16 >= 8)
                              v22 = 1;
                            else
                              v22 = v16 >> 2;
                            if (sub_1000145F8(a1, "maintenance_main_to_backup", v11, 4u, v22))
                              goto LABEL_1372;
                            v9 = "ASPMSPParseBufferToCxt: maintenance_main_to_backup(8204): Error adding 1 elements to context";
                            break;
                          case 8205:
                            if ((_DWORD)v16 != 4)
                              sub_10001B514("ASPMSPParseBufferToCxt: boot_block_erase_failures(8205): cfg 1 elements; (1*4) cfg bytes"
                                " != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            if (v16 >= 8)
                              v22 = 1;
                            else
                              v22 = v16 >> 2;
                            if (sub_1000145F8(a1, "boot_block_erase_failures", v11, 4u, v22))
                              goto LABEL_1372;
                            v9 = "ASPMSPParseBufferToCxt: boot_block_erase_failures(8205): Error adding 1 elements to context";
                            break;
                          case 8206:
                            if ((_DWORD)v16 != 4)
                              sub_10001B514("ASPMSPParseBufferToCxt: boot_block_program_failures(8206): cfg 1 elements; (1*4) cfg byt"
                                "es != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            if (v16 >= 8)
                              v22 = 1;
                            else
                              v22 = v16 >> 2;
                            if (sub_1000145F8(a1, "boot_block_program_failures", v11, 4u, v22))
                              goto LABEL_1372;
                            v9 = "ASPMSPParseBufferToCxt: boot_block_program_failures(8206): Error adding 1 elements to context";
                            break;
                          case 8207:
                            if ((_DWORD)v16 != 4)
                              sub_10001B514("ASPMSPParseBufferToCxt: boot_block_read_verify_failures(8207): cfg 1 elements; (1*4) cfg"
                                " bytes != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            if (v16 >= 8)
                              v22 = 1;
                            else
                              v22 = v16 >> 2;
                            if (sub_1000145F8(a1, "boot_block_read_verify_failures", v11, 4u, v22))
                              goto LABEL_1372;
                            v9 = "ASPMSPParseBufferToCxt: boot_block_read_verify_failures(8207): Error adding 1 elements to context";
                            break;
                          case 8208:
                            if ((_DWORD)v16 != 4)
                              sub_10001B514("ASPMSPParseBufferToCxt: boot_block_read_failures(8208): cfg 1 elements; (1*4) cfg bytes "
                                "!= (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            if (v16 >= 8)
                              v22 = 1;
                            else
                              v22 = v16 >> 2;
                            if (sub_1000145F8(a1, "boot_block_read_failures", v11, 4u, v22))
                              goto LABEL_1372;
                            v9 = "ASPMSPParseBufferToCxt: boot_block_read_failures(8208): Error adding 1 elements to context";
                            break;
                          case 8209:
                            if ((_DWORD)v16 != 4)
                              sub_10001B514("ASPMSPParseBufferToCxt: boot_block_refresh(8209): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            if (v16 >= 8)
                              v22 = 1;
                            else
                              v22 = v16 >> 2;
                            if (sub_1000145F8(a1, "boot_block_refresh", v11, 4u, v22))
                              goto LABEL_1372;
                            v9 = "ASPMSPParseBufferToCxt: boot_block_refresh(8209): Error adding 1 elements to context";
                            break;
                          case 8210:
                            if ((_DWORD)v16 != 4)
                              sub_10001B514("ASPMSPParseBufferToCxt: boot_block_convert_to_main(8210): cfg 1 elements; (1*4) cfg byte"
                                "s != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            if (v16 >= 8)
                              v22 = 1;
                            else
                              v22 = v16 >> 2;
                            if (sub_1000145F8(a1, "boot_block_convert_to_main", v11, 4u, v22))
                              goto LABEL_1372;
                            v9 = "ASPMSPParseBufferToCxt: boot_block_convert_to_main(8210): Error adding 1 elements to context";
                            break;
                          case 8211:
                            if ((_DWORD)v16 != 4)
                              sub_10001B514("ASPMSPParseBufferToCxt: boot_block_read_source_changed(8211): cfg 1 elements; (1*4) cfg "
                                "bytes != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            if (v16 >= 8)
                              v22 = 1;
                            else
                              v22 = v16 >> 2;
                            if (sub_1000145F8(a1, "boot_block_read_source_changed", v11, 4u, v22))
                              goto LABEL_1372;
                            v9 = "ASPMSPParseBufferToCxt: boot_block_read_source_changed(8211): Error adding 1 elements to context";
                            break;
                          case 8212:
                            if ((_DWORD)v16 != 16)
                              sub_10001B514("ASPMSPParseBufferToCxt: open_blocks_hist(8212): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            if (v16 >= 0x14)
                              v22 = 4;
                            else
                              v22 = v16 >> 2;
                            if (sub_1000145F8(a1, "open_blocks_hist", v11, 4u, v22))
                              goto LABEL_1372;
                            v9 = "ASPMSPParseBufferToCxt: open_blocks_hist(8212): Error adding 4 elements to context";
                            break;
                          case 8213:
                            if ((_DWORD)v16 != 24)
                              sub_10001B514("ASPMSPParseBufferToCxt: random_read_hit_ratio_hist(8213): cfg 6 elements; (6*4) cfg byte"
                                "s != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            if (v16 >= 0x1C)
                              v22 = 6;
                            else
                              v22 = v16 >> 2;
                            if (sub_1000145F8(a1, "random_read_hit_ratio_hist", v11, 4u, v22))
                              goto LABEL_1372;
                            v9 = "ASPMSPParseBufferToCxt: random_read_hit_ratio_hist(8213): Error adding 6 elements to context";
                            break;
                          case 8214:
                            if ((_DWORD)v16 != 20)
                              sub_10001B514("ASPMSPParseBufferToCxt: active_time_hist(8214): cfg 5 elements; (5*4) cfg bytes != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            if (v16 >= 0x18)
                              v22 = 5;
                            else
                              v22 = v16 >> 2;
                            if (sub_1000145F8(a1, "active_time_hist", v11, 4u, v22))
                              goto LABEL_1372;
                            v9 = "ASPMSPParseBufferToCxt: active_time_hist(8214): Error adding 5 elements to context";
                            break;
                          case 8215:
                            if ((_DWORD)v16 != 8)
                              sub_10001B514("ASPMSPParseBufferToCxt: rd_retraining_failures(8215): cfg 2 elements; (2*4) cfg bytes !="
                                " (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            if (v16 >= 0xC)
                              v22 = 2;
                            else
                              v22 = v16 >> 2;
                            if (sub_1000145F8(a1, "rd_retraining_failures", v11, 4u, v22))
                              goto LABEL_1372;
                            v9 = "ASPMSPParseBufferToCxt: rd_retraining_failures(8215): Error adding 2 elements to context";
                            break;
                          case 8216:
                            if ((_DWORD)v16 != 8)
                              sub_10001B514("ASPMSPParseBufferToCxt: wr_retraining_failures(8216): cfg 2 elements; (2*4) cfg bytes !="
                                " (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            if (v16 >= 0xC)
                              v22 = 2;
                            else
                              v22 = v16 >> 2;
                            if (sub_1000145F8(a1, "wr_retraining_failures", v11, 4u, v22))
                              goto LABEL_1372;
                            v9 = "ASPMSPParseBufferToCxt: wr_retraining_failures(8216): Error adding 2 elements to context";
                            break;
                          case 8217:
                            if ((_DWORD)v16 != 20)
                              sub_10001B514("ASPMSPParseBufferToCxt: auto_skip(8217): cfg 5 elements; (5*4) cfg bytes != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            if (v16 >= 0x18)
                              v22 = 5;
                            else
                              v22 = v16 >> 2;
                            if (sub_1000145F8(a1, "auto_skip", v11, 4u, v22))
                              goto LABEL_1372;
                            v9 = "ASPMSPParseBufferToCxt: auto_skip(8217): Error adding 5 elements to context";
                            break;
                          case 8218:
                            if ((_DWORD)v16 != 4)
                              sub_10001B514("ASPMSPParseBufferToCxt: number_of_dcc_pass_after_retry(8218): cfg 1 elements; (1*4) cfg "
                                "bytes != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            if (v16 >= 8)
                              v22 = 1;
                            else
                              v22 = v16 >> 2;
                            if (sub_1000145F8(a1, "number_of_dcc_pass_after_retry", v11, 4u, v22))
                              goto LABEL_1372;
                            v9 = "ASPMSPParseBufferToCxt: number_of_dcc_pass_after_retry(8218): Error adding 1 elements to context";
                            break;
                          case 8219:
                            if ((_DWORD)v16 != 4)
                              sub_10001B514("ASPMSPParseBufferToCxt: number_of_dcc_failures(8219): cfg 1 elements; (1*4) cfg bytes !="
                                " (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            if (v16 >= 8)
                              v22 = 1;
                            else
                              v22 = v16 >> 2;
                            if (sub_1000145F8(a1, "number_of_dcc_failures", v11, 4u, v22))
                              goto LABEL_1372;
                            v9 = "ASPMSPParseBufferToCxt: number_of_dcc_failures(8219): Error adding 1 elements to context";
                            break;
                          case 8220:
                            if ((_DWORD)v16 != 28)
                              sub_10001B514("ASPMSPParseBufferToCxt: open_blocks_hist(8220): cfg 7 elements; (7*4) cfg bytes != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            if (v16 >= 0x20)
                              v22 = 7;
                            else
                              v22 = v16 >> 2;
                            if (sub_1000145F8(a1, "open_blocks_hist", v11, 4u, v22))
                              goto LABEL_1372;
                            v9 = "ASPMSPParseBufferToCxt: open_blocks_hist(8220): Error adding 7 elements to context";
                            break;
                          case 8221:
                            if ((_DWORD)v16 != 4)
                              sub_10001B514("ASPMSPParseBufferToCxt: max_size_open_blocks_list(8221): cfg 1 elements; (1*4) cfg bytes"
                                " != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            if (v16 >= 8)
                              v22 = 1;
                            else
                              v22 = v16 >> 2;
                            if (sub_1000145F8(a1, "max_size_open_blocks_list", v11, 4u, v22))
                              goto LABEL_1372;
                            v9 = "ASPMSPParseBufferToCxt: max_size_open_blocks_list(8221): Error adding 1 elements to context";
                            break;
                          case 8222:
                            if ((_DWORD)v16 != 4)
                              sub_10001B514("ASPMSPParseBufferToCxt: gps_max_num_of_failures(8222): cfg 1 elements; (1*4) cfg bytes !"
                                "= (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            if (v16 >= 8)
                              v22 = 1;
                            else
                              v22 = v16 >> 2;
                            if (sub_1000145F8(a1, "gps_max_num_of_failures", v11, 4u, v22))
                              goto LABEL_1372;
                            v9 = "ASPMSPParseBufferToCxt: gps_max_num_of_failures(8222): Error adding 1 elements to context";
                            break;
                          case 8223:
                            if ((_DWORD)v16 != 4)
                              sub_10001B514("ASPMSPParseBufferToCxt: gps_num_of_failures_max_overflow(8223): cfg 1 elements; (1*4) cf"
                                "g bytes != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            if (v16 >= 8)
                              v22 = 1;
                            else
                              v22 = v16 >> 2;
                            if (sub_1000145F8(a1, "gps_num_of_failures_max_overflow", v11, 4u, v22))
                              goto LABEL_1372;
                            v9 = "ASPMSPParseBufferToCxt: gps_num_of_failures_max_overflow(8223): Error adding 1 elements to context";
                            break;
                          case 8224:
                            if ((_DWORD)v16 != 32)
                              sub_10001B514("ASPMSPParseBufferToCxt: active_time_hist(8224): cfg 8 elements; (8*4) cfg bytes != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            if (v16 >= 0x24)
                              v22 = 8;
                            else
                              v22 = v16 >> 2;
                            if (sub_1000145F8(a1, "active_time_hist", v11, 4u, v22))
                              goto LABEL_1372;
                            v9 = "ASPMSPParseBufferToCxt: active_time_hist(8224): Error adding 8 elements to context";
                            break;
                          case 8225:
                            if ((_DWORD)v16 != 4)
                              sub_10001B514("ASPMSPParseBufferToCxt: num_auto_program_cache_terminations(8225): cfg 1 elements; (1*4)"
                                " cfg bytes != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            if (v16 >= 8)
                              v22 = 1;
                            else
                              v22 = v16 >> 2;
                            if (sub_1000145F8(a1, "num_auto_program_cache_terminations", v11, 4u, v22))
                              goto LABEL_1372;
                            v9 = "ASPMSPParseBufferToCxt: num_auto_program_cache_terminations(8225): Error adding 1 elements to context";
                            break;
                          case 8226:
                            if ((_DWORD)v16 != 4)
                              sub_10001B514("ASPMSPParseBufferToCxt: number_of_read_cache_auto_terminations(8226): cfg 1 elements; (1"
                                "*4) cfg bytes != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            if (v16 >= 8)
                              v22 = 1;
                            else
                              v22 = v16 >> 2;
                            if (sub_1000145F8(a1, "number_of_read_cache_auto_terminations", v11, 4u, v22))
                              goto LABEL_1372;
                            v9 = "ASPMSPParseBufferToCxt: number_of_read_cache_auto_terminations(8226): Error adding 1 el"
                                 "ements to context";
                            break;
                          case 8227:
                            if ((_DWORD)v16 != 28)
                              sub_10001B514("ASPMSPParseBufferToCxt: external_etags_usage_hist(8227): cfg 7 elements; (7*4) cfg bytes"
                                " != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            if (v16 >= 0x20)
                              v22 = 7;
                            else
                              v22 = v16 >> 2;
                            if (sub_1000145F8(a1, "external_etags_usage_hist", v11, 4u, v22))
                              goto LABEL_1372;
                            v9 = "ASPMSPParseBufferToCxt: external_etags_usage_hist(8227): Error adding 7 elements to context";
                            break;
                          case 8228:
                            if ((_DWORD)v16 != 16)
                              sub_10001B514("ASPMSPParseBufferToCxt: internal_etags_usage_hist(8228): cfg 4 elements; (4*4) cfg bytes"
                                " != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            if (v16 >= 0x14)
                              v22 = 4;
                            else
                              v22 = v16 >> 2;
                            if (sub_1000145F8(a1, "internal_etags_usage_hist", v11, 4u, v22))
                              goto LABEL_1372;
                            v9 = "ASPMSPParseBufferToCxt: internal_etags_usage_hist(8228): Error adding 4 elements to context";
                            break;
                          case 8229:
                            if ((_DWORD)v16 != 4)
                              sub_10001B514("ASPMSPParseBufferToCxt: max_heap_usage(8229): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            if (v16 >= 8)
                              v22 = 1;
                            else
                              v22 = v16 >> 2;
                            if (sub_1000145F8(a1, "max_heap_usage", v11, 4u, v22))
                              goto LABEL_1372;
                            v9 = "ASPMSPParseBufferToCxt: max_heap_usage(8229): Error adding 1 elements to context";
                            break;
                          case 8230:
                            if ((_DWORD)v16 != 24)
                              sub_10001B514("ASPMSPParseBufferToCxt: rom_num_hard_resets(8230): cfg 6 elements; (6*4) cfg bytes != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            if (v16 >= 0x1C)
                              v22 = 6;
                            else
                              v22 = v16 >> 2;
                            if (sub_1000145F8(a1, "rom_num_hard_resets", v11, 4u, v22))
                              goto LABEL_1372;
                            v9 = "ASPMSPParseBufferToCxt: rom_num_hard_resets(8230): Error adding 6 elements to context";
                            break;
                          case 8231:
                            if ((_DWORD)v16 != 64)
                              sub_10001B514("ASPMSPParseBufferToCxt: lower_die_temperature(8231): cfg 16 elements; (16*4) cfg bytes !"
                                "= (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            if (v16 >= 0x44)
                              v22 = 16;
                            else
                              v22 = v16 >> 2;
                            if (sub_1000145F8(a1, "lower_die_temperature", v11, 4u, v22))
                              goto LABEL_1372;
                            v9 = "ASPMSPParseBufferToCxt: lower_die_temperature(8231): Error adding 16 elements to context";
                            break;
                          case 8232:
                            if ((_DWORD)v16 != 64)
                              sub_10001B514("ASPMSPParseBufferToCxt: higher_die_temperature(8232): cfg 16 elements; (16*4) cfg bytes "
                                "!= (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            if (v16 >= 0x44)
                              v22 = 16;
                            else
                              v22 = v16 >> 2;
                            if (sub_1000145F8(a1, "higher_die_temperature", v11, 4u, v22))
                              goto LABEL_1372;
                            v9 = "ASPMSPParseBufferToCxt: higher_die_temperature(8232): Error adding 16 elements to context";
                            break;
                          case 8233:
                            if ((_DWORD)v16 != 24)
                              sub_10001B514("ASPMSPParseBufferToCxt: random_read_hit_ratio_hist(8233): cfg 6 elements; (6*4) cfg byte"
                                "s != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            if (v16 >= 0x1C)
                              v22 = 6;
                            else
                              v22 = v16 >> 2;
                            if (sub_1000145F8(a1, "random_read_hit_ratio_hist", v11, 4u, v22))
                              goto LABEL_1372;
                            v9 = "ASPMSPParseBufferToCxt: random_read_hit_ratio_hist(8233): Error adding 6 elements to context";
                            break;
                          case 8234:
                            if ((_DWORD)v16 != 4)
                              sub_10001B514("ASPMSPParseBufferToCxt: msp_number_sram_flips(8234): cfg 1 elements; (1*4) cfg bytes != "
                                "(%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            if (v16 >= 8)
                              v22 = 1;
                            else
                              v22 = v16 >> 2;
                            if (sub_1000145F8(a1, "msp_number_sram_flips", v11, 4u, v22))
                              goto LABEL_1372;
                            v9 = "ASPMSPParseBufferToCxt: msp_number_sram_flips(8234): Error adding 1 elements to context";
                            break;
                          case 8235:
                            if ((_DWORD)v16 != 28)
                              sub_10001B514("ASPMSPParseBufferToCxt: boot_time_normal_power(8235): cfg 7 elements; (7*4) cfg bytes !="
                                " (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            if (v16 >= 0x20)
                              v22 = 7;
                            else
                              v22 = v16 >> 2;
                            if (sub_1000145F8(a1, "boot_time_normal_power", v11, 4u, v22))
                              goto LABEL_1372;
                            v9 = "ASPMSPParseBufferToCxt: boot_time_normal_power(8235): Error adding 7 elements to context";
                            break;
                          case 8236:
                            if ((_DWORD)v16 != 28)
                              sub_10001B514("ASPMSPParseBufferToCxt: boot_time_low_power(8236): cfg 7 elements; (7*4) cfg bytes != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            if (v16 >= 0x20)
                              v22 = 7;
                            else
                              v22 = v16 >> 2;
                            if (sub_1000145F8(a1, "boot_time_low_power", v11, 4u, v22))
                              goto LABEL_1372;
                            v9 = "ASPMSPParseBufferToCxt: boot_time_low_power(8236): Error adding 7 elements to context";
                            break;
                          case 8237:
                            if ((_DWORD)v16 != 40)
                              sub_10001B514("ASPMSPParseBufferToCxt: active_time_bw_pg_hist(8237): cfg 10 elements; (10*4) cfg bytes "
                                "!= (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            if (v16 >= 0x2C)
                              v22 = 10;
                            else
                              v22 = v16 >> 2;
                            if (sub_1000145F8(a1, "active_time_bw_pg_hist", v11, 4u, v22))
                              goto LABEL_1372;
                            v9 = "ASPMSPParseBufferToCxt: active_time_bw_pg_hist(8237): Error adding 10 elements to context";
                            break;
                          case 8238:
                            if ((_DWORD)v16 != 4)
                              sub_10001B514("ASPMSPParseBufferToCxt: active_time_bw_pg_min(8238): cfg 1 elements; (1*4) cfg bytes != "
                                "(%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            if (v16 >= 8)
                              v22 = 1;
                            else
                              v22 = v16 >> 2;
                            if (sub_1000145F8(a1, "active_time_bw_pg_min", v11, 4u, v22))
                              goto LABEL_1372;
                            v9 = "ASPMSPParseBufferToCxt: active_time_bw_pg_min(8238): Error adding 1 elements to context";
                            break;
                          case 8239:
                            if ((_DWORD)v16 != 4)
                              sub_10001B514("ASPMSPParseBufferToCxt: active_time_bw_pg_max(8239): cfg 1 elements; (1*4) cfg bytes != "
                                "(%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            if (v16 >= 8)
                              v22 = 1;
                            else
                              v22 = v16 >> 2;
                            if (sub_1000145F8(a1, "active_time_bw_pg_max", v11, 4u, v22))
                              goto LABEL_1372;
                            v9 = "ASPMSPParseBufferToCxt: active_time_bw_pg_max(8239): Error adding 1 elements to context";
                            break;
                          case 8240:
                            if ((_DWORD)v16 != 20)
                              sub_10001B514("ASPMSPParseBufferToCxt: mdll_relative_offset(8240): cfg 5 elements; (5*4) cfg bytes != ("
                                "%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            if (v16 >= 0x18)
                              v22 = 5;
                            else
                              v22 = v16 >> 2;
                            if (sub_1000145F8(a1, "mdll_relative_offset", v11, 4u, v22))
                              goto LABEL_1372;
                            v9 = "ASPMSPParseBufferToCxt: mdll_relative_offset(8240): Error adding 5 elements to context";
                            break;
                          case 8241:
                            if ((_DWORD)v16 != 4)
                              sub_10001B514("ASPMSPParseBufferToCxt: num_pg_regrets(8241): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            if (v16 >= 8)
                              v22 = 1;
                            else
                              v22 = v16 >> 2;
                            if (sub_1000145F8(a1, "num_pg_regrets", v11, 4u, v22))
                              goto LABEL_1372;
                            v9 = "ASPMSPParseBufferToCxt: num_pg_regrets(8241): Error adding 1 elements to context";
                            break;
                          case 8242:
                            if ((_DWORD)v16 != 4)
                              sub_10001B514("ASPMSPParseBufferToCxt: spi_image_overall_duration_acc(8242): cfg 1 elements; (1*4) cfg "
                                "bytes != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            if (v16 >= 8)
                              v22 = 1;
                            else
                              v22 = v16 >> 2;
                            if (sub_1000145F8(a1, "spi_image_overall_duration_acc", v11, 4u, v22))
                              goto LABEL_1372;
                            v9 = "ASPMSPParseBufferToCxt: spi_image_overall_duration_acc(8242): Error adding 1 elements to context";
                            break;
                          case 8243:
                            if ((_DWORD)v16 != 4)
                              sub_10001B514("ASPMSPParseBufferToCxt: spi_image_cw_fetch_duration_acc(8243): cfg 1 elements; (1*4) cfg"
                                " bytes != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            if (v16 >= 8)
                              v22 = 1;
                            else
                              v22 = v16 >> 2;
                            if (sub_1000145F8(a1, "spi_image_cw_fetch_duration_acc", v11, 4u, v22))
                              goto LABEL_1372;
                            v9 = "ASPMSPParseBufferToCxt: spi_image_cw_fetch_duration_acc(8243): Error adding 1 elements to context";
                            break;
                          case 8244:
                            if ((_DWORD)v16 != 20)
                              sub_10001B514("ASPMSPParseBufferToCxt: spi_image_cw_fetch_duration_hist(8244): cfg 5 elements; (5*4) cf"
                                "g bytes != (%d) buffer bytes",
                                a2,
                                a3,
                                a4,
                                a5,
                                a6,
                                a7,
                                a8,
                                v16);
                            if (v16 >= 0x18)
                              v22 = 5;
                            else
                              v22 = v16 >> 2;
                            if (sub_1000145F8(a1, "spi_image_cw_fetch_duration_hist", v11, 4u, v22))
                              goto LABEL_1372;
                            v9 = "ASPMSPParseBufferToCxt: spi_image_cw_fetch_duration_hist(8244): Error adding 5 elements to context";
                            break;
                          default:
                            switch(v17)
                            {
                              case 4279:
                                if ((_DWORD)v16 != 16)
                                  sub_10001B514("ASPMSPParseBufferToCxt: fs1_4b_fail(4279): cfg 4 elements; (4*4) cfg bytes != (%d) buffer bytes",
                                    a2,
                                    a3,
                                    a4,
                                    a5,
                                    a6,
                                    a7,
                                    a8,
                                    v16);
                                if (v16 >= 0x14)
                                  v22 = 4;
                                else
                                  v22 = v16 >> 2;
                                if (sub_1000145F8(a1, "fs1_4b_fail_", v11, 4u, v22))
                                  goto LABEL_1372;
                                v9 = v14;
                                break;
                              case 4280:
                                if ((_DWORD)v16 != 16)
                                  sub_10001B514("ASPMSPParseBufferToCxt: fs1_4b_fast_fail(4280): cfg 4 elements; (4*4) cfg bytes != ("
                                    "%d) buffer bytes",
                                    a2,
                                    a3,
                                    a4,
                                    a5,
                                    a6,
                                    a7,
                                    a8,
                                    v16);
                                if (v16 >= 0x14)
                                  v22 = 4;
                                else
                                  v22 = v16 >> 2;
                                if (sub_1000145F8(a1, "fs1_4b_fast_fail_", v11, 4u, v22))
                                  goto LABEL_1372;
                                v9 = "ASPMSPParseBufferToCxt: fs1_4b_fast_fail(4280): Error adding 4 elements to context";
                                break;
                              case 4281:
                                if ((_DWORD)v16 != 40)
                                  sub_10001B514("ASPMSPParseBufferToCxt: dyce_decoded_bit_flips(4281): cfg 10 elements; (10*4) cfg by"
                                    "tes != (%d) buffer bytes",
                                    a2,
                                    a3,
                                    a4,
                                    a5,
                                    a6,
                                    a7,
                                    a8,
                                    v16);
                                if (v16 >= 0x2C)
                                  v22 = 10;
                                else
                                  v22 = v16 >> 2;
                                if (sub_1000145F8(a1, "dyce_decoded_bit_flips_", v11, 4u, v22))
                                  goto LABEL_1372;
                                v9 = "ASPMSPParseBufferToCxt: dyce_decoded_bit_flips(4281): Error adding 10 elements to context";
                                break;
                              case 4282:
                                if ((_DWORD)v16 != 60)
                                  sub_10001B514("ASPMSPParseBufferToCxt: slip_bch(4282): cfg 15 elements; (15*4) cfg bytes != (%d) buffer bytes",
                                    a2,
                                    a3,
                                    a4,
                                    a5,
                                    a6,
                                    a7,
                                    a8,
                                    v16);
                                if (v16 >= 0x40)
                                  v22 = 15;
                                else
                                  v22 = v16 >> 2;
                                if (sub_1000145F8(a1, "slip_bch_", v11, 4u, v22))
                                  goto LABEL_1372;
                                v9 = "ASPMSPParseBufferToCxt: slip_bch(4282): Error adding 15 elements to context";
                                break;
                              case 4283:
                                if ((_DWORD)v16 != 40)
                                  sub_10001B514("ASPMSPParseBufferToCxt: read_fail(4283): cfg 10 elements; (10*4) cfg bytes != (%d) buffer bytes",
                                    a2,
                                    a3,
                                    a4,
                                    a5,
                                    a6,
                                    a7,
                                    a8,
                                    v16);
                                if (v16 >= 0x2C)
                                  v22 = 10;
                                else
                                  v22 = v16 >> 2;
                                if (sub_1000145F8(a1, "read_fail_", v11, 4u, v22))
                                  goto LABEL_1372;
                                v9 = "ASPMSPParseBufferToCxt: read_fail(4283): Error adding 10 elements to context";
                                break;
                              case 4284:
                                if ((_DWORD)v16 != 40)
                                  sub_10001B514("ASPMSPParseBufferToCxt: tr_read_fail(4284): cfg 10 elements; (10*4) cfg bytes != (%d) buffer bytes",
                                    a2,
                                    a3,
                                    a4,
                                    a5,
                                    a6,
                                    a7,
                                    a8,
                                    v16);
                                if (v16 >= 0x2C)
                                  v22 = 10;
                                else
                                  v22 = v16 >> 2;
                                if (sub_1000145F8(a1, "tr_read_fail_", v11, 4u, v22))
                                  goto LABEL_1372;
                                v9 = "ASPMSPParseBufferToCxt: tr_read_fail(4284): Error adding 10 elements to context";
                                break;
                              case 4285:
                                if ((_DWORD)v16 != 40)
                                  sub_10001B514("ASPMSPParseBufferToCxt: tr_aux_bfs_percent(4285): cfg 10 elements; (10*4) cfg bytes "
                                    "!= (%d) buffer bytes",
                                    a2,
                                    a3,
                                    a4,
                                    a5,
                                    a6,
                                    a7,
                                    a8,
                                    v16);
                                if (v16 >= 0x2C)
                                  v22 = 10;
                                else
                                  v22 = v16 >> 2;
                                if (sub_1000145F8(a1, "tr_aux_bfs_percent_", v11, 4u, v22))
                                  goto LABEL_1372;
                                v9 = "ASPMSPParseBufferToCxt: tr_aux_bfs_percent(4285): Error adding 10 elements to context";
                                break;
                              case 4286:
                                if ((_DWORD)v16 != 20)
                                  sub_10001B514("ASPMSPParseBufferToCxt: tr_reconstruct_pass_step(4286): cfg 5 elements; (5*4) cfg by"
                                    "tes != (%d) buffer bytes",
                                    a2,
                                    a3,
                                    a4,
                                    a5,
                                    a6,
                                    a7,
                                    a8,
                                    v16);
                                if (v16 >= 0x18)
                                  v22 = 5;
                                else
                                  v22 = v16 >> 2;
                                if (sub_1000145F8(a1, "tr_reconstruct_pass_step_", v11, 4u, v22))
                                  goto LABEL_1372;
                                v9 = "ASPMSPParseBufferToCxt: tr_reconstruct_pass_step(4286): Error adding 5 elements to context";
                                break;
                              case 4287:
                                if ((_DWORD)v16 != 4)
                                  sub_10001B514("ASPMSPParseBufferToCxt: tr_reconstruct_num(4287): cfg 1 elements; (1*4) cfg bytes !="
                                    " (%d) buffer bytes",
                                    a2,
                                    a3,
                                    a4,
                                    a5,
                                    a6,
                                    a7,
                                    a8,
                                    v16);
                                if (v16 >= 8)
                                  v22 = 1;
                                else
                                  v22 = v16 >> 2;
                                if (sub_1000145F8(a1, "tr_reconstruct_num", v11, 4u, v22))
                                  goto LABEL_1372;
                                v9 = "ASPMSPParseBufferToCxt: tr_reconstruct_num(4287): Error adding 1 elements to context";
                                break;
                              default:
                                goto LABEL_1404;
                            }
                            goto LABEL_1981;
                        }
                        goto LABEL_1981;
                      }
                      switch(v17)
                      {
                        case 12326:
                          if ((_DWORD)v16 != 8)
                            sub_10001B514("ASPMSPParseBufferToCxt: initialReadStageParameter2(12326): cfg 1 elements; (1*8) cfg bytes"
                              " != (%d) buffer bytes",
                              a2,
                              a3,
                              a4,
                              a5,
                              a6,
                              a7,
                              a8,
                              v16);
                          if (v16 >= 0x10)
                            v22 = 1;
                          else
                            v22 = v16 >> 3;
                          if (!sub_1000145F8(a1, "initialReadStageParameter2", v11, 8u, v22))
                          {
                            v9 = "ASPMSPParseBufferToCxt: initialReadStageParameter2(12326): Error adding 1 elements to context";
                            goto LABEL_1981;
                          }
                          break;
                        case 12325:
                          if ((_DWORD)v16 != 8)
                            sub_10001B514("ASPMSPParseBufferToCxt: initialReadStageParameter1(12325): cfg 1 elements; (1*8) cfg bytes"
                              " != (%d) buffer bytes",
                              a2,
                              a3,
                              a4,
                              a5,
                              a6,
                              a7,
                              a8,
                              v16);
                          if (v16 >= 0x10)
                            v22 = 1;
                          else
                            v22 = v16 >> 3;
                          if (!sub_1000145F8(a1, "initialReadStageParameter1", v11, 8u, v22))
                          {
                            v9 = "ASPMSPParseBufferToCxt: initialReadStageParameter1(12325): Error adding 1 elements to context";
                            goto LABEL_1981;
                          }
                          break;
                        case 12324:
                          if ((_DWORD)v16 != 8)
                            sub_10001B514("ASPMSPParseBufferToCxt: dspExceptionParameter144(12324): cfg 1 elements; (1*8) cfg bytes !"
                              "= (%d) buffer bytes",
                              a2,
                              a3,
                              a4,
                              a5,
                              a6,
                              a7,
                              a8,
                              v16);
                          if (v16 >= 0x10)
                            v22 = 1;
                          else
                            v22 = v16 >> 3;
                          if (!sub_1000145F8(a1, "dspExceptionParameter144", v11, 8u, v22))
                          {
                            v9 = "ASPMSPParseBufferToCxt: dspExceptionParameter144(12324): Error adding 1 elements to context";
                            goto LABEL_1981;
                          }
                          break;
                        default:
LABEL_1404:
                          switch(v17)
                          {
                            case 8245:
                              if ((_DWORD)v16 != 4)
                                sub_10001B514("ASPMSPParseBufferToCxt: spi_num_uses(8245): cfg 1 elements; (1*4) cfg bytes != (%d) buffer bytes",
                                  a2,
                                  a3,
                                  a4,
                                  a5,
                                  a6,
                                  a7,
                                  a8,
                                  v16);
                              if (v16 >= 8)
                                v22 = 1;
                              else
                                v22 = v16 >> 2;
                              if (sub_1000145F8(a1, "spi_num_uses", v11, 4u, v22))
                                goto LABEL_1372;
                              v9 = "ASPMSPParseBufferToCxt: spi_num_uses(8245): Error adding 1 elements to context";
                              break;
                            case 8246:
                              if ((_DWORD)v16 != 20)
                                sub_10001B514("ASPMSPParseBufferToCxt: e2e_error_count_tmode(8246): cfg 5 elements; (5*4) cfg bytes !"
                                  "= (%d) buffer bytes",
                                  a2,
                                  a3,
                                  a4,
                                  a5,
                                  a6,
                                  a7,
                                  a8,
                                  v16);
                              if (v16 >= 0x18)
                                v22 = 5;
                              else
                                v22 = v16 >> 2;
                              if (sub_1000145F8(a1, "e2e_error_count_tmode", v11, 4u, v22))
                                goto LABEL_1372;
                              v9 = "ASPMSPParseBufferToCxt: e2e_error_count_tmode(8246): Error adding 5 elements to context";
                              break;
                            case 8247:
                              if ((_DWORD)v16 != 36)
                                sub_10001B514("ASPMSPParseBufferToCxt: rd_window_dist(8247): cfg 9 elements; (9*4) cfg bytes != (%d) buffer bytes",
                                  a2,
                                  a3,
                                  a4,
                                  a5,
                                  a6,
                                  a7,
                                  a8,
                                  v16);
                              if (v16 >= 0x28)
                                v22 = 9;
                              else
                                v22 = v16 >> 2;
                              if (sub_1000145F8(a1, "rd_window_dist", v11, 4u, v22))
                                goto LABEL_1372;
                              v9 = "ASPMSPParseBufferToCxt: rd_window_dist(8247): Error adding 9 elements to context";
                              break;
                            case 8248:
                              if ((_DWORD)v16 != 36)
                                sub_10001B514("ASPMSPParseBufferToCxt: extended_rd_window_diff_dist(8248): cfg 9 elements; (9*4) cfg "
                                  "bytes != (%d) buffer bytes",
                                  a2,
                                  a3,
                                  a4,
                                  a5,
                                  a6,
                                  a7,
                                  a8,
                                  v16);
                              if (v16 >= 0x28)
                                v22 = 9;
                              else
                                v22 = v16 >> 2;
                              if (sub_1000145F8(a1, "extended_rd_window_diff_dist", v11, 4u, v22))
                                goto LABEL_1372;
                              v9 = "ASPMSPParseBufferToCxt: extended_rd_window_diff_dist(8248): Error adding 9 elements to context";
                              break;
                            case 8249:
                              if ((_DWORD)v16 != 8)
                                sub_10001B514("ASPMSPParseBufferToCxt: rd_retraining_failures_v2(8249): cfg 2 elements; (2*4) cfg byt"
                                  "es != (%d) buffer bytes",
                                  a2,
                                  a3,
                                  a4,
                                  a5,
                                  a6,
                                  a7,
                                  a8,
                                  v16);
                              if (v16 >= 0xC)
                                v22 = 2;
                              else
                                v22 = v16 >> 2;
                              if (sub_1000145F8(a1, "rd_retraining_failures_v2", v11, 4u, v22))
                                goto LABEL_1372;
                              v9 = "ASPMSPParseBufferToCxt: rd_retraining_failures_v2(8249): Error adding 2 elements to context";
                              break;
                            case 8250:
                              if ((_DWORD)v16 != 120)
                                sub_10001B514("ASPMSPParseBufferToCxt: lower_die_temperature(8250): cfg 30 elements; (30*4) cfg bytes"
                                  " != (%d) buffer bytes",
                                  a2,
                                  a3,
                                  a4,
                                  a5,
                                  a6,
                                  a7,
                                  a8,
                                  v16);
                              if (v16 >= 0x7C)
                                v22 = 30;
                              else
                                v22 = v16 >> 2;
                              if (sub_1000145F8(a1, "lower_die_temperature", v11, 4u, v22))
                                goto LABEL_1372;
                              v9 = "ASPMSPParseBufferToCxt: lower_die_temperature(8250): Error adding 30 elements to context";
                              break;
                            case 8251:
                              if ((_DWORD)v16 != 120)
                                sub_10001B514("ASPMSPParseBufferToCxt: higher_die_temperature(8251): cfg 30 elements; (30*4) cfg byte"
                                  "s != (%d) buffer bytes",
                                  a2,
                                  a3,
                                  a4,
                                  a5,
                                  a6,
                                  a7,
                                  a8,
                                  v16);
                              if (v16 >= 0x7C)
                                v22 = 30;
                              else
                                v22 = v16 >> 2;
                              if (sub_1000145F8(a1, "higher_die_temperature", v11, 4u, v22))
                                goto LABEL_1372;
                              v9 = "ASPMSPParseBufferToCxt: higher_die_temperature(8251): Error adding 30 elements to context";
                              break;
                            case 8252:
                              if ((_DWORD)v16 != 36)
                                sub_10001B514("ASPMSPParseBufferToCxt: rd_window_dist_single_die(8252): cfg 9 elements; (9*4) cfg byt"
                                  "es != (%d) buffer bytes",
                                  a2,
                                  a3,
                                  a4,
                                  a5,
                                  a6,
                                  a7,
                                  a8,
                                  v16);
                              if (v16 >= 0x28)
                                v22 = 9;
                              else
                                v22 = v16 >> 2;
                              if (sub_1000145F8(a1, "rd_window_dist_single_die", v11, 4u, v22))
                                goto LABEL_1372;
                              v9 = "ASPMSPParseBufferToCxt: rd_window_dist_single_die(8252): Error adding 9 elements to context";
                              break;
                            case 8253:
                              if ((_DWORD)v16 != 16)
                                sub_10001B514("ASPMSPParseBufferToCxt: parallel_slip_drops_hist(8253): cfg 4 elements; (4*4) cfg byte"
                                  "s != (%d) buffer bytes",
                                  a2,
                                  a3,
                                  a4,
                                  a5,
                                  a6,
                                  a7,
                                  a8,
                                  v16);
                              if (v16 >= 0x14)
                                v22 = 4;
                              else
                                v22 = v16 >> 2;
                              if (sub_1000145F8(a1, "parallel_slip_drops_hist", v11, 4u, v22))
                                goto LABEL_1372;
                              v9 = "ASPMSPParseBufferToCxt: parallel_slip_drops_hist(8253): Error adding 4 elements to context";
                              break;
                            case 8254:
                              if ((_DWORD)v16 != 4)
                                sub_10001B514("ASPMSPParseBufferToCxt: sys_halt_max_latency(8254): cfg 1 elements; (1*4) cfg bytes !="
                                  " (%d) buffer bytes",
                                  a2,
                                  a3,
                                  a4,
                                  a5,
                                  a6,
                                  a7,
                                  a8,
                                  v16);
                              if (v16 >= 8)
                                v22 = 1;
                              else
                                v22 = v16 >> 2;
                              if (sub_1000145F8(a1, "sys_halt_max_latency", v11, 4u, v22))
                                goto LABEL_1372;
                              v9 = "ASPMSPParseBufferToCxt: sys_halt_max_latency(8254): Error adding 1 elements to context";
                              break;
                            case 8255:
                              if ((_DWORD)v16 != 4)
                                sub_10001B514("ASPMSPParseBufferToCxt: sys_halt_max_latency_opcode(8255): cfg 1 elements; (1*4) cfg b"
                                  "ytes != (%d) buffer bytes",
                                  a2,
                                  a3,
                                  a4,
                                  a5,
                                  a6,
                                  a7,
                                  a8,
                                  v16);
                              if (v16 >= 8)
                                v22 = 1;
                              else
                                v22 = v16 >> 2;
                              if (sub_1000145F8(a1, "sys_halt_max_latency_opcode", v11, 4u, v22))
                                goto LABEL_1372;
                              v9 = "ASPMSPParseBufferToCxt: sys_halt_max_latency_opcode(8255): Error adding 1 elements to context";
                              break;
                            case 8256:
                              if ((_DWORD)v16 != 4)
                                sub_10001B514("ASPMSPParseBufferToCxt: channel_halt_max_latency(8256): cfg 1 elements; (1*4) cfg byte"
                                  "s != (%d) buffer bytes",
                                  a2,
                                  a3,
                                  a4,
                                  a5,
                                  a6,
                                  a7,
                                  a8,
                                  v16);
                              if (v16 >= 8)
                                v22 = 1;
                              else
                                v22 = v16 >> 2;
                              if (sub_1000145F8(a1, "channel_halt_max_latency", v11, 4u, v22))
                                goto LABEL_1372;
                              v9 = "ASPMSPParseBufferToCxt: channel_halt_max_latency(8256): Error adding 1 elements to context";
                              break;
                            case 8257:
                              if ((_DWORD)v16 != 8)
                                sub_10001B514("ASPMSPParseBufferToCxt: max_heap_usage_v2(8257): cfg 2 elements; (2*4) cfg bytes != (%d) buffer bytes",
                                  a2,
                                  a3,
                                  a4,
                                  a5,
                                  a6,
                                  a7,
                                  a8,
                                  v16);
                              if (v16 >= 0xC)
                                v22 = 2;
                              else
                                v22 = v16 >> 2;
                              if (sub_1000145F8(a1, "max_heap_usage_v2", v11, 4u, v22))
                                goto LABEL_1372;
                              v9 = "ASPMSPParseBufferToCxt: max_heap_usage_v2(8257): Error adding 2 elements to context";
                              break;
                            default:
                              switch(v17)
                              {
                                case 16384:
                                  if ((_DWORD)v16 != 8)
                                    sub_10001B514("ASPMSPParseBufferToCxt: fw_version_identifier(16384): cfg 1 elements; (1*8) cfg by"
                                      "tes != (%d) buffer bytes",
                                      a2,
                                      a3,
                                      a4,
                                      a5,
                                      a6,
                                      a7,
                                      a8,
                                      v16);
                                  if (v16 >= 0x10)
                                    v22 = 1;
                                  else
                                    v22 = v16 >> 3;
                                  if (sub_1000145F8(a1, "fw_version_identifier", v11, 8u, v22))
                                    goto LABEL_1372;
                                  v9 = "ASPMSPParseBufferToCxt: fw_version_identifier(16384): Error adding 1 elements to context";
                                  break;
                                case 16385:
                                  if ((_DWORD)v16 != 40)
                                    sub_10001B514("ASPMSPParseBufferToCxt: random_read_size_ratio(16385): cfg 5 elements; (5*8) cfg b"
                                      "ytes != (%d) buffer bytes",
                                      a2,
                                      a3,
                                      a4,
                                      a5,
                                      a6,
                                      a7,
                                      a8,
                                      v16);
                                  if (v16 >= 0x30)
                                    v22 = 5;
                                  else
                                    v22 = v16 >> 3;
                                  if (sub_1000145F8(a1, "random_read_size_ratio", v11, 8u, v22))
                                    goto LABEL_1372;
                                  v9 = "ASPMSPParseBufferToCxt: random_read_size_ratio(16385): Error adding 5 elements to context";
                                  break;
                                case 16386:
                                  if ((_DWORD)v16 != 8)
                                    sub_10001B514("ASPMSPParseBufferToCxt: number_gracefull_read_terminations(16386): cfg 1 elements;"
                                      " (1*8) cfg bytes != (%d) buffer bytes",
                                      a2,
                                      a3,
                                      a4,
                                      a5,
                                      a6,
                                      a7,
                                      a8,
                                      v16);
                                  if (v16 >= 0x10)
                                    v22 = 1;
                                  else
                                    v22 = v16 >> 3;
                                  if (sub_1000145F8(a1, "number_gracefull_read_terminations", v11, 8u, v22))goto LABEL_1372;
                                  v9 = "ASPMSPParseBufferToCxt: number_gracefull_read_terminations(16386): Error adding 1"
                                       " elements to context";
                                  break;
                                case 16387:
                                  if ((_DWORD)v16 != 8)
                                    sub_10001B514("ASPMSPParseBufferToCxt: active_time_bw_pg_acc(16387): cfg 1 elements; (1*8) cfg by"
                                      "tes != (%d) buffer bytes",
                                      a2,
                                      a3,
                                      a4,
                                      a5,
                                      a6,
                                      a7,
                                      a8,
                                      v16);
                                  if (v16 >= 0x10)
                                    v22 = 1;
                                  else
                                    v22 = v16 >> 3;
                                  if (sub_1000145F8(a1, "active_time_bw_pg_acc", v11, 8u, v22))
                                    goto LABEL_1372;
                                  v9 = "ASPMSPParseBufferToCxt: active_time_bw_pg_acc(16387): Error adding 1 elements to context";
                                  break;
                                case 16388:
                                  if ((_DWORD)v16 != 8)
                                    sub_10001B514("ASPMSPParseBufferToCxt: num_pg_events(16388): cfg 1 elements; (1*8) cfg bytes != ("
                                      "%d) buffer bytes",
                                      a2,
                                      a3,
                                      a4,
                                      a5,
                                      a6,
                                      a7,
                                      a8,
                                      v16);
                                  if (v16 >= 0x10)
                                    v22 = 1;
                                  else
                                    v22 = v16 >> 3;
                                  if (sub_1000145F8(a1, "num_pg_events", v11, 8u, v22))
                                    goto LABEL_1372;
                                  v9 = "ASPMSPParseBufferToCxt: num_pg_events(16388): Error adding 1 elements to context";
                                  break;
                                case 16389:
                                  if ((_DWORD)v16 != 128)
                                    sub_10001B514("ASPMSPParseBufferToCxt: algo_queue_depth(16389): cfg 16 elements; (16*8) cfg bytes"
                                      " != (%d) buffer bytes",
                                      a2,
                                      a3,
                                      a4,
                                      a5,
                                      a6,
                                      a7,
                                      a8,
                                      v16);
                                  if (v16 >= 0x88)
                                    v22 = 16;
                                  else
                                    v22 = v16 >> 3;
                                  if (sub_1000145F8(a1, "algo_queue_depth", v11, 8u, v22))
                                    goto LABEL_1372;
                                  v9 = "ASPMSPParseBufferToCxt: algo_queue_depth(16389): Error adding 16 elements to context";
                                  break;
                                case 16390:
                                  if ((_DWORD)v16 != 128)
                                    sub_10001B514("ASPMSPParseBufferToCxt: parallel_slip_hist(16390): cfg 16 elements; (16*8) cfg byt"
                                      "es != (%d) buffer bytes",
                                      a2,
                                      a3,
                                      a4,
                                      a5,
                                      a6,
                                      a7,
                                      a8,
                                      v16);
                                  if (v16 >= 0x88)
                                    v22 = 16;
                                  else
                                    v22 = v16 >> 3;
                                  if (sub_1000145F8(a1, "parallel_slip_hist", v11, 8u, v22))
                                    goto LABEL_1372;
                                  v9 = "ASPMSPParseBufferToCxt: parallel_slip_hist(16390): Error adding 16 elements to context";
                                  break;
                                case 16391:
                                  if ((_DWORD)v16 != 48)
                                    sub_10001B514("ASPMSPParseBufferToCxt: sys_halt_latency_hist(16391): cfg 6 elements; (6*8) cfg by"
                                      "tes != (%d) buffer bytes",
                                      a2,
                                      a3,
                                      a4,
                                      a5,
                                      a6,
                                      a7,
                                      a8,
                                      v16);
                                  if (v16 >= 0x38)
                                    v22 = 6;
                                  else
                                    v22 = v16 >> 3;
                                  if (sub_1000145F8(a1, "sys_halt_latency_hist", v11, 8u, v22))
                                    goto LABEL_1372;
                                  v9 = "ASPMSPParseBufferToCxt: sys_halt_latency_hist(16391): Error adding 6 elements to context";
                                  break;
                                case 16392:
                                  if ((_DWORD)v16 != 48)
                                    sub_10001B514("ASPMSPParseBufferToCxt: channel_halt_latency_hist(16392): cfg 6 elements; (6*8) cf"
                                      "g bytes != (%d) buffer bytes",
                                      a2,
                                      a3,
                                      a4,
                                      a5,
                                      a6,
                                      a7,
                                      a8,
                                      v16);
                                  if (v16 >= 0x38)
                                    v22 = 6;
                                  else
                                    v22 = v16 >> 3;
                                  if (sub_1000145F8(a1, "channel_halt_latency_hist", v11, 8u, v22))
                                    goto LABEL_1372;
                                  v9 = "ASPMSPParseBufferToCxt: channel_halt_latency_hist(16392): Error adding 6 elements to context";
                                  break;
                                case 16393:
                                  if ((_DWORD)v16 != 8)
                                    sub_10001B514("ASPMSPParseBufferToCxt: num_idle_die_read_cache_terminate(16393): cfg 1 elements; "
                                      "(1*8) cfg bytes != (%d) buffer bytes",
                                      a2,
                                      a3,
                                      a4,
                                      a5,
                                      a6,
                                      a7,
                                      a8,
                                      v16);
                                  if (v16 >= 0x10)
                                    v22 = 1;
                                  else
                                    v22 = v16 >> 3;
                                  if (sub_1000145F8(a1, "num_idle_die_read_cache_terminate", v11, 8u, v22))goto LABEL_1372;
                                  v9 = "ASPMSPParseBufferToCxt: num_idle_die_read_cache_terminate(16393): Error adding 1 "
                                       "elements to context";
                                  break;
                                default:
                                  goto LABEL_1373;
                              }
                              goto LABEL_1981;
                          }
                          goto LABEL_1981;
                      }
LABEL_1372:
                      v8 = v8 + v22;
LABEL_1373:
                      v13 = &jpt_1000189D4;
                      break;
                  }
                  break;
              }
              break;
          }
          break;
      }
      goto LABEL_461;
  }
}

uint64_t sub_10001B08C(uint64_t result, const char *a2, const char *a3, uint64_t a4)
{
  _QWORD *v7;
  char *v8;
  _BYTE *v9;
  _BYTE *v10;
  uint64_t v11;
  uint64_t v12;
  char **v13;

  if (result)
  {
    v7 = (_QWORD *)result;
    v8 = (char *)malloc_type_calloc(1uLL, 0x78uLL, 0x102004060B2607BuLL);
    v9 = malloc_type_calloc(1uLL, 0x78uLL, 0x102004060B2607BuLL);
    v10 = v9;
    if (v8 && v9)
    {
      v11 = v7[1];
      if (v11 && (v12 = v7[3]) != 0)
      {
        *(_QWORD *)(v11 + 112) = v9;
        v13 = (char **)(v12 + 112);
      }
      else
      {
        *v7 = v9;
        v13 = (char **)(v7 + 2);
      }
      *v13 = v8;
      v7[1] = v9;
      v7[3] = v8;
      *((_QWORD *)v8 + 14) = 0;
      *((_QWORD *)v9 + 14) = 0;
      snprintf(v9, 0x63uLL, "%s%s", a2, a3);
      v10[99] = 0;
      snprintf(v8, 0x63uLL, "%llu", a4);
      v8[99] = 0;
      *((_QWORD *)v8 + 13) = a4;
      return 1;
    }
    else
    {
      if (v8)
        free(v8);
      if (v10)
        free(v10);
      return 0;
    }
  }
  return result;
}

double sub_10001B1B0(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  double result;

  if (a1)
  {
    v2 = *(_QWORD **)a1;
    if (v2)
    {
      do
      {
        v3 = (_QWORD *)v2[14];
        free(v2);
        v2 = v3;
      }
      while (v3);
    }
    v4 = *(_QWORD **)(a1 + 16);
    if (v4)
    {
      do
      {
        v5 = (_QWORD *)v4[14];
        free(v4);
        v4 = v5;
      }
      while (v5);
    }
    result = 0.0;
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
  }
  return result;
}

uint64_t sub_10001B208(_QWORD *a1, const char *a2, const char *a3, uint64_t a4)
{
  char *v8;
  _QWORD *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  char **v13;
  uint64_t result;

  v8 = (char *)malloc_type_malloc(0x78uLL, 0x102004060B2607BuLL);
  v9 = malloc_type_malloc(0x78uLL, 0x102004060B2607BuLL);
  v10 = v9;
  v11 = a1[1];
  if (v11 && (v12 = a1[3]) != 0)
  {
    *(_QWORD *)(v11 + 112) = v9;
    v13 = (char **)(v12 + 112);
  }
  else
  {
    *a1 = v9;
    v13 = (char **)(a1 + 2);
  }
  *v13 = v8;
  a1[1] = v9;
  a1[3] = v8;
  *((_QWORD *)v8 + 14) = 0;
  v9[14] = 0;
  snprintf((char *)v9, 0x63uLL, "%s%s", a2, a3);
  *((_BYTE *)v10 + 99) = 0;
  result = snprintf(v8, 0x63uLL, "%llu", a4);
  v8[99] = 0;
  *((_QWORD *)v8 + 13) = a4;
  return result;
}

id sub_10001B2F4(uint64_t *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;

  v3 = a2;
  v4 = objc_alloc_init((Class)NSMutableDictionary);
  v5 = *a1;
  v6 = a1[2];
  if (*a1)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (!v7)
  {
    do
    {
      if (!v3
        || (v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v5)),
            v9 = objc_msgSend(v3, "containsObject:", v8),
            v8,
            v9))
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", *(_QWORD *)(v6 + 104)));
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v5));
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, v11);

      }
      v5 = *(_QWORD *)(v5 + 112);
      if (!v5)
        break;
      v6 = *(_QWORD *)(v6 + 112);
    }
    while (v6);
  }

  return v4;
}

id sub_10001B3E4(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  id v12;

  v3 = a1;
  v4 = a2;
  if (v4)
  {
    v5 = objc_alloc_init((Class)NSMutableDictionary);
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10001B4B4;
    v10[3] = &unk_100080970;
    v11 = v4;
    v6 = v5;
    v12 = v6;
    objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v10);
    v7 = v12;
    v8 = v6;

  }
  else
  {
    v8 = v3;
  }

  return v8;
}

void sub_10001B4B4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v6))
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v5, v6);

}

void sub_10001B514(const char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  char __str[1024];

  bzero(__str, 0x400uLL);
  if (!qword_1000BA100)
  {
    qword_1000BA100 = (uint64_t)malloc_type_calloc(0x400uLL, 1uLL, 0x100004077774924uLL);
    vsnprintf(__str, 0x400uLL, a1, &a9);
    snprintf((char *)qword_1000BA100, 0x400uLL, "%s", __str);
  }
}

const char *sub_10001B5E0()
{
  if (qword_1000BA100)
    return (const char *)qword_1000BA100;
  else
    return "NA";
}

void *sub_10001B5FC()
{
  return &unk_1000B9B98;
}

void *sub_10001B608()
{
  return &unk_1000B9BA0;
}

void *sub_10001B614()
{
  return &unk_1000B9BA8;
}

void *sub_10001B620()
{
  return &unk_1000B9BB8;
}

void *sub_10001B62C()
{
  return &unk_1000B9BC0;
}

void *sub_10001B638()
{
  return &unk_1000B9BC8;
}

void *sub_10001B644()
{
  return &unk_1000B9BD0;
}

void *sub_10001B650()
{
  return &unk_1000B9BD8;
}

void *sub_10001B65C()
{
  return &unk_1000B9BB0;
}

void *sub_10001B668()
{
  return &unk_1000B9BE0;
}

char *sub_10001B674(char ***a1)
{
  int v2;
  int *v3;
  char *result;
  char **v5;
  const __CFDictionary *v6;
  io_service_t MatchingService;
  io_object_t v8;
  const char *v9;
  io_connect_t connect;

  connect = 0;
  *a1 = 0;
  v2 = pthread_mutex_trylock(&stru_1000B9BE8);
  if (v2)
  {
    if (v2 != 16
      || (syslog(3, "Error: NANDInfo: NANDExporter: serializeAccess already locked. waiting for lock !\n"),
          pthread_mutex_lock(&stru_1000B9BE8)))
    {
      v3 = __error();
      syslog(3, "Error: NANDInfo: NANDExporter: pthread_mutex_trylock() (%d) failed \n", *v3);
      return 0;
    }
  }
  syslog(5, "NANDInfo: NANDExporter object locked ! \n");
  v5 = &off_1000B9C28;
  result = off_1000B9C28;
  if (!off_1000B9C28)
  {
LABEL_11:
    v8 = 0;
    goto LABEL_12;
  }
  while (1)
  {
    v6 = IOServiceMatching(result);
    if (!v6)
      goto LABEL_10;
    MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v6);
    if (!MatchingService)
      goto LABEL_10;
    v8 = MatchingService;
    if (!IOServiceOpen(MatchingService, mach_task_self_, 0, &connect))
      break;
    IOServiceClose(connect);
    connect = 0;
    IOObjectRelease(v8);
LABEL_10:
    v9 = v5[21];
    v5 += 21;
    result = (char *)v9;
    if (!v9)
      goto LABEL_11;
  }
  syslog(5, "NANDInfo: findNandExporter_tunnel: Controller found: %s\n", *v5);
  result = (char *)1;
LABEL_12:
  *((_DWORD *)v5 + 4) = connect;
  *((_DWORD *)v5 + 5) = v8;
  *a1 = v5;
  return result;
}

uint64_t sub_10001B7BC(uint64_t a1)
{
  io_connect_t v2;
  io_object_t v3;

  v2 = *(_DWORD *)(a1 + 16);
  if (v2)
  {
    IOServiceClose(v2);
    *(_DWORD *)(a1 + 16) = 0;
  }
  v3 = *(_DWORD *)(a1 + 20);
  if (v3)
  {
    IOObjectRelease(v3);
    *(_DWORD *)(a1 + 20) = 0;
  }
  syslog(5, "NANDInfo: NANDExporter object unlocked ! \n");
  return pthread_mutex_unlock(&stru_1000B9BE8);
}

void *sub_10001CBC4(char **a1, int a2, int a3, int a4, _QWORD *a5, char a6, char a7)
{
  char **v13;
  int v14;
  unsigned int v15;
  uint64_t v16;
  size_t v17;
  void *v18;
  void *v19;
  char **v21;

  v13 = a1;
  v21 = 0;
  *a5 = 0;
  if (!a1 && (!sub_10001B674(&v21) || (v13 = v21) == 0 || !*((_DWORD *)v21 + 4)))
  {
    fwrite("Err: Finding internal NAND exporter failed for fetch tunnel buffer.\n", 0x44uLL, 1uLL, __stderrp);
LABEL_11:
    v19 = 0;
    goto LABEL_14;
  }
  v14 = a3;
  v15 = sub_10001CD68((uint64_t)v13, a2, a3, a4, a7);
  if (!v15)
  {
    fprintf(__stderrp, "failed to get data size for cmd option %d\n", a2);
    goto LABEL_11;
  }
  v16 = v15;
  v17 = (vm_page_size + v15 - 1) / vm_page_size * vm_page_size;
  v18 = malloc_type_valloc(v17, 0x7C7CDE6BuLL);
  v19 = v18;
  if (v18)
  {
    bzero(v18, v17);
    if ((sub_10001CE2C((uint64_t)v13, a2, v14, a4, v19, v17, a6, a7) & 1) != 0)
    {
      *a5 = v16;
    }
    else
    {
      free(v19);
      v19 = 0;
      *a5 = 0;
    }
  }
  else
  {
    fwrite("can't allocate buffer!\n", 0x17uLL, 1uLL, __stderrp);
  }
LABEL_14:
  if (v21)
    sub_10001B7BC((uint64_t)v21);
  return v19;
}

uint64_t sub_10001CD68(uint64_t a1, int a2, int a3, int a4, char a5)
{
  kern_return_t v7;
  uint64_t result;
  size_t outputStructCnt;
  unsigned int outputStruct;
  _DWORD inputStruct[3];
  uint64_t v12;
  int v13;

  v13 = 0;
  v12 = 0;
  outputStruct = 0;
  inputStruct[0] = a2;
  outputStructCnt = 4;
  inputStruct[2] = a4;
  inputStruct[1] = a3 | 1;
  v7 = IOConnectCallStructMethod(*(_DWORD *)(a1 + 16), *(_DWORD *)(a1 + 28), inputStruct, 0x18uLL, &outputStruct, &outputStructCnt);
  if (v7)
  {
    if ((a5 & 1) == 0)
      fprintf(__stderrp, "Error calling CoreDebugTunnel method! - 0x%X\n", v7);
    return 0;
  }
  else
  {
    result = outputStruct;
    if (!outputStruct && (a5 & 1) == 0)
    {
      fprintf(__stderrp, "SizeOnly for tunnel command 0x%x returned 0\n", a2);
      return outputStruct;
    }
  }
  return result;
}

uint64_t sub_10001CE2C(uint64_t a1, int a2, int a3, int a4, void *outputStruct, size_t a6, char a7, char a8)
{
  uint64_t v9;
  kern_return_t v15;
  size_t v16;
  _DWORD inputStruct[3];
  uint64_t v19;
  int v20;
  size_t outputStructCnt;

  LOBYTE(v9) = a7;
  outputStructCnt = a6;
  v20 = 0;
  v19 = 0;
  while (1)
  {
    inputStruct[0] = a2;
    inputStruct[1] = a3;
    inputStruct[2] = a4;
    v15 = IOConnectCallStructMethod(*(_DWORD *)(a1 + 16), *(_DWORD *)(a1 + 28), inputStruct, 0x18uLL, outputStruct, &outputStructCnt);
    if (v15 != -536870211)
      break;
    if ((v9 & 1) == 0)
      goto LABEL_10;
    if ((a8 & 1) == 0)
      fprintf(__stderrp, "CoreDebugTunnel 0x%x returned kIOReturnNoMemory\n", a2);
    v16 = outputStructCnt;
    outputStructCnt = vm_page_size;
    v9 = 1;
    if (vm_page_size == v16)
      return v9;
  }
  if (!v15)
    return 1;
LABEL_10:
  if ((a8 & 1) == 0)
    fprintf(__stderrp, "Error calling CoreDebugTunnel method! - 0x%X\n", v15);
  return 0;
}

id stringOrNull(void *a1)
{
  id v1;
  void *v2;
  id v3;
  void *v4;

  v1 = a1;
  v2 = v1;
  if (v1)
    v3 = v1;
  else
    v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v4 = v3;

  return v4;
}

id numberOrNull(void *a1)
{
  id v1;
  void *v2;
  id v3;
  void *v4;

  v1 = a1;
  v2 = v1;
  if (v1)
    v3 = v1;
  else
    v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v4 = v3;

  return v4;
}

id dictionaryOrNull(void *a1)
{
  id v1;
  void *v2;
  id v3;
  void *v4;

  v1 = a1;
  v2 = v1;
  if (v1)
    v3 = v1;
  else
    v3 = (id)objc_claimAutoreleasedReturnValue(+[NSNull null](NSNull, "null"));
  v4 = v3;

  return v4;
}

BOOL isValidSerialNumber(void *a1)
{
  id v1;
  uint64_t v2;
  _BOOL8 v3;

  v1 = a1;
  v2 = objc_opt_class(NSString);
  v3 = (objc_opt_isKindOfClass(v1, v2) & 1) != 0 && (unint64_t)objc_msgSend(v1, "length") > 3;

  return v3;
}

id byteString(void *a1, int a2)
{
  id v3;
  char *v4;
  id v5;
  unsigned __int8 *v6;
  id v7;
  void *v8;
  unsigned int v9;
  unsigned int v10;
  char v11;
  unsigned int v12;
  char v13;
  __CFString *v14;
  UInt8 bytes[2];

  v3 = a1;
  v4 = (char *)objc_msgSend(v3, "length");
  v5 = objc_retainAutorelease(v3);
  v6 = (unsigned __int8 *)objc_msgSend(v5, "bytes");
  v7 = objc_msgSend(objc_allocWithZone((Class)NSMutableString), "initWithCapacity:", 512);
  v8 = v7;
  if (a2)
    objc_msgSend(v7, "appendString:", CFSTR("0x"));
  for (; v4; --v4)
  {
    v10 = *v6++;
    v9 = v10;
    if (v10 >= 0xA0)
      v11 = 87;
    else
      v11 = 48;
    bytes[0] = v11 + (v9 >> 4);
    v12 = v9 & 0xF;
    if (v12 >= 0xA)
      v13 = 87;
    else
      v13 = 48;
    bytes[1] = v13 + v12;
    v14 = (__CFString *)CFStringCreateWithBytes(0, bytes, 2, 0x600u, 0);
    objc_msgSend(v8, "appendString:", v14);

  }
  return v8;
}

void sub_10001D968(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_10001D984(uint64_t a1, uint64_t a2)
{
  id result;

  result = objc_msgSend(*(id *)(a1 + 32), "containsObject:", a2);
  if ((_DWORD)result)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  return result;
}

void sub_10001DF7C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  int v8;
  id v9;

  v5 = a2;
  if ((*(_DWORD *)(a1 + 40) & objc_msgSend(a3, "unsignedLongValue")) != 0)
  {
    v6 = DiagnosticLogHandleForCategory(6);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = 138412290;
      v9 = v5;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Found Grape critical error: %@", (uint8_t *)&v8, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
  }

}

BOOL sub_10001EF04(id a1, unsigned int a2)
{
  uint64_t v2;
  NSObject *v3;
  _BOOL4 v4;
  uint64_t v5;
  NSObject *v6;
  uint32_t size;
  int v9;
  _DWORD v10[2];
  __int16 v11;
  int v12;

  size = 4;
  v9 = 0;
  if (IORegistryEntryGetProperty(a2, "flags", (char *)&v9, &size))
  {
    v2 = DiagnosticLogHandleForCategory(6);
    v3 = objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v10[0]) = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Service for AppleAuthCPRelay does not have flags", (uint8_t *)v10, 2u);
    }

    v4 = 0;
  }
  else
  {
    v4 = BYTE2(v9) << 16 == 0x10000;
  }
  v5 = DiagnosticLogHandleForCategory(6);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v10[0] = 67109376;
    v10[1] = v4;
    v11 = 1024;
    v12 = v9;
    _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "AppleAuthCPRelay is battery: %d. Flags: %x.", (uint8_t *)v10, 0xEu);
  }

  return v4;
}

void sub_10001F958(uint64_t a1)
{
  void *v1;
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  void *i;
  void *v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  _QWORD v15[2];

  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "_powerSourceNodeProperties"));
  if (v1)
  {
    v15[0] = CFSTR("Serial");
    v15[1] = CFSTR("BatterySerialNumber");
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v2 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v15, 2));
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v11;
      while (2)
      {
        for (i = 0; i != v4; i = (char *)i + 1)
        {
          if (*(_QWORD *)v11 != v5)
            objc_enumerationMutation(v2);
          v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i), (_QWORD)v10));
          if (v7)
          {
            v8 = objc_opt_class(NSString);
            if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
            {
              v9 = (void *)qword_1000BA040;
              qword_1000BA040 = (uint64_t)v7;

              goto LABEL_13;
            }
          }

        }
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        if (v4)
          continue;
        break;
      }
    }
LABEL_13:

  }
}

void sub_100021244(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100021280(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100021290(uint64_t a1)
{

}

intptr_t sub_100021298(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = a2;

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100021814(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

intptr_t sub_100021868(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = a2;

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100023028(id a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint8_t buf[4];
  uint64_t v8;

  v6 = 0;
  v1 = ZhuGeCopyValue(CFSTR("ReportFDRDiagnostic"), 0, 0, &v6);
  v2 = (void *)qword_1000BA050;
  qword_1000BA050 = v1;

  if (v6)
  {
    v3 = (void *)qword_1000BA050;
    qword_1000BA050 = 0;

    v4 = DiagnosticLogHandleForCategory(6);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v8 = v6;
      _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Failed to generate FDRDiagnostic report, error: %@", buf, 0xCu);
    }

  }
}

void sub_100023378(id a1)
{
  byte_1000BA060 = dlopen((const char *)objc_msgSend(CFSTR("/System/Library/PrivateFrameworks/BiometricKit.framework/BiometricKit"), "UTF8String"), 1) != 0;
}

void sub_10002343C(id a1)
{
  byte_1000BA061 = dlopen((const char *)objc_msgSend(CFSTR("/System/Library/PrivateFrameworks/NearField.framework/NearField"), "UTF8String"), 1) != 0;
}

void sub_100023500(id a1)
{
  byte_1000BA062 = dlopen((const char *)objc_msgSend(CFSTR("/System/Library/PrivateFrameworks/NearFieldAccessory.framework/NearFieldAccessory"), "UTF8String"), 1) != 0;
}

void sub_1000235C4(id a1)
{
  byte_1000BA063 = dlopen((const char *)objc_msgSend(CFSTR("/System/Library/PrivateFrameworks/CoreRepairKit.framework/CoreRepairKit"), "UTF8String"), 1) != 0;
}

CFIndex sub_100024750(const __CFString *a1)
{
  CFTypeID v2;

  v2 = CFGetTypeID(a1);
  if (v2 == CFBooleanGetTypeID())
    return 1;
  if (v2 == CFNumberGetTypeID())
    return CFNumberGetByteSize((CFNumberRef)a1);
  if (v2 == CFStringGetTypeID())
    return CFStringGetLength(a1);
  if (v2 == CFDataGetTypeID())
    return CFDataGetLength((CFDataRef)a1);
  return 0;
}

BOOL findDeviceWithName(unsigned __int8 *a1)
{
  _BOOL8 v2;
  int v3;
  uint64_t v4;
  NSObject *v5;
  _BOOL4 v6;
  const char *v7;
  int v9;
  uint8_t buf[4];
  unsigned __int8 *v11;
  _BYTE v12[40];

  v9 = 0;
  v2 = 0;
  if (!FindDevicesWithProp("IOService:name", a1, (uint64_t)v12, 10, &v9))
  {
    v3 = v9;
    v2 = v9 != 0;
    v4 = DiagnosticLogHandleForCategory(6);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
    if (v3)
    {
      if (v6)
      {
        *(_DWORD *)buf = 136315138;
        v11 = a1;
        v7 = "%s found.";
LABEL_9:
        _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, v7, buf, 0xCu);
      }
    }
    else if (v6)
    {
      *(_DWORD *)buf = 136315138;
      v11 = a1;
      v7 = "%s not found.";
      goto LABEL_9;
    }

  }
  return v2;
}

uint64_t FindDevicesWithProp(const char *a1, unsigned __int8 *a2, uint64_t a3, int a4, int *a5)
{
  size_t v10;
  uint64_t v11;
  unsigned int v12;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  const char *v17;
  const __CFAllocator *v18;
  CFStringRef v19;
  const __CFString *v20;
  io_object_t v21;
  io_registry_entry_t v22;
  int v23;
  io_object_t v24;
  const __CFString *CFProperty;
  const __CFString *v26;
  unsigned int v27;
  unsigned int v28;
  CFIndex v29;
  UInt8 *v30;
  unsigned int v31;
  uint64_t v32;
  NSObject *v33;
  unsigned int v34;
  CFTypeID v35;
  CFNumberType Type;
  uint64_t v37;
  UInt8 *v38;
  unsigned __int8 *v39;
  int v40;
  int v41;
  int v42;
  unsigned __int8 *v44;
  const __CFString *v45;
  io_iterator_t iterator;
  uint8_t buf[16];
  char cStr[16];
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _OWORD plane[4];
  CFRange v57;
  CFRange v58;

  if (!a5 || !a1 || !a3 || a4 <= 0)
  {
    v14 = DiagnosticLogHandleForCategory(6);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)cStr = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Could not find devices with property.", (uint8_t *)cStr, 2u);
    }

    return 1;
  }
  iterator = 0;
  strcpy((char *)plane, "IODeviceTree");
  __strcpy_chk(cStr, a1, 128);
  v10 = strlen(a1);
  if (v10)
  {
    v11 = 0;
    v12 = 1;
    while (a1[v11] != 58)
    {
      v11 = v12;
      if (v10 <= v12++)
        goto LABEL_14;
    }
    memset(plane, 0, sizeof(plane));
    *(_OWORD *)cStr = 0u;
    v49 = 0u;
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    __strncpy_chk(plane, a1);
    v17 = &a1[v12];
    strlen(v17);
    __strncpy_chk(cStr, v17);
  }
LABEL_14:
  v16 = IORegistryCreateIterator(kIOMainPortDefault, (const char *)plane, 1u, &iterator);
  if ((_DWORD)v16)
    return v16;
  v18 = kCFAllocatorSystemDefault;
  v19 = CFStringCreateWithCString(kCFAllocatorSystemDefault, cStr, 0);
  if (!v19)
  {
    v16 = 0;
    goto LABEL_53;
  }
  v20 = v19;
  v44 = a2;
  v21 = IOIteratorNext(iterator);
  if (!v21)
  {
    v16 = 0;
    v23 = 0;
    goto LABEL_52;
  }
  v22 = v21;
  v23 = 0;
  v16 = 0;
  v45 = v20;
  while (1)
  {
    while (!IOIteratorIsValid(iterator))
    {
      IOIteratorReset(iterator);
      v24 = IOIteratorNext(iterator);
      if (!v24)
        goto LABEL_52;
      v22 = v24;
    }
    CFProperty = (const __CFString *)IORegistryEntryCreateCFProperty(v22, v20, v18, 0);
    if (!CFProperty)
      goto LABEL_48;
    v26 = CFProperty;
    v27 = sub_100024750(CFProperty);
    if (!v27)
      break;
    v28 = v27;
    v29 = v27;
    v30 = (UInt8 *)malloc_type_malloc(v27, 0x177395A4uLL);
    v30[v28 - 1] = 0;
    v31 = sub_100024750(v26);
    if (v31 > v28)
    {
      v32 = DiagnosticLogHandleForCategory(6);
      v33 = objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "Could not convert CFTypeRef to value", buf, 2u);
      }

LABEL_27:
      v16 = 1;
      v20 = v45;
      goto LABEL_47;
    }
    v34 = v31;
    v35 = CFGetTypeID(v26);
    if (v35 == CFBooleanGetTypeID())
    {
      *v30 = CFBooleanGetValue((CFBooleanRef)v26);
LABEL_37:
      v20 = v45;
LABEL_38:
      if (v44 && v34)
      {
        v37 = v34;
        v38 = v30;
        v39 = v44;
        while (1)
        {
          v41 = *v39++;
          v40 = v41;
          v42 = *v38++;
          if (v40 != v42)
            break;
          if (!--v37)
            goto LABEL_43;
        }
        v16 = 0;
      }
      else
      {
LABEL_43:
        if (v23 < a4)
          *(_DWORD *)(a3 + 4 * v23) = v22;
        v16 = 0;
        ++v23;
      }
      goto LABEL_47;
    }
    if (v35 != CFNumberGetTypeID())
    {
      if (v35 == CFStringGetTypeID())
      {
        v57.length = v34;
        v57.location = 0;
        CFStringGetBytes(v26, v57, 0, 0, 0, v30, v29, 0);
        goto LABEL_37;
      }
      if (v35 == CFDataGetTypeID())
      {
        v58.length = v34;
        v58.location = 0;
        CFDataGetBytes((CFDataRef)v26, v58, v30);
        goto LABEL_37;
      }
      goto LABEL_27;
    }
    Type = CFNumberGetType((CFNumberRef)v26);
    v20 = v45;
    if (CFNumberGetValue((CFNumberRef)v26, Type, v30))
      goto LABEL_38;
    v16 = 1;
LABEL_47:
    free(v30);
    CFRelease(v26);
    v18 = kCFAllocatorSystemDefault;
LABEL_48:
    v22 = IOIteratorNext(iterator);
    if (!v22)
      goto LABEL_52;
  }
  CFRelease(v26);
LABEL_52:
  *a5 = v23;
  CFRelease(v20);
LABEL_53:
  IOObjectRelease(iterator);
  return v16;
}

void sub_100024D9C(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)qword_1000BA090;
  qword_1000BA090 = (uint64_t)v1;

}

void sub_100025FC8(id a1)
{
  DAProximityManager *v1;
  void *v2;

  v1 = objc_alloc_init(DAProximityManager);
  v2 = (void *)qword_1000BA098;
  qword_1000BA098 = (uint64_t)v1;

}

void sub_10002640C(uint64_t a1, uint64_t a2)
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[DAProximityManager sharedInstance](DAProximityManager, "sharedInstance"));
  objc_msgSend(v3, "handleNewProximityValue:", a2);

}

void sub_100026804(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, char a17)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100026834(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100026844(uint64_t a1)
{

}

void sub_10002684C(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  __int128 v5;
  _QWORD v6[4];
  __int128 v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "systemHealthStatus"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000268F4;
  v6[3] = &unk_100080B88;
  v5 = *(_OWORD *)(a1 + 32);
  v4 = (id)v5;
  v7 = v5;
  objc_msgSend(v3, "getCurrentSystemHealthStatusForComponents:WithReply:", -1, v6);

}

void sub_1000268F4(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  _BOOL4 v11;
  uint64_t v12;
  id v13;
  int v14;
  id v15;

  v7 = a3;
  v8 = a4;
  v9 = DiagnosticLogHandleForCategory(6);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v8 || (a2 & 1) == 0)
  {
    if (v11)
    {
      v14 = 138412290;
      v15 = v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "getCurrentSystemHealthStatusForComponents failed: error: %@", (uint8_t *)&v14, 0xCu);
    }
  }
  else
  {
    if (v11)
    {
      LOWORD(v14) = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Received system health status info", (uint8_t *)&v14, 2u);
    }

    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v13 = v7;
    v10 = *(NSObject **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v13;
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100026F30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location, char a19)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a19, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100026F58(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100026F68(uint64_t a1)
{

}

intptr_t sub_100026F70(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "device"));
  v5 = objc_loadWeakRetained(v2);
  if (objc_msgSend(v5, "isMagSafe"))
    v6 = 135;
  else
    v6 = 13;
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringFromHIDReport:", v6));
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_100027F8C(id a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init((Class)BCBatteryDeviceController);
  v2 = (void *)qword_1000BA0A8;
  qword_1000BA0A8 = (uint64_t)v1;

}

void sub_1000285BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location, char a19)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a19, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000285E4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1000285F4(uint64_t a1)
{

}

intptr_t sub_1000285FC(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  v2 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "hidDevice"));
  v5 = objc_loadWeakRetained(v2);
  if (objc_msgSend(v5, "isMagSafe"))
    v6 = 135;
  else
    v6 = 13;
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringFromHIDReport:", v6));
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v9 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v7;

  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10002A388(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,char a44)
{
  uint64_t v44;

  _Block_object_dispose(&a38, 8);
  _Block_object_dispose(&a44, 8);
  _Block_object_dispose((const void *)(v44 - 248), 8);
  _Block_object_dispose((const void *)(v44 - 200), 8);
  _Block_object_dispose((const void *)(v44 - 152), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10002A3D0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10002A3E0(uint64_t a1)
{

}

void sub_10002A3E8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "generateMaxMinAvgCapacity"));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void sub_10002A420(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "generateTemperatureData"));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void sub_10002A458(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "generateUPOStepper"));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void sub_10002A490(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "generateBatteryConfig"));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void sub_10002A4C8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  DSShutdownLog *v5;

  v2 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  v5 = objc_alloc_init(DSShutdownLog);
  -[DSShutdownLog addShutdownLogToArray:usingFormatter:](v5, "addShutdownLogToArray:usingFormatter:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), &stru_100080C70);

}

id sub_10002A53C(id a1, NSDictionary *a2)
{
  return a2;
}

void sub_10002B56C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, char a17)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

void sub_10002B5A4(uint64_t a1, char a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;

  v5 = a3;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v7 = (void *)MGCopyAnswer(CFSTR("FirmwarePreflightInfo"), 0);
  v8 = dictionaryOrNull(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  objc_msgSend(WeakRetained, "setPreflightData:", v9);

  if (v5)
  {
    v10 = DiagnosticLogHandleForCategory(6);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedDescription"));
      v13 = 138412290;
      v14 = v12;
      _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v13, 0xCu);

    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void sub_10002F0A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10002F0C8(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_10002F0D8(uint64_t a1)
{

}

void sub_10002F0E0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v2 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "systemVersion"));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void sub_10003036C(id a1)
{
  id v1;

  v1 = (id)MGCopyAnswer(CFSTR("ReleaseType"), 0);
  if (objc_msgSend(v1, "isEqualToString:", CFSTR("Beta")))
    byte_1000BA0C0 = 1;

}

void sub_1000303F8(id a1)
{
  byte_1000BA0C1 = os_variant_has_internal_content("com.apple.DiagnosticsService.SystemReport");
}

BOOL sub_1000329B8(id a1, unsigned int a2)
{
  uint64_t v2;
  NSObject *v3;
  _BOOL4 v4;
  uint64_t v5;
  NSObject *v6;
  uint32_t size;
  int v9;
  _DWORD v10[2];
  __int16 v11;
  int v12;

  size = 4;
  v9 = 0;
  if (IORegistryEntryGetProperty(a2, "flags", (char *)&v9, &size))
  {
    v2 = DiagnosticLogHandleForCategory(6);
    v3 = objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v10[0]) = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "Service for AppleAuthCPRelay does not have flags", (uint8_t *)v10, 2u);
    }

    v4 = 0;
  }
  else
  {
    v4 = BYTE2(v9) << 16 == 196608;
  }
  v5 = DiagnosticLogHandleForCategory(6);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v10[0] = 67109376;
    v10[1] = v4;
    v11 = 1024;
    v12 = v9;
    _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "AppleAuthCPRelay is top module: %d. Flags: %x.", (uint8_t *)v10, 0xEu);
  }

  return v4;
}

void sub_100034550(uint64_t a1)
{
  void *v2;
  void *v3;
  unsigned int v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  uint8_t buf[16];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[BluetoothManager sharedInstance](BluetoothManager, "sharedInstance"));
  objc_msgSend(*(id *)(a1 + 32), "setBtManager:", v2);

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "btManager"));
  v4 = objc_msgSend(v3, "available");

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "bluetoothManagerDidBecomeAvailable");
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "btManagerAvailableSemaphore"));
    dispatch_semaphore_signal(v8);

  }
  else
  {
    v5 = DiagnosticLogHandleForCategory(6);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Bluetooth manager is not available on init. Waiting for availability before retrieving devices.", buf, 2u);
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v7, "addObserver:selector:name:object:", *(_QWORD *)(a1 + 32), "bluetoothManagerDidBecomeAvailable", BluetoothAvailabilityChangedNotification, 0);

  }
}

void sub_100035120(id a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init((Class)BCBatteryDeviceController);
  v2 = (void *)qword_1000BA0D8;
  qword_1000BA0D8 = (uint64_t)v1;

}

void sub_100035958(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location)
{
  id *v24;
  uint64_t v25;

  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
  _Block_object_dispose((const void *)(v25 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100035990(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1000359A0(uint64_t a1)
{

}

void sub_1000359A8(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  unsigned int v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "bluetoothUUID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "identifier"));
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  if (v5)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
    if (WeakRetained)
    {
      v7 = WeakRetained;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[DSDateFormatter sharedFormatter](DSDateFormatter, "sharedFormatter"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "formatterWithType:", 0));

      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "lastMeasurementTimestampLeft"));
      if (v10)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringFromDate:", v10));
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setObject:forKeyedSubscript:", v11, CFSTR("lastMeasurementTimestampLeft"));

      }
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "lastMeasurementTimestampRight"));
      if (v12)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringFromDate:", v12));
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "setObject:forKeyedSubscript:", v13, CFSTR("lastMeasurementTimestampRight"));

      }
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "version"));
      objc_msgSend(v7, "addObjectIfNotNil:forKey:toDictionary:", v14, CFSTR("version"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));

      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "daysSinceLastMeasurementLeft"));
      objc_msgSend(v7, "addObjectIfNotNil:forKey:toDictionary:", v15, CFSTR("daysSinceLastCalLeft"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));

      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "daysSinceLastMeasurementRight"));
      objc_msgSend(v7, "addObjectIfNotNil:forKey:toDictionary:", v16, CFSTR("daysSinceLastCalRight"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));

      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "daysSinceLastHarmonicMeasurementLeft"));
      objc_msgSend(v7, "addObjectIfNotNil:forKey:toDictionary:", v17, CFSTR("daysSinceLastHarmonicLeft"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));

      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "daysSinceLastHarmonicMeasurementRight"));
      objc_msgSend(v7, "addObjectIfNotNil:forKey:toDictionary:", v18, CFSTR("daysSinceLastHarmonicRight"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));

      objc_msgSend(v7, "addEnumValueIfNotZero:forKey:toDictionary:", (int)objc_msgSend(v19, "errMicStatusLeft"), CFSTR("errMicStatusLeft"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
      objc_msgSend(v7, "addEnumValueIfNotZero:forKey:toDictionary:", (int)objc_msgSend(v19, "errMicStatusRight"), CFSTR("errMicStatusRight"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
      objc_msgSend(v7, "addEnumValueIfNotZero:forKey:toDictionary:", (int)objc_msgSend(v19, "generalSystemStatusLeft"), CFSTR("generalSystemStatusLeft"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
      objc_msgSend(v7, "addEnumValueIfNotZero:forKey:toDictionary:", (int)objc_msgSend(v19, "generalSystemStatusRight"), CFSTR("generalSystemStatusRight"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
      objc_msgSend(v7, "addEnumValueIfNotZero:forKey:toDictionary:", (int)objc_msgSend(v19, "frontVentStatusLeft"), CFSTR("frontVentStatusLeft"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
      objc_msgSend(v7, "addEnumValueIfNotZero:forKey:toDictionary:", (int)objc_msgSend(v19, "frontVentStatusRight"), CFSTR("frontVentStatusRight"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
      objc_msgSend(v7, "addEnumValueIfNotZero:forKey:toDictionary:", (int)objc_msgSend(v19, "latestMeasurementResultLeft"), CFSTR("latestMeasurementResultLeft"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
      objc_msgSend(v7, "addEnumValueIfNotZero:forKey:toDictionary:", (int)objc_msgSend(v19, "latestMeasurementResultRight"), CFSTR("latestMeasurementResultRight"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
      objc_msgSend(v7, "addEnumValueIfNotZero:forKey:toDictionary:", (int)objc_msgSend(v19, "rearVentStatusLeft"), CFSTR("rearVentStatusLeft"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
      objc_msgSend(v7, "addEnumValueIfNotZero:forKey:toDictionary:", (int)objc_msgSend(v19, "rearVentStatusRight"), CFSTR("rearVentStatusRight"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
      objc_msgSend(v7, "addEnumValueIfNotZero:forKey:toDictionary:", (int)objc_msgSend(v19, "refMicStatusLeft"), CFSTR("refMicStatusLeft"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
      objc_msgSend(v7, "addEnumValueIfNotZero:forKey:toDictionary:", (int)objc_msgSend(v19, "refMicStatusRight"), CFSTR("refMicStatusRight"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
      objc_msgSend(v7, "addEnumValueIfNotZero:forKey:toDictionary:", (int)objc_msgSend(v19, "speakerStatusLeft"), CFSTR("speakerStatusLeft"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
      objc_msgSend(v7, "addEnumValueIfNotZero:forKey:toDictionary:", (int)objc_msgSend(v19, "speakerStatusRight"), CFSTR("speakerStatusRight"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
      objc_msgSend(v7, "addEnumValueIfNotZero:forKey:toDictionary:", (int)objc_msgSend(v19, "vceMicStatusLeft"), CFSTR("vceMicStatusLeft"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
      objc_msgSend(v7, "addEnumValueIfNotZero:forKey:toDictionary:", (int)objc_msgSend(v19, "vceMicStatusRight"), CFSTR("vceMicStatusRight"), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
      dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

    }
  }

}

void sub_100035E84(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;

  v3 = a2;
  if (v3)
  {
    v4 = DiagnosticLogHandleForCategory(1);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedDescription"));
      v7 = 138412290;
      v8 = v6;
      _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "Unable to activate HMServiceClient with error: %@", (uint8_t *)&v7, 0xCu);

    }
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }

}

id objc_msgSend_ECID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ECID");
}

id objc_msgSend_HIDEventSystem(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "HIDEventSystem");
}

id objc_msgSend_ICCID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ICCID");
}

id objc_msgSend_IMEI(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "IMEI");
}

id objc_msgSend_IORegClassName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "IORegClassName");
}

id objc_msgSend_IORegistryNameExists_optionalKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "IORegistryNameExists:optionalKey:");
}

id objc_msgSend_IORegistryNameExists_optionalKey_passingValidator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "IORegistryNameExists:optionalKey:passingValidator:");
}

id objc_msgSend_MEID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "MEID");
}

id objc_msgSend_UDID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UDID");
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend__chargerNodeProperties(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_chargerNodeProperties");
}

id objc_msgSend__createMTDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_createMTDevice:");
}

id objc_msgSend__enableProx_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_enableProx:");
}

id objc_msgSend__encodeDataInArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_encodeDataInArray:");
}

id objc_msgSend__encodeDataInDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_encodeDataInDictionary:");
}

id objc_msgSend__encodeDataInObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_encodeDataInObject:");
}

id objc_msgSend__getMTReport_payloadBuffer_bufferSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_getMTReport:payloadBuffer:bufferSize:");
}

id objc_msgSend__getMTReportErrorFromCommandBuffer_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_getMTReportErrorFromCommandBuffer:length:");
}

id objc_msgSend__grapeCriticalErrorDetected_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_grapeCriticalErrorDetected:");
}

id objc_msgSend__isBeatsDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_isBeatsDevice:");
}

id objc_msgSend__isProxEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_isProxEnabled");
}

id objc_msgSend__nodePropertiesForServiceMatching_extraKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_nodePropertiesForServiceMatching:extraKey:");
}

id objc_msgSend__pmuNodeProperties(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_pmuNodeProperties");
}

id objc_msgSend__powerSourceNodeProperties(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_powerSourceNodeProperties");
}

id objc_msgSend__refreshGrapeProperties(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_refreshGrapeProperties");
}

id objc_msgSend__registerForProx_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_registerForProx:");
}

id objc_msgSend__setMTReport_payloadBuffer_bufferSize_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setMTReport:payloadBuffer:bufferSize:");
}

id objc_msgSend__setupTelephonyClient(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_setupTelephonyClient");
}

id objc_msgSend__unregisterForProx_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_unregisterForProx:");
}

id objc_msgSend_aacpInfoFromAccessoryInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "aacpInfoFromAccessoryInfo:");
}

id objc_msgSend_accessoryCategory(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessoryCategory");
}

id objc_msgSend_accessoryCertificate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessoryCertificate");
}

id objc_msgSend_accessoryInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessoryInfo");
}

id objc_msgSend_accessoryManagerESN(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "accessoryManagerESN");
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activate");
}

id objc_msgSend_activateWithCompletion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activateWithCompletion:");
}

id objc_msgSend_activationConfigurationInformation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activationConfigurationInformation");
}

id objc_msgSend_activeHearingProtectionAvailableForAddress_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activeHearingProtectionAvailableForAddress:");
}

id objc_msgSend_activeHearingProtectionEnabledForAddress_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activeHearingProtectionEnabledForAddress:");
}

id objc_msgSend_addCycleCountHistoryToDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addCycleCountHistoryToDictionary:");
}

id objc_msgSend_addDateOfManufactureAndFirstUseToDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addDateOfManufactureAndFirstUseToDictionary:");
}

id objc_msgSend_addEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addEntriesFromDictionary:");
}

id objc_msgSend_addEnumValueIfNotZero_forKey_toDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addEnumValueIfNotZero:forKey:toDictionary:");
}

id objc_msgSend_addHeatMapToDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addHeatMapToDictionary:");
}

id objc_msgSend_addInductiveChargingParametersToDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addInductiveChargingParametersToDictionary:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectIfNotNil_forKey_toDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObjectIfNotNil:forKey:toDictionary:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_addRawRaDataToDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addRawRaDataToDictionary:");
}

id objc_msgSend_addShutdownLogToArray_usingFormatter_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addShutdownLogToArray:usingFormatter:");
}

id objc_msgSend_addWirelessChargingModeToDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addWirelessChargingModeToDictionary:");
}

id objc_msgSend_address(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "address");
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allKeys");
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allObjects");
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allValues");
}

id objc_msgSend_appendFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendFormat:");
}

id objc_msgSend_appendString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "appendString:");
}

id objc_msgSend_approximatesPercentCharge(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "approximatesPercentCharge");
}

id objc_msgSend_arcSerialNumber(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arcSerialNumber");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "array");
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithCapacity:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_arrowChipId(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrowChipId");
}

id objc_msgSend_arrowChipUniqueId(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrowChipUniqueId");
}

id objc_msgSend_attributesOfItemAtPath_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attributesOfItemAtPath:error:");
}

id objc_msgSend_audioOutputForDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "audioOutputForDevice:");
}

id objc_msgSend_authError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "authError");
}

id objc_msgSend_authPassed(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "authPassed");
}

id objc_msgSend_authenticityStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "authenticityStatus");
}

id objc_msgSend_available(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "available");
}

id objc_msgSend_backglassCompassSerialNumber(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "backglassCompassSerialNumber");
}

id objc_msgSend_base64EncodeData_result_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "base64EncodeData:result:");
}

id objc_msgSend_base64EncodedStringWithOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "base64EncodedStringWithOptions:");
}

id objc_msgSend_basebandFirmwareVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "basebandFirmwareVersion");
}

id objc_msgSend_batteryCellDisconnectCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "batteryCellDisconnectCount");
}

id objc_msgSend_batteryLevel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "batteryLevel");
}

id objc_msgSend_batteryOptimizationMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "batteryOptimizationMode");
}

id objc_msgSend_batterySerialNumber(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "batterySerialNumber");
}

id objc_msgSend_beginAggregation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "beginAggregation");
}

id objc_msgSend_biometricKitFdrValidationStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "biometricKitFdrValidationStatus");
}

id objc_msgSend_bluetoothAddress(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bluetoothAddress");
}

id objc_msgSend_bluetoothManagerDidBecomeAvailable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bluetoothManagerDidBecomeAvailable");
}

id objc_msgSend_bluetoothUUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bluetoothUUID");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_btManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "btManager");
}

id objc_msgSend_btManagerAvailableSemaphore(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "btManagerAvailableSemaphore");
}

id objc_msgSend_budSide_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "budSide:");
}

id objc_msgSend_buildVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "buildVersion");
}

id objc_msgSend_buttonsDetected(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "buttonsDetected");
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bytes");
}

id objc_msgSend_cameraModuleType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cameraModuleType");
}

id objc_msgSend_carrierBundleVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "carrierBundleVersion");
}

id objc_msgSend_carrierName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "carrierName");
}

id objc_msgSend_carrierName2(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "carrierName2");
}

id objc_msgSend_carrierNameForSimCard_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "carrierNameForSimCard:");
}

id objc_msgSend_caseInfoFromAccessoryInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "caseInfoFromAccessoryInfo:");
}

id objc_msgSend_cbDevices(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cbDevices");
}

id objc_msgSend_cellularCallStatistics(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cellularCallStatistics");
}

id objc_msgSend_celsiusTemperatureFromService_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "celsiusTemperatureFromService:");
}

id objc_msgSend_checkDiskSpaceForURLResourceKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkDiskSpaceForURLResourceKey:");
}

id objc_msgSend_checkRadioBootHealth_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "checkRadioBootHealth:");
}

id objc_msgSend_chipID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "chipID");
}

id objc_msgSend_component(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "component");
}

id objc_msgSend_componentIdentity(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentIdentity");
}

id objc_msgSend_componentsJoinedByString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentsJoinedByString:");
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentsSeparatedByString:");
}

id objc_msgSend_conformsToProtocol_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "conformsToProtocol:");
}

id objc_msgSend_connected(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connected");
}

id objc_msgSend_connectedAccessories(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectedAccessories");
}

id objc_msgSend_connectedDevices(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectedDevices");
}

id objc_msgSend_connectingDevices(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectingDevices");
}

id objc_msgSend_consent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "consent");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_containsString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsString:");
}

id objc_msgSend_controllerInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "controllerInfo");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copy");
}

id objc_msgSend_copyCarrierBundleValue_key_bundleType_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyCarrierBundleValue:key:bundleType:error:");
}

id objc_msgSend_copyCarrierBundleVersion_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyCarrierBundleVersion:error:");
}

id objc_msgSend_coreRepairClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "coreRepairClass:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_cpuArchitecture(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cpuArchitecture");
}

id objc_msgSend_criticalErrorSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "criticalErrorSet:");
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentDevice");
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentLocale");
}

id objc_msgSend_currentRoute(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentRoute");
}

id objc_msgSend_currentStandbyTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentStandbyTime");
}

id objc_msgSend_currentUsageTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentUsageTime");
}

id objc_msgSend_dataAvailable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataAvailable");
}

id objc_msgSend_dataAvailableForImportantUsage(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataAvailableForImportantUsage");
}

id objc_msgSend_dataCapacity(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataCapacity");
}

id objc_msgSend_dataUsingEncoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataUsingEncoding:");
}

id objc_msgSend_dataWithBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dataWithBytes:length:");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "date");
}

id objc_msgSend_daysSinceLastHarmonicMeasurementLeft(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "daysSinceLastHarmonicMeasurementLeft");
}

id objc_msgSend_daysSinceLastHarmonicMeasurementRight(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "daysSinceLastHarmonicMeasurementRight");
}

id objc_msgSend_daysSinceLastMeasurementLeft(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "daysSinceLastMeasurementLeft");
}

id objc_msgSend_daysSinceLastMeasurementRight(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "daysSinceLastMeasurementRight");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultCenter");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "description");
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "device");
}

id objc_msgSend_deviceColor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceColor");
}

id objc_msgSend_deviceID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceID");
}

id objc_msgSend_deviceMatchingAccessories_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceMatchingAccessories:");
}

id objc_msgSend_deviceModel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceModel");
}

id objc_msgSend_deviceName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceName");
}

id objc_msgSend_deviceRef(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceRef");
}

id objc_msgSend_deviceStart(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceStart");
}

id objc_msgSend_deviceStop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceStop");
}

id objc_msgSend_deviceSupportsBatteryAuth(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceSupportsBatteryAuth");
}

id objc_msgSend_deviceSupportsTopModuleAuth(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceSupportsTopModuleAuth");
}

id objc_msgSend_deviceType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceType");
}

id objc_msgSend_deviceVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceVersion");
}

id objc_msgSend_deviceWithModelNumber_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceWithModelNumber:");
}

id objc_msgSend_deviceWithSerialNumber_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deviceWithSerialNumber:");
}

id objc_msgSend_devices(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "devices");
}

id objc_msgSend_devicesWithDiscoveryFlags_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "devicesWithDiscoveryFlags:error:");
}

id objc_msgSend_diagnosticsBuild(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "diagnosticsBuild");
}

id objc_msgSend_diagnosticsVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "diagnosticsVersion");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithCapacity:");
}

id objc_msgSend_dictionaryWithDictionary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithDictionary:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_dieId(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dieId");
}

id objc_msgSend_displayConfiguration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "displayConfiguration");
}

id objc_msgSend_distantPast(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "distantPast");
}

id objc_msgSend_eUICC(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "eUICC");
}

id objc_msgSend_eUICCChipID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "eUICCChipID");
}

id objc_msgSend_eUICCFwUpdateCurrentVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "eUICCFwUpdateCurrentVersion");
}

id objc_msgSend_eUICCFwUpdateGoldFwMac(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "eUICCFwUpdateGoldFwMac");
}

id objc_msgSend_eUICCFwUpdateLoaderVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "eUICCFwUpdateLoaderVersion");
}

id objc_msgSend_eUICCFwUpdateOperationMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "eUICCFwUpdateOperationMode");
}

id objc_msgSend_embeddedSecureElement(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "embeddedSecureElement");
}

id objc_msgSend_endDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endDate");
}

id objc_msgSend_enumerateKeysAndObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_errMicStatusLeft(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errMicStatusLeft");
}

id objc_msgSend_errMicStatusRight(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "errMicStatusRight");
}

id objc_msgSend_error_pages_array(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "error_pages_array");
}

id objc_msgSend_error_payload_array(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "error_payload_array");
}

id objc_msgSend_executeAfterDuration(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "executeAfterDuration");
}

id objc_msgSend_factoryDataSizeForRegion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "factoryDataSizeForRegion:");
}

id objc_msgSend_fbsn(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fbsn");
}

id objc_msgSend_fdrValidationStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fdrValidationStatus");
}

id objc_msgSend_fileExistsAtPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileExistsAtPath:");
}

id objc_msgSend_fileURLWithPath_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileURLWithPath:");
}

id objc_msgSend_findEntryForBundleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "findEntryForBundleIdentifier:");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "firstObject");
}

id objc_msgSend_flexDisconnected(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "flexDisconnected");
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "floatValue");
}

id objc_msgSend_formatterWithType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "formatterWithType:");
}

id objc_msgSend_frontVentStatusLeft(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "frontVentStatusLeft");
}

id objc_msgSend_frontVentStatusRight(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "frontVentStatusRight");
}

id objc_msgSend_gapaFlags(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "gapaFlags");
}

id objc_msgSend_generalSystemStatusLeft(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "generalSystemStatusLeft");
}

id objc_msgSend_generalSystemStatusRight(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "generalSystemStatusRight");
}

id objc_msgSend_generateBatteryConfig(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "generateBatteryConfig");
}

id objc_msgSend_generateCoreRepairData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "generateCoreRepairData");
}

id objc_msgSend_generateMaxMinAvgCapacity(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "generateMaxMinAvgCapacity");
}

id objc_msgSend_generateMitigationState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "generateMitigationState");
}

id objc_msgSend_generatePowerSourceData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "generatePowerSourceData");
}

id objc_msgSend_generateTemperatureData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "generateTemperatureData");
}

id objc_msgSend_generateUPOStepper(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "generateUPOStepper");
}

id objc_msgSend_generationStringForProductId_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "generationStringForProductId:");
}

id objc_msgSend_getAACPCapabilityBit_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getAACPCapabilityBit:");
}

id objc_msgSend_getAdaptiveVolumeMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getAdaptiveVolumeMode");
}

id objc_msgSend_getAdaptiveVolumeSupport(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getAdaptiveVolumeSupport");
}

id objc_msgSend_getAppleTopModuleAuthClass(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getAppleTopModuleAuthClass");
}

id objc_msgSend_getArcModuleClass(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getArcModuleClass");
}

id objc_msgSend_getArcModuleSerialNumberKey(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getArcModuleSerialNumberKey");
}

id objc_msgSend_getAutoEQStateForDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getAutoEQStateForDevice:");
}

id objc_msgSend_getBasebandRadioFrequencyFrontEndScanData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getBasebandRadioFrequencyFrontEndScanData:");
}

id objc_msgSend_getBatteryInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getBatteryInfo");
}

id objc_msgSend_getBatteryInfoForAddress_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getBatteryInfoForAddress:");
}

id objc_msgSend_getBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getBytes:length:");
}

id objc_msgSend_getCBDevices(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getCBDevices");
}

id objc_msgSend_getConversationDetectMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getConversationDetectMode");
}

id objc_msgSend_getConversationDetectSupport(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getConversationDetectSupport");
}

id objc_msgSend_getCurrentSystemHealthStatusForComponents_WithReply_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getCurrentSystemHealthStatusForComponents:WithReply:");
}

id objc_msgSend_getDeviceCoverGlassCoating(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getDeviceCoverGlassCoating");
}

id objc_msgSend_getDieId_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getDieId:");
}

id objc_msgSend_getDopplerDataRegister(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getDopplerDataRegister");
}

id objc_msgSend_getDopplerSiliconVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getDopplerSiliconVersion");
}

id objc_msgSend_getGasGaugeData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getGasGaugeData");
}

id objc_msgSend_getHwSupport_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getHwSupport:error:");
}

id objc_msgSend_getIORegistryClass_property_optionalKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getIORegistryClass:property:optionalKey:");
}

id objc_msgSend_getIORegistryClass_property_optionalKey_classValidator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getIORegistryClass:property:optionalKey:classValidator:");
}

id objc_msgSend_getIORegistryName_property_optionalKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getIORegistryName:property:optionalKey:");
}

id objc_msgSend_getIORegistryName_property_optionalKey_classValidator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getIORegistryName:property:optionalKey:classValidator:");
}

id objc_msgSend_getIOService_optionalKey_optionalClassValidator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getIOService:optionalKey:optionalClassValidator:");
}

id objc_msgSend_getIOregData_property_length_optionalKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getIOregData:property:length:optionalKey:");
}

id objc_msgSend_getInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getInfo");
}

id objc_msgSend_getMCLLimitWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getMCLLimitWithError:");
}

id objc_msgSend_getMatchingDict_property_optionalKey_optionalClassValidator_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getMatchingDict:property:optionalKey:optionalClassValidator:");
}

id objc_msgSend_getPairedAppleAudioDevices(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getPairedAppleAudioDevices");
}

id objc_msgSend_getResourceValue_forKey_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getResourceValue:forKey:error:");
}

id objc_msgSend_getSpatialAudioPlatformSupport(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getSpatialAudioPlatformSupport");
}

id objc_msgSend_getSubscriptionInfoWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getSubscriptionInfoWithError:");
}

id objc_msgSend_getSynchronousResult(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getSynchronousResult");
}

id objc_msgSend_getTopModuleAuthDict(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getTopModuleAuthDict");
}

id objc_msgSend_gyroInformation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "gyroInformation");
}

id objc_msgSend_handleNewProximityValue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleNewProximityValue:");
}

id objc_msgSend_handler(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handler");
}

id objc_msgSend_hasSMC(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasSMC");
}

id objc_msgSend_hidDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hidDevice");
}

id objc_msgSend_hwHousing(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hwHousing");
}

id objc_msgSend_hwManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hwManager");
}

id objc_msgSend_hwPrdId(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hwPrdId");
}

id objc_msgSend_hwRev(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hwRev");
}

id objc_msgSend_hwSku(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hwSku");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "identifier");
}

id objc_msgSend_idsn(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "idsn");
}

id objc_msgSend_illuminatorSerialNumber(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "illuminatorSerialNumber");
}

id objc_msgSend_illuminatorSerialNumberComponentPropertyKey(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "illuminatorSerialNumberComponentPropertyKey");
}

id objc_msgSend_inEarDetectEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inEarDetectEnabled");
}

id objc_msgSend_inEarStatusForDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inEarStatusForDevice:");
}

id objc_msgSend_inEarStatusPrimary_secondary_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inEarStatusPrimary:secondary:");
}

id objc_msgSend_infoDictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "infoDictionary");
}

id objc_msgSend_information(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "information");
}

id objc_msgSend_initWithArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithArray:");
}

id objc_msgSend_initWithBundleType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBundleType:");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_initWithClientName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithClientName:");
}

id objc_msgSend_initWithData_encoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithData:encoding:");
}

id objc_msgSend_initWithDictionary_copyItems_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDictionary:copyItems:");
}

id objc_msgSend_initWithQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithQueue:");
}

id objc_msgSend_initWithSuiteName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithSuiteName:");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intValue");
}

id objc_msgSend_integerNumberWithNumber_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "integerNumberWithNumber:");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "integerValue");
}

id objc_msgSend_interfaceNames(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "interfaceNames");
}

id objc_msgSend_invalid_error_payload(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalid_error_payload");
}

id objc_msgSend_ioRegFdrValidationStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "ioRegFdrValidationStatus");
}

id objc_msgSend_isAppleAudioDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isAppleAudioDevice");
}

id objc_msgSend_isBatteryCharging(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isBatteryCharging");
}

id objc_msgSend_isBetaBuild(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isBetaBuild");
}

id objc_msgSend_isBiometricKitFrameworkAvailable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isBiometricKitFrameworkAvailable");
}

id objc_msgSend_isCharging(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isCharging");
}

id objc_msgSend_isCheckerBoardActive(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isCheckerBoardActive");
}

id objc_msgSend_isCoreRepairFrameworkAvailable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isCoreRepairFrameworkAvailable");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToNumber_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToNumber:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isGenuineAirPods(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isGenuineAirPods");
}

id objc_msgSend_isGreenTeaDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isGreenTeaDevice");
}

id objc_msgSend_isInBoxUpdateEligibleMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isInBoxUpdateEligibleMode");
}

id objc_msgSend_isInBoxUpdateMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isInBoxUpdateMode:");
}

id objc_msgSend_isInDiagnosticsMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isInDiagnosticsMode");
}

id objc_msgSend_isInternalInstall(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isInternalInstall");
}

id objc_msgSend_isLowBattery(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isLowBattery");
}

id objc_msgSend_isMCLCurrentlyEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isMCLCurrentlyEnabled:");
}

id objc_msgSend_isMCLSupported(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isMCLSupported");
}

id objc_msgSend_isMagSafe(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isMagSafe");
}

id objc_msgSend_isNearFieldAccessoryFrameworkAvailable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isNearFieldAccessoryFrameworkAvailable");
}

id objc_msgSend_isNearFieldFrameworkAvailable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isNearFieldFrameworkAvailable");
}

id objc_msgSend_isOBCSupported(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isOBCSupported");
}

id objc_msgSend_isPasscodeLocked(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isPasscodeLocked");
}

id objc_msgSend_isPasscodeSet(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isPasscodeSet");
}

id objc_msgSend_isPowerConnected(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isPowerConnected");
}

id objc_msgSend_isPresent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isPresent");
}

id objc_msgSend_isProdDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isProdDevice");
}

id objc_msgSend_isServicePart(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isServicePart");
}

id objc_msgSend_isServicePartWithError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isServicePartWithError:");
}

id objc_msgSend_isSmartChargingCurrentlyEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isSmartChargingCurrentlyEnabled:");
}

id objc_msgSend_isSuperWide(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isSuperWide");
}

id objc_msgSend_isTemporaryPaired(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isTemporaryPaired");
}

id objc_msgSend_isTrusted(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isTrusted");
}

id objc_msgSend_isTrustedForUI(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isTrustedForUI");
}

id objc_msgSend_isValidJSONObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isValidJSONObject:");
}

id objc_msgSend_isValidNumber_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isValidNumber:");
}

id objc_msgSend_isVeridianFWUpdateRequired(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isVeridianFWUpdateRequired");
}

id objc_msgSend_kioskMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "kioskMode");
}

id objc_msgSend_languageCode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "languageCode");
}

id objc_msgSend_lastEraseDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastEraseDate");
}

id objc_msgSend_lastMeasurementTimestampLeft(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastMeasurementTimestampLeft");
}

id objc_msgSend_lastMeasurementTimestampRight(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastMeasurementTimestampRight");
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastObject");
}

id objc_msgSend_lastRestoreDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastRestoreDate");
}

id objc_msgSend_lastUpdateDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastUpdateDate");
}

id objc_msgSend_latestMeasurementResultLeft(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "latestMeasurementResultLeft");
}

id objc_msgSend_latestMeasurementResultRight(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "latestMeasurementResultRight");
}

id objc_msgSend_latestUserLog(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "latestUserLog");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_listeningMode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "listeningMode");
}

id objc_msgSend_localTime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localTime");
}

id objc_msgSend_localTimeZone(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localTimeZone");
}

id objc_msgSend_localeCode(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localeCode");
}

id objc_msgSend_localeIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localeIdentifier");
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedDescription");
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainBundle");
}

id objc_msgSend_mainDisplay(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainDisplay");
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainScreen");
}

id objc_msgSend_marketingProductNumber(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "marketingProductNumber");
}

id objc_msgSend_marketingVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "marketingVersion");
}

id objc_msgSend_mesaModuleSerialNumber(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mesaModuleSerialNumber");
}

id objc_msgSend_mesaSensorProvisioningState(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mesaSensorProvisioningState");
}

id objc_msgSend_mesaSensorSerialNumber(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mesaSensorSerialNumber");
}

id objc_msgSend_metadata(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "metadata");
}

id objc_msgSend_microphoneCalibrationResultForDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "microphoneCalibrationResultForDevice:");
}

id objc_msgSend_modelNumber(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "modelNumber");
}

id objc_msgSend_motionCoprocessorServiceName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "motionCoprocessorServiceName");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "name");
}

id objc_msgSend_nearFieldClass_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nearFieldClass:");
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "null");
}

id objc_msgSend_nullableBoolNumberWithNumber_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nullableBoolNumberWithNumber:");
}

id objc_msgSend_numDetectedDevices(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numDetectedDevices");
}

id objc_msgSend_numExpectedDevices(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numExpectedDevices");
}

id objc_msgSend_numMissingDevices(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numMissingDevices");
}

id objc_msgSend_num_errors_in_payload_cur(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "num_errors_in_payload_cur");
}

id objc_msgSend_num_errors_in_payload_prev(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "num_errors_in_payload_prev");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithFloat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithFloat:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithShort_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithShort:");
}

id objc_msgSend_numberWithUnsignedChar_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedChar:");
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInt:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_numberWithUnsignedLongLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedLongLong:");
}

id objc_msgSend_numberWithUnsignedShort_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedShort:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_orbErrorDetected(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "orbErrorDetected");
}

id objc_msgSend_other_stats_dict(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "other_stats_dict");
}

id objc_msgSend_outputs(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "outputs");
}

id objc_msgSend_pairedDevices(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pairedDevices");
}

id objc_msgSend_parameterName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "parameterName");
}

id objc_msgSend_parseBIMData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "parseBIMData:");
}

id objc_msgSend_parseHIDLocationID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "parseHIDLocationID:");
}

id objc_msgSend_parseStringToArray_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "parseStringToArray:length:");
}

id objc_msgSend_parts(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "parts");
}

id objc_msgSend_percentCharge(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "percentCharge");
}

id objc_msgSend_populateAttributes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "populateAttributes:");
}

id objc_msgSend_populateFdrValidationStatus_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "populateFdrValidationStatus:");
}

id objc_msgSend_populatePLQueryAttributes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "populatePLQueryAttributes:");
}

id objc_msgSend_portType(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "portType");
}

id objc_msgSend_preflightData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "preflightData");
}

id objc_msgSend_primaryBudSide_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "primaryBudSide:");
}

id objc_msgSend_processedBatteryShutdownDataEntry_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processedBatteryShutdownDataEntry:");
}

id objc_msgSend_productId(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "productId");
}

id objc_msgSend_productName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "productName");
}

id objc_msgSend_productVersionExtra(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "productVersionExtra");
}

id objc_msgSend_psDevice(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "psDevice");
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "queue");
}

id objc_msgSend_readFactoryDataForRegion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "readFactoryDataForRegion:");
}

id objc_msgSend_rearVentStatusLeft(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rearVentStatusLeft");
}

id objc_msgSend_rearVentStatusRight(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rearVentStatusRight");
}

id objc_msgSend_refMicStatusLeft(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "refMicStatusLeft");
}

id objc_msgSend_refMicStatusRight(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "refMicStatusRight");
}

id objc_msgSend_refreshRate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "refreshRate");
}

id objc_msgSend_registerProximityChangedCallback(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registerProximityChangedCallback");
}

id objc_msgSend_registryESN(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "registryESN");
}

id objc_msgSend_regulatoryModelNumber(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "regulatoryModelNumber");
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObserver:");
}

id objc_msgSend_reportWithID_reportType_object_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reportWithID:reportType:object:length:");
}

id objc_msgSend_resetCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resetCount");
}

id objc_msgSend_restoreDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "restoreDate");
}

id objc_msgSend_retrieveBIMData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "retrieveBIMData");
}

id objc_msgSend_retrieveDataSerialNumberWithComponentName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "retrieveDataSerialNumberWithComponentName:");
}

id objc_msgSend_retrieveSerialNumberWithComponentName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "retrieveSerialNumberWithComponentName:");
}

id objc_msgSend_reverseByteOrder_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reverseByteOrder:");
}

id objc_msgSend_rfcHwid(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rfcHwid");
}

id objc_msgSend_rfcInitPass(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rfcInitPass");
}

id objc_msgSend_rfcMmwHwid(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rfcMmwHwid");
}

id objc_msgSend_rfcMmwRev(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rfcMmwRev");
}

id objc_msgSend_rfcRev(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rfcRev");
}

id objc_msgSend_rffeScanData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rffeScanData");
}

id objc_msgSend_rffeScanInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rffeScanInfo");
}

id objc_msgSend_rffeScanPass(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rffeScanPass");
}

id objc_msgSend_rootCreationDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "rootCreationDate");
}

id objc_msgSend_savageChipID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "savageChipID");
}

id objc_msgSend_savageSerialNumber(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "savageSerialNumber");
}

id objc_msgSend_savageUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "savageUID");
}

id objc_msgSend_secondSimStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "secondSimStatus");
}

id objc_msgSend_secondSimTrayStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "secondSimTrayStatus");
}

id objc_msgSend_sensorRegion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sensorRegion");
}

id objc_msgSend_sensorSerialNumber(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sensorSerialNumber");
}

id objc_msgSend_serialNumber(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serialNumber");
}

id objc_msgSend_serialNumberComponentPropertyKey(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serialNumberComponentPropertyKey");
}

id objc_msgSend_serialNumberMismatch(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serialNumberMismatch");
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "set");
}

id objc_msgSend_setBtManager_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBtManager:");
}

id objc_msgSend_setCbDevices_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCbDevices:");
}

id objc_msgSend_setComponent_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setComponent:");
}

id objc_msgSend_setDeviceDiagnosticRecordFoundHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDeviceDiagnosticRecordFoundHandler:");
}

id objc_msgSend_setDevices_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDevices:");
}

id objc_msgSend_setHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHandler:");
}

id objc_msgSend_setHidDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHidDevice:");
}

id objc_msgSend_setHwManager_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHwManager:");
}

id objc_msgSend_setInvalid_error_payload_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInvalid_error_payload:");
}

id objc_msgSend_setObject_atIndexedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:atIndexedSubscript:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setOther_stats_dict_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setOther_stats_dict:");
}

id objc_msgSend_setPreflightData_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPreflightData:");
}

id objc_msgSend_setSmartChargeClient_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSmartChargeClient:");
}

id objc_msgSend_setSubscriptionInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSubscriptionInfo:");
}

id objc_msgSend_setTelephonyClient_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTelephonyClient:");
}

id objc_msgSend_setTelephonyClientQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTelephonyClientQueue:");
}

id objc_msgSend_setTopModuleAuthDict_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTopModuleAuthDict:");
}

id objc_msgSend_setUpdating_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUpdating:");
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setValue:forKey:");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_setupAssistantCompletionDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupAssistantCompletionDate");
}

id objc_msgSend_setupCompletedDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupCompletedDate");
}

id objc_msgSend_setupWithContext_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupWithContext:");
}

id objc_msgSend_sharedAccessoryManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedAccessoryManager");
}

id objc_msgSend_sharedFormatter(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedFormatter");
}

id objc_msgSend_sharedHardwareManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedHardwareManager");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedManager");
}

id objc_msgSend_sikPublicKey(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sikPublicKey");
}

id objc_msgSend_simStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "simStatus");
}

id objc_msgSend_simTrayStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "simTrayStatus");
}

id objc_msgSend_slotID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "slotID");
}

id objc_msgSend_smartChargeClient(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "smartChargeClient");
}

id objc_msgSend_snapshot(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "snapshot");
}

id objc_msgSend_spatialAudioEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "spatialAudioEnabled");
}

id objc_msgSend_spatialAudioSupportedForDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "spatialAudioSupportedForDevice:");
}

id objc_msgSend_speakerStatusLeft(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "speakerStatusLeft");
}

id objc_msgSend_speakerStatusRight(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "speakerStatusRight");
}

id objc_msgSend_startDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startDate");
}

id objc_msgSend_status(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "status");
}

id objc_msgSend_storeDemoModeEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "storeDemoModeEnabled");
}

id objc_msgSend_string(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "string");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringForInEarStatus_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringForInEarStatus:");
}

id objc_msgSend_stringForListeningMode_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringForListeningMode:");
}

id objc_msgSend_stringFromDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringFromDate:");
}

id objc_msgSend_stringFromHIDReport_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringFromHIDReport:");
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringValue");
}

id objc_msgSend_stringWithCString_encoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithCString:encoding:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_subscriptionInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subscriptionInfo");
}

id objc_msgSend_subscriptions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subscriptions");
}

id objc_msgSend_subscriptionsInUse(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "subscriptionsInUse");
}

id objc_msgSend_supplementalBuildVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supplementalBuildVersion");
}

id objc_msgSend_supplyCurrent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supplyCurrent");
}

id objc_msgSend_supportsInductiveCharging(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsInductiveCharging");
}

id objc_msgSend_systemClientRelease(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemClientRelease");
}

id objc_msgSend_systemClientSetup(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemClientSetup");
}

id objc_msgSend_systemHealthInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemHealthInfo");
}

id objc_msgSend_systemHealthStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemHealthStatus");
}

id objc_msgSend_systemUptime(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemUptime");
}

id objc_msgSend_systemVersion(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "systemVersion");
}

id objc_msgSend_telephonyClient(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "telephonyClient");
}

id objc_msgSend_telephonyClientQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "telephonyClientQueue");
}

id objc_msgSend_temperatureData(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "temperatureData");
}

id objc_msgSend_topModuleAccessoryCertificate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "topModuleAccessoryCertificate");
}

id objc_msgSend_topModuleAuthDict(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "topModuleAuthDict");
}

id objc_msgSend_topModuleAuthPassed(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "topModuleAuthPassed");
}

id objc_msgSend_topModuleFdrValidationStatus(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "topModuleFdrValidationStatus");
}

id objc_msgSend_topModuleIDSN(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "topModuleIDSN");
}

id objc_msgSend_totalDiskCapacity(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "totalDiskCapacity");
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "type");
}

id objc_msgSend_unregisterProximityChangedCallback(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unregisterProximityChangedCallback");
}

id objc_msgSend_unsignedLongValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedLongValue");
}

id objc_msgSend_updateDate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateDate");
}

id objc_msgSend_updating(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updating");
}

id objc_msgSend_upoCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "upoCount");
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForKey:");
}

id objc_msgSend_vceMicStatusLeft(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "vceMicStatusLeft");
}

id objc_msgSend_vceMicStatusRight(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "vceMicStatusRight");
}

id objc_msgSend_version(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "version");
}

id objc_msgSend_wifiAddress(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "wifiAddress");
}

id objc_msgSend_wifiDeviceCount(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "wifiDeviceCount");
}

id objc_msgSend_yonkersSerialNumber(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "yonkersSerialNumber");
}

id objc_msgSend_zhuGeFDRLabelForCategory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "zhuGeFDRLabelForCategory:");
}

id objc_msgSend_zhuGeFDRStatus_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "zhuGeFDRStatus:");
}

id objc_msgSend_zoomed(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "zoomed");
}
