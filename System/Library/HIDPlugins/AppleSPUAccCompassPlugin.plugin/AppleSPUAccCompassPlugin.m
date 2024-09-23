uint64_t sub_2310ECEA8(uint64_t a1, uint64_t a2)
{
  return a2;
}

uint64_t sub_2310ECEB8(uint64_t a1)
{
  uint64_t v1;

  v1 = (*(_DWORD *)(a1 + 16) + 1);
  *(_DWORD *)(a1 + 16) = v1;
  return v1;
}

uint64_t sub_2310ECED0()
{
  return 1000;
}

void AppleSPUAccCompassPlugin::alloc(AppleSPUAccCompassPlugin *this, const __CFAllocator *a2)
{
  AppleSPUAccCompassPlugin *v3;

  v3 = (AppleSPUAccCompassPlugin *)CFAllocatorAllocate(this, 48, 0);
  AppleSPUAccCompassPlugin::AppleSPUAccCompassPlugin(v3, this);
}

void AppleSPUAccCompassPlugin::operator delete(CFAllocatorRef *ptr)
{
  CFAllocatorDeallocate(ptr[1], ptr);
}

void sub_2310ECF30(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

void AppleSPUAccCompassPlugin::AppleSPUAccCompassPlugin(AppleSPUAccCompassPlugin *this, const __CFAllocator *a2)
{
  const __CFUUID *v2;

  *(_QWORD *)this = &AppleSPUAccCompassPlugin::vtbl;
  *((_QWORD *)this + 1) = a2;
  *((_DWORD *)this + 4) = 1;
  *((_QWORD *)this + 4) = 0;
  *((_QWORD *)this + 5) = 0;
  *((_QWORD *)this + 3) = 0;
  v2 = CFUUIDGetConstantUUIDWithBytes((CFAllocatorRef)*MEMORY[0x24BDBD260], 0xEu, 0xB5u, 0xD7u, 0x69u, 0x3Du, 0x30u, 0x4Fu, 0x50u, 0x90u, 0xBBu, 0xCDu, 0xF5u, 0x27u, 0xA9u, 0xADu, 0xF3u);
  CFPlugInAddInstanceForFactory(v2);
}

void AppleSPUAccCompassPlugin::~AppleSPUAccCompassPlugin(AppleSPUAccCompassPlugin *this)
{
  const __CFUUID *v1;

  os_release((void *)qword_25414D8B8);
  v1 = CFUUIDGetConstantUUIDWithBytes((CFAllocatorRef)*MEMORY[0x24BDBD260], 0xEu, 0xB5u, 0xD7u, 0x69u, 0x3Du, 0x30u, 0x4Fu, 0x50u, 0x90u, 0xBBu, 0xCDu, 0xF5u, 0x27u, 0xA9u, 0xADu, 0xF3u);
  CFPlugInRemoveInstanceForFactory(v1);
}

uint64_t AppleSPUAccCompassPlugin::QueryInterface(AppleSPUAccCompassPlugin *this, CFUUIDBytes a2, void **a3)
{
  CFUUIDRef v5;
  const __CFAllocator *v6;
  CFUUIDRef v7;
  CFUUIDRef v8;
  CFUUIDRef v9;
  uint64_t v10;

  v5 = CFUUIDCreateFromUUIDBytes(0, a2);
  v6 = (const __CFAllocator *)*MEMORY[0x24BDBD260];
  v7 = CFUUIDGetConstantUUIDWithBytes((CFAllocatorRef)*MEMORY[0x24BDBD260], 5u, 5u, 0xD7u, 0x8Du, 0x4Fu, 0x4Eu, 0x4Cu, 0x41u, 0xA3u, 0xA6u, 0xC7u, 0xA7u, 0x7Bu, 0x41u, 0xBDu, 0xACu);
  if (CFEqual(v5, v7)
    || (v8 = CFUUIDGetConstantUUIDWithBytes(v6, 0xC7u, 0x10u, 0x95u, 0x1Du, 0x18u, 0x40u, 0x45u, 0x6Eu, 0x82u, 0xE7u, 0xFCu, 0xA1u, 0xA0u, 0xFAu, 0x7Fu, 0xE4u), CFEqual(v5, v8))|| (v9 = CFUUIDGetConstantUUIDWithBytes(v6, 0, 0, 0, 0, 0, 0, 0, 0, 0xC0u, 0, 0, 0, 0, 0, 0, 0x46u), CFEqual(v5, v9)))
  {
    v10 = 0;
    ++*((_DWORD *)this + 4);
  }
  else
  {
    this = 0;
    v10 = 2147483652;
  }
  *a3 = this;
  CFRelease(v5);
  return v10;
}

uint64_t AppleSPUAccCompassPlugin::AddRef(AppleSPUAccCompassPlugin *this)
{
  uint64_t v1;

  v1 = (*((_DWORD *)this + 4) + 1);
  *((_DWORD *)this + 4) = v1;
  return v1;
}

uint64_t AppleSPUAccCompassPlugin::Release(AppleSPUAccCompassPlugin *this)
{
  int v1;
  uint64_t v2;
  CFAllocatorRef *v3;

  v1 = *((_DWORD *)this + 4);
  v2 = (v1 - 1);
  *((_DWORD *)this + 4) = v2;
  if (v1 == 1)
  {
    AppleSPUAccCompassPlugin::~AppleSPUAccCompassPlugin(this);
    AppleSPUAccCompassPlugin::operator delete(v3);
  }
  return v2;
}

void AppleSPUAccCompassPlugin::open(uint64_t *a1)
{
  uint64_t v2;
  NSObject *v3;
  _BOOL8 v4;
  uint64_t v5;
  char i;
  char v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t v10[8];
  int v11;
  char v12;

  if (qword_25414D8B0 != -1)
    dispatch_once(&qword_25414D8B0, &unk_24FFFD328);
  v2 = operator new();
  *(_DWORD *)v2 = 0;
  *(_OWORD *)(v2 + 8) = 0u;
  *(_OWORD *)(v2 + 24) = 0u;
  *(_QWORD *)(v2 + 40) = 0;
  a1[3] = v2;
  if (AppleSPUAccCompassPlugin::openInterface((uint64_t)a1, v2))
  {
    if (os_log_type_enabled((os_log_t)qword_25414D8B8, OS_LOG_TYPE_ERROR))
      sub_2310EE7A4();
  }
  else
  {
    if (MGGetProductType() == 1234705395)
    {
      v3 = qword_25414D8B8;
      v4 = os_log_type_enabled((os_log_t)qword_25414D8B8, OS_LOG_TYPE_DEFAULT);
      if (v4)
      {
        *(_WORD *)v10 = 0;
        _os_log_impl(&dword_2310EC000, v3, OS_LOG_TYPE_DEFAULT, "Detected N84!", v10, 2u);
      }
      AppleSPUAccCompassPlugin::checkForBatteryRepair(v4, a1[3]);
    }
    v5 = 0;
    for (i = 1; ; i = 0)
    {
      v7 = i;
      v8 = a1[3];
      v11 = *((_DWORD *)&AppleSPUAccCompassPlugin::accCompassCompensationTable + 4 * v5 + 3);
      v12 = 0;
      v9 = *(_QWORD *)(v8 + 8);
      if (!v9
        || (*(unsigned int (**)(uint64_t, uint64_t, int *, uint64_t, _QWORD, _QWORD))(*(_QWORD *)v9 + 80))(v9, 4, &v11, 5, 0, 0))
      {
        break;
      }
      v5 = 1;
      if ((v7 & 1) == 0)
      {
        if (AppleSPUAccCompassPlugin::addAccMatchingNotification((AppleSPUAccCompassPlugin *)a1))
        {
          if (os_log_type_enabled((os_log_t)qword_25414D8B8, OS_LOG_TYPE_ERROR))
            sub_2310EE778();
        }
        return;
      }
    }
    if (os_log_type_enabled((os_log_t)qword_25414D8B8, OS_LOG_TYPE_ERROR))
      sub_2310EE74C();
  }
}

os_log_t sub_2310ED3D8()
{
  os_log_t result;

  result = os_log_create("AOP", "AppleSPUAccCompassPlugin");
  qword_25414D8B8 = (uint64_t)result;
  return result;
}

uint64_t AppleSPUAccCompassPlugin::openInterface(uint64_t a1, uint64_t a2)
{
  const __CFNumber *IOHIDServiceRegistryID;
  mach_port_t v4;
  const __CFDictionary *v5;
  io_service_t MatchingService;
  io_service_t v7;
  const __CFAllocator *v8;
  const __CFUUID *v9;
  const __CFUUID *v10;
  kern_return_t v11;
  IOCFPlugInInterface **v12;
  BOOL v13;
  uint64_t v14;
  HRESULT (__cdecl *QueryInterface)(void *, REFIID, LPVOID *);
  const __CFUUID *v16;
  CFUUIDBytes v17;
  uint64_t v18;
  int v19;
  IOCFPlugInInterface **theInterface;
  SInt32 theScore;

  theInterface = 0;
  IOHIDServiceRegistryID = AppleSPUAccCompassPlugin::getIOHIDServiceRegistryID();
  v4 = *MEMORY[0x24BDD8B20];
  v5 = IORegistryEntryIDMatching((uint64_t)IOHIDServiceRegistryID);
  MatchingService = IOServiceGetMatchingService(v4, v5);
  if (!a2)
    return 3758097090;
  v7 = MatchingService;
  *(_DWORD *)a2 = MatchingService;
  if (!MatchingService)
    return 3758097136;
  theScore = 0;
  v8 = (const __CFAllocator *)*MEMORY[0x24BDBD260];
  v9 = CFUUIDGetConstantUUIDWithBytes((CFAllocatorRef)*MEMORY[0x24BDBD260], 0x3Bu, 0xC5u, 0xCCu, 0x87u, 0x84u, 0x5Eu, 0x48u, 0xABu, 0xA9u, 0xC2u, 0x94u, 0x36u, 0, 0x1Bu, 0xA6u, 0x8Au);
  v10 = CFUUIDGetConstantUUIDWithBytes(0, 0xC2u, 0x44u, 0xE8u, 0x58u, 0x10u, 0x9Cu, 0x11u, 0xD4u, 0x91u, 0xD4u, 0, 0x50u, 0xE4u, 0xC6u, 0x42u, 0x6Fu);
  v11 = IOCreatePlugInInterfaceForService(v7, v9, v10, &theInterface, &theScore);
  v12 = theInterface;
  if (v11)
    v13 = 1;
  else
    v13 = theInterface == 0;
  if (v13)
  {
    v14 = 0;
    if (!theInterface)
      return v14;
    goto LABEL_14;
  }
  QueryInterface = (*theInterface)->QueryInterface;
  v16 = CFUUIDGetConstantUUIDWithBytes(v8, 0x59u, 0x79u, 0x99u, 0x3Cu, 0x85u, 0xF5u, 0x4Du, 0x59u, 0x85u, 0x93u, 0xFFu, 0x92u, 0x15u, 0xDAu, 0x47u, 0xADu);
  v17 = CFUUIDGetUUIDBytes(v16);
  ((void (*)(IOCFPlugInInterface **, _QWORD, _QWORD, uint64_t))QueryInterface)(v12, *(_QWORD *)&v17.byte0, *(_QWORD *)&v17.byte8, a2 + 8);
  v18 = *(_QWORD *)(a2 + 8);
  if (v18)
  {
    v19 = (*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)v18 + 64))(v18, 0);
    v12 = theInterface;
    if (v19)
    {
      v14 = 3758097101;
      if (!theInterface)
        return v14;
    }
    else
    {
      v14 = 0;
    }
    goto LABEL_14;
  }
  v14 = 0;
  v12 = theInterface;
  if (theInterface)
LABEL_14:
    ((void (*)(IOCFPlugInInterface **))(*v12)->Release)(v12);
  return v14;
}

uint64_t AppleSPUAccCompassPlugin::checkForBatteryRepair(uint64_t a1, uint64_t a2)
{
  unsigned int v3;
  NSObject *v4;
  _BOOL4 v5;
  int BatteryChemID;
  NSObject *v7;
  int v8;
  const char *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  int v16;
  _OWORD v17[2];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v3 = _hadHadAuthorizedBatteryRepair();
  v4 = qword_25414D8B8;
  v5 = os_log_type_enabled((os_log_t)qword_25414D8B8, OS_LOG_TYPE_DEFAULT);
  if (!v3)
  {
    if (!v5)
      return 0;
    LOWORD(v16) = 0;
    v9 = "Authorized battery repair check returned False!";
LABEL_11:
    _os_log_impl(&dword_2310EC000, v4, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v16, 2u);
    return 0;
  }
  if (v5)
  {
    LOWORD(v16) = 0;
    _os_log_impl(&dword_2310EC000, v4, OS_LOG_TYPE_DEFAULT, "Authorized battery repair check returned True!", (uint8_t *)&v16, 2u);
  }
  BatteryChemID = _getBatteryChemID();
  v7 = qword_25414D8B8;
  if (os_log_type_enabled((os_log_t)qword_25414D8B8, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 67109120;
    LODWORD(v17[0]) = BatteryChemID;
    _os_log_impl(&dword_2310EC000, v7, OS_LOG_TYPE_DEFAULT, "Got chemID 0x%x", (uint8_t *)&v16, 8u);
  }
  if (BatteryChemID > 6257)
  {
    if ((BatteryChemID - 6258) >= 2)
    {
      v8 = 14357;
      goto LABEL_20;
    }
  }
  else if ((BatteryChemID - 6176) >= 2)
  {
    v8 = 6249;
LABEL_20:
    if (BatteryChemID == v8)
    {
      v13 = qword_25414D8B8;
      if (os_log_type_enabled((os_log_t)qword_25414D8B8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v16) = 0;
        _os_log_impl(&dword_2310EC000, v13, OS_LOG_TYPE_DEFAULT, "Murata batteries detected", (uint8_t *)&v16, 2u);
      }
      v16 = 217;
      v17[0] = xmmword_2310EEAE8;
      *(_OWORD *)((char *)v17 + 12) = *(__int128 *)((char *)&xmmword_2310EEAE8 + 12);
      v14 = *(_QWORD *)(a2 + 8);
      if (v14)
      {
        v10 = (*(uint64_t (**)(uint64_t, uint64_t, int *, uint64_t, _QWORD, _QWORD))(*(_QWORD *)v14 + 80))(v14, 4, &v16, 32, 0, 0);
        if (!(_DWORD)v10)
          return v10;
      }
      else
      {
        v10 = 3758097112;
      }
      if (os_log_type_enabled((os_log_t)qword_25414D8B8, OS_LOG_TYPE_ERROR))
      {
LABEL_33:
        sub_2310EE7D0();
        return v10;
      }
      return v10;
    }
    v4 = qword_25414D8B8;
    v10 = 0;
    if (!os_log_type_enabled((os_log_t)qword_25414D8B8, OS_LOG_TYPE_DEFAULT))
      return v10;
    LOWORD(v16) = 0;
    v9 = "Neither Murata nor ATL/SDI batteries found, ignoring...";
    goto LABEL_11;
  }
  v11 = qword_25414D8B8;
  if (os_log_type_enabled((os_log_t)qword_25414D8B8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v16) = 0;
    _os_log_impl(&dword_2310EC000, v11, OS_LOG_TYPE_DEFAULT, "SDI/ATL batteries detected", (uint8_t *)&v16, 2u);
  }
  v16 = 217;
  v17[0] = xmmword_2310EEB04;
  *(_OWORD *)((char *)v17 + 12) = *(__int128 *)((char *)&xmmword_2310EEB04 + 12);
  v12 = *(_QWORD *)(a2 + 8);
  if (v12)
  {
    v10 = (*(uint64_t (**)(uint64_t, uint64_t, int *, uint64_t, _QWORD, _QWORD))(*(_QWORD *)v12 + 80))(v12, 4, &v16, 32, 0, 0);
    if (!(_DWORD)v10)
      return v10;
  }
  else
  {
    v10 = 3758097112;
  }
  if (os_log_type_enabled((os_log_t)qword_25414D8B8, OS_LOG_TYPE_ERROR))
    goto LABEL_33;
  return v10;
}

uint64_t AppleSPUAccCompassPlugin::setProperty(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6;
  size_t v7;
  _DWORD *v8;
  int v9;
  const void *v10;
  uint64_t v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v6 = a5 + 4;
  MEMORY[0x24BDAC7A8]();
  v8 = (_DWORD *)((char *)v13 - ((v7 + 19) & 0xFFFFFFFFFFFFFFF0));
  *v8 = v9;
  memcpy(v8 + 1, v10, v7);
  v11 = *(_QWORD *)(a2 + 8);
  if (v11)
    return (*(uint64_t (**)(uint64_t, uint64_t, _DWORD *, uint64_t, _QWORD, _QWORD))(*(_QWORD *)v11 + 80))(v11, 4, v8, v6, 0, 0);
  else
    return 3758097112;
}

uint64_t AppleSPUAccCompassPlugin::addAccMatchingNotification(AppleSPUAccCompassPlugin *this)
{
  uint64_t v2;
  const __CFAllocator *v3;
  CFMutableDictionaryRef Mutable;
  CFMutableDictionaryRef v5;
  CFNumberRef v6;
  CFNumberRef v7;
  CFNumberRef v8;
  CFNumberRef v9;
  CFNumberRef v10;
  CFNumberRef v11;
  __CFDictionary *v12;
  __CFDictionary *v13;
  __IOHIDManager *v14;
  __CFRunLoop *Main;
  char v16;
  const void *v17;
  int v19;
  int v20;
  int v21;
  int valuePtr;

  v2 = 3758097115;
  v21 = 11;
  valuePtr = 65280;
  v19 = 1452;
  v20 = 5016;
  v3 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  *((_QWORD *)this + 4) = IOHIDManagerCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  Mutable = CFDictionaryCreateMutable(v3, 4, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (!Mutable)
  {
LABEL_15:
    v17 = (const void *)*((_QWORD *)this + 4);
    if (v17)
      CFRelease(v17);
    return v2;
  }
  v5 = Mutable;
  v6 = CFNumberCreate(v3, kCFNumberIntType, &valuePtr);
  if (!v6)
  {
LABEL_19:
    CFRelease(v5);
    goto LABEL_15;
  }
  v7 = v6;
  v8 = CFNumberCreate(v3, kCFNumberIntType, &v21);
  if (!v8)
  {
    CFRelease(v7);
    goto LABEL_19;
  }
  v9 = v8;
  v10 = CFNumberCreate(v3, kCFNumberIntType, &v20);
  if (!v10)
  {
    v11 = 0;
    goto LABEL_21;
  }
  v11 = CFNumberCreate(v3, kCFNumberIntType, &v19);
  if (!v11)
  {
LABEL_21:
    v13 = 0;
    goto LABEL_22;
  }
  v12 = CFDictionaryCreateMutable(v3, 2, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v13 = v12;
  if (v12)
  {
    CFDictionarySetValue(v12, CFSTR("DeviceUsagePage"), v7);
    CFDictionarySetValue(v13, CFSTR("DeviceUsage"), v9);
    CFDictionarySetValue(v5, CFSTR("DeviceUsagePairs"), v13);
    CFDictionarySetValue(v5, CFSTR("ProductID"), v10);
    CFDictionarySetValue(v5, CFSTR("VendorID"), v11);
    IOHIDManagerSetDeviceMatching(*((IOHIDManagerRef *)this + 4), v5);
    IOHIDManagerRegisterDeviceMatchingCallback(*((IOHIDManagerRef *)this + 4), (IOHIDDeviceCallback)AppleSPUAccCompassPlugin::accAddedNotification, this);
    IOHIDManagerRegisterDeviceRemovalCallback(*((IOHIDManagerRef *)this + 4), (IOHIDDeviceCallback)AppleSPUAccCompassPlugin::accRemovalNotification, this);
    v14 = (__IOHIDManager *)*((_QWORD *)this + 4);
    Main = CFRunLoopGetMain();
    IOHIDManagerScheduleWithRunLoop(v14, Main, (CFStringRef)*MEMORY[0x24BDBD5A0]);
    v2 = 0;
    v16 = 1;
    goto LABEL_8;
  }
LABEL_22:
  v16 = 0;
LABEL_8:
  CFRelease(v7);
  CFRelease(v9);
  if (v10)
    CFRelease(v10);
  if (v11)
    CFRelease(v11);
  if (v13)
    CFRelease(v13);
  CFRelease(v5);
  if ((v16 & 1) == 0)
    goto LABEL_15;
  return v2;
}

uint64_t AppleSPUAccCompassPlugin::close(uint64_t a1)
{
  const void *v2;
  uint64_t result;

  v2 = *(const void **)(a1 + 32);
  if (v2)
    CFRelease(v2);
  result = *(_QWORD *)(a1 + 24);
  if (result)
  {
    result = MEMORY[0x2348D1590](result, 0x10B0C4017A8DECDLL);
    *(_QWORD *)(a1 + 24) = 0;
  }
  return result;
}

const __CFNumber *AppleSPUAccCompassPlugin::getIOHIDServiceRegistryID()
{
  const __CFNumber *result;
  uint64_t valuePtr;

  result = (const __CFNumber *)IOHIDServiceGetRegistryID();
  if (result)
  {
    valuePtr = 0;
    if (CFNumberGetValue(result, kCFNumberSInt64Type, &valuePtr))
      return (const __CFNumber *)valuePtr;
    else
      return 0;
  }
  return result;
}

uint64_t AppleSPUAccCompassPlugin::match()
{
  return 1000;
}

__CFDictionary *AppleSPUAccCompassPlugin::copyPropertyForClient(AppleSPUAccCompassPlugin *this, CFTypeRef cf1, const void *a3)
{
  __CFDictionary *Mutable;

  if (!CFEqual(cf1, CFSTR("ServiceFilterDebug")))
    return 0;
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  CFDictionarySetValue(Mutable, CFSTR("Class"), CFSTR("AppleSPUAccCompassPlugin"));
  return Mutable;
}

uint64_t AppleSPUAccCompassPlugin::filter(uint64_t a1, uint64_t a2)
{
  return a2;
}

void AppleSPUAccCompassPlugin::accAddedNotification(AppleSPUAccCompassPlugin *this, void *a2, int a3, __IOHIDDevice *a4, __IOHIDDevice *a5)
{
  NSObject *v7;
  AppleSPUAccCompassPlugin *v8;
  uint64_t v9;
  char i;
  char v11;
  char *v12;
  uint64_t AccCompassCompensationElementData;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  unint64_t v17;
  uint8_t v18[4];
  char v19;
  uint8_t buf[4];
  __IOHIDDevice *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v17 = 0;
  if (this)
  {
    v7 = qword_25414D8B8;
    if (os_log_type_enabled((os_log_t)qword_25414D8B8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v21 = a4;
      _os_log_impl(&dword_2310EC000, v7, OS_LOG_TYPE_DEFAULT, "Accessory added %p\n", buf, 0xCu);
    }
    v8 = (AppleSPUAccCompassPlugin *)AppleSPUAccCompassPlugin::verifyAccMatchedDevice(this, a4);
    if (!(_DWORD)v8)
    {
      v9 = 0;
      for (i = 1; ; i = 0)
      {
        v11 = i;
        v12 = (char *)&AppleSPUAccCompassPlugin::accCompassCompensationTable + 16 * v9;
        AccCompassCompensationElementData = AppleSPUAccCompassPlugin::getAccCompassCompensationElementData(v8, a4, 65302, *((_DWORD *)v12 + 1), buf, &v17);
        if ((_DWORD)AccCompassCompensationElementData)
          return;
        if (AppleSPUAccCompassPlugin::setProperty(AccCompassCompensationElementData, *((_QWORD *)this + 3), *((unsigned int *)v12 + 2), (uint64_t)buf, v17))
        {
          if (!os_log_type_enabled((os_log_t)qword_25414D8B8, OS_LOG_TYPE_ERROR))
            return;
          goto LABEL_15;
        }
        buf[0] = 1;
        v17 = 1;
        v14 = *((_QWORD *)this + 3);
        *(_DWORD *)v18 = *((_DWORD *)&AppleSPUAccCompassPlugin::accCompassCompensationTable + 4 * v9 + 3);
        v19 = 1;
        v15 = *(_QWORD *)(v14 + 8);
        if (!v15
          || (*(unsigned int (**)(uint64_t, uint64_t, uint8_t *, uint64_t, _QWORD, _QWORD))(*(_QWORD *)v15 + 80))(v15, 4, v18, 5, 0, 0))
        {
          break;
        }
        v16 = qword_25414D8B8;
        v8 = (AppleSPUAccCompassPlugin *)os_log_type_enabled((os_log_t)qword_25414D8B8, OS_LOG_TYPE_DEFAULT);
        if ((_DWORD)v8)
        {
          *(_WORD *)v18 = 0;
          _os_log_impl(&dword_2310EC000, v16, OS_LOG_TYPE_DEFAULT, "Accessory Compass Compensation enabled \n", v18, 2u);
        }
        v9 = 1;
        if ((v11 & 1) == 0)
          return;
      }
      if (os_log_type_enabled((os_log_t)qword_25414D8B8, OS_LOG_TYPE_ERROR))
LABEL_15:
        sub_2310EE7FC();
    }
  }
}

void AppleSPUAccCompassPlugin::accRemovalNotification(AppleSPUAccCompassPlugin *this, void *a2, int a3, void *a4, __IOHIDDevice *a5)
{
  void *v7;
  NSObject *v8;
  _BOOL4 v9;
  uint64_t v10;
  char v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  NSObject *v17;
  uint32_t v18;
  int v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (this)
  {
    v7 = (void *)*((_QWORD *)this + 5);
    v8 = qword_25414D8B8;
    v9 = os_log_type_enabled((os_log_t)qword_25414D8B8, OS_LOG_TYPE_DEFAULT);
    if (v7 == a4)
    {
      if (v9)
      {
        v19 = 134217984;
        v20 = a4;
        _os_log_impl(&dword_2310EC000, v8, OS_LOG_TYPE_DEFAULT, "Accessory detached %p\n", (uint8_t *)&v19, 0xCu);
      }
      v10 = 0;
      *((_QWORD *)this + 5) = 0;
      v11 = 1;
      do
      {
        v12 = v11;
        v13 = *((_QWORD *)this + 3);
        v19 = *((_DWORD *)&AppleSPUAccCompassPlugin::accCompassCompensationTable + 4 * v10 + 3);
        LOBYTE(v20) = 0;
        v14 = *(_QWORD *)(v13 + 8);
        if (!v14
          || (*(unsigned int (**)(uint64_t, uint64_t, int *, uint64_t, _QWORD, _QWORD))(*(_QWORD *)v14 + 80))(v14, 4, &v19, 5, 0, 0))
        {
          if (os_log_type_enabled((os_log_t)qword_25414D8B8, OS_LOG_TYPE_ERROR))
            sub_2310EE74C();
          return;
        }
        v11 = 0;
        v10 = 1;
      }
      while ((v12 & 1) != 0);
      v15 = qword_25414D8B8;
      if (!os_log_type_enabled((os_log_t)qword_25414D8B8, OS_LOG_TYPE_DEFAULT))
        return;
      LOWORD(v19) = 0;
      v16 = "Accessory Compass compensation Disabled \n";
      v17 = v15;
      v18 = 2;
      goto LABEL_11;
    }
    if (v9)
    {
      v19 = 134217984;
      v20 = a4;
      v16 = "Unexpected Accessory removed %p\n";
      v17 = v8;
      v18 = 12;
LABEL_11:
      _os_log_impl(&dword_2310EC000, v17, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v19, v18);
    }
  }
}

uint64_t AppleSPUAccCompassPlugin::verifyAccMatchedDevice(AppleSPUAccCompassPlugin *this, IOHIDDeviceRef device)
{
  AppleSPUAccCompassPlugin *v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  char v7;
  char v8;
  char v9;
  NSObject *v10;
  int v12;
  IOHIDDeviceRef v13;
  uint64_t v14;

  v3 = this;
  v14 = *MEMORY[0x24BDAC8D0];
  v4 = 3758097109;
  if (!*((_QWORD *)this + 5)
    || (v5 = qword_25414D8B8, os_log_type_enabled((os_log_t)qword_25414D8B8, OS_LOG_TYPE_DEFAULT))
    && (v12 = 134217984,
        v13 = device,
        _os_log_impl(&dword_2310EC000, v5, OS_LOG_TYPE_DEFAULT, "Unexpected Second Accessory Verified %p", (uint8_t *)&v12, 0xCu), !*((_QWORD *)v3 + 5)))
  {
    v6 = 0;
    v7 = 1;
    v8 = 1;
    do
    {
      v9 = v7;
      this = (AppleSPUAccCompassPlugin *)AppleSPUAccCompassPlugin::checkForAccCompassCompensationElements(this, device, 65302, *((_DWORD *)&AppleSPUAccCompassPlugin::accCompassCompensationTable+ 4 * v6+ 1));
      v7 = 0;
      v8 &= (_DWORD)this == 0;
      v6 = 1;
    }
    while ((v9 & 1) != 0);
    if ((v8 & 1) != 0)
    {
      *((_QWORD *)v3 + 5) = device;
      v10 = qword_25414D8B8;
      v4 = 0;
      if (os_log_type_enabled((os_log_t)qword_25414D8B8, OS_LOG_TYPE_DEFAULT))
      {
        v12 = 134217984;
        v13 = device;
        _os_log_impl(&dword_2310EC000, v10, OS_LOG_TYPE_DEFAULT, "Accessory verified and attached %p\n", (uint8_t *)&v12, 0xCu);
        return 0;
      }
    }
    else
    {
      return 3758097136;
    }
  }
  return v4;
}

uint64_t AppleSPUAccCompassPlugin::checkForAccCompassCompensationElements(AppleSPUAccCompassPlugin *this, IOHIDDeviceRef device, int a3, int a4)
{
  uint64_t v7;
  const __CFArray *v8;
  const __CFArray *v9;
  CFIndex v10;
  __IOHIDElement *ValueAtIndex;
  __IOHIDElement *v12;

  v7 = 3758097136;
  if (IOHIDDeviceOpen(device, 0))
    return 3758097101;
  v8 = IOHIDDeviceCopyMatchingElements(device, 0, 0);
  if (v8)
  {
    v9 = v8;
    if (CFArrayGetCount(v8) >= 1)
    {
      v10 = 0;
      while (1)
      {
        ValueAtIndex = (__IOHIDElement *)CFArrayGetValueAtIndex(v9, v10);
        if (ValueAtIndex)
        {
          v12 = ValueAtIndex;
          if (IOHIDElementGetUsage(ValueAtIndex) == a4
            && IOHIDElementGetUsagePage(v12) == a3
            && IOHIDElementGetType(v12) == kIOHIDElementTypeFeature)
          {
            break;
          }
        }
        if (CFArrayGetCount(v9) <= ++v10)
          goto LABEL_10;
      }
      v7 = 0;
    }
LABEL_10:
    CFRelease(v9);
  }
  else
  {
    v7 = 0;
  }
  IOHIDDeviceClose(device, 0);
  return v7;
}

uint64_t AppleSPUAccCompassPlugin::getAccCompassCompensationElementData(AppleSPUAccCompassPlugin *this, IOHIDDeviceRef device, int a3, int a4, unsigned __int8 *a5, unint64_t *a6)
{
  const __CFArray *v11;
  const __CFArray *v12;
  CFIndex v13;
  __IOHIDElement *ValueAtIndex;
  __IOHIDElement *v15;
  size_t Length;
  const uint8_t *BytePtr;
  IOHIDValueRef pValue;

  pValue = 0;
  if (IOHIDDeviceOpen(device, 0))
    return 3758097101;
  v11 = IOHIDDeviceCopyMatchingElements(device, 0, 0);
  if (v11)
  {
    v12 = v11;
    if (CFArrayGetCount(v11) >= 1)
    {
      v13 = 0;
      while (1)
      {
        ValueAtIndex = (__IOHIDElement *)CFArrayGetValueAtIndex(v12, v13);
        if (ValueAtIndex)
        {
          v15 = ValueAtIndex;
          if (IOHIDElementGetUsage(ValueAtIndex) == a4
            && IOHIDElementGetUsagePage(v15) == a3
            && IOHIDElementGetType(v15) == kIOHIDElementTypeFeature)
          {
            break;
          }
        }
        if (CFArrayGetCount(v12) <= ++v13)
          goto LABEL_10;
      }
      IOHIDDeviceGetValue(device, v15, &pValue);
      if (pValue)
      {
        Length = IOHIDValueGetLength(pValue);
        BytePtr = IOHIDValueGetBytePtr(pValue);
      }
      else
      {
        BytePtr = 0;
        Length = 0;
      }
      *a6 = Length;
      memcpy(a5, BytePtr, Length);
    }
LABEL_10:
    CFRelease(v12);
  }
  IOHIDDeviceClose(device, 0);
  return 0;
}

void AppleSPUAccCompassServicePluginFactory(const __CFAllocator *a1, const void *a2)
{
  CFUUIDRef v4;
  AppleSPUAccCompassPlugin *v5;

  v4 = CFUUIDGetConstantUUIDWithBytes((CFAllocatorRef)*MEMORY[0x24BDBD260], 0x6Bu, 3u, 0x40u, 0xD3u, 0x57u, 0x98u, 0x40u, 0x64u, 0xAAu, 0x17u, 0x92u, 4u, 0xC7u, 0xB0u, 0x6Fu, 0xFDu);
  if (CFEqual(a2, v4))
  {
    v5 = (AppleSPUAccCompassPlugin *)CFAllocatorAllocate(a1, 48, 0);
    AppleSPUAccCompassPlugin::AppleSPUAccCompassPlugin(v5, a1);
  }
}

uint64_t AppleSPUAccCompassPlugin::performCommand(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, _QWORD *a7)
{
  uint64_t v7;
  uint64_t result;

  v7 = *(_QWORD *)(a2 + 8);
  if (!v7)
    return 3758097112;
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD *))(*(_QWORD *)v7 + 80))(v7, a3, a4, a5, a6, a7);
  if ((_DWORD)result)
    *a7 = 0;
  return result;
}

uint64_t AppleSPUAccCompassPlugin::getProperty(uint64_t a1, uint64_t a2, int a3, uint64_t a4, uint64_t a5, _QWORD *a6)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  int v11;

  result = 3758097090;
  v11 = a3;
  v10 = a5;
  if (a6)
  {
    v7 = *(_QWORD *)(a2 + 8);
    if (v7)
    {
      result = (*(uint64_t (**)(_QWORD, uint64_t, int *, uint64_t, uint64_t, uint64_t *))(*(_QWORD *)v7 + 80))(*(_QWORD *)(a2 + 8), 10, &v11, 4, a4, &v10);
      v9 = v10;
      if ((_DWORD)result)
        v9 = 0;
      *a6 = v9;
    }
    else
    {
      return 3758097112;
    }
  }
  return result;
}

void sub_2310EE674(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void *_hadHadAuthorizedBatteryRepair()
{
  void *result;
  void *v1;
  uint64_t v2;

  result = dlopen("/System/Library/PrivateFrameworks/CoreRepairKit.framework/CoreRepairKit", 1);
  if (result)
  {
    v1 = result;
    v2 = objc_msgSend(dlsym(result, "OBJC_CLASS_$_CRRepairStatus"), "hasHadAuthorizedRepairForComponent:", 0);
    dlclose(v1);
    return (void *)v2;
  }
  return result;
}

uint64_t _getBatteryChemID()
{
  void *v0;
  void (*v1)(void);
  void *v2;
  uint64_t v3;

  v0 = dlopen("/System/Library/PrivateFrameworks/CoreRepairKit.framework/CoreRepairKit", 1);
  if (!v0)
    return 0xFFFFFFFFLL;
  v1 = (void (*)(void))dlsym(v0, "getDeviceChemID");
  if (!v1)
    return 0xFFFFFFFFLL;
  v1();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "intValue");

  return v3;
}

void sub_2310EE74C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2310EE68C();
  sub_2310EE674(&dword_2310EC000, v0, v1, "Error disabling compass compensation!", v2, v3, v4, v5, v6);
  sub_2310EE684();
}

void sub_2310EE778()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2310EE68C();
  sub_2310EE674(&dword_2310EC000, v0, v1, "Error adding match notification!", v2, v3, v4, v5, v6);
  sub_2310EE684();
}

void sub_2310EE7A4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2310EE68C();
  sub_2310EE674(&dword_2310EC000, v0, v1, "Error connecting to compass service!", v2, v3, v4, v5, v6);
  sub_2310EE684();
}

void sub_2310EE7D0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2310EE68C();
  sub_2310EE674(&dword_2310EC000, v0, v1, "Error updating CBCC values!", v2, v3, v4, v5, v6);
  sub_2310EE684();
}

void sub_2310EE7FC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2310EE68C();
  sub_2310EE674(&dword_2310EC000, v0, v1, "Error enabling compass compensation!", v2, v3, v4, v5, v6);
  sub_2310EE684();
}

void *__cdecl CFAllocatorAllocate(CFAllocatorRef allocator, CFIndex size, CFOptionFlags hint)
{
  return (void *)MEMORY[0x24BDBB790](allocator, size, hint);
}

void CFAllocatorDeallocate(CFAllocatorRef allocator, void *ptr)
{
  MEMORY[0x24BDBB7A0](allocator, ptr);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB820](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x24BDBB860](theArray, idx);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x24BDBBE68](cf1, cf2);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x24BDBC0A0](allocator, theType, valuePtr);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x24BDBC130](number, theType, valuePtr);
}

void CFPlugInAddInstanceForFactory(CFUUIDRef factoryID)
{
  MEMORY[0x24BDBC140](factoryID);
}

void CFPlugInRemoveInstanceForFactory(CFUUIDRef factoryID)
{
  MEMORY[0x24BDBC148](factoryID);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x24BDBC300]();
}

CFUUIDRef CFUUIDCreateFromUUIDBytes(CFAllocatorRef alloc, CFUUIDBytes bytes)
{
  return (CFUUIDRef)MEMORY[0x24BDBC8E0](alloc, *(_QWORD *)&bytes.byte0, *(_QWORD *)&bytes.byte8);
}

CFUUIDRef CFUUIDGetConstantUUIDWithBytes(CFAllocatorRef alloc, UInt8 byte0, UInt8 byte1, UInt8 byte2, UInt8 byte3, UInt8 byte4, UInt8 byte5, UInt8 byte6, UInt8 byte7, UInt8 byte8, UInt8 byte9, UInt8 byte10, UInt8 byte11, UInt8 byte12, UInt8 byte13, UInt8 byte14, UInt8 byte15)
{
  return (CFUUIDRef)MEMORY[0x24BDBC8F8](alloc, byte0, byte1, byte2, byte3, byte4, byte5, byte6);
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

kern_return_t IOCreatePlugInInterfaceForService(io_service_t service, CFUUIDRef pluginType, CFUUIDRef interfaceType, IOCFPlugInInterface ***theInterface, SInt32 *theScore)
{
  return MEMORY[0x24BDD7F90](*(_QWORD *)&service, pluginType, interfaceType, theInterface, theScore);
}

IOReturn IOHIDDeviceClose(IOHIDDeviceRef device, IOOptionBits options)
{
  return MEMORY[0x24BDD8018](device, *(_QWORD *)&options);
}

CFArrayRef IOHIDDeviceCopyMatchingElements(IOHIDDeviceRef device, CFDictionaryRef matching, IOOptionBits options)
{
  return (CFArrayRef)MEMORY[0x24BDD8028](device, matching, *(_QWORD *)&options);
}

IOReturn IOHIDDeviceGetValue(IOHIDDeviceRef device, IOHIDElementRef element, IOHIDValueRef *pValue)
{
  return MEMORY[0x24BDD8058](device, element, pValue);
}

IOReturn IOHIDDeviceOpen(IOHIDDeviceRef device, IOOptionBits options)
{
  return MEMORY[0x24BDD8060](device, *(_QWORD *)&options);
}

IOHIDElementType IOHIDElementGetType(IOHIDElementRef element)
{
  return MEMORY[0x24BDD8118](element);
}

uint32_t IOHIDElementGetUsage(IOHIDElementRef element)
{
  return MEMORY[0x24BDD8130](element);
}

uint32_t IOHIDElementGetUsagePage(IOHIDElementRef element)
{
  return MEMORY[0x24BDD8138](element);
}

IOHIDManagerRef IOHIDManagerCreate(CFAllocatorRef allocator, IOOptionBits options)
{
  return (IOHIDManagerRef)MEMORY[0x24BDD8488](allocator, *(_QWORD *)&options);
}

void IOHIDManagerRegisterDeviceMatchingCallback(IOHIDManagerRef manager, IOHIDDeviceCallback callback, void *context)
{
  MEMORY[0x24BDD84A8](manager, callback, context);
}

void IOHIDManagerRegisterDeviceRemovalCallback(IOHIDManagerRef manager, IOHIDDeviceCallback callback, void *context)
{
  MEMORY[0x24BDD84B0](manager, callback, context);
}

void IOHIDManagerScheduleWithRunLoop(IOHIDManagerRef manager, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
  MEMORY[0x24BDD84D0](manager, runLoop, runLoopMode);
}

void IOHIDManagerSetDeviceMatching(IOHIDManagerRef manager, CFDictionaryRef matching)
{
  MEMORY[0x24BDD84E0](manager, matching);
}

uint64_t IOHIDServiceGetRegistryID()
{
  return MEMORY[0x24BDD8578]();
}

const uint8_t *__cdecl IOHIDValueGetBytePtr(IOHIDValueRef value)
{
  return (const uint8_t *)MEMORY[0x24BDD8630](value);
}

CFIndex IOHIDValueGetLength(IOHIDValueRef value)
{
  return MEMORY[0x24BDD8648](value);
}

CFMutableDictionaryRef IORegistryEntryIDMatching(uint64_t entryID)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDD8918](entryID);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x24BDD8988](*(_QWORD *)&mainPort, matching);
}

uint64_t MGGetProductType()
{
  return MEMORY[0x24BED8488]();
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

uint64_t operator delete()
{
  return off_24FFFD238();
}

uint64_t operator new()
{
  return off_24FFFD240();
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x24BEDB910](a1);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

int dlclose(void *__handle)
{
  return MEMORY[0x24BDAE060](__handle);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x24BDAE070](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

void os_release(void *object)
{
  MEMORY[0x24BDAF3F0](object);
}

