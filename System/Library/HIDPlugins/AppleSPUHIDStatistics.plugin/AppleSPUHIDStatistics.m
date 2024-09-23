uint64_t AppleSPUHIDStatistics::registerService(uint64_t a1)
{
  const void *v2;
  const void *v3;
  CFTypeID v4;
  const __CFNumber *IOHIDServiceRegistryID;
  mach_port_t v6;
  const __CFDictionary *v7;
  uint64_t MatchingService;
  uint64_t v9;
  uint64_t *v10;
  NSObject *v11;
  io_service_t *v12;
  io_service_t v13;
  const __CFAllocator *v14;
  const __CFUUID *v15;
  const __CFUUID *v16;
  IOCFPlugInInterface **v17;
  HRESULT (__cdecl *QueryInterface)(void *, REFIID, LPVOID *);
  const __CFUUID *v19;
  CFUUIDBytes v20;
  uint64_t v21;
  io_service_t v22;
  const __CFUUID *v23;
  const __CFUUID *v24;
  IOCFPlugInInterface **v25;
  HRESULT (__cdecl *v26)(void *, REFIID, LPVOID *);
  const __CFUUID *v27;
  CFUUIDBytes v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t result;
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  NSObject *v35;
  SInt32 theScore;
  IOCFPlugInInterface **theInterface;
  io_registry_entry_t parent;
  uint8_t buf[4];
  const char *v40;
  __int16 v41;
  const char *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  const char *v46;
  __int16 v47;
  int v48;
  __int16 v49;
  int v50;
  _OWORD v51[8];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  parent = 0;
  theInterface = 0;
  theScore = 0;
  memset(v51, 0, sizeof(v51));
  v2 = (const void *)IOHIDServiceCopyProperty();
  if (!v2)
  {
    v9 = 0;
    goto LABEL_28;
  }
  v3 = v2;
  v4 = CFGetTypeID(v2);
  if (v4 == CFStringGetTypeID()
    && CFEqual(v3, CFSTR("SPU"))
    && AppleSPUHIDStatistics::IOHIDServiceSupportsAggregateDictionary())
  {
    IOHIDServiceRegistryID = AppleSPUHIDStatistics::getIOHIDServiceRegistryID();
    v6 = *MEMORY[0x24BDD8B20];
    v7 = IORegistryEntryIDMatching((uint64_t)IOHIDServiceRegistryID);
    MatchingService = IOServiceGetMatchingService(v6, v7);
    v9 = operator new();
    *(_OWORD *)(v9 + 8) = 0u;
    v10 = (uint64_t *)(v9 + 8);
    *(_OWORD *)(v9 + 24) = 0u;
    *(_QWORD *)(v9 + 40) = 0;
    *(_DWORD *)v9 = MatchingService;
    if (!(_DWORD)MatchingService)
      goto LABEL_26;
    MEMORY[0x2348D1940](MatchingService, v51);
    v11 = qword_25414D8C8;
    if (os_log_type_enabled((os_log_t)qword_25414D8C8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v40 = "registerService";
      v41 = 2080;
      v42 = (const char *)v51;
      _os_log_impl(&dword_2310F1000, v11, OS_LOG_TYPE_DEFAULT, "%s: name=%s", buf, 0x16u);
    }
    if (IORegistryEntryGetParentEntry(*(_DWORD *)v9, "IOService", &parent))
      goto LABEL_26;
    if (!parent)
      goto LABEL_26;
    v12 = (io_service_t *)(v9 + 36);
    if (IORegistryEntryGetParentEntry(parent, "IOService", (io_registry_entry_t *)(v9 + 36)) || !*v12)
      goto LABEL_26;
    v13 = *(_DWORD *)v9;
    v14 = (const __CFAllocator *)*MEMORY[0x24BDBD260];
    v15 = CFUUIDGetConstantUUIDWithBytes((CFAllocatorRef)*MEMORY[0x24BDBD260], 0x3Bu, 0xC5u, 0xCCu, 0x87u, 0x84u, 0x5Eu, 0x48u, 0xABu, 0xA9u, 0xC2u, 0x94u, 0x36u, 0, 0x1Bu, 0xA6u, 0x8Au);
    v16 = CFUUIDGetConstantUUIDWithBytes(0, 0xC2u, 0x44u, 0xE8u, 0x58u, 0x10u, 0x9Cu, 0x11u, 0xD4u, 0x91u, 0xD4u, 0, 0x50u, 0xE4u, 0xC6u, 0x42u, 0x6Fu);
    if (!IOCreatePlugInInterfaceForService(v13, v15, v16, &theInterface, &theScore))
    {
      v17 = theInterface;
      if (theInterface)
      {
        QueryInterface = (*theInterface)->QueryInterface;
        v19 = CFUUIDGetConstantUUIDWithBytes(v14, 0x59u, 0x79u, 0x99u, 0x3Cu, 0x85u, 0xF5u, 0x4Du, 0x59u, 0x85u, 0x93u, 0xFFu, 0x92u, 0x15u, 0xDAu, 0x47u, 0xADu);
        v20 = CFUUIDGetUUIDBytes(v19);
        if ((((uint64_t (*)(IOCFPlugInInterface **, _QWORD, _QWORD, uint64_t *))QueryInterface)(v17, *(_QWORD *)&v20.byte0, *(_QWORD *)&v20.byte8, v10) & 0x80000000) != 0)
        {
          v32 = qword_25414D8C8;
          if (os_log_type_enabled((os_log_t)qword_25414D8C8, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316418;
            v40 = (const char *)&unk_231101D67;
            v41 = 2080;
            v42 = "((HRESULT)(Status) >= 0)";
            v43 = 2080;
            v44 = &unk_231101D67;
            v45 = 2080;
            v46 = "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPUHIDPlugins/AppleSPUHIDStatistics/AppleSPUHIDStatistics.cpp";
            v47 = 1024;
            v48 = 252;
            v49 = 1024;
            v50 = 0;
            _os_log_impl(&dword_2310F1000, v32, OS_LOG_TYPE_DEFAULT, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", buf, 0x36u);
          }
        }
        v21 = *v10;
        if (*v10)
          goto LABEL_46;
        v33 = qword_25414D8C8;
        if (os_log_type_enabled((os_log_t)qword_25414D8C8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316418;
          v40 = (const char *)&unk_231101D67;
          v41 = 2080;
          v42 = "context->_driver._interface";
          v43 = 2080;
          v44 = &unk_231101D67;
          v45 = 2080;
          v46 = "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPUHIDPlugins/AppleSPUHIDStatistics/AppleSPUHIDStatistics.cpp";
          v47 = 1024;
          v48 = 253;
          v49 = 1024;
          v50 = 0;
          _os_log_impl(&dword_2310F1000, v33, OS_LOG_TYPE_DEFAULT, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", buf, 0x36u);
          v21 = *v10;
          if (*v10)
          {
LABEL_46:
            if ((*(unsigned int (**)(uint64_t, _QWORD))(*(_QWORD *)v21 + 64))(v21, 0))
              goto LABEL_26;
            ((void (*)(IOCFPlugInInterface **))(*theInterface)->Release)(theInterface);
            theInterface = 0;
          }
        }
      }
    }
    v22 = *v12;
    v23 = CFUUIDGetConstantUUIDWithBytes(v14, 0x7Au, 0xCFu, 0x53u, 0x32u, 0x1Au, 0x35u, 0x48u, 0x93u, 0x87u, 0xCBu, 0xBAu, 0x64u, 0xE1u, 0x88u, 0x7Fu, 0xAEu);
    v24 = CFUUIDGetConstantUUIDWithBytes(0, 0xC2u, 0x44u, 0xE8u, 0x58u, 0x10u, 0x9Cu, 0x11u, 0xD4u, 0x91u, 0xD4u, 0, 0x50u, 0xE4u, 0xC6u, 0x42u, 0x6Fu);
    if (!IOCreatePlugInInterfaceForService(v22, v23, v24, &theInterface, &theScore))
    {
      v25 = theInterface;
      if (theInterface)
      {
        v26 = (*theInterface)->QueryInterface;
        v27 = CFUUIDGetConstantUUIDWithBytes(v14, 1u, 0x64u, 0x69u, 0xD8u, 0x77u, 0x3Bu, 0x46u, 0xACu, 0x90u, 0x9Eu, 0xF9u, 0xCu, 0x4Au, 0x6Eu, 0x75u, 0x77u);
        v28 = CFUUIDGetUUIDBytes(v27);
        v29 = (_QWORD *)(v9 + 40);
        if ((((uint64_t (*)(IOCFPlugInInterface **, _QWORD, _QWORD, uint64_t))v26)(v25, *(_QWORD *)&v28.byte0, *(_QWORD *)&v28.byte8, v9 + 40) & 0x80000000) != 0)
        {
          v34 = qword_25414D8C8;
          if (os_log_type_enabled((os_log_t)qword_25414D8C8, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136316418;
            v40 = (const char *)&unk_231101D67;
            v41 = 2080;
            v42 = "((HRESULT)(Status) >= 0)";
            v43 = 2080;
            v44 = &unk_231101D67;
            v45 = 2080;
            v46 = "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPUHIDPlugins/AppleSPUHIDStatistics/AppleSPUHIDStatistics.cpp";
            v47 = 1024;
            v48 = 269;
            v49 = 1024;
            v50 = 0;
            _os_log_impl(&dword_2310F1000, v34, OS_LOG_TYPE_DEFAULT, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", buf, 0x36u);
          }
        }
        v30 = *v29;
        if (*v29)
          goto LABEL_22;
        v35 = qword_25414D8C8;
        if (os_log_type_enabled((os_log_t)qword_25414D8C8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136316418;
          v40 = (const char *)&unk_231101D67;
          v41 = 2080;
          v42 = "context->_device._interface";
          v43 = 2080;
          v44 = &unk_231101D67;
          v45 = 2080;
          v46 = "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/AppleSPUHIDPlugins/AppleSPUHIDStatistics/AppleSPUHIDStatistics.cpp";
          v47 = 1024;
          v48 = 270;
          v49 = 1024;
          v50 = 0;
          _os_log_impl(&dword_2310F1000, v35, OS_LOG_TYPE_DEFAULT, "%s: AssertMacros: %s, %s file: %s, line: %d value:%x\n", buf, 0x36u);
          v30 = *v29;
          if (*v29)
          {
LABEL_22:
            (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)v30 + 64))(v30, 0);
            (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)*v29 + 144))(*v29, *(_QWORD *)(a1 + 624));
            (*(void (**)(_QWORD, uint64_t (*)(AppleSPUHIDStatistics *__hidden, void *, void *, unint64_t), uint64_t))(*(_QWORD *)*v29 + 136))(*v29, AppleSPUHIDStatistics::publishADData, a1);
          }
        }
        ((void (*)(IOCFPlugInInterface **))(*theInterface)->Release)(theInterface);
        theInterface = 0;
      }
    }
    CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 24), (const void *)v9);
  }
  v9 = 0;
LABEL_26:
  CFRelease(v3);
  if (theInterface)
    ((void (*)(IOCFPlugInInterface **))(*theInterface)->Release)(theInterface);
LABEL_28:
  result = parent;
  if (parent)
    result = IOObjectRelease(parent);
  if (v9)
    return MEMORY[0x2348D1AE4](v9, 0x10B0C4017A8DECDLL);
  return result;
}

uint64_t sub_2310F30B4(uint64_t a1)
{
  uint64_t v1;

  v1 = (*(_DWORD *)(a1 + 16) + 1);
  *(_DWORD *)(a1 + 16) = v1;
  return v1;
}

uint64_t sub_2310F30CC(uint64_t a1)
{
  AppleSPUHIDStatistics::open(a1);
  return 1;
}

uint64_t sub_2310F30E8(uint64_t a1, dispatch_queue_t queue)
{
  int out_token;

  *(_QWORD *)(a1 + 624) = queue;
  out_token = 0;
  return notify_register_dispatch("com.apple.applespuhidstatistics.fault", &out_token, queue, &unk_24FFFDC18);
}

uint64_t sub_2310F3124(uint64_t result)
{
  *(_QWORD *)(result + 624) = 0;
  return result;
}

void AppleSPUHIDStatistics::alloc(AppleSPUHIDStatistics *this, const __CFAllocator *a2)
{
  AppleSPUHIDStatistics *v3;

  v3 = (AppleSPUHIDStatistics *)CFAllocatorAllocate(this, 632, 0);
  AppleSPUHIDStatistics::AppleSPUHIDStatistics(v3, this);
}

void AppleSPUHIDStatistics::operator delete(CFAllocatorRef *ptr)
{
  CFAllocatorDeallocate(ptr[1], ptr);
}

void sub_2310F317C(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

void AppleSPUHIDStatistics::AppleSPUHIDStatistics(AppleSPUHIDStatistics *this, const __CFAllocator *a2)
{
  const __CFUUID *v3;

  *(_QWORD *)this = &AppleSPUHIDStatistics::vtbl;
  *((_QWORD *)this + 1) = a2;
  *((_DWORD *)this + 4) = 1;
  v3 = CFUUIDGetConstantUUIDWithBytes((CFAllocatorRef)*MEMORY[0x24BDBD260], 0x75u, 0xF0u, 0x71u, 0x27u, 0xBBu, 6u, 0x49u, 0xAu, 0xB1u, 0xB9u, 0x81u, 0xAEu, 0x65u, 0xDFu, 6u, 0x46u);
  CFPlugInAddInstanceForFactory(v3);
  *((_QWORD *)this + 3) = CFArrayCreateMutable(*((CFAllocatorRef *)this + 1), 0, 0);
}

void AppleSPUHIDStatistics::~AppleSPUHIDStatistics(AppleSPUHIDStatistics *this)
{
  const __CFUUID *v1;

  v1 = CFUUIDGetConstantUUIDWithBytes((CFAllocatorRef)*MEMORY[0x24BDBD260], 0x75u, 0xF0u, 0x71u, 0x27u, 0xBBu, 6u, 0x49u, 0xAu, 0xB1u, 0xB9u, 0x81u, 0xAEu, 0x65u, 0xDFu, 6u, 0x46u);
  CFPlugInRemoveInstanceForFactory(v1);
  os_release((void *)qword_25414D8C8);
}

uint64_t AppleSPUHIDStatistics::QueryInterface(AppleSPUHIDStatistics *this, CFUUIDBytes a2, void **a3)
{
  CFUUIDRef v5;
  const __CFAllocator *v6;
  CFUUIDRef v7;
  CFUUIDRef v8;
  CFUUIDRef v9;
  uint64_t v10;

  v5 = CFUUIDCreateFromUUIDBytes(0, a2);
  v6 = (const __CFAllocator *)*MEMORY[0x24BDBD260];
  v7 = CFUUIDGetConstantUUIDWithBytes((CFAllocatorRef)*MEMORY[0x24BDBD260], 0x19u, 0xD7u, 0x74u, 0x41u, 0xBBu, 0xC4u, 0x45u, 0x11u, 0x91u, 0x49u, 0x60u, 0x57u, 0x2Au, 0xBu, 1u, 0x5Cu);
  if (CFEqual(v5, v7)
    || (v8 = CFUUIDGetConstantUUIDWithBytes(v6, 0x3Du, 0xC3u, 0x5Au, 0xA6u, 0xD3u, 0x5Cu, 0x44u, 0x5Bu, 0x9Au, 0x59u, 0xCAu, 3u, 0xDAu, 0x40u, 0x8Bu, 0x97u), CFEqual(v5, v8))|| (v9 = CFUUIDGetConstantUUIDWithBytes(v6, 0, 0, 0, 0, 0, 0, 0, 0, 0xC0u, 0, 0, 0, 0, 0, 0, 0x46u), CFEqual(v5, v9)))
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

uint64_t AppleSPUHIDStatistics::AddRef(AppleSPUHIDStatistics *this)
{
  uint64_t v1;

  v1 = (*((_DWORD *)this + 4) + 1);
  *((_DWORD *)this + 4) = v1;
  return v1;
}

uint64_t AppleSPUHIDStatistics::Release(AppleSPUHIDStatistics *this)
{
  int v1;
  uint64_t v2;
  CFAllocatorRef *v3;

  v1 = *((_DWORD *)this + 4);
  v2 = (v1 - 1);
  *((_DWORD *)this + 4) = v2;
  if (v1 == 1)
  {
    AppleSPUHIDStatistics::~AppleSPUHIDStatistics(this);
    AppleSPUHIDStatistics::operator delete(v3);
  }
  return v2;
}

uint64_t AppleSPUHIDStatistics::open(uint64_t a1)
{
  uint64_t v2;
  const __CFAllocator *v3;
  uint64_t v4;
  const char *v5;

  if (qword_25414D8C0 != -1)
    dispatch_once(&qword_25414D8C0, &unk_24FFFD988);
  v2 = 0;
  v3 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v4 = a1 + 32;
  do
  {
    if (off_24FFFD9A8[v2])
      v5 = off_24FFFD9A8[v2];
    else
      v5 = "com.apple.aop.unknown";
    *(_QWORD *)(v4 + v2 * 8) = CFStringCreateWithCString(v3, v5, 0);
    ++v2;
  }
  while (v2 != 74);
  return 1;
}

os_log_t sub_2310F34F8()
{
  os_log_t result;

  result = os_log_create("AOP", "AppleSPUHIDStatistics");
  qword_25414D8C8 = (uint64_t)result;
  return result;
}

const __CFBoolean *AppleSPUHIDStatistics::IOHIDServiceSupportsAggregateDictionary()
{
  const __CFBoolean *result;
  const __CFBoolean *v1;
  CFTypeID v2;

  result = (const __CFBoolean *)IOHIDServiceGetProperty();
  if (result)
  {
    v1 = result;
    v2 = CFGetTypeID(result);
    if (v2 == CFBooleanGetTypeID())
      return (const __CFBoolean *)(CFBooleanGetValue(v1) != 0);
    else
      return 0;
  }
  return result;
}

const __CFNumber *AppleSPUHIDStatistics::getIOHIDServiceRegistryID()
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

uint64_t AppleSPUHIDStatistics::scheduleWithDispatchQueue(AppleSPUHIDStatistics *this, dispatch_queue_t queue)
{
  int out_token;

  *((_QWORD *)this + 78) = queue;
  out_token = 0;
  return notify_register_dispatch("com.apple.applespuhidstatistics.fault", &out_token, queue, &unk_24FFFDC18);
}

void sub_2310F3604()
{
  NSObject *v0;

  v0 = qword_25414D8C8;
  if (os_log_type_enabled((os_log_t)qword_25414D8C8, OS_LOG_TYPE_FAULT))
    sub_2311001C8(v0);
}

uint64_t AppleSPUHIDStatistics::unscheduleFromDispatchQueue(uint64_t this, dispatch_queue_s *a2)
{
  *(_QWORD *)(this + 624) = 0;
  return this;
}

const __CFString *AppleSPUHIDStatistics::keyForIndex(uint64_t a1, int a2)
{
  if (a2 > 73)
    return CFSTR("com.apple.aop.unknown");
  else
    return *(const __CFString **)(a1 + 8 * a2 + 32);
}

void AppleSPUHIDStatistics::publishADData(uint64_t a1, unint64_t a2, unint64_t a3)
{
  unint64_t v4;
  uint64_t v5;
  unsigned int v6;
  unint64_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  __int16 *v11;
  unsigned int v12;
  unint64_t v13;
  const __CFString *v14;
  unint64_t v15;
  NSObject *v16;
  uint64_t v17;
  NSObject *v18;
  unint64_t v19;
  unsigned int v20;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  const __CFString *v29;
  __int16 v30;
  int v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v4 = a2;
    v5 = 0;
    v6 = 0;
    v7 = 0x25414D000uLL;
    do
    {
      v8 = *(unsigned __int8 *)(v4 - v5 + 8 * v5);
      if (v8 == 74)
      {
        v9 = v4 - v5 + 8 * v5;
        v12 = *(unsigned __int16 *)(v9 + 1);
        v11 = (__int16 *)(v9 + 1);
        LOBYTE(v10) = v12;
        v13 = (unint64_t)v12 >> 8;
        if (v12 >> 9 > 0x24)
          v14 = CFSTR("com.apple.aop.unknown");
        else
          v14 = *(const __CFString **)(a1 + 8 * v13 + 32);
        v15 = v7;
        v16 = *(NSObject **)(v7 + 2248);
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315906;
          v25 = "publishADData";
          v26 = 1024;
          v27 = v10;
          v28 = 2112;
          v29 = v14;
          v30 = 1024;
          v31 = v13;
          _os_log_debug_impl(&dword_2310F1000, v16, OS_LOG_TYPE_DEBUG, "%s op=%#x '%@' (%#x)", buf, 0x22u);
          v10 = *v11;
        }
        v17 = v10;
        v7 = v15;
        v4 = a2;
        switch((char)v10)
        {
          case 0:
            break;
          case 1:
            ADClientClearScalarKey();
            break;
          case 2:
            ADClientSetValueForScalarKey();
            break;
          case 3:
            ADClientAddValueForScalarKey();
            break;
          case 4:
            ADClientClearDistributionKey();
            break;
          case 5:
            ADClientSetValueForDistributionKey();
            break;
          default:
            v19 = v10 - 5;
            v7 = a2;
            v4 = a2;
            if (v17 != 5)
            {
              v20 = 1;
              do
                ADClientPushValueForDistributionKey();
              while (v19 > v20++);
            }
            break;
        }
      }
      else
      {
        v18 = *(NSObject **)(v7 + 2248);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 136315650;
          v25 = "publishADData";
          v26 = 1024;
          v27 = v8;
          v28 = 1024;
          LODWORD(v29) = 74;
          _os_log_error_impl(&dword_2310F1000, v18, OS_LOG_TYPE_ERROR, "%s spuaggdkeys version mismatch (%#x/%#x)", buf, 0x18u);
        }
      }
      v5 = ++v6;
    }
    while (v6 < a3);
  }
}

void AppleSPUHIDStatisticsFactory(const __CFAllocator *a1, const void *a2)
{
  CFUUIDRef v4;
  AppleSPUHIDStatistics *v5;

  v4 = CFUUIDGetConstantUUIDWithBytes((CFAllocatorRef)*MEMORY[0x24BDBD260], 0x7Fu, 0x1Au, 0x3Au, 0xE6u, 0x3Eu, 0x3Du, 0x47u, 0xAu, 0xBDu, 0x15u, 0xA2u, 0xDDu, 0x7Eu, 0x1Bu, 0xB7u, 0x19u);
  if (CFEqual(a2, v4))
  {
    v5 = (AppleSPUHIDStatistics *)CFAllocatorAllocate(a1, 632, 0);
    AppleSPUHIDStatistics::AppleSPUHIDStatistics(v5, a1);
  }
}

void spu_profile_print(_QWORD *a1)
{
  const __CFString *v1;
  const __CFString *v2;
  const char *CStringPtr;

  v1 = CopyProfileDescription(a1);
  if (v1)
  {
    v2 = v1;
    CStringPtr = CFStringGetCStringPtr(v1, 0);
    puts(CStringPtr);
    CFRelease(v2);
  }
}

CFStringRef CopyProfileDescription(_QWORD *a1)
{
  void **v1;
  CFStringRef v2;
  __int128 v4;
  uint64_t v5;
  void *__p[2];
  uint64_t v7;

  AOPLogDecoder::to_string(a1);
  *(_OWORD *)__p = v4;
  v7 = v5;
  if (v5 >= 0)
    v1 = __p;
  else
    v1 = (void **)__p[0];
  v2 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x24BDBD240], (const char *)v1, 0x8000100u);
  if (SHIBYTE(v7) < 0)
    operator delete(__p[0]);
  return v2;
}

void sub_2310F3A94(void *a1)
{
  __cxa_begin_catch(a1);
  __cxa_end_catch();
  JUMPOUT(0x2310F3A40);
}

void sub_2310F3AA0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *__p, uint64_t a14, int a15, __int16 a16, char a17, char a18)
{
  if (a18 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

std::string *profile_decoder::find_in_table@<X0>(const entry *a1@<X1>, unsigned int __val@<W3>, unsigned int a3@<W2>, std::string *a4@<X8>)
{
  uint64_t v5;
  void **i;

  if (!a3)
    return std::to_string(a4, __val);
  v5 = a3;
  for (i = &a1->data; *((_DWORD *)i - 2) != __val; i += 2)
  {
    if (!--v5)
      return std::to_string(a4, __val);
  }
  return (std::string *)sub_2310FF330(a4, (char *)*i);
}

uint64_t profile_decoder::dump(profile_decoder *this, const void *a2, int a3)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD v7[2];
  _QWORD v8[11];
  char v9;
  uint64_t v10;

  sub_2310F3C38((uint64_t)v7);
  sub_2310FF468(v8, (uint64_t)"[", 1);
  if (a3)
  {
    v4 = 0;
    do
    {
      if (v4)
        sub_2310FF468(v8, (uint64_t)",", 1);
      std::ostream::operator<<();
      ++v4;
    }
    while (a3 != v4);
  }
  sub_2310FF468(v8, (uint64_t)"]", 1);
  std::stringbuf::str();
  v7[0] = *MEMORY[0x24BEDB7F0];
  v5 = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 72);
  *(_QWORD *)((char *)v7 + *(_QWORD *)(v7[0] - 24)) = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 64);
  v8[0] = v5;
  v8[1] = MEMORY[0x24BEDB848] + 16;
  if (v9 < 0)
    operator delete((void *)v8[9]);
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  return MEMORY[0x2348D1AA8](&v10);
}

void sub_2310F3C20(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  sub_2310F3D64((uint64_t)va);
  _Unwind_Resume(a1);
}

uint64_t sub_2310F3C38(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  std::ios_base *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v2 = MEMORY[0x24BEDB858];
  v3 = MEMORY[0x24BEDB858] + 104;
  *(_QWORD *)(a1 + 128) = MEMORY[0x24BEDB858] + 104;
  *(_QWORD *)(a1 + 16) = v2 + 64;
  v4 = a1 + 16;
  v5 = (_QWORD *)MEMORY[0x24BEDB7F0];
  v6 = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 16);
  v7 = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 24);
  *(_QWORD *)a1 = v6;
  *(_QWORD *)(a1 + *(_QWORD *)(v6 - 24)) = v7;
  *(_QWORD *)(a1 + 8) = 0;
  v8 = (std::ios_base *)(a1 + *(_QWORD *)(*(_QWORD *)a1 - 24));
  std::ios_base::init(v8, (void *)(a1 + 24));
  v8[1].__vftable = 0;
  v8[1].__fmtflags_ = -1;
  v9 = v5[4];
  v10 = v5[5];
  *(_QWORD *)(a1 + 16) = v9;
  *(_QWORD *)(v4 + *(_QWORD *)(v9 - 24)) = v10;
  v11 = v5[1];
  *(_QWORD *)a1 = v11;
  *(_QWORD *)(a1 + *(_QWORD *)(v11 - 24)) = v5[6];
  *(_QWORD *)a1 = v2 + 24;
  *(_QWORD *)(a1 + 128) = v3;
  *(_QWORD *)(a1 + 16) = v2 + 64;
  std::streambuf::basic_streambuf();
  *(_QWORD *)(a1 + 24) = MEMORY[0x24BEDB848] + 16;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_DWORD *)(a1 + 120) = 24;
  return a1;
}

void sub_2310F3D3C(_Unwind_Exception *a1)
{
  uint64_t v1;

  std::iostream::~basic_iostream();
  MEMORY[0x2348D1AA8](v1);
  _Unwind_Resume(a1);
}

uint64_t sub_2310F3D64(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = MEMORY[0x24BEDB7F0];
  v3 = *MEMORY[0x24BEDB7F0];
  *(_QWORD *)a1 = *MEMORY[0x24BEDB7F0];
  v4 = *(_QWORD *)(v2 + 72);
  *(_QWORD *)(a1 + *(_QWORD *)(v3 - 24)) = *(_QWORD *)(v2 + 64);
  *(_QWORD *)(a1 + 24) = MEMORY[0x24BEDB848] + 16;
  *(_QWORD *)(a1 + 16) = v4;
  if (*(char *)(a1 + 111) < 0)
    operator delete(*(void **)(a1 + 88));
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x2348D1AA8](a1 + 128);
  return a1;
}

std::string *profile_decoder::category_name@<X0>(unsigned int __val@<W1>, std::string *a2@<X8>)
{
  return profile_decoder::find_in_table((const entry *)&unk_24FFFDC38, __val, 0xEu, a2);
}

std::string *profile_decoder::component_name@<X0>(unsigned int __val@<W1>, std::string *a2@<X8>)
{
  return std::to_string(a2, __val);
}

std::string *profile_decoder::event_name@<X0>(unsigned int __val@<W2>, std::string *a2@<X8>)
{
  return std::to_string(a2, __val);
}

void profile_decoder::parse_datatype(uint64_t a1, uint64_t a2, uint64_t a3)
{
  std::string *v5;
  std::string::size_type size;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
  std::string *v10;
  std::string::size_type v11;
  _QWORD *v12;
  _QWORD *v13;
  _QWORD *v14;
  std::string *v15;
  std::string::size_type v16;
  _QWORD *v17;
  _QWORD *v18;
  _QWORD *v19;
  std::string *v20;
  std::string::size_type v21;
  _QWORD *v22;
  _QWORD *v23;
  _QWORD *v24;
  std::string *v25;
  std::string::size_type v26;
  profile_decoder *v27;
  profile_decoder *v28;
  int v29;
  std::string *p_p;
  std::string::size_type v31;
  _QWORD *v32;
  void *v33;
  std::string *v34;
  std::string::size_type v35;
  _QWORD *v36;
  _QWORD *v37;
  _QWORD *v38;
  std::string *v39;
  std::string::size_type v40;
  _QWORD *v41;
  _QWORD *v42;
  _QWORD *v43;
  std::string *v44;
  std::string::size_type v45;
  _QWORD *v46;
  _QWORD *v47;
  _QWORD *v48;
  std::string *v49;
  std::string::size_type v50;
  _QWORD *v51;
  _QWORD *v52;
  _QWORD *v53;
  std::string *v54;
  std::string::size_type v55;
  profile_decoder *v56;
  std::string *v57;
  std::string::size_type v58;
  _QWORD *v59;
  std::string *v60;
  std::string::size_type v61;
  _QWORD *v62;
  _QWORD *v63;
  _QWORD *v64;
  std::string *v65;
  std::string::size_type v66;
  _QWORD *v67;
  _QWORD *v68;
  _QWORD *v69;
  std::string *v70;
  std::string::size_type v71;
  _QWORD *v72;
  _QWORD *v73;
  _QWORD *v74;
  std::string *v75;
  std::string::size_type v76;
  _QWORD *v77;
  _QWORD *v78;
  _QWORD *v79;
  std::string *v80;
  std::string::size_type v81;
  _QWORD *v82;
  _QWORD *v83;
  _QWORD *v84;
  std::string *v85;
  std::string::size_type v86;
  _QWORD *v87;
  _QWORD *v88;
  _QWORD *v89;
  std::string *v90;
  std::string::size_type v91;
  _QWORD *v92;
  _QWORD *v93;
  _QWORD *v94;
  std::string *v95;
  std::string::size_type v96;
  _QWORD *v97;
  _QWORD *v98;
  _QWORD *v99;
  std::string *v100;
  std::string::size_type v101;
  _QWORD *v102;
  _QWORD *v103;
  _QWORD *v104;
  std::string *p_s;
  std::string::size_type v106;
  _QWORD *v107;
  _QWORD *v108;
  _QWORD *v109;
  std::string *v110;
  std::string::size_type v111;
  _QWORD *v112;
  _QWORD *v113;
  _QWORD *v114;
  std::string *v115;
  std::string::size_type v116;
  _QWORD *v117;
  _QWORD *v118;
  _QWORD *v119;
  std::string *v120;
  std::string::size_type v121;
  _QWORD *v122;
  std::string *v123;
  std::string::size_type v124;
  _QWORD *v125;
  _QWORD *v126;
  std::string *v127;
  std::string::size_type v128;
  _QWORD *v129;
  _QWORD *v130;
  _QWORD *v131;
  std::string *v132;
  std::string::size_type v133;
  _QWORD *v134;
  _QWORD *v135;
  _QWORD *v136;
  std::string *v137;
  std::string::size_type v138;
  _QWORD *v139;
  _QWORD *v140;
  _QWORD *v141;
  std::string *v142;
  std::string::size_type v143;
  _QWORD *v144;
  _QWORD *v145;
  _QWORD *v146;
  std::string *v147;
  std::string::size_type v148;
  _QWORD *v149;
  _QWORD *v150;
  _QWORD *v151;
  std::string *v152;
  std::string::size_type v153;
  _QWORD *v154;
  _QWORD *v155;
  _QWORD *v156;
  std::string *v157;
  std::string::size_type v158;
  _QWORD *v159;
  _QWORD *v160;
  std::string *v161;
  std::string::size_type v162;
  _QWORD *v163;
  std::string *v164;
  std::string::size_type v165;
  _QWORD *v166;
  _QWORD *v167;
  std::string *v168;
  std::string::size_type v169;
  _QWORD *v170;
  _QWORD *v171;
  _QWORD *v172;
  std::string *v173;
  std::string::size_type v174;
  _QWORD *v175;
  _QWORD *v176;
  _QWORD *v177;
  std::string *v178;
  std::string::size_type v179;
  _QWORD *v180;
  _QWORD *v181;
  _QWORD *v182;
  std::string *v183;
  std::string::size_type v184;
  _QWORD *v185;
  _QWORD *v186;
  std::string *v187;
  std::string::size_type v188;
  _QWORD *v189;
  _QWORD *v190;
  _QWORD *v191;
  std::string *v192;
  std::string::size_type v193;
  _QWORD *v194;
  _QWORD *v195;
  _QWORD *v196;
  std::string *v197;
  std::string::size_type v198;
  _QWORD *v199;
  std::string *v200;
  std::string::size_type v201;
  _QWORD *v202;
  _QWORD *v203;
  std::string *v204;
  std::string::size_type v205;
  _QWORD *v206;
  _QWORD *v207;
  _QWORD *v208;
  std::string *v209;
  std::string::size_type v210;
  _QWORD *v211;
  _QWORD *v212;
  std::string *v213;
  std::string::size_type v214;
  _QWORD *v215;
  _QWORD *v216;
  std::string *v217;
  std::string::size_type v218;
  _QWORD *v219;
  _QWORD *v220;
  _QWORD *v221;
  std::string *v222;
  std::string::size_type v223;
  _QWORD *v224;
  _QWORD *v225;
  std::string *v226;
  std::string::size_type v227;
  _QWORD *v228;
  _QWORD *v229;
  _QWORD *v230;
  std::string *v231;
  std::string::size_type v232;
  _QWORD *v233;
  _QWORD *v234;
  _QWORD *v235;
  std::string *v236;
  std::string::size_type v237;
  _QWORD *v238;
  _QWORD *v239;
  _QWORD *v240;
  std::string *v241;
  std::string::size_type v242;
  _QWORD *v243;
  _QWORD *v244;
  _QWORD *v245;
  std::string *v246;
  std::string::size_type v247;
  _QWORD *v248;
  _QWORD *v249;
  _QWORD *v250;
  std::string *v251;
  std::string::size_type v252;
  _QWORD *v253;
  _QWORD *v254;
  std::string *v255;
  std::string::size_type v256;
  _QWORD *v257;
  std::string *v258;
  std::string::size_type v259;
  _QWORD *v260;
  _QWORD *v261;
  std::string *v262;
  std::string::size_type v263;
  _QWORD *v264;
  _QWORD *v265;
  _QWORD *v266;
  std::string *v267;
  std::string::size_type v268;
  _QWORD *v269;
  _QWORD *v270;
  _QWORD *v271;
  std::string *v272;
  std::string::size_type v273;
  _QWORD *v274;
  _QWORD *v275;
  _QWORD *v276;
  std::string *v277;
  std::string::size_type v278;
  _QWORD *v279;
  _QWORD *v280;
  void *v281;
  char v282;
  void *v283;
  char v284;
  void *v285;
  char v286;
  void *v287;
  char v288;
  void *v289;
  char v290;
  void *v291;
  char v292;
  void *v293;
  char v294;
  void *v295;
  char v296;
  void *v297;
  char v298;
  void *v299;
  char v300;
  void *v301;
  char v302;
  void *v303;
  char v304;
  void *v305;
  char v306;
  void *v307;
  char v308;
  void *v309;
  char v310;
  void *v311;
  char v312;
  void *v313;
  char v314;
  void *v315;
  char v316;
  void *v317;
  char v318;
  void *v319;
  char v320;
  void *v321;
  char v322;
  void *v323;
  char v324;
  void *v325;
  char v326;
  void *v327;
  char v328;
  void *v329;
  char v330;
  void *v331;
  char v332;
  void *v333;
  char v334;
  void *v335;
  char v336;
  void *v337;
  char v338;
  void *v339;
  char v340;
  void *v341;
  char v342;
  void *v343;
  char v344;
  void *v345;
  char v346;
  void *v347;
  char v348;
  void *v349;
  char v350;
  void *v351;
  char v352;
  void *v353;
  char v354;
  void *v355;
  char v356;
  void *v357;
  char v358;
  void *v359;
  char v360;
  void *v361;
  char v362;
  void *v363;
  char v364;
  void *v365;
  char v366;
  void *v367;
  char v368;
  void *v369;
  char v370;
  void *v371;
  char v372;
  void *v373;
  char v374;
  std::string v375;
  void *v376;
  char v377;
  std::string v378;
  void *v379;
  char v380;
  void *v381;
  char v382;
  std::string v383;
  void *v384;
  char v385;
  std::string v386;
  void *v387;
  char v388;
  void *v389;
  char v390;
  std::string __p;
  void *v392;
  char v393;
  std::string v394;
  void *v395;
  char v396;
  std::string v397;
  void *v398;
  char v399;
  std::string v400;
  void *v401;
  char v402;
  std::string v403;
  void *v404;
  char v405;
  std::string v406;
  std::string __s;
  std::string v408;
  uint64_t v409;

  v409 = *MEMORY[0x24BDAC8D0];
  switch(*(_BYTE *)a3)
  {
    case 1:
      sub_2310FF330(&v323, "subtype");
      profile_decoder::key(&v406);
      if ((v406.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v5 = &v406;
      else
        v5 = (std::string *)v406.__r_.__value_.__r.__words[0];
      if ((v406.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        size = HIBYTE(v406.__r_.__value_.__r.__words[2]);
      else
        size = v406.__r_.__value_.__l.__size_;
      v7 = sub_2310FF468((_QWORD *)(a2 + 16), (uint64_t)v5, size);
      *(_QWORD *)((char *)v7 + *(_QWORD *)(*v7 - 24) + 24) = 10;
      v8 = (_QWORD *)std::ostream::operator<<();
      v9 = sub_2310FF468(v8, (uint64_t)",", 1);
      sub_2310FF330(&v321, "packet-size");
      profile_decoder::key(&v403);
      if ((v403.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v10 = &v403;
      else
        v10 = (std::string *)v403.__r_.__value_.__r.__words[0];
      if ((v403.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v11 = HIBYTE(v403.__r_.__value_.__r.__words[2]);
      else
        v11 = v403.__r_.__value_.__l.__size_;
      v12 = sub_2310FF468(v9, (uint64_t)v10, v11);
      *(_QWORD *)((char *)v12 + *(_QWORD *)(*v12 - 24) + 24) = 10;
      v13 = (_QWORD *)std::ostream::operator<<();
      v14 = sub_2310FF468(v13, (uint64_t)",", 1);
      sub_2310FF330(&v319, "data-length");
      profile_decoder::key(&v400);
      if ((v400.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v15 = &v400;
      else
        v15 = (std::string *)v400.__r_.__value_.__r.__words[0];
      if ((v400.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v16 = HIBYTE(v400.__r_.__value_.__r.__words[2]);
      else
        v16 = v400.__r_.__value_.__l.__size_;
      v17 = sub_2310FF468(v14, (uint64_t)v15, v16);
      *(_QWORD *)((char *)v17 + *(_QWORD *)(*v17 - 24) + 24) = 10;
      v18 = (_QWORD *)std::ostream::operator<<();
      v19 = sub_2310FF468(v18, (uint64_t)",", 1);
      sub_2310FF330(&v317, "data-offset");
      profile_decoder::key(&v397);
      if ((v397.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v20 = &v397;
      else
        v20 = (std::string *)v397.__r_.__value_.__r.__words[0];
      if ((v397.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v21 = HIBYTE(v397.__r_.__value_.__r.__words[2]);
      else
        v21 = v397.__r_.__value_.__l.__size_;
      v22 = sub_2310FF468(v19, (uint64_t)v20, v21);
      *(_QWORD *)((char *)v22 + *(_QWORD *)(*v22 - 24) + 24) = 10;
      v23 = (_QWORD *)std::ostream::operator<<();
      v24 = sub_2310FF468(v23, (uint64_t)",", 1);
      sub_2310FF330(&v315, "raw-data");
      profile_decoder::key(&v394);
      if ((v394.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v25 = &v394;
      else
        v25 = (std::string *)v394.__r_.__value_.__r.__words[0];
      if ((v394.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v26 = HIBYTE(v394.__r_.__value_.__r.__words[2]);
      else
        v26 = v394.__r_.__value_.__l.__size_;
      v27 = (profile_decoder *)sub_2310FF468(v24, (uint64_t)v25, v26);
      v28 = v27;
      *(_QWORD *)((char *)v27 + *(_QWORD *)(*(_QWORD *)v27 - 24) + 24) = 10;
      if (*(unsigned __int16 *)(a3 + 20) >= 0x18u)
        v29 = 24;
      else
        v29 = *(unsigned __int16 *)(a3 + 20);
      profile_decoder::dump(v27, (const void *)(a3 + 24), v29);
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        p_p = &__p;
      else
        p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v31 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
      else
        v31 = __p.__r_.__value_.__l.__size_;
      v32 = sub_2310FF468(v28, (uint64_t)p_p, v31);
      sub_2310FF468(v32, (uint64_t)",", 1);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
      if (SHIBYTE(v394.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v394.__r_.__value_.__l.__data_);
      if (v316 < 0)
        operator delete(v315);
      if (SHIBYTE(v397.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v397.__r_.__value_.__l.__data_);
      if (v318 < 0)
        operator delete(v317);
      if (SHIBYTE(v400.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v400.__r_.__value_.__l.__data_);
      if (v320 < 0)
        operator delete(v319);
      if (SHIBYTE(v403.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v403.__r_.__value_.__l.__data_);
      if (v322 < 0)
        operator delete(v321);
      if (SHIBYTE(v406.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v406.__r_.__value_.__l.__data_);
      if (v324 < 0)
      {
        v33 = v323;
        goto LABEL_601;
      }
      break;
    case 2:
      sub_2310FF330(&v313, "subtype");
      profile_decoder::key(&v406);
      if ((v406.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v34 = &v406;
      else
        v34 = (std::string *)v406.__r_.__value_.__r.__words[0];
      if ((v406.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v35 = HIBYTE(v406.__r_.__value_.__r.__words[2]);
      else
        v35 = v406.__r_.__value_.__l.__size_;
      v36 = sub_2310FF468((_QWORD *)(a2 + 16), (uint64_t)v34, v35);
      *(_QWORD *)((char *)v36 + *(_QWORD *)(*v36 - 24) + 24) = 10;
      v37 = (_QWORD *)std::ostream::operator<<();
      v38 = sub_2310FF468(v37, (uint64_t)",", 1);
      sub_2310FF330(&v311, "packet-size");
      profile_decoder::key(&v403);
      if ((v403.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v39 = &v403;
      else
        v39 = (std::string *)v403.__r_.__value_.__r.__words[0];
      if ((v403.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v40 = HIBYTE(v403.__r_.__value_.__r.__words[2]);
      else
        v40 = v403.__r_.__value_.__l.__size_;
      v41 = sub_2310FF468(v38, (uint64_t)v39, v40);
      *(_QWORD *)((char *)v41 + *(_QWORD *)(*v41 - 24) + 24) = 10;
      v42 = (_QWORD *)std::ostream::operator<<();
      v43 = sub_2310FF468(v42, (uint64_t)",", 1);
      sub_2310FF330(&v309, "data-length");
      profile_decoder::key(&v400);
      if ((v400.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v44 = &v400;
      else
        v44 = (std::string *)v400.__r_.__value_.__r.__words[0];
      if ((v400.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v45 = HIBYTE(v400.__r_.__value_.__r.__words[2]);
      else
        v45 = v400.__r_.__value_.__l.__size_;
      v46 = sub_2310FF468(v43, (uint64_t)v44, v45);
      *(_QWORD *)((char *)v46 + *(_QWORD *)(*v46 - 24) + 24) = 10;
      v47 = (_QWORD *)std::ostream::operator<<();
      v48 = sub_2310FF468(v47, (uint64_t)",", 1);
      sub_2310FF330(&v307, "data-offset");
      profile_decoder::key(&v397);
      if ((v397.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v49 = &v397;
      else
        v49 = (std::string *)v397.__r_.__value_.__r.__words[0];
      if ((v397.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v50 = HIBYTE(v397.__r_.__value_.__r.__words[2]);
      else
        v50 = v397.__r_.__value_.__l.__size_;
      v51 = sub_2310FF468(v48, (uint64_t)v49, v50);
      *(_QWORD *)((char *)v51 + *(_QWORD *)(*v51 - 24) + 24) = 10;
      v52 = (_QWORD *)std::ostream::operator<<();
      v53 = sub_2310FF468(v52, (uint64_t)",", 1);
      sub_2310FF330(&v305, "raw-data");
      profile_decoder::key(&v394);
      if ((v394.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v54 = &v394;
      else
        v54 = (std::string *)v394.__r_.__value_.__r.__words[0];
      if ((v394.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v55 = HIBYTE(v394.__r_.__value_.__r.__words[2]);
      else
        v55 = v394.__r_.__value_.__l.__size_;
      v56 = (profile_decoder *)sub_2310FF468(v53, (uint64_t)v54, v55);
      *(_QWORD *)((char *)v56 + *(_QWORD *)(*(_QWORD *)v56 - 24) + 24) = 10;
      profile_decoder::dump(v56, (const void *)(a3 + 18), 30);
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v57 = &__p;
      else
        v57 = (std::string *)__p.__r_.__value_.__r.__words[0];
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v58 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
      else
        v58 = __p.__r_.__value_.__l.__size_;
      v59 = sub_2310FF468(v56, (uint64_t)v57, v58);
      sub_2310FF468(v59, (uint64_t)",", 1);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
      if (SHIBYTE(v394.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v394.__r_.__value_.__l.__data_);
      if (v306 < 0)
        operator delete(v305);
      if (SHIBYTE(v397.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v397.__r_.__value_.__l.__data_);
      if (v308 < 0)
        operator delete(v307);
      if (SHIBYTE(v400.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v400.__r_.__value_.__l.__data_);
      if (v310 < 0)
        operator delete(v309);
      if (SHIBYTE(v403.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v403.__r_.__value_.__l.__data_);
      if (v312 < 0)
        operator delete(v311);
      if (SHIBYTE(v406.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v406.__r_.__value_.__l.__data_);
      if (v314 < 0)
      {
        v33 = v313;
        goto LABEL_601;
      }
      break;
    case 3:
      sub_2310FF330(&v404, "arg1");
      profile_decoder::key(&v406);
      if ((v406.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v60 = &v406;
      else
        v60 = (std::string *)v406.__r_.__value_.__r.__words[0];
      if ((v406.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v61 = HIBYTE(v406.__r_.__value_.__r.__words[2]);
      else
        v61 = v406.__r_.__value_.__l.__size_;
      v62 = sub_2310FF468((_QWORD *)(a2 + 16), (uint64_t)v60, v61);
      *(_QWORD *)((char *)v62 + *(_QWORD *)(*v62 - 24) + 24) = 10;
      v63 = (_QWORD *)std::ostream::operator<<();
      v64 = sub_2310FF468(v63, (uint64_t)",", 1);
      sub_2310FF330(&v401, "arg2");
      profile_decoder::key(&v403);
      if ((v403.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v65 = &v403;
      else
        v65 = (std::string *)v403.__r_.__value_.__r.__words[0];
      if ((v403.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v66 = HIBYTE(v403.__r_.__value_.__r.__words[2]);
      else
        v66 = v403.__r_.__value_.__l.__size_;
      v67 = sub_2310FF468(v64, (uint64_t)v65, v66);
      *(_QWORD *)((char *)v67 + *(_QWORD *)(*v67 - 24) + 24) = 10;
      v68 = (_QWORD *)std::ostream::operator<<();
      v69 = sub_2310FF468(v68, (uint64_t)",", 1);
      sub_2310FF330(&v398, "arg3");
      profile_decoder::key(&v400);
      if ((v400.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v70 = &v400;
      else
        v70 = (std::string *)v400.__r_.__value_.__r.__words[0];
      if ((v400.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v71 = HIBYTE(v400.__r_.__value_.__r.__words[2]);
      else
        v71 = v400.__r_.__value_.__l.__size_;
      v72 = sub_2310FF468(v69, (uint64_t)v70, v71);
      *(_QWORD *)((char *)v72 + *(_QWORD *)(*v72 - 24) + 24) = 10;
      v73 = (_QWORD *)std::ostream::operator<<();
      v74 = sub_2310FF468(v73, (uint64_t)",", 1);
      sub_2310FF330(&v395, "arg4");
      profile_decoder::key(&v397);
      if ((v397.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v75 = &v397;
      else
        v75 = (std::string *)v397.__r_.__value_.__r.__words[0];
      if ((v397.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v76 = HIBYTE(v397.__r_.__value_.__r.__words[2]);
      else
        v76 = v397.__r_.__value_.__l.__size_;
      v77 = sub_2310FF468(v74, (uint64_t)v75, v76);
      *(_QWORD *)((char *)v77 + *(_QWORD *)(*v77 - 24) + 24) = 10;
      v78 = (_QWORD *)std::ostream::operator<<();
      v79 = sub_2310FF468(v78, (uint64_t)",", 1);
      sub_2310FF330(&v392, "arg5");
      profile_decoder::key(&v394);
      if ((v394.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v80 = &v394;
      else
        v80 = (std::string *)v394.__r_.__value_.__r.__words[0];
      if ((v394.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v81 = HIBYTE(v394.__r_.__value_.__r.__words[2]);
      else
        v81 = v394.__r_.__value_.__l.__size_;
      v82 = sub_2310FF468(v79, (uint64_t)v80, v81);
      *(_QWORD *)((char *)v82 + *(_QWORD *)(*v82 - 24) + 24) = 10;
      v83 = (_QWORD *)std::ostream::operator<<();
      v84 = sub_2310FF468(v83, (uint64_t)",", 1);
      sub_2310FF330(&v389, "arg6");
      profile_decoder::key(&__p);
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v85 = &__p;
      else
        v85 = (std::string *)__p.__r_.__value_.__r.__words[0];
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v86 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
      else
        v86 = __p.__r_.__value_.__l.__size_;
      v87 = sub_2310FF468(v84, (uint64_t)v85, v86);
      *(_QWORD *)((char *)v87 + *(_QWORD *)(*v87 - 24) + 24) = 10;
      v88 = (_QWORD *)std::ostream::operator<<();
      v89 = sub_2310FF468(v88, (uint64_t)",", 1);
      *(_DWORD *)((char *)v89 + *(_QWORD *)(*v89 - 24) + 8) = *(_DWORD *)((_BYTE *)v89 + *(_QWORD *)(*v89 - 24) + 8) & 0xFFFFFFB5 | 8;
      sub_2310FF330(&v387, "xarg1");
      profile_decoder::key(&v408);
      if ((v408.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v90 = &v408;
      else
        v90 = (std::string *)v408.__r_.__value_.__r.__words[0];
      if ((v408.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v91 = HIBYTE(v408.__r_.__value_.__r.__words[2]);
      else
        v91 = v408.__r_.__value_.__l.__size_;
      v92 = sub_2310FF468(v89, (uint64_t)v90, v91);
      *(_QWORD *)((char *)v92 + *(_QWORD *)(*v92 - 24) + 24) = 10;
      sub_2310FF468(v92, (uint64_t)"'", 1);
      v93 = (_QWORD *)std::ostream::operator<<();
      v94 = sub_2310FF468(v93, (uint64_t)"',", 2);
      sub_2310FF330(&v384, "xarg2");
      profile_decoder::key(&v386);
      if ((v386.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v95 = &v386;
      else
        v95 = (std::string *)v386.__r_.__value_.__r.__words[0];
      if ((v386.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v96 = HIBYTE(v386.__r_.__value_.__r.__words[2]);
      else
        v96 = v386.__r_.__value_.__l.__size_;
      v97 = sub_2310FF468(v94, (uint64_t)v95, v96);
      *(_QWORD *)((char *)v97 + *(_QWORD *)(*v97 - 24) + 24) = 10;
      sub_2310FF468(v97, (uint64_t)"'", 1);
      v98 = (_QWORD *)std::ostream::operator<<();
      v99 = sub_2310FF468(v98, (uint64_t)"',", 2);
      sub_2310FF330(&v381, "xarg3");
      profile_decoder::key(&v383);
      if ((v383.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v100 = &v383;
      else
        v100 = (std::string *)v383.__r_.__value_.__r.__words[0];
      if ((v383.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v101 = HIBYTE(v383.__r_.__value_.__r.__words[2]);
      else
        v101 = v383.__r_.__value_.__l.__size_;
      v102 = sub_2310FF468(v99, (uint64_t)v100, v101);
      *(_QWORD *)((char *)v102 + *(_QWORD *)(*v102 - 24) + 24) = 10;
      sub_2310FF468(v102, (uint64_t)"'", 1);
      v103 = (_QWORD *)std::ostream::operator<<();
      v104 = sub_2310FF468(v103, (uint64_t)"',", 2);
      sub_2310FF330(&v379, "xarg4");
      profile_decoder::key(&__s);
      if ((__s.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        p_s = &__s;
      else
        p_s = (std::string *)__s.__r_.__value_.__r.__words[0];
      if ((__s.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v106 = HIBYTE(__s.__r_.__value_.__r.__words[2]);
      else
        v106 = __s.__r_.__value_.__l.__size_;
      v107 = sub_2310FF468(v104, (uint64_t)p_s, v106);
      *(_QWORD *)((char *)v107 + *(_QWORD *)(*v107 - 24) + 24) = 10;
      sub_2310FF468(v107, (uint64_t)"'", 1);
      v108 = (_QWORD *)std::ostream::operator<<();
      v109 = sub_2310FF468(v108, (uint64_t)"',", 2);
      sub_2310FF330(&v376, "xarg5");
      profile_decoder::key(&v378);
      if ((v378.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v110 = &v378;
      else
        v110 = (std::string *)v378.__r_.__value_.__r.__words[0];
      if ((v378.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v111 = HIBYTE(v378.__r_.__value_.__r.__words[2]);
      else
        v111 = v378.__r_.__value_.__l.__size_;
      v112 = sub_2310FF468(v109, (uint64_t)v110, v111);
      *(_QWORD *)((char *)v112 + *(_QWORD *)(*v112 - 24) + 24) = 10;
      sub_2310FF468(v112, (uint64_t)"'", 1);
      v113 = (_QWORD *)std::ostream::operator<<();
      v114 = sub_2310FF468(v113, (uint64_t)"',", 2);
      sub_2310FF330(&v373, "xarg6");
      profile_decoder::key(&v375);
      if ((v375.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v115 = &v375;
      else
        v115 = (std::string *)v375.__r_.__value_.__r.__words[0];
      if ((v375.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v116 = HIBYTE(v375.__r_.__value_.__r.__words[2]);
      else
        v116 = v375.__r_.__value_.__l.__size_;
      v117 = sub_2310FF468(v114, (uint64_t)v115, v116);
      *(_QWORD *)((char *)v117 + *(_QWORD *)(*v117 - 24) + 24) = 10;
      sub_2310FF468(v117, (uint64_t)"'", 1);
      v118 = (_QWORD *)std::ostream::operator<<();
      v119 = sub_2310FF468(v118, (uint64_t)"',", 2);
      *(_DWORD *)((char *)v119 + *(_QWORD *)(*v119 - 24) + 8) = *(_DWORD *)((_BYTE *)v119
                                                                            + *(_QWORD *)(*v119 - 24)
                                                                            + 8) & 0xFFFFFFB5 | 2;
      if (SHIBYTE(v375.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v375.__r_.__value_.__l.__data_);
      if (v374 < 0)
        operator delete(v373);
      if (SHIBYTE(v378.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v378.__r_.__value_.__l.__data_);
      if (v377 < 0)
        operator delete(v376);
      if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__s.__r_.__value_.__l.__data_);
      if (v380 < 0)
        operator delete(v379);
      if (SHIBYTE(v383.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v383.__r_.__value_.__l.__data_);
      if (v382 < 0)
        operator delete(v381);
      if (SHIBYTE(v386.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v386.__r_.__value_.__l.__data_);
      if (v385 < 0)
        operator delete(v384);
      if (SHIBYTE(v408.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v408.__r_.__value_.__l.__data_);
      if (v388 < 0)
        operator delete(v387);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
      if (v390 < 0)
        operator delete(v389);
      if (SHIBYTE(v394.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v394.__r_.__value_.__l.__data_);
      if (v393 < 0)
        operator delete(v392);
      if (SHIBYTE(v397.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v397.__r_.__value_.__l.__data_);
      if (v396 < 0)
        operator delete(v395);
      if (SHIBYTE(v400.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v400.__r_.__value_.__l.__data_);
      if (v399 < 0)
        operator delete(v398);
      if (SHIBYTE(v403.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v403.__r_.__value_.__l.__data_);
      if (v402 < 0)
        operator delete(v401);
      if (SHIBYTE(v406.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v406.__r_.__value_.__l.__data_);
      if (v405 < 0)
      {
        v33 = v404;
        goto LABEL_601;
      }
      break;
    case 4:
      sub_2310FF330(&v371, "trigger");
      profile_decoder::key(&v406);
      if ((v406.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v213 = &v406;
      else
        v213 = (std::string *)v406.__r_.__value_.__r.__words[0];
      if ((v406.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v214 = HIBYTE(v406.__r_.__value_.__r.__words[2]);
      else
        v214 = v406.__r_.__value_.__l.__size_;
      sub_2310FF468((_QWORD *)(a2 + 16), (uint64_t)v213, v214);
      v215 = (_QWORD *)std::ostream::operator<<();
      v216 = sub_2310FF468(v215, (uint64_t)",", 1);
      sub_2310FF330(&v369, "thread-id");
      profile_decoder::key(&v403);
      if ((v403.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v217 = &v403;
      else
        v217 = (std::string *)v403.__r_.__value_.__r.__words[0];
      if ((v403.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v218 = HIBYTE(v403.__r_.__value_.__r.__words[2]);
      else
        v218 = v403.__r_.__value_.__l.__size_;
      v219 = sub_2310FF468(v216, (uint64_t)v217, v218);
      *(_QWORD *)((char *)v219 + *(_QWORD *)(*v219 - 24) + 24) = 10;
      v220 = (_QWORD *)std::ostream::operator<<();
      v221 = sub_2310FF468(v220, (uint64_t)",", 1);
      sub_2310FF330(&v367, "arg");
      profile_decoder::key(&v400);
      if ((v400.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v222 = &v400;
      else
        v222 = (std::string *)v400.__r_.__value_.__r.__words[0];
      if ((v400.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v223 = HIBYTE(v400.__r_.__value_.__r.__words[2]);
      else
        v223 = v400.__r_.__value_.__l.__size_;
      v224 = sub_2310FF468(v221, (uint64_t)v222, v223);
      *(_QWORD *)((char *)v224 + *(_QWORD *)(*v224 - 24) + 24) = 10;
      v225 = (_QWORD *)std::ostream::operator<<();
      sub_2310FF468(v225, (uint64_t)",", 1);
      if (SHIBYTE(v400.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v400.__r_.__value_.__l.__data_);
      if (v368 < 0)
        operator delete(v367);
      if (SHIBYTE(v403.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v403.__r_.__value_.__l.__data_);
      if (v370 < 0)
        operator delete(v369);
      if (SHIBYTE(v406.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v406.__r_.__value_.__l.__data_);
      if (v372 < 0)
      {
        v33 = v371;
        goto LABEL_601;
      }
      break;
    case 5:
      sub_2310FF330(&v335, "function-id");
      profile_decoder::key(&v406);
      if ((v406.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v226 = &v406;
      else
        v226 = (std::string *)v406.__r_.__value_.__r.__words[0];
      if ((v406.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v227 = HIBYTE(v406.__r_.__value_.__r.__words[2]);
      else
        v227 = v406.__r_.__value_.__l.__size_;
      v228 = sub_2310FF468((_QWORD *)(a2 + 16), (uint64_t)v226, v227);
      *(_QWORD *)((char *)v228 + *(_QWORD *)(*v228 - 24) + 24) = 10;
      v229 = (_QWORD *)std::ostream::operator<<();
      v230 = sub_2310FF468(v229, (uint64_t)",", 1);
      sub_2310FF330(&v333, "extra-id");
      profile_decoder::key(&v403);
      if ((v403.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v231 = &v403;
      else
        v231 = (std::string *)v403.__r_.__value_.__r.__words[0];
      if ((v403.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v232 = HIBYTE(v403.__r_.__value_.__r.__words[2]);
      else
        v232 = v403.__r_.__value_.__l.__size_;
      v233 = sub_2310FF468(v230, (uint64_t)v231, v232);
      *(_QWORD *)((char *)v233 + *(_QWORD *)(*v233 - 24) + 24) = 10;
      v234 = (_QWORD *)std::ostream::operator<<();
      v235 = sub_2310FF468(v234, (uint64_t)",", 1);
      sub_2310FF330(&v331, "thread-id");
      profile_decoder::key(&v400);
      if ((v400.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v236 = &v400;
      else
        v236 = (std::string *)v400.__r_.__value_.__r.__words[0];
      if ((v400.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v237 = HIBYTE(v400.__r_.__value_.__r.__words[2]);
      else
        v237 = v400.__r_.__value_.__l.__size_;
      v238 = sub_2310FF468(v235, (uint64_t)v236, v237);
      *(_QWORD *)((char *)v238 + *(_QWORD *)(*v238 - 24) + 24) = 10;
      v239 = (_QWORD *)std::ostream::operator<<();
      v240 = sub_2310FF468(v239, (uint64_t)",", 1);
      sub_2310FF330(&v329, "duration");
      profile_decoder::key(&v397);
      if ((v397.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v241 = &v397;
      else
        v241 = (std::string *)v397.__r_.__value_.__r.__words[0];
      if ((v397.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v242 = HIBYTE(v397.__r_.__value_.__r.__words[2]);
      else
        v242 = v397.__r_.__value_.__l.__size_;
      v243 = sub_2310FF468(v240, (uint64_t)v241, v242);
      *(_QWORD *)((char *)v243 + *(_QWORD *)(*v243 - 24) + 24) = 10;
      v244 = (_QWORD *)std::ostream::operator<<();
      v245 = sub_2310FF468(v244, (uint64_t)",", 1);
      sub_2310FF330(&v327, "depth");
      profile_decoder::key(&v394);
      if ((v394.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v246 = &v394;
      else
        v246 = (std::string *)v394.__r_.__value_.__r.__words[0];
      if ((v394.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v247 = HIBYTE(v394.__r_.__value_.__r.__words[2]);
      else
        v247 = v394.__r_.__value_.__l.__size_;
      v248 = sub_2310FF468(v245, (uint64_t)v246, v247);
      *(_QWORD *)((char *)v248 + *(_QWORD *)(*v248 - 24) + 24) = 10;
      v249 = (_QWORD *)std::ostream::operator<<();
      v250 = sub_2310FF468(v249, (uint64_t)",", 1);
      sub_2310FF330(&v325, "thread_duration");
      profile_decoder::key(&__p);
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v251 = &__p;
      else
        v251 = (std::string *)__p.__r_.__value_.__r.__words[0];
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v252 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
      else
        v252 = __p.__r_.__value_.__l.__size_;
      v253 = sub_2310FF468(v250, (uint64_t)v251, v252);
      *(_QWORD *)((char *)v253 + *(_QWORD *)(*v253 - 24) + 24) = 10;
      v254 = (_QWORD *)std::ostream::operator<<();
      sub_2310FF468(v254, (uint64_t)",", 1);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
      if (v326 < 0)
        operator delete(v325);
      if (SHIBYTE(v394.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v394.__r_.__value_.__l.__data_);
      if (v328 < 0)
        operator delete(v327);
      if (SHIBYTE(v397.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v397.__r_.__value_.__l.__data_);
      if (v330 < 0)
        operator delete(v329);
      if (SHIBYTE(v400.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v400.__r_.__value_.__l.__data_);
      if (v332 < 0)
        operator delete(v331);
      if (SHIBYTE(v403.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v403.__r_.__value_.__l.__data_);
      if (v334 < 0)
        operator delete(v333);
      if (SHIBYTE(v406.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v406.__r_.__value_.__l.__data_);
      if (v336 < 0)
      {
        v33 = v335;
        goto LABEL_601;
      }
      break;
    case 8:
      __s.__r_.__value_.__s.__data_[12] = 0;
      __s.__r_.__value_.__r.__words[0] = *(_QWORD *)(a3 + 35);
      LODWORD(__s.__r_.__value_.__r.__words[1]) = *(_DWORD *)(a3 + 43);
      sub_2310FF330(&v365, "name");
      profile_decoder::key(&v406);
      if ((v406.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v120 = &v406;
      else
        v120 = (std::string *)v406.__r_.__value_.__r.__words[0];
      if ((v406.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v121 = HIBYTE(v406.__r_.__value_.__r.__words[2]);
      else
        v121 = v406.__r_.__value_.__l.__size_;
      v122 = sub_2310FF468((_QWORD *)(a2 + 16), (uint64_t)v120, v121);
      *(_QWORD *)((char *)v122 + *(_QWORD *)(*v122 - 24) + 24) = 16;
      sub_2310FF330(&v363, (char *)&__s);
      profile_decoder::str(&v403);
      if ((v403.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v123 = &v403;
      else
        v123 = (std::string *)v403.__r_.__value_.__r.__words[0];
      if ((v403.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v124 = HIBYTE(v403.__r_.__value_.__r.__words[2]);
      else
        v124 = v403.__r_.__value_.__l.__size_;
      v125 = sub_2310FF468(v122, (uint64_t)v123, v124);
      v126 = sub_2310FF468(v125, (uint64_t)",", 1);
      sub_2310FF330(&v361, "report-interval");
      profile_decoder::key(&v400);
      if ((v400.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v127 = &v400;
      else
        v127 = (std::string *)v400.__r_.__value_.__r.__words[0];
      if ((v400.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v128 = HIBYTE(v400.__r_.__value_.__r.__words[2]);
      else
        v128 = v400.__r_.__value_.__l.__size_;
      v129 = sub_2310FF468(v126, (uint64_t)v127, v128);
      *(_QWORD *)((char *)v129 + *(_QWORD *)(*v129 - 24) + 24) = 10;
      v130 = (_QWORD *)std::ostream::operator<<();
      v131 = sub_2310FF468(v130, (uint64_t)",", 1);
      sub_2310FF330(&v359, "batch-interval");
      profile_decoder::key(&v397);
      if ((v397.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v132 = &v397;
      else
        v132 = (std::string *)v397.__r_.__value_.__r.__words[0];
      if ((v397.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v133 = HIBYTE(v397.__r_.__value_.__r.__words[2]);
      else
        v133 = v397.__r_.__value_.__l.__size_;
      v134 = sub_2310FF468(v131, (uint64_t)v132, v133);
      *(_QWORD *)((char *)v134 + *(_QWORD *)(*v134 - 24) + 24) = 10;
      v135 = (_QWORD *)std::ostream::operator<<();
      v136 = sub_2310FF468(v135, (uint64_t)",", 1);
      sub_2310FF330(&v357, "threshold");
      profile_decoder::key(&v394);
      if ((v394.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v137 = &v394;
      else
        v137 = (std::string *)v394.__r_.__value_.__r.__words[0];
      if ((v394.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v138 = HIBYTE(v394.__r_.__value_.__r.__words[2]);
      else
        v138 = v394.__r_.__value_.__l.__size_;
      v139 = sub_2310FF468(v136, (uint64_t)v137, v138);
      *(_QWORD *)((char *)v139 + *(_QWORD *)(*v139 - 24) + 24) = 10;
      v140 = (_QWORD *)std::ostream::operator<<();
      v141 = sub_2310FF468(v140, (uint64_t)",", 1);
      sub_2310FF330(&v355, "time-limit");
      profile_decoder::key(&__p);
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v142 = &__p;
      else
        v142 = (std::string *)__p.__r_.__value_.__r.__words[0];
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v143 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
      else
        v143 = __p.__r_.__value_.__l.__size_;
      v144 = sub_2310FF468(v141, (uint64_t)v142, v143);
      *(_QWORD *)((char *)v144 + *(_QWORD *)(*v144 - 24) + 24) = 10;
      v145 = (_QWORD *)std::ostream::operator<<();
      v146 = sub_2310FF468(v145, (uint64_t)",", 1);
      sub_2310FF330(&v353, "connected");
      profile_decoder::key(&v408);
      if ((v408.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v147 = &v408;
      else
        v147 = (std::string *)v408.__r_.__value_.__r.__words[0];
      if ((v408.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v148 = HIBYTE(v408.__r_.__value_.__r.__words[2]);
      else
        v148 = v408.__r_.__value_.__l.__size_;
      v149 = sub_2310FF468(v146, (uint64_t)v147, v148);
      *(_QWORD *)((char *)v149 + *(_QWORD *)(*v149 - 24) + 24) = 10;
      v150 = (_QWORD *)std::ostream::operator<<();
      v151 = sub_2310FF468(v150, (uint64_t)",", 1);
      sub_2310FF330(&v351, "decimation");
      profile_decoder::key(&v386);
      if ((v386.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v152 = &v386;
      else
        v152 = (std::string *)v386.__r_.__value_.__r.__words[0];
      if ((v386.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v153 = HIBYTE(v386.__r_.__value_.__r.__words[2]);
      else
        v153 = v386.__r_.__value_.__l.__size_;
      v154 = sub_2310FF468(v151, (uint64_t)v152, v153);
      *(_QWORD *)((char *)v154 + *(_QWORD *)(*v154 - 24) + 24) = 10;
      v155 = (_QWORD *)std::ostream::operator<<();
      v156 = sub_2310FF468(v155, (uint64_t)",", 1);
      sub_2310FF330(&v349, "gyroPowerMode");
      profile_decoder::key(&v383);
      if ((v383.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v157 = &v383;
      else
        v157 = (std::string *)v383.__r_.__value_.__r.__words[0];
      if ((v383.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v158 = HIBYTE(v383.__r_.__value_.__r.__words[2]);
      else
        v158 = v383.__r_.__value_.__l.__size_;
      v159 = sub_2310FF468(v156, (uint64_t)v157, v158);
      *(_QWORD *)((char *)v159 + *(_QWORD *)(*v159 - 24) + 24) = 10;
      v160 = (_QWORD *)std::ostream::operator<<();
      sub_2310FF468(v160, (uint64_t)",", 1);
      if (SHIBYTE(v383.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v383.__r_.__value_.__l.__data_);
      if (v350 < 0)
        operator delete(v349);
      if (SHIBYTE(v386.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v386.__r_.__value_.__l.__data_);
      if (v352 < 0)
        operator delete(v351);
      if (SHIBYTE(v408.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v408.__r_.__value_.__l.__data_);
      if (v354 < 0)
        operator delete(v353);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
      if (v356 < 0)
        operator delete(v355);
      if (SHIBYTE(v394.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v394.__r_.__value_.__l.__data_);
      if (v358 < 0)
        operator delete(v357);
      if (SHIBYTE(v397.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v397.__r_.__value_.__l.__data_);
      if (v360 < 0)
        operator delete(v359);
      if (SHIBYTE(v400.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v400.__r_.__value_.__l.__data_);
      if (v362 < 0)
        operator delete(v361);
      if (SHIBYTE(v403.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v403.__r_.__value_.__l.__data_);
      if (v364 < 0)
        operator delete(v363);
      if (SHIBYTE(v406.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v406.__r_.__value_.__l.__data_);
      if (v366 < 0)
      {
        v33 = v365;
        goto LABEL_601;
      }
      break;
    case 9:
      v408.__r_.__value_.__s.__data_[16] = 0;
      *(_OWORD *)&v408.__r_.__value_.__l.__data_ = *(_OWORD *)(a3 + 32);
      sub_2310FF330(&v303, "function");
      profile_decoder::key(&v406);
      if ((v406.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v161 = &v406;
      else
        v161 = (std::string *)v406.__r_.__value_.__r.__words[0];
      if ((v406.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v162 = HIBYTE(v406.__r_.__value_.__r.__words[2]);
      else
        v162 = v406.__r_.__value_.__l.__size_;
      v163 = sub_2310FF468((_QWORD *)(a2 + 16), (uint64_t)v161, v162);
      *(_QWORD *)((char *)v163 + *(_QWORD *)(*v163 - 24) + 24) = 10;
      sub_2310FF330(&v301, (char *)&v408);
      profile_decoder::str(&v403);
      if ((v403.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v164 = &v403;
      else
        v164 = (std::string *)v403.__r_.__value_.__r.__words[0];
      if ((v403.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v165 = HIBYTE(v403.__r_.__value_.__r.__words[2]);
      else
        v165 = v403.__r_.__value_.__l.__size_;
      v166 = sub_2310FF468(v163, (uint64_t)v164, v165);
      v167 = sub_2310FF468(v166, (uint64_t)",", 1);
      sub_2310FF330(&v299, "arg");
      profile_decoder::key(&v400);
      if ((v400.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v168 = &v400;
      else
        v168 = (std::string *)v400.__r_.__value_.__r.__words[0];
      if ((v400.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v169 = HIBYTE(v400.__r_.__value_.__r.__words[2]);
      else
        v169 = v400.__r_.__value_.__l.__size_;
      v170 = sub_2310FF468(v167, (uint64_t)v168, v169);
      *(_QWORD *)((char *)v170 + *(_QWORD *)(*v170 - 24) + 24) = 10;
      v171 = (_QWORD *)std::ostream::operator<<();
      v172 = sub_2310FF468(v171, (uint64_t)",", 1);
      sub_2310FF330(&v297, "task");
      profile_decoder::key(&v397);
      if ((v397.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v173 = &v397;
      else
        v173 = (std::string *)v397.__r_.__value_.__r.__words[0];
      if ((v397.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v174 = HIBYTE(v397.__r_.__value_.__r.__words[2]);
      else
        v174 = v397.__r_.__value_.__l.__size_;
      v175 = sub_2310FF468(v172, (uint64_t)v173, v174);
      *(_QWORD *)((char *)v175 + *(_QWORD *)(*v175 - 24) + 24) = 10;
      v176 = (_QWORD *)std::ostream::operator<<();
      v177 = sub_2310FF468(v176, (uint64_t)",", 1);
      sub_2310FF330(&v295, "thread");
      profile_decoder::key(&v394);
      if ((v394.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v178 = &v394;
      else
        v178 = (std::string *)v394.__r_.__value_.__r.__words[0];
      if ((v394.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v179 = HIBYTE(v394.__r_.__value_.__r.__words[2]);
      else
        v179 = v394.__r_.__value_.__l.__size_;
      v180 = sub_2310FF468(v177, (uint64_t)v178, v179);
      *(_QWORD *)((char *)v180 + *(_QWORD *)(*v180 - 24) + 24) = 10;
      v181 = (_QWORD *)std::ostream::operator<<();
      v182 = sub_2310FF468(v181, (uint64_t)",", 1);
      sub_2310FF330(&v293, "duration");
      profile_decoder::key(&__p);
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v183 = &__p;
      else
        v183 = (std::string *)__p.__r_.__value_.__r.__words[0];
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v184 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
      else
        v184 = __p.__r_.__value_.__l.__size_;
      v185 = sub_2310FF468(v182, (uint64_t)v183, v184);
      *(_QWORD *)((char *)v185 + *(_QWORD *)(*v185 - 24) + 24) = 10;
      v186 = (_QWORD *)std::ostream::operator<<();
      sub_2310FF468(v186, (uint64_t)",", 1);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
      if (v294 < 0)
        operator delete(v293);
      if (SHIBYTE(v394.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v394.__r_.__value_.__l.__data_);
      if (v296 < 0)
        operator delete(v295);
      if (SHIBYTE(v397.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v397.__r_.__value_.__l.__data_);
      if (v298 < 0)
        operator delete(v297);
      if (SHIBYTE(v400.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v400.__r_.__value_.__l.__data_);
      if (v300 < 0)
        operator delete(v299);
      if (SHIBYTE(v403.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v403.__r_.__value_.__l.__data_);
      if (v302 < 0)
        operator delete(v301);
      if (SHIBYTE(v406.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v406.__r_.__value_.__l.__data_);
      if (v304 < 0)
      {
        v33 = v303;
        goto LABEL_601;
      }
      break;
    case 0xB:
      v406.__r_.__value_.__r.__words[0] = *(_QWORD *)(a3 + 24);
      sub_2310FF330(&v291, "global-id");
      profile_decoder::key(&v403);
      if ((v403.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v187 = &v403;
      else
        v187 = (std::string *)v403.__r_.__value_.__r.__words[0];
      if ((v403.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v188 = HIBYTE(v403.__r_.__value_.__r.__words[2]);
      else
        v188 = v403.__r_.__value_.__l.__size_;
      v189 = sub_2310FF468((_QWORD *)(a2 + 16), (uint64_t)v187, v188);
      *(_QWORD *)((char *)v189 + *(_QWORD *)(*v189 - 24) + 24) = 10;
      v190 = (_QWORD *)std::ostream::operator<<();
      v191 = sub_2310FF468(v190, (uint64_t)",", 1);
      sub_2310FF330(&v289, "entry-id");
      profile_decoder::key(&v400);
      if ((v400.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v192 = &v400;
      else
        v192 = (std::string *)v400.__r_.__value_.__r.__words[0];
      if ((v400.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v193 = HIBYTE(v400.__r_.__value_.__r.__words[2]);
      else
        v193 = v400.__r_.__value_.__l.__size_;
      v194 = sub_2310FF468(v191, (uint64_t)v192, v193);
      *(_QWORD *)((char *)v194 + *(_QWORD *)(*v194 - 24) + 24) = 10;
      v195 = (_QWORD *)std::ostream::operator<<();
      v196 = sub_2310FF468(v195, (uint64_t)",", 1);
      sub_2310FF330(&v287, "entry");
      profile_decoder::key(&v397);
      if ((v397.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v197 = &v397;
      else
        v197 = (std::string *)v397.__r_.__value_.__r.__words[0];
      if ((v397.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v198 = HIBYTE(v397.__r_.__value_.__r.__words[2]);
      else
        v198 = v397.__r_.__value_.__l.__size_;
      v199 = sub_2310FF468(v196, (uint64_t)v197, v198);
      *(_QWORD *)((char *)v199 + *(_QWORD *)(*v199 - 24) + 24) = 10;
      sub_2310FF330(&v285, (char *)&v406);
      profile_decoder::str(&v394);
      if ((v394.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v200 = &v394;
      else
        v200 = (std::string *)v394.__r_.__value_.__r.__words[0];
      if ((v394.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v201 = HIBYTE(v394.__r_.__value_.__r.__words[2]);
      else
        v201 = v394.__r_.__value_.__l.__size_;
      v202 = sub_2310FF468(v199, (uint64_t)v200, v201);
      v203 = sub_2310FF468(v202, (uint64_t)",", 1);
      sub_2310FF330(&v283, "arg1");
      profile_decoder::key(&__p);
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v204 = &__p;
      else
        v204 = (std::string *)__p.__r_.__value_.__r.__words[0];
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v205 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
      else
        v205 = __p.__r_.__value_.__l.__size_;
      v206 = sub_2310FF468(v203, (uint64_t)v204, v205);
      *(_QWORD *)((char *)v206 + *(_QWORD *)(*v206 - 24) + 24) = 10;
      v207 = (_QWORD *)std::ostream::operator<<();
      v208 = sub_2310FF468(v207, (uint64_t)",", 1);
      sub_2310FF330(&v281, "arg2");
      profile_decoder::key(&v408);
      if ((v408.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v209 = &v408;
      else
        v209 = (std::string *)v408.__r_.__value_.__r.__words[0];
      if ((v408.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v210 = HIBYTE(v408.__r_.__value_.__r.__words[2]);
      else
        v210 = v408.__r_.__value_.__l.__size_;
      v211 = sub_2310FF468(v208, (uint64_t)v209, v210);
      *(_QWORD *)((char *)v211 + *(_QWORD *)(*v211 - 24) + 24) = 10;
      v212 = (_QWORD *)std::ostream::operator<<();
      sub_2310FF468(v212, (uint64_t)",", 1);
      if (SHIBYTE(v408.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v408.__r_.__value_.__l.__data_);
      if (v282 < 0)
        operator delete(v281);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
      if (v284 < 0)
        operator delete(v283);
      if (SHIBYTE(v394.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v394.__r_.__value_.__l.__data_);
      if (v286 < 0)
        operator delete(v285);
      if (SHIBYTE(v397.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v397.__r_.__value_.__l.__data_);
      if (v288 < 0)
        operator delete(v287);
      if (SHIBYTE(v400.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v400.__r_.__value_.__l.__data_);
      if (v290 < 0)
        operator delete(v289);
      if (SHIBYTE(v403.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v403.__r_.__value_.__l.__data_);
      if (v292 < 0)
      {
        v33 = v291;
        goto LABEL_601;
      }
      break;
    case 0xC:
      v408.__r_.__value_.__s.__data_[12] = 0;
      v408.__r_.__value_.__r.__words[0] = *(_QWORD *)(a3 + 36);
      LODWORD(v408.__r_.__value_.__r.__words[1]) = *(_DWORD *)(a3 + 44);
      sub_2310FF330(&v347, "name");
      profile_decoder::key(&v406);
      if ((v406.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v255 = &v406;
      else
        v255 = (std::string *)v406.__r_.__value_.__r.__words[0];
      if ((v406.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v256 = HIBYTE(v406.__r_.__value_.__r.__words[2]);
      else
        v256 = v406.__r_.__value_.__l.__size_;
      v257 = sub_2310FF468((_QWORD *)(a2 + 16), (uint64_t)v255, v256);
      *(_QWORD *)((char *)v257 + *(_QWORD *)(*v257 - 24) + 24) = 16;
      sub_2310FF330(&v345, (char *)&v408);
      profile_decoder::str(&v403);
      if ((v403.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v258 = &v403;
      else
        v258 = (std::string *)v403.__r_.__value_.__r.__words[0];
      if ((v403.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v259 = HIBYTE(v403.__r_.__value_.__r.__words[2]);
      else
        v259 = v403.__r_.__value_.__l.__size_;
      v260 = sub_2310FF468(v257, (uint64_t)v258, v259);
      v261 = sub_2310FF468(v260, (uint64_t)",", 1);
      sub_2310FF330(&v343, "sample-interval");
      profile_decoder::key(&v400);
      if ((v400.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v262 = &v400;
      else
        v262 = (std::string *)v400.__r_.__value_.__r.__words[0];
      if ((v400.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v263 = HIBYTE(v400.__r_.__value_.__r.__words[2]);
      else
        v263 = v400.__r_.__value_.__l.__size_;
      v264 = sub_2310FF468(v261, (uint64_t)v262, v263);
      *(_QWORD *)((char *)v264 + *(_QWORD *)(*v264 - 24) + 24) = 10;
      v265 = (_QWORD *)std::ostream::operator<<();
      v266 = sub_2310FF468(v265, (uint64_t)",", 1);
      sub_2310FF330(&v341, "report-interval");
      profile_decoder::key(&v397);
      if ((v397.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v267 = &v397;
      else
        v267 = (std::string *)v397.__r_.__value_.__r.__words[0];
      if ((v397.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v268 = HIBYTE(v397.__r_.__value_.__r.__words[2]);
      else
        v268 = v397.__r_.__value_.__l.__size_;
      v269 = sub_2310FF468(v266, (uint64_t)v267, v268);
      *(_QWORD *)((char *)v269 + *(_QWORD *)(*v269 - 24) + 24) = 10;
      v270 = (_QWORD *)std::ostream::operator<<();
      v271 = sub_2310FF468(v270, (uint64_t)",", 1);
      sub_2310FF330(&v339, "batch-interval");
      profile_decoder::key(&v394);
      if ((v394.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v272 = &v394;
      else
        v272 = (std::string *)v394.__r_.__value_.__r.__words[0];
      if ((v394.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v273 = HIBYTE(v394.__r_.__value_.__r.__words[2]);
      else
        v273 = v394.__r_.__value_.__l.__size_;
      v274 = sub_2310FF468(v271, (uint64_t)v272, v273);
      *(_QWORD *)((char *)v274 + *(_QWORD *)(*v274 - 24) + 24) = 10;
      v275 = (_QWORD *)std::ostream::operator<<();
      v276 = sub_2310FF468(v275, (uint64_t)",", 1);
      sub_2310FF330(&v337, "next-dispatch");
      profile_decoder::key(&__p);
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v277 = &__p;
      else
        v277 = (std::string *)__p.__r_.__value_.__r.__words[0];
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v278 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
      else
        v278 = __p.__r_.__value_.__l.__size_;
      v279 = sub_2310FF468(v276, (uint64_t)v277, v278);
      *(_QWORD *)((char *)v279 + *(_QWORD *)(*v279 - 24) + 24) = 10;
      v280 = (_QWORD *)std::ostream::operator<<();
      sub_2310FF468(v280, (uint64_t)",", 1);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
      if (v338 < 0)
        operator delete(v337);
      if (SHIBYTE(v394.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v394.__r_.__value_.__l.__data_);
      if (v340 < 0)
        operator delete(v339);
      if (SHIBYTE(v397.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v397.__r_.__value_.__l.__data_);
      if (v342 < 0)
        operator delete(v341);
      if (SHIBYTE(v400.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v400.__r_.__value_.__l.__data_);
      if (v344 < 0)
        operator delete(v343);
      if (SHIBYTE(v403.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v403.__r_.__value_.__l.__data_);
      if (v346 < 0)
        operator delete(v345);
      if (SHIBYTE(v406.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v406.__r_.__value_.__l.__data_);
      if (v348 < 0)
      {
        v33 = v347;
LABEL_601:
        operator delete(v33);
      }
      break;
    default:
      return;
  }
}

void sub_2310F5FFC(_Unwind_Exception *a1)
{
  uint64_t v1;

  if (SLOBYTE(STACK[0x56F]) < 0)
    operator delete((void *)STACK[0x558]);
  if (SLOBYTE(STACK[0x2B7]) < 0)
    operator delete((void *)STACK[0x2A0]);
  if (SLOBYTE(STACK[0x59F]) < 0)
    operator delete((void *)STACK[0x588]);
  if (SLOBYTE(STACK[0x2CF]) < 0)
    operator delete((void *)STACK[0x2B8]);
  if (SLOBYTE(STACK[0x5CF]) < 0)
    operator delete((void *)STACK[0x5B8]);
  if (SLOBYTE(STACK[0x2E7]) < 0)
    operator delete((void *)STACK[0x2D0]);
  if (*(char *)(v1 - 193) < 0)
    operator delete(*(void **)(v1 - 216));
  if (SLOBYTE(STACK[0x2FF]) < 0)
    operator delete((void *)STACK[0x2E8]);
  if (*(char *)(v1 - 145) < 0)
    operator delete(*(void **)(v1 - 168));
  if (SLOBYTE(STACK[0x317]) < 0)
    operator delete((void *)STACK[0x300]);
  if (*(char *)(v1 - 97) < 0)
    operator delete(*(void **)(v1 - 120));
  if (SLOBYTE(STACK[0x32F]) < 0)
    operator delete((void *)STACK[0x318]);
  _Unwind_Resume(a1);
}

void sub_2310F6C78()
{
  JUMPOUT(0x2310F6C70);
}

void profile_decoder::key(std::string *a1@<X8>)
{
  std::string *v2;
  std::string v3;

  std::operator+<char>();
  v2 = std::string::append(&v3, "':");
  *a1 = *v2;
  v2->__r_.__value_.__l.__size_ = 0;
  v2->__r_.__value_.__r.__words[2] = 0;
  v2->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v3.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v3.__r_.__value_.__l.__data_);
}

void sub_2310F6CEC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void profile_decoder::str(std::string *a1@<X8>)
{
  std::string *v2;
  std::string v3;

  std::operator+<char>();
  v2 = std::string::append(&v3, "'");
  *a1 = *v2;
  v2->__r_.__value_.__l.__size_ = 0;
  v2->__r_.__value_.__r.__words[2] = 0;
  v2->__r_.__value_.__r.__words[0] = 0;
  if (SHIBYTE(v3.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v3.__r_.__value_.__l.__data_);
}

void sub_2310F6D74(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

uint64_t profile_decoder::spu_time_to_wall_time(uint64_t a1, uint64_t a2, uint64_t a3)
{
  mach_port_t v5;
  const __CFDictionary *v6;
  uint64_t result;
  io_object_t v8;
  const __CFDictionary *CFProperty;
  const __CFDictionary *v10;
  const __CFNumber *Value;
  const __CFNumber *v12;
  unint64_t v13;
  tm *v14;
  time_t v15;
  char __str[32];
  _QWORD valuePtr[5];

  valuePtr[4] = *MEMORY[0x24BDAC8D0];
  v5 = *MEMORY[0x24BDD8B20];
  v6 = IOServiceMatching("AppleSPUTimesync");
  result = IOServiceGetMatchingService(v5, v6);
  if ((_DWORD)result)
  {
    v8 = result;
    valuePtr[0] = 0;
    *(_QWORD *)__str = 0;
    CFProperty = (const __CFDictionary *)IORegistryEntryCreateCFProperty(result, CFSTR("timesync"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
    if (CFProperty)
    {
      v10 = CFProperty;
      Value = (const __CFNumber *)CFDictionaryGetValue(CFProperty, CFSTR("spu"));
      CFNumberGetValue(Value, kCFNumberLongLongType, valuePtr);
      v12 = (const __CFNumber *)CFDictionaryGetValue(v10, CFSTR("calendar"));
      CFNumberGetValue(v12, kCFNumberLongLongType, __str);
      v13 = *(_QWORD *)__str + 1000 * a2 - valuePtr[0];
      CFRelease(v10);
      IOObjectRelease(v8);
      v15 = v13 / 0x3B9ACA00;
      v14 = localtime(&v15);
      strftime((char *)valuePtr, 0x1EuLL, "%b %d %T", v14);
      snprintf(__str, 0x1EuLL, "%s.%06lld", (const char *)valuePtr, v13 / 0x3E8 - 1000000 * ((unint64_t)((v13 / 0x3E8 * (unsigned __int128)0x431BDE82D7B635uLL) >> 64) >> 10));
      MEMORY[0x2348D19E8](a3, __str);
      return 1;
    }
    else
    {
      IOObjectRelease(v8);
      return 0;
    }
  }
  return result;
}

BOOL profile_decoder::get_boot_time(profile_decoder *this, unint64_t *a2)
{
  int v3;
  size_t v5;
  uint64_t v6;
  int v7;
  int v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v5 = 16;
  *(_QWORD *)v8 = 0x1500000001;
  v3 = sysctl(v8, 2u, &v6, &v5, 0, 0);
  if ((v3 & 0x80000000) == 0)
    *a2 = v7 + 1000000 * v6;
  return v3 >= 0;
}

std::string *profile_decoder::type_name@<X0>(unsigned int __val@<W1>, std::string *a2@<X8>)
{
  return profile_decoder::find_in_table((const entry *)&unk_24FFFDD18, __val, 0xDu, a2);
}

void profile_decoder::to_string(uint64_t a1, _QWORD *a2)
{
  int v4;
  std::string *v5;
  profile_decoder *v6;
  _QWORD *v7;
  std::string *v8;
  std::string::size_type size;
  _QWORD *v10;
  std::string *v11;
  std::string::size_type v12;
  _QWORD *v13;
  _QWORD *v14;
  std::string *v15;
  std::string::size_type v16;
  _QWORD *v17;
  std::string *v18;
  std::string::size_type v19;
  _QWORD *v20;
  _QWORD *v21;
  std::string *v22;
  std::string::size_type v23;
  _QWORD *v24;
  std::string *v25;
  std::string::size_type v26;
  _QWORD *v27;
  _QWORD *v28;
  std::string *v29;
  std::string::size_type v30;
  _QWORD *v31;
  std::string *v32;
  std::string::size_type v33;
  _QWORD *v34;
  _QWORD *v35;
  std::string *v36;
  std::string::size_type v37;
  _QWORD *v38;
  _QWORD *v39;
  _QWORD *v40;
  std::string *p_p;
  std::string::size_type v42;
  _QWORD *v43;
  _QWORD *v44;
  std::string *v45;
  std::string::size_type v46;
  _QWORD *v47;
  _QWORD *v48;
  std::string *v49;
  std::string::size_type v50;
  _QWORD *v51;
  _QWORD *v52;
  std::string *v53;
  std::string::size_type v54;
  _QWORD *v55;
  _QWORD *v56;
  std::string *v57;
  std::string::size_type v58;
  _QWORD *v59;
  _QWORD *v60;
  std::string *v61;
  std::string::size_type v62;
  profile_decoder *v63;
  std::string *v64;
  std::string::size_type v65;
  _QWORD *v66;
  std::string *v67;
  std::string::size_type v68;
  _QWORD *v69;
  std::string *v70;
  std::string::size_type v71;
  _QWORD *v72;
  std::string *v73;
  std::string::size_type v74;
  uint64_t v75;
  _BOOL4 boot_time;
  int v77;
  void *v78;
  char v79;
  void *v80[2];
  uint64_t v81;
  void *v82;
  char v83;
  void *v84;
  char v85;
  void *v86;
  char v87;
  void *v88;
  char v89;
  void *v90;
  char v91;
  void *v92;
  char v93;
  void *v94;
  char v95;
  std::string __p;
  void *v97;
  char v98;
  std::string v99;
  std::string v100;
  std::string v101;
  void *v102;
  char v103;
  std::string v104;
  __int128 v105;
  uint64_t v106;
  std::string v107;
  void *v108;
  char v109;
  std::string v110;
  __int128 v111;
  uint64_t v112;
  std::string v113;
  void *v114;
  char v115;
  std::string v116;
  __int128 __dst;
  uint64_t v118;
  std::string v119;
  void *v120;
  char v121;
  std::string v122;
  _QWORD v123[2];
  _QWORD v124[11];
  char v125;
  uint64_t v126;
  unint64_t v127;
  __int128 v128;
  uint64_t v129;
  std::string v130;
  __int128 v131;
  uint64_t v132;
  __int128 v133;
  uint64_t v134;
  __int128 v135;
  uint64_t v136;

  v4 = *(_DWORD *)a2;
  (*(void (**)(__int128 *__return_ptr, uint64_t, _QWORD))(*(_QWORD *)a1 + 8))(&v135, a1, HIBYTE(*(_DWORD *)a2));
  (*(void (**)(__int128 *__return_ptr, uint64_t, _QWORD))(*(_QWORD *)a1 + 16))(&v133, a1, BYTE2(v4));
  (*(void (**)(__int128 *__return_ptr, uint64_t, _QWORD, _QWORD))(*(_QWORD *)a1 + 24))(&v131, a1, BYTE2(v4), BYTE1(v4));
  v5 = profile_decoder::find_in_table((const entry *)&unk_24FFFDD18, v4, 0xDu, &v130);
  v128 = 0uLL;
  v129 = 0;
  v6 = (profile_decoder *)profile_decoder::spu_time_to_wall_time((uint64_t)v5, a2[1], (uint64_t)&v128);
  v77 = (int)v6;
  v127 = 0;
  boot_time = profile_decoder::get_boot_time(v6, &v127);
  sub_2310F3C38((uint64_t)v123);
  v7 = sub_2310FF468(v124, (uint64_t)"{ ", 2);
  sub_2310FF330(&v120, "category");
  profile_decoder::key(&v122);
  if ((v122.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v8 = &v122;
  else
    v8 = (std::string *)v122.__r_.__value_.__r.__words[0];
  if ((v122.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    size = HIBYTE(v122.__r_.__value_.__r.__words[2]);
  else
    size = v122.__r_.__value_.__l.__size_;
  v10 = sub_2310FF468(v7, (uint64_t)v8, size);
  *(_QWORD *)((char *)v10 + *(_QWORD *)(*v10 - 24) + 24) = 8;
  if (SHIBYTE(v136) < 0)
  {
    sub_2310FF7B0(&__dst, (void *)v135, *((unint64_t *)&v135 + 1));
  }
  else
  {
    __dst = v135;
    v118 = v136;
  }
  profile_decoder::str(&v119);
  if ((v119.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v11 = &v119;
  else
    v11 = (std::string *)v119.__r_.__value_.__r.__words[0];
  if ((v119.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v12 = HIBYTE(v119.__r_.__value_.__r.__words[2]);
  else
    v12 = v119.__r_.__value_.__l.__size_;
  v13 = sub_2310FF468(v10, (uint64_t)v11, v12);
  v14 = sub_2310FF468(v13, (uint64_t)",", 1);
  sub_2310FF330(&v114, "component");
  profile_decoder::key(&v116);
  if ((v116.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v15 = &v116;
  else
    v15 = (std::string *)v116.__r_.__value_.__r.__words[0];
  if ((v116.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v16 = HIBYTE(v116.__r_.__value_.__r.__words[2]);
  else
    v16 = v116.__r_.__value_.__l.__size_;
  v17 = sub_2310FF468(v14, (uint64_t)v15, v16);
  *(_QWORD *)((char *)v17 + *(_QWORD *)(*v17 - 24) + 24) = 8;
  if (SHIBYTE(v134) < 0)
  {
    sub_2310FF7B0(&v111, (void *)v133, *((unint64_t *)&v133 + 1));
  }
  else
  {
    v111 = v133;
    v112 = v134;
  }
  profile_decoder::str(&v113);
  if ((v113.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v18 = &v113;
  else
    v18 = (std::string *)v113.__r_.__value_.__r.__words[0];
  if ((v113.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v19 = HIBYTE(v113.__r_.__value_.__r.__words[2]);
  else
    v19 = v113.__r_.__value_.__l.__size_;
  v20 = sub_2310FF468(v17, (uint64_t)v18, v19);
  v21 = sub_2310FF468(v20, (uint64_t)",", 1);
  sub_2310FF330(&v108, "event");
  profile_decoder::key(&v110);
  if ((v110.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v22 = &v110;
  else
    v22 = (std::string *)v110.__r_.__value_.__r.__words[0];
  if ((v110.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v23 = HIBYTE(v110.__r_.__value_.__r.__words[2]);
  else
    v23 = v110.__r_.__value_.__l.__size_;
  v24 = sub_2310FF468(v21, (uint64_t)v22, v23);
  *(_QWORD *)((char *)v24 + *(_QWORD *)(*v24 - 24) + 24) = 12;
  if (SHIBYTE(v132) < 0)
  {
    sub_2310FF7B0(&v105, (void *)v131, *((unint64_t *)&v131 + 1));
  }
  else
  {
    v105 = v131;
    v106 = v132;
  }
  profile_decoder::str(&v107);
  if ((v107.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v25 = &v107;
  else
    v25 = (std::string *)v107.__r_.__value_.__r.__words[0];
  if ((v107.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v26 = HIBYTE(v107.__r_.__value_.__r.__words[2]);
  else
    v26 = v107.__r_.__value_.__l.__size_;
  v27 = sub_2310FF468(v24, (uint64_t)v25, v26);
  v28 = sub_2310FF468(v27, (uint64_t)",", 1);
  sub_2310FF330(&v102, "type");
  profile_decoder::key(&v104);
  if ((v104.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v29 = &v104;
  else
    v29 = (std::string *)v104.__r_.__value_.__r.__words[0];
  if ((v104.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v30 = HIBYTE(v104.__r_.__value_.__r.__words[2]);
  else
    v30 = v104.__r_.__value_.__l.__size_;
  v31 = sub_2310FF468(v28, (uint64_t)v29, v30);
  *(_QWORD *)((char *)v31 + *(_QWORD *)(*v31 - 24) + 24) = 12;
  if (SHIBYTE(v130.__r_.__value_.__r.__words[2]) < 0)
    sub_2310FF7B0(&v100, v130.__r_.__value_.__l.__data_, v130.__r_.__value_.__l.__size_);
  else
    v100 = v130;
  profile_decoder::str(&v101);
  if ((v101.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v32 = &v101;
  else
    v32 = (std::string *)v101.__r_.__value_.__r.__words[0];
  if ((v101.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v33 = HIBYTE(v101.__r_.__value_.__r.__words[2]);
  else
    v33 = v101.__r_.__value_.__l.__size_;
  v34 = sub_2310FF468(v31, (uint64_t)v32, v33);
  v35 = sub_2310FF468(v34, (uint64_t)",", 1);
  sub_2310FF330(&v97, "timestamp");
  profile_decoder::key(&v99);
  if ((v99.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v36 = &v99;
  else
    v36 = (std::string *)v99.__r_.__value_.__r.__words[0];
  if ((v99.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v37 = HIBYTE(v99.__r_.__value_.__r.__words[2]);
  else
    v37 = v99.__r_.__value_.__l.__size_;
  v38 = sub_2310FF468(v35, (uint64_t)v36, v37);
  *(_QWORD *)((char *)v38 + *(_QWORD *)(*v38 - 24) + 24) = 10;
  v39 = (_QWORD *)std::ostream::operator<<();
  v40 = sub_2310FF468(v39, (uint64_t)",", 1);
  sub_2310FF330(&v94, "sequence_num");
  profile_decoder::key(&__p);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    p_p = &__p;
  else
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v42 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  else
    v42 = __p.__r_.__value_.__l.__size_;
  v43 = sub_2310FF468(v40, (uint64_t)p_p, v42);
  *(_QWORD *)((char *)v43 + *(_QWORD *)(*v43 - 24) + 24) = 10;
  v44 = (_QWORD *)std::ostream::operator<<();
  sub_2310FF468(v44, (uint64_t)",", 1);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (v95 < 0)
    operator delete(v94);
  if (SHIBYTE(v99.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v99.__r_.__value_.__l.__data_);
  if (v98 < 0)
    operator delete(v97);
  if (SHIBYTE(v101.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v101.__r_.__value_.__l.__data_);
  if (SHIBYTE(v100.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v100.__r_.__value_.__l.__data_);
  if (SHIBYTE(v104.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v104.__r_.__value_.__l.__data_);
  if (v103 < 0)
    operator delete(v102);
  if (SHIBYTE(v107.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v107.__r_.__value_.__l.__data_);
  if (SHIBYTE(v106) < 0)
    operator delete((void *)v105);
  if (SHIBYTE(v110.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v110.__r_.__value_.__l.__data_);
  if (v109 < 0)
    operator delete(v108);
  if (SHIBYTE(v113.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v113.__r_.__value_.__l.__data_);
  if (SHIBYTE(v112) < 0)
    operator delete((void *)v111);
  if (SHIBYTE(v116.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v116.__r_.__value_.__l.__data_);
  if (v115 < 0)
    operator delete(v114);
  if (SHIBYTE(v119.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v119.__r_.__value_.__l.__data_);
  if (SHIBYTE(v118) < 0)
    operator delete((void *)__dst);
  if (SHIBYTE(v122.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v122.__r_.__value_.__l.__data_);
  if (v121 < 0)
    operator delete(v120);
  (*(void (**)(uint64_t, _QWORD *, _QWORD *))(*(_QWORD *)a1 + 32))(a1, v123, a2);
  sub_2310FF330(&v92, "type-id");
  profile_decoder::key(&v122);
  if ((v122.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v45 = &v122;
  else
    v45 = (std::string *)v122.__r_.__value_.__r.__words[0];
  if ((v122.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v46 = HIBYTE(v122.__r_.__value_.__r.__words[2]);
  else
    v46 = v122.__r_.__value_.__l.__size_;
  sub_2310FF468(v124, (uint64_t)v45, v46);
  v47 = (_QWORD *)std::ostream::operator<<();
  v48 = sub_2310FF468(v47, (uint64_t)",", 1);
  sub_2310FF330(&v90, "category-id");
  profile_decoder::key(&v119);
  if ((v119.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v49 = &v119;
  else
    v49 = (std::string *)v119.__r_.__value_.__r.__words[0];
  if ((v119.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v50 = HIBYTE(v119.__r_.__value_.__r.__words[2]);
  else
    v50 = v119.__r_.__value_.__l.__size_;
  sub_2310FF468(v48, (uint64_t)v49, v50);
  v51 = (_QWORD *)std::ostream::operator<<();
  v52 = sub_2310FF468(v51, (uint64_t)",", 1);
  sub_2310FF330(&v88, "component-id");
  profile_decoder::key(&v116);
  if ((v116.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v53 = &v116;
  else
    v53 = (std::string *)v116.__r_.__value_.__r.__words[0];
  if ((v116.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v54 = HIBYTE(v116.__r_.__value_.__r.__words[2]);
  else
    v54 = v116.__r_.__value_.__l.__size_;
  sub_2310FF468(v52, (uint64_t)v53, v54);
  v55 = (_QWORD *)std::ostream::operator<<();
  v56 = sub_2310FF468(v55, (uint64_t)",", 1);
  sub_2310FF330(&v86, "event-id");
  profile_decoder::key(&v113);
  if ((v113.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v57 = &v113;
  else
    v57 = (std::string *)v113.__r_.__value_.__r.__words[0];
  if ((v113.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v58 = HIBYTE(v113.__r_.__value_.__r.__words[2]);
  else
    v58 = v113.__r_.__value_.__l.__size_;
  sub_2310FF468(v56, (uint64_t)v57, v58);
  v59 = (_QWORD *)std::ostream::operator<<();
  v60 = sub_2310FF468(v59, (uint64_t)",", 1);
  sub_2310FF330(&v84, "binary-data");
  profile_decoder::key(&v110);
  if ((v110.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v61 = &v110;
  else
    v61 = (std::string *)v110.__r_.__value_.__r.__words[0];
  if ((v110.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v62 = HIBYTE(v110.__r_.__value_.__r.__words[2]);
  else
    v62 = v110.__r_.__value_.__l.__size_;
  v63 = (profile_decoder *)sub_2310FF468(v60, (uint64_t)v61, v62);
  profile_decoder::dump(v63, a2, 48);
  if ((v107.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v64 = &v107;
  else
    v64 = (std::string *)v107.__r_.__value_.__r.__words[0];
  if ((v107.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v65 = HIBYTE(v107.__r_.__value_.__r.__words[2]);
  else
    v65 = v107.__r_.__value_.__l.__size_;
  sub_2310FF468(v63, (uint64_t)v64, v65);
  if (SHIBYTE(v107.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v107.__r_.__value_.__l.__data_);
  if (SHIBYTE(v110.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v110.__r_.__value_.__l.__data_);
  if (v85 < 0)
    operator delete(v84);
  if (SHIBYTE(v113.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v113.__r_.__value_.__l.__data_);
  if (v87 < 0)
    operator delete(v86);
  if (SHIBYTE(v116.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v116.__r_.__value_.__l.__data_);
  if (v89 < 0)
    operator delete(v88);
  if (SHIBYTE(v119.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v119.__r_.__value_.__l.__data_);
  if (v91 < 0)
    operator delete(v90);
  if (SHIBYTE(v122.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v122.__r_.__value_.__l.__data_);
  if (v93 < 0)
    operator delete(v92);
  if (v77)
  {
    v66 = sub_2310FF468(v124, (uint64_t)",", 1);
    sub_2310FF330(&v82, "calendar-time");
    profile_decoder::key(&v122);
    if ((v122.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v67 = &v122;
    else
      v67 = (std::string *)v122.__r_.__value_.__r.__words[0];
    if ((v122.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v68 = HIBYTE(v122.__r_.__value_.__r.__words[2]);
    else
      v68 = v122.__r_.__value_.__l.__size_;
    v69 = sub_2310FF468(v66, (uint64_t)v67, v68);
    if (SHIBYTE(v129) < 0)
    {
      sub_2310FF7B0(v80, (void *)v128, *((unint64_t *)&v128 + 1));
    }
    else
    {
      *(_OWORD *)v80 = v128;
      v81 = v129;
    }
    profile_decoder::str(&v119);
    if ((v119.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v70 = &v119;
    else
      v70 = (std::string *)v119.__r_.__value_.__r.__words[0];
    if ((v119.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v71 = HIBYTE(v119.__r_.__value_.__r.__words[2]);
    else
      v71 = v119.__r_.__value_.__l.__size_;
    sub_2310FF468(v69, (uint64_t)v70, v71);
    if (SHIBYTE(v119.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v119.__r_.__value_.__l.__data_);
    if (SHIBYTE(v81) < 0)
      operator delete(v80[0]);
    if (SHIBYTE(v122.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v122.__r_.__value_.__l.__data_);
    if (v83 < 0)
      operator delete(v82);
  }
  if (boot_time)
  {
    v72 = sub_2310FF468(v124, (uint64_t)",", 1);
    sub_2310FF330(&v78, "boot-timestamp");
    profile_decoder::key(&v122);
    if ((v122.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v73 = &v122;
    else
      v73 = (std::string *)v122.__r_.__value_.__r.__words[0];
    if ((v122.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v74 = HIBYTE(v122.__r_.__value_.__r.__words[2]);
    else
      v74 = v122.__r_.__value_.__l.__size_;
    sub_2310FF468(v72, (uint64_t)v73, v74);
    std::ostream::operator<<();
    if (SHIBYTE(v122.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v122.__r_.__value_.__l.__data_);
    if (v79 < 0)
      operator delete(v78);
  }
  sub_2310FF468(v124, (uint64_t)"}", 1);
  std::stringbuf::str();
  v123[0] = *MEMORY[0x24BEDB7F0];
  v75 = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 72);
  *(_QWORD *)((char *)v123 + *(_QWORD *)(v123[0] - 24)) = *(_QWORD *)(MEMORY[0x24BEDB7F0] + 64);
  v124[0] = v75;
  v124[1] = MEMORY[0x24BEDB848] + 16;
  if (v125 < 0)
    operator delete((void *)v124[9]);
  std::streambuf::~streambuf();
  std::iostream::~basic_iostream();
  MEMORY[0x2348D1AA8](&v126);
  if (SHIBYTE(v129) < 0)
    operator delete((void *)v128);
  if (SHIBYTE(v130.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v130.__r_.__value_.__l.__data_);
  if (SHIBYTE(v132) < 0)
    operator delete((void *)v131);
  if (SHIBYTE(v134) < 0)
    operator delete((void *)v133);
  if (SHIBYTE(v136) < 0)
    operator delete((void *)v135);
}

void sub_2310F7B94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15, uint64_t a16, uint64_t a17, uint64_t a18, void *a19, uint64_t a20,int a21,__int16 a22,char a23,char a24)
{
  uint64_t v24;

  if (SLOBYTE(STACK[0x2C7]) < 0)
    operator delete((void *)STACK[0x2B0]);
  if (a24 < 0)
    operator delete(a19);
  sub_2310F3D64((uint64_t)&STACK[0x2C8]);
  if (*(char *)(v24 - 193) < 0)
    operator delete(*(void **)(v24 - 216));
  if (*(char *)(v24 - 169) < 0)
    operator delete(*(void **)(v24 - 192));
  if (*(char *)(v24 - 145) < 0)
    operator delete(*(void **)(v24 - 168));
  if (*(char *)(v24 - 121) < 0)
    operator delete(*(void **)(v24 - 144));
  if (*(char *)(v24 - 97) < 0)
    operator delete(*(void **)(v24 - 120));
  _Unwind_Resume(a1);
}

std::string *execution_decoder::component_name@<X0>(unsigned int __val@<W1>, std::string *a2@<X8>)
{
  return profile_decoder::find_in_table((const entry *)&unk_24FFFDDE8, __val, 6u, a2);
}

std::string *execution_decoder::event_name@<X0>(profile_decoder *a1@<X2>, int a2@<W1>, std::string *a3@<X8>)
{
  unsigned int v4;
  const entry *v5;
  unsigned int v6;
  std::string *result;

  v4 = a1;
  switch(a2)
  {
    case 0:
      v5 = (const entry *)&unk_24FFFDE48;
      v6 = 3;
      goto LABEL_3;
    case 1:
      v5 = (const entry *)&unk_24FFFDE78;
      goto LABEL_9;
    case 2:
      v5 = (const entry *)&unk_24FFFDE88;
      v6 = 2;
      goto LABEL_3;
    case 3:
      v5 = (const entry *)&unk_24FFFDEA8;
      v6 = 8;
      goto LABEL_3;
    case 4:
      v5 = (const entry *)&unk_24FFFDF28;
LABEL_9:
      v6 = 1;
LABEL_3:
      result = profile_decoder::find_in_table(v5, v4, v6, a3);
      break;
    default:
      result = std::to_string(a3, a1);
      break;
  }
  return result;
}

std::string *trace_decoder::component_name@<X0>(unsigned int __val@<W1>, std::string *a2@<X8>)
{
  return profile_decoder::find_in_table((const entry *)&unk_24FFFDF38, __val, 4u, a2);
}

std::string *trace_decoder::event_name@<X0>(unsigned int __val@<W2>, std::string *a2@<X8>)
{
  return std::to_string(a2, __val);
}

std::string *sensor_decoder::component_name@<X0>(unsigned int __val@<W1>, std::string *a2@<X8>)
{
  return profile_decoder::find_in_table((const entry *)&unk_24FFFDF78, __val, 7u, a2);
}

std::string *sensor_decoder::event_name@<X0>(unsigned int __val@<W2>, std::string *a2@<X8>)
{
  return profile_decoder::find_in_table((const entry *)&unk_24FFFDFE8, __val, 0xDu, a2);
}

std::string *sphere_decoder::component_name@<X0>(unsigned int __val@<W1>, std::string *a2@<X8>)
{
  return profile_decoder::find_in_table(&stru_24FFFE0B8, __val, 1u, a2);
}

std::string *sphere_decoder::event_name@<X0>(unsigned int __val@<W2>, std::string *a2@<X8>)
{
  return profile_decoder::find_in_table((const entry *)&unk_24FFFE0C8, __val, 3u, a2);
}

std::string *cumulus_decoder::component_name@<X0>(unsigned int __val@<W1>, std::string *a2@<X8>)
{
  return profile_decoder::find_in_table(&stru_24FFFE0F8, __val, 1u, a2);
}

std::string *cumulus_decoder::event_name@<X0>(unsigned int __val@<W2>, std::string *a2@<X8>)
{
  return profile_decoder::find_in_table((const entry *)&unk_24FFFE108, __val, 2u, a2);
}

void cumulus_decoder::parse_datatype(uint64_t a1, uint64_t a2, int *a3)
{
  int v6;
  std::string *v7;
  std::string::size_type size;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  std::string *v12;
  std::string::size_type v13;
  _QWORD *v14;
  _QWORD *v15;
  _QWORD *v16;
  std::string *v17;
  std::string::size_type v18;
  _QWORD *v19;
  _QWORD *v20;
  _QWORD *v21;
  std::string *v22;
  std::string::size_type v23;
  _QWORD *v24;
  _QWORD *v25;
  _QWORD *v26;
  std::string *v27;
  std::string::size_type v28;
  _QWORD *v29;
  _QWORD *v30;
  _QWORD *v31;
  std::string *v32;
  std::string::size_type v33;
  _QWORD *v34;
  _QWORD *v35;
  _QWORD *v36;
  std::string *v37;
  std::string::size_type v38;
  _QWORD *v39;
  _QWORD *v40;
  _QWORD *v41;
  std::string *v42;
  std::string::size_type v43;
  _QWORD *v44;
  _QWORD *v45;
  _QWORD *v46;
  std::string *p_p;
  std::string::size_type v48;
  _QWORD *v49;
  _QWORD *v50;
  std::string *v51;
  std::string::size_type v52;
  _QWORD *v53;
  _QWORD *v54;
  _QWORD *v55;
  std::string *v56;
  std::string::size_type v57;
  _QWORD *v58;
  _QWORD *v59;
  _QWORD *v60;
  std::string *v61;
  std::string::size_type v62;
  _QWORD *v63;
  _QWORD *v64;
  _QWORD *v65;
  std::string *v66;
  std::string::size_type v67;
  _QWORD *v68;
  _QWORD *v69;
  _QWORD *v70;
  std::string *v71;
  std::string::size_type v72;
  _QWORD *v73;
  _QWORD *v74;
  _QWORD *v75;
  std::string *v76;
  std::string::size_type v77;
  _QWORD *v78;
  _QWORD *v79;
  _QWORD *v80;
  std::string *v81;
  std::string::size_type v82;
  _QWORD *v83;
  _QWORD *v84;
  _QWORD *v85;
  std::string *v86;
  std::string::size_type v87;
  _QWORD *v88;
  _QWORD *v89;
  _QWORD *v90;
  std::string *v91;
  std::string::size_type v92;
  _QWORD *v93;
  _QWORD *v94;
  void *v95;
  char v96;
  void *v97;
  char v98;
  void *v99;
  char v100;
  void *v101;
  char v102;
  void *v103;
  char v104;
  void *v105;
  char v106;
  void *v107;
  char v108;
  void *v109;
  char v110;
  void *v111;
  char v112;
  void *v113;
  char v114;
  std::string __p;
  void *v116;
  char v117;
  std::string v118;
  void *v119;
  char v120;
  std::string v121;
  void *v122;
  char v123;
  std::string v124;
  void *v125;
  char v126;
  std::string v127;
  void *v128;
  char v129;
  std::string v130;
  void *v131;
  char v132;
  std::string v133;
  void *v134;
  char v135;
  std::string v136;
  void *v137;
  char v138;
  std::string v139;

  v6 = *a3;
  if (*a3 == 67108867)
  {
    sub_2310FF330(&v137, "arg1");
    profile_decoder::key(&v139);
    if ((v139.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v7 = &v139;
    else
      v7 = (std::string *)v139.__r_.__value_.__r.__words[0];
    if ((v139.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      size = HIBYTE(v139.__r_.__value_.__r.__words[2]);
    else
      size = v139.__r_.__value_.__l.__size_;
    v9 = sub_2310FF468((_QWORD *)(a2 + 16), (uint64_t)v7, size);
    *(_QWORD *)((char *)v9 + *(_QWORD *)(*v9 - 24) + 24) = 10;
    v10 = (_QWORD *)std::ostream::operator<<();
    v11 = sub_2310FF468(v10, (uint64_t)",", 1);
    sub_2310FF330(&v134, "arg2");
    profile_decoder::key(&v136);
    if ((v136.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v12 = &v136;
    else
      v12 = (std::string *)v136.__r_.__value_.__r.__words[0];
    if ((v136.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v13 = HIBYTE(v136.__r_.__value_.__r.__words[2]);
    else
      v13 = v136.__r_.__value_.__l.__size_;
    v14 = sub_2310FF468(v11, (uint64_t)v12, v13);
    *(_QWORD *)((char *)v14 + *(_QWORD *)(*v14 - 24) + 24) = 10;
    v15 = (_QWORD *)std::ostream::operator<<();
    v16 = sub_2310FF468(v15, (uint64_t)",", 1);
    sub_2310FF330(&v131, "arg3");
    profile_decoder::key(&v133);
    if ((v133.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v17 = &v133;
    else
      v17 = (std::string *)v133.__r_.__value_.__r.__words[0];
    if ((v133.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v18 = HIBYTE(v133.__r_.__value_.__r.__words[2]);
    else
      v18 = v133.__r_.__value_.__l.__size_;
    v19 = sub_2310FF468(v16, (uint64_t)v17, v18);
    *(_QWORD *)((char *)v19 + *(_QWORD *)(*v19 - 24) + 24) = 10;
    v20 = (_QWORD *)std::ostream::operator<<();
    v21 = sub_2310FF468(v20, (uint64_t)",", 1);
    sub_2310FF330(&v128, "arg4");
    profile_decoder::key(&v130);
    if ((v130.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v22 = &v130;
    else
      v22 = (std::string *)v130.__r_.__value_.__r.__words[0];
    if ((v130.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v23 = HIBYTE(v130.__r_.__value_.__r.__words[2]);
    else
      v23 = v130.__r_.__value_.__l.__size_;
    v24 = sub_2310FF468(v21, (uint64_t)v22, v23);
    *(_QWORD *)((char *)v24 + *(_QWORD *)(*v24 - 24) + 24) = 10;
    v25 = (_QWORD *)std::ostream::operator<<();
    v26 = sub_2310FF468(v25, (uint64_t)",", 1);
    sub_2310FF330(&v125, "arg5");
    profile_decoder::key(&v127);
    if ((v127.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v27 = &v127;
    else
      v27 = (std::string *)v127.__r_.__value_.__r.__words[0];
    if ((v127.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v28 = HIBYTE(v127.__r_.__value_.__r.__words[2]);
    else
      v28 = v127.__r_.__value_.__l.__size_;
    v29 = sub_2310FF468(v26, (uint64_t)v27, v28);
    *(_QWORD *)((char *)v29 + *(_QWORD *)(*v29 - 24) + 24) = 10;
    v30 = (_QWORD *)std::ostream::operator<<();
    v31 = sub_2310FF468(v30, (uint64_t)",", 1);
    sub_2310FF330(&v122, "arg6");
    profile_decoder::key(&v124);
    if ((v124.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v32 = &v124;
    else
      v32 = (std::string *)v124.__r_.__value_.__r.__words[0];
    if ((v124.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v33 = HIBYTE(v124.__r_.__value_.__r.__words[2]);
    else
      v33 = v124.__r_.__value_.__l.__size_;
    v34 = sub_2310FF468(v31, (uint64_t)v32, v33);
    *(_QWORD *)((char *)v34 + *(_QWORD *)(*v34 - 24) + 24) = 10;
    v35 = (_QWORD *)std::ostream::operator<<();
    v36 = sub_2310FF468(v35, (uint64_t)",", 1);
    sub_2310FF330(&v119, "x");
    profile_decoder::key(&v121);
    if ((v121.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v37 = &v121;
    else
      v37 = (std::string *)v121.__r_.__value_.__r.__words[0];
    if ((v121.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v38 = HIBYTE(v121.__r_.__value_.__r.__words[2]);
    else
      v38 = v121.__r_.__value_.__l.__size_;
    v39 = sub_2310FF468(v36, (uint64_t)v37, v38);
    *(_QWORD *)((char *)v39 + *(_QWORD *)(*v39 - 24) + 24) = 10;
    v40 = (_QWORD *)std::ostream::operator<<();
    v41 = sub_2310FF468(v40, (uint64_t)",", 1);
    sub_2310FF330(&v116, "y");
    profile_decoder::key(&v118);
    if ((v118.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v42 = &v118;
    else
      v42 = (std::string *)v118.__r_.__value_.__r.__words[0];
    if ((v118.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v43 = HIBYTE(v118.__r_.__value_.__r.__words[2]);
    else
      v43 = v118.__r_.__value_.__l.__size_;
    v44 = sub_2310FF468(v41, (uint64_t)v42, v43);
    *(_QWORD *)((char *)v44 + *(_QWORD *)(*v44 - 24) + 24) = 10;
    v45 = (_QWORD *)std::ostream::operator<<();
    v46 = sub_2310FF468(v45, (uint64_t)",", 1);
    sub_2310FF330(&v113, "z");
    profile_decoder::key(&__p);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      p_p = &__p;
    else
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v48 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
    else
      v48 = __p.__r_.__value_.__l.__size_;
    v49 = sub_2310FF468(v46, (uint64_t)p_p, v48);
    *(_QWORD *)((char *)v49 + *(_QWORD *)(*v49 - 24) + 24) = 10;
    v50 = (_QWORD *)std::ostream::operator<<();
    sub_2310FF468(v50, (uint64_t)",", 1);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    if (v114 < 0)
      operator delete(v113);
    if (SHIBYTE(v118.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v118.__r_.__value_.__l.__data_);
    if (v117 < 0)
      operator delete(v116);
    if (SHIBYTE(v121.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v121.__r_.__value_.__l.__data_);
    if (v120 < 0)
      operator delete(v119);
    if (SHIBYTE(v124.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v124.__r_.__value_.__l.__data_);
    if (v123 < 0)
      operator delete(v122);
    if (SHIBYTE(v127.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v127.__r_.__value_.__l.__data_);
    if (v126 < 0)
      operator delete(v125);
    if (SHIBYTE(v130.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v130.__r_.__value_.__l.__data_);
    if (v129 < 0)
      operator delete(v128);
    if (SHIBYTE(v133.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v133.__r_.__value_.__l.__data_);
    if (v132 < 0)
      operator delete(v131);
    if (SHIBYTE(v136.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v136.__r_.__value_.__l.__data_);
    if (v135 < 0)
      operator delete(v134);
    if (SHIBYTE(v139.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v139.__r_.__value_.__l.__data_);
    if (v138 < 0)
      operator delete(v137);
    v6 = *a3;
  }
  if (v6 == 67109123)
  {
    sub_2310FF330(&v111, "arg1");
    profile_decoder::key(&v139);
    if ((v139.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v51 = &v139;
    else
      v51 = (std::string *)v139.__r_.__value_.__r.__words[0];
    if ((v139.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v52 = HIBYTE(v139.__r_.__value_.__r.__words[2]);
    else
      v52 = v139.__r_.__value_.__l.__size_;
    v53 = sub_2310FF468((_QWORD *)(a2 + 16), (uint64_t)v51, v52);
    *(_QWORD *)((char *)v53 + *(_QWORD *)(*v53 - 24) + 24) = 10;
    v54 = (_QWORD *)std::ostream::operator<<();
    v55 = sub_2310FF468(v54, (uint64_t)",", 1);
    sub_2310FF330(&v109, "arg2");
    profile_decoder::key(&v136);
    if ((v136.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v56 = &v136;
    else
      v56 = (std::string *)v136.__r_.__value_.__r.__words[0];
    if ((v136.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v57 = HIBYTE(v136.__r_.__value_.__r.__words[2]);
    else
      v57 = v136.__r_.__value_.__l.__size_;
    v58 = sub_2310FF468(v55, (uint64_t)v56, v57);
    *(_QWORD *)((char *)v58 + *(_QWORD *)(*v58 - 24) + 24) = 10;
    v59 = (_QWORD *)std::ostream::operator<<();
    v60 = sub_2310FF468(v59, (uint64_t)",", 1);
    sub_2310FF330(&v107, "arg3");
    profile_decoder::key(&v133);
    if ((v133.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v61 = &v133;
    else
      v61 = (std::string *)v133.__r_.__value_.__r.__words[0];
    if ((v133.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v62 = HIBYTE(v133.__r_.__value_.__r.__words[2]);
    else
      v62 = v133.__r_.__value_.__l.__size_;
    v63 = sub_2310FF468(v60, (uint64_t)v61, v62);
    *(_QWORD *)((char *)v63 + *(_QWORD *)(*v63 - 24) + 24) = 10;
    v64 = (_QWORD *)std::ostream::operator<<();
    v65 = sub_2310FF468(v64, (uint64_t)",", 1);
    sub_2310FF330(&v105, "arg4");
    profile_decoder::key(&v130);
    if ((v130.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v66 = &v130;
    else
      v66 = (std::string *)v130.__r_.__value_.__r.__words[0];
    if ((v130.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v67 = HIBYTE(v130.__r_.__value_.__r.__words[2]);
    else
      v67 = v130.__r_.__value_.__l.__size_;
    v68 = sub_2310FF468(v65, (uint64_t)v66, v67);
    *(_QWORD *)((char *)v68 + *(_QWORD *)(*v68 - 24) + 24) = 10;
    v69 = (_QWORD *)std::ostream::operator<<();
    v70 = sub_2310FF468(v69, (uint64_t)",", 1);
    sub_2310FF330(&v103, "arg5");
    profile_decoder::key(&v127);
    if ((v127.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v71 = &v127;
    else
      v71 = (std::string *)v127.__r_.__value_.__r.__words[0];
    if ((v127.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v72 = HIBYTE(v127.__r_.__value_.__r.__words[2]);
    else
      v72 = v127.__r_.__value_.__l.__size_;
    v73 = sub_2310FF468(v70, (uint64_t)v71, v72);
    *(_QWORD *)((char *)v73 + *(_QWORD *)(*v73 - 24) + 24) = 10;
    v74 = (_QWORD *)std::ostream::operator<<();
    v75 = sub_2310FF468(v74, (uint64_t)",", 1);
    sub_2310FF330(&v101, "arg6");
    profile_decoder::key(&v124);
    if ((v124.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v76 = &v124;
    else
      v76 = (std::string *)v124.__r_.__value_.__r.__words[0];
    if ((v124.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v77 = HIBYTE(v124.__r_.__value_.__r.__words[2]);
    else
      v77 = v124.__r_.__value_.__l.__size_;
    v78 = sub_2310FF468(v75, (uint64_t)v76, v77);
    *(_QWORD *)((char *)v78 + *(_QWORD *)(*v78 - 24) + 24) = 10;
    v79 = (_QWORD *)std::ostream::operator<<();
    v80 = sub_2310FF468(v79, (uint64_t)",", 1);
    sub_2310FF330(&v99, "x");
    profile_decoder::key(&v121);
    if ((v121.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v81 = &v121;
    else
      v81 = (std::string *)v121.__r_.__value_.__r.__words[0];
    if ((v121.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v82 = HIBYTE(v121.__r_.__value_.__r.__words[2]);
    else
      v82 = v121.__r_.__value_.__l.__size_;
    v83 = sub_2310FF468(v80, (uint64_t)v81, v82);
    *(_QWORD *)((char *)v83 + *(_QWORD *)(*v83 - 24) + 24) = 10;
    v84 = (_QWORD *)std::ostream::operator<<();
    v85 = sub_2310FF468(v84, (uint64_t)",", 1);
    sub_2310FF330(&v97, "y");
    profile_decoder::key(&v118);
    if ((v118.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v86 = &v118;
    else
      v86 = (std::string *)v118.__r_.__value_.__r.__words[0];
    if ((v118.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v87 = HIBYTE(v118.__r_.__value_.__r.__words[2]);
    else
      v87 = v118.__r_.__value_.__l.__size_;
    v88 = sub_2310FF468(v85, (uint64_t)v86, v87);
    *(_QWORD *)((char *)v88 + *(_QWORD *)(*v88 - 24) + 24) = 10;
    v89 = (_QWORD *)std::ostream::operator<<();
    v90 = sub_2310FF468(v89, (uint64_t)",", 1);
    sub_2310FF330(&v95, "z");
    profile_decoder::key(&__p);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v91 = &__p;
    else
      v91 = (std::string *)__p.__r_.__value_.__r.__words[0];
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v92 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
    else
      v92 = __p.__r_.__value_.__l.__size_;
    v93 = sub_2310FF468(v90, (uint64_t)v91, v92);
    *(_QWORD *)((char *)v93 + *(_QWORD *)(*v93 - 24) + 24) = 10;
    v94 = (_QWORD *)std::ostream::operator<<();
    sub_2310FF468(v94, (uint64_t)",", 1);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    if (v96 < 0)
      operator delete(v95);
    if (SHIBYTE(v118.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v118.__r_.__value_.__l.__data_);
    if (v98 < 0)
      operator delete(v97);
    if (SHIBYTE(v121.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v121.__r_.__value_.__l.__data_);
    if (v100 < 0)
      operator delete(v99);
    if (SHIBYTE(v124.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v124.__r_.__value_.__l.__data_);
    if (v102 < 0)
      operator delete(v101);
    if (SHIBYTE(v127.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v127.__r_.__value_.__l.__data_);
    if (v104 < 0)
      operator delete(v103);
    if (SHIBYTE(v130.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v130.__r_.__value_.__l.__data_);
    if (v106 < 0)
      operator delete(v105);
    if (SHIBYTE(v133.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v133.__r_.__value_.__l.__data_);
    if (v108 < 0)
      operator delete(v107);
    if (SHIBYTE(v136.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v136.__r_.__value_.__l.__data_);
    if (v110 < 0)
      operator delete(v109);
    if (SHIBYTE(v139.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v139.__r_.__value_.__l.__data_);
    if (v112 < 0)
      operator delete(v111);
  }
  else
  {
    profile_decoder::parse_datatype(a1, a2, (uint64_t)a3);
  }
}

void sub_2310F8BF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27,void *a28,uint64_t a29,int a30,__int16 a31,char a32,char a33,void *a34,uint64_t a35,int a36,__int16 a37,char a38,char a39,void *a40,uint64_t a41,int a42,__int16 a43,char a44,char a45,void *a46,uint64_t a47,int a48,__int16 a49,char a50,char a51,void *a52,uint64_t a53,int a54,__int16 a55,char a56,char a57,void *a58,uint64_t a59,int a60,__int16 a61,char a62,char a63)
{
  void *__p;
  char a72;
  void *a73;
  char a74;
  void *a75;
  char a76;
  void *a77;
  char a78;
  void *a79;
  char a80;
  uint64_t v80;

  if (a72 < 0)
    operator delete(__p);
  if (a15 < 0)
    operator delete(a10);
  if (a74 < 0)
    operator delete(a73);
  if (a21 < 0)
    operator delete(a16);
  if (a76 < 0)
    operator delete(a75);
  if (a27 < 0)
    operator delete(a22);
  if (a78 < 0)
    operator delete(a77);
  if (a33 < 0)
    operator delete(a28);
  if (a80 < 0)
    operator delete(a79);
  if (a39 < 0)
    operator delete(a34);
  if (*(char *)(v80 - 209) < 0)
    operator delete(*(void **)(v80 - 232));
  if (a45 < 0)
    operator delete(a40);
  if (*(char *)(v80 - 161) < 0)
    operator delete(*(void **)(v80 - 184));
  if (a51 < 0)
    operator delete(a46);
  if (*(char *)(v80 - 113) < 0)
    operator delete(*(void **)(v80 - 136));
  if (a57 < 0)
    operator delete(a52);
  if (*(char *)(v80 - 65) < 0)
    operator delete(*(void **)(v80 - 88));
  if (a63 < 0)
    operator delete(a58);
  _Unwind_Resume(a1);
}

std::string *interrupt_decoder::component_name@<X0>(unsigned int __val@<W1>, std::string *a2@<X8>)
{
  return profile_decoder::find_in_table(&stru_24FFFE128, __val, 1u, a2);
}

std::string *interrupt_decoder::event_name@<X0>(unsigned int __val@<W2>, std::string *a2@<X8>)
{
  return profile_decoder::find_in_table(&stru_24FFFE138, __val, 1u, a2);
}

std::string *uart_decoder::component_name@<X0>(unsigned int __val@<W1>, std::string *a2@<X8>)
{
  return profile_decoder::find_in_table((const entry *)&unk_24FFFE148, __val, 3u, a2);
}

std::string *uart_decoder::event_name@<X0>(unsigned int __val@<W2>, std::string *a2@<X8>)
{
  return profile_decoder::find_in_table((const entry *)&unk_24FFFE178, __val, 8u, a2);
}

std::string *sshb_decoder::component_name@<X0>(unsigned int __val@<W1>, std::string *a2@<X8>)
{
  return profile_decoder::find_in_table((const entry *)&unk_24FFFE1F8, __val, 8u, a2);
}

std::string *sshb_decoder::event_name@<X0>(unsigned int __val@<W2>, int a2@<W1>, std::string *a3@<X8>)
{
  const entry *v4;

  if (a2 == 3)
    v4 = (const entry *)&unk_24FFFE278;
  else
    v4 = (const entry *)&unk_24FFFE2F8;
  return profile_decoder::find_in_table(v4, __val, 8u, a3);
}

std::string *sshb_decoder::subtype_name@<X0>(sshb_decoder *this@<X0>, profile_decoder *a2@<X2>, int a3@<W1>, std::string *a4@<X8>)
{
  unsigned int v4;
  const entry *v5;
  unsigned int v6;
  std::string *result;

  v4 = a2;
  switch(a3)
  {
    case 0:
    case 1:
    case 2:
    case 4:
      v5 = (const entry *)&unk_24FFFE378;
      v6 = 113;
      goto LABEL_3;
    case 3:
      result = (std::string *)(*(uint64_t (**)(sshb_decoder *, uint64_t, profile_decoder *))(*(_QWORD *)this + 24))(this, 3, a2);
      break;
    case 7:
      v5 = (const entry *)&unk_24FFFEA88;
      v6 = 17;
LABEL_3:
      result = profile_decoder::find_in_table(v5, v4, v6, a4);
      break;
    default:
      result = std::to_string(a4, a2);
      break;
  }
  return result;
}

void sshb_decoder::parse_datatype(sshb_decoder *a1, uint64_t a2, int *a3)
{
  int v6;
  int v7;
  int v8;
  std::string *v9;
  std::string::size_type size;
  _QWORD *v11;
  std::string *v12;
  std::string::size_type v13;
  _QWORD *v14;
  _QWORD *v15;
  std::string *v16;
  std::string::size_type v17;
  _QWORD *v18;
  _QWORD *v19;
  _QWORD *v20;
  std::string *v21;
  std::string::size_type v22;
  _QWORD *v23;
  _QWORD *v24;
  _QWORD *v25;
  std::string *v26;
  std::string::size_type v27;
  _QWORD *v28;
  _QWORD *v29;
  _QWORD *v30;
  std::string *v31;
  std::string::size_type v32;
  _QWORD *v33;
  _QWORD *v34;
  _QWORD *v35;
  std::string *p_p;
  std::string::size_type v37;
  _QWORD *v38;
  _QWORD *v39;
  std::string *v40;
  std::string::size_type v41;
  _QWORD *v42;
  std::string *v43;
  std::string::size_type v44;
  _QWORD *v45;
  _QWORD *v46;
  std::string *v47;
  std::string::size_type v48;
  _QWORD *v49;
  _QWORD *v50;
  _QWORD *v51;
  std::string *v52;
  std::string::size_type v53;
  _QWORD *v54;
  _QWORD *v55;
  _QWORD *v56;
  std::string *v57;
  std::string::size_type v58;
  _QWORD *v59;
  _QWORD *v60;
  _QWORD *v61;
  std::string *v62;
  std::string::size_type v63;
  _QWORD *v64;
  _QWORD *v65;
  _QWORD *v66;
  std::string *v67;
  std::string::size_type v68;
  _QWORD *v69;
  _QWORD *v70;
  void *v71;
  int v72;
  int v74;
  std::string *v75;
  std::string::size_type v76;
  _QWORD *v77;
  _QWORD *v78;
  std::string *v79;
  std::string::size_type v80;
  _QWORD *v81;
  _QWORD *v82;
  std::string *v83;
  std::string::size_type v84;
  _QWORD *v85;
  _QWORD *v86;
  std::string *v87;
  std::string::size_type v88;
  _QWORD *v89;
  _QWORD *v90;
  std::string *v91;
  std::string::size_type v92;
  _QWORD *v93;
  _QWORD *v94;
  std::string *v95;
  std::string::size_type v96;
  _QWORD *v97;
  _QWORD *v98;
  std::string *v99;
  std::string::size_type v100;
  _QWORD *v101;
  _QWORD *v102;
  std::string *v103;
  std::string::size_type v104;
  _QWORD *v105;
  _QWORD *v106;
  std::string *v107;
  std::string::size_type v108;
  _QWORD *v109;
  _QWORD *v110;
  std::string *v111;
  std::string::size_type v112;
  _QWORD *v113;
  _QWORD *v114;
  std::string *v115;
  std::string::size_type v116;
  _QWORD *v117;
  _QWORD *v118;
  std::string *v119;
  std::string::size_type v120;
  _QWORD *v121;
  _QWORD *v122;
  std::string *v123;
  std::string::size_type v124;
  _QWORD *v125;
  _QWORD *v126;
  std::string *v127;
  std::string::size_type v128;
  _QWORD *v129;
  _QWORD *v130;
  std::string *v131;
  std::string::size_type v132;
  _QWORD *v133;
  _QWORD *v134;
  std::string *v135;
  std::string::size_type v136;
  _QWORD *v137;
  void *v138;
  std::string *v139;
  std::string::size_type v140;
  _QWORD *v141;
  _QWORD *v142;
  _QWORD *v143;
  std::string *v144;
  std::string::size_type v145;
  _QWORD *v146;
  _QWORD *v147;
  _QWORD *v148;
  std::string *v149;
  std::string::size_type v150;
  _QWORD *v151;
  _QWORD *v152;
  _QWORD *v153;
  std::string *v154;
  std::string::size_type v155;
  _QWORD *v156;
  _QWORD *v157;
  _QWORD *v158;
  std::string *v159;
  std::string::size_type v160;
  _QWORD *v161;
  _QWORD *v162;
  _QWORD *v163;
  std::string *v164;
  std::string::size_type v165;
  _QWORD *v166;
  _QWORD *v167;
  _QWORD *v168;
  std::string *v169;
  std::string::size_type v170;
  _QWORD *v171;
  _QWORD *v172;
  _QWORD *v173;
  std::string *v174;
  std::string::size_type v175;
  _QWORD *v176;
  _QWORD *v177;
  void *v178;
  std::string *v179;
  std::string::size_type v180;
  _QWORD *v181;
  _QWORD *v182;
  std::string *v183;
  std::string::size_type v184;
  _QWORD *v185;
  _QWORD *v186;
  std::string *v187;
  std::string::size_type v188;
  _QWORD *v189;
  _QWORD *v190;
  std::string *v191;
  std::string::size_type v192;
  _QWORD *v193;
  _QWORD *v194;
  std::string *v195;
  std::string::size_type v196;
  _QWORD *v197;
  _QWORD *v198;
  std::string *v199;
  std::string::size_type v200;
  _QWORD *v201;
  _QWORD *v202;
  std::string *v203;
  std::string::size_type v204;
  _QWORD *v205;
  _QWORD *v206;
  std::string *v207;
  std::string::size_type v208;
  _QWORD *v209;
  _QWORD *v210;
  std::string *v211;
  std::string::size_type v212;
  _QWORD *v213;
  _QWORD *v214;
  std::string *v215;
  std::string::size_type v216;
  _QWORD *v217;
  _QWORD *v218;
  std::string *v219;
  std::string::size_type v220;
  _QWORD *v221;
  _QWORD *v222;
  std::string *v223;
  std::string::size_type v224;
  _QWORD *v225;
  _QWORD *v226;
  std::string *v227;
  std::string::size_type v228;
  _QWORD *v229;
  _QWORD *v230;
  std::string *v231;
  std::string::size_type v232;
  _QWORD *v233;
  _QWORD *v234;
  std::string *v235;
  std::string::size_type v236;
  _QWORD *v237;
  _QWORD *v238;
  std::string *v239;
  std::string::size_type v240;
  _QWORD *v241;
  _QWORD *v242;
  std::string *v243;
  std::string::size_type v244;
  _QWORD *v245;
  _QWORD *v246;
  std::string *v247;
  std::string::size_type v248;
  _QWORD *v249;
  _QWORD *v250;
  std::string *v251;
  std::string::size_type v252;
  _QWORD *v253;
  _QWORD *v254;
  std::string *v255;
  std::string::size_type v256;
  _QWORD *v257;
  _QWORD *v258;
  std::string *v259;
  std::string::size_type v260;
  _QWORD *v261;
  _QWORD *v262;
  std::string *v263;
  std::string::size_type v264;
  _QWORD *v265;
  _QWORD *v266;
  std::string *v267;
  std::string::size_type v268;
  _QWORD *v269;
  _QWORD *v270;
  std::string *v271;
  std::string::size_type v272;
  _QWORD *v273;
  _QWORD *v274;
  std::string *v275;
  std::string::size_type v276;
  _QWORD *v277;
  _QWORD *v278;
  std::string *v279;
  std::string::size_type v280;
  _QWORD *v281;
  _QWORD *v282;
  std::string *v283;
  std::string::size_type v284;
  _QWORD *v285;
  _QWORD *v286;
  std::string *v287;
  std::string::size_type v288;
  _QWORD *v289;
  _QWORD *v290;
  std::string *v291;
  std::string::size_type v292;
  _QWORD *v293;
  std::string *v294;
  std::string::size_type v295;
  _QWORD *v296;
  _QWORD *v297;
  std::string *v298;
  std::string::size_type v299;
  _QWORD *v300;
  _QWORD *v301;
  std::string *v302;
  std::string::size_type v303;
  _QWORD *v304;
  _QWORD *v305;
  std::string *v306;
  std::string::size_type v307;
  _QWORD *v308;
  _QWORD *v309;
  std::string *v310;
  std::string::size_type v311;
  _QWORD *v312;
  _QWORD *v313;
  std::string *v314;
  std::string::size_type v315;
  _QWORD *v316;
  _QWORD *v317;
  std::string *v318;
  std::string::size_type v319;
  _QWORD *v320;
  _QWORD *v321;
  std::string *v322;
  std::string::size_type v323;
  _QWORD *v324;
  _QWORD *v325;
  std::string *v326;
  std::string::size_type v327;
  _QWORD *v328;
  _QWORD *v329;
  std::string *v330;
  std::string::size_type v331;
  _QWORD *v332;
  _QWORD *v333;
  std::string *v334;
  std::string::size_type v335;
  _QWORD *v336;
  _QWORD *v337;
  std::string *v338;
  std::string::size_type v339;
  _QWORD *v340;
  _QWORD *v341;
  std::string *v342;
  std::string::size_type v343;
  _QWORD *v344;
  _QWORD *v345;
  std::string *v346;
  std::string::size_type v347;
  _QWORD *v348;
  std::string *v349;
  std::string::size_type v350;
  _QWORD *v351;
  _QWORD *v352;
  std::string *v353;
  std::string::size_type v354;
  _QWORD *v355;
  _QWORD *v356;
  std::string *v357;
  std::string::size_type v358;
  _QWORD *v359;
  _QWORD *v360;
  std::string *v361;
  std::string::size_type v362;
  _QWORD *v363;
  _QWORD *v364;
  std::string *v365;
  std::string::size_type v366;
  _QWORD *v367;
  _QWORD *v368;
  std::string *v369;
  std::string::size_type v370;
  _QWORD *v371;
  _QWORD *v372;
  std::string *v373;
  std::string::size_type v374;
  _QWORD *v375;
  _QWORD *v376;
  std::string *v377;
  std::string::size_type v378;
  _QWORD *v379;
  _QWORD *v380;
  std::string *v381;
  std::string::size_type v382;
  _QWORD *v383;
  _QWORD *v384;
  std::string *v385;
  std::string::size_type v386;
  _QWORD *v387;
  _QWORD *v388;
  std::string *v389;
  std::string::size_type v390;
  _QWORD *v391;
  _QWORD *v392;
  std::string *v393;
  std::string::size_type v394;
  _QWORD *v395;
  _QWORD *v396;
  std::string *v397;
  std::string::size_type v398;
  _QWORD *v399;
  _QWORD *v400;
  std::string *v401;
  std::string::size_type v402;
  _QWORD *v403;
  _QWORD *v404;
  std::string *v405;
  std::string::size_type v406;
  _QWORD *v407;
  _QWORD *v408;
  std::string *v409;
  std::string::size_type v410;
  _QWORD *v411;
  _QWORD *v412;
  std::string *v413;
  std::string::size_type v414;
  _QWORD *v415;
  _QWORD *v416;
  std::string *v417;
  std::string::size_type v418;
  _QWORD *v419;
  _QWORD *v420;
  std::string *v421;
  std::string::size_type v422;
  _QWORD *v423;
  _QWORD *v424;
  std::string *v425;
  std::string::size_type v426;
  _QWORD *v427;
  _QWORD *v428;
  std::string *v429;
  std::string::size_type v430;
  _QWORD *v431;
  _QWORD *v432;
  std::string *v433;
  std::string::size_type v434;
  _QWORD *v435;
  _QWORD *v436;
  std::string *v437;
  std::string::size_type v438;
  _QWORD *v439;
  _QWORD *v440;
  std::string *v441;
  std::string::size_type v442;
  _QWORD *v443;
  _QWORD *v444;
  std::string *v445;
  std::string::size_type v446;
  _QWORD *v447;
  _QWORD *v448;
  std::string *v449;
  std::string::size_type v450;
  _QWORD *v451;
  std::string *v452;
  std::string::size_type v453;
  _QWORD *v454;
  _QWORD *v455;
  _QWORD *v456;
  std::string *v457;
  std::string::size_type v458;
  _QWORD *v459;
  _QWORD *v460;
  _QWORD *v461;
  std::string *v462;
  std::string::size_type v463;
  _QWORD *v464;
  _QWORD *v465;
  std::string *v466;
  std::string::size_type v467;
  _QWORD *v468;
  _QWORD *v469;
  _QWORD *v470;
  std::string *v471;
  std::string::size_type v472;
  _QWORD *v473;
  _QWORD *v474;
  _QWORD *v475;
  std::string *v476;
  std::string::size_type v477;
  _QWORD *v478;
  _QWORD *v479;
  _QWORD *v480;
  std::string *v481;
  std::string::size_type v482;
  _QWORD *v483;
  _QWORD *v484;
  void *v485;
  char v486;
  void *v487;
  char v488;
  void *v489;
  char v490;
  void *v491;
  char v492;
  void *v493;
  char v494;
  void *v495;
  char v496;
  void *v497;
  char v498;
  void *v499;
  char v500;
  void *v501;
  char v502;
  void *v503;
  char v504;
  void *v505;
  char v506;
  void *v507;
  char v508;
  std::string v509;
  void *v510;
  char v511;
  void *v512;
  char v513;
  void *v514;
  char v515;
  void *v516;
  char v517;
  void *v518;
  char v519;
  void *v520;
  char v521;
  void *v522;
  char v523;
  void *v524;
  char v525;
  void *v526;
  char v527;
  void *v528;
  char v529;
  void *v530;
  char v531;
  void *v532;
  char v533;
  void *v534;
  char v535;
  void *v536;
  char v537;
  void *v538;
  char v539;
  void *v540;
  char v541;
  void *v542;
  char v543;
  void *v544;
  char v545;
  void *v546;
  char v547;
  void *v548;
  char v549;
  void *v550;
  char v551;
  void *v552;
  char v553;
  void *v554;
  char v555;
  void *v556;
  char v557;
  void *v558;
  char v559;
  void *v560;
  char v561;
  void *v562;
  char v563;
  void *v564;
  char v565;
  void *v566;
  char v567;
  void *v568;
  char v569;
  void *v570;
  char v571;
  void *v572;
  char v573;
  void *v574;
  char v575;
  void *v576;
  char v577;
  void *v578;
  char v579;
  void *v580;
  char v581;
  void *v582;
  char v583;
  void *v584;
  char v585;
  void *v586;
  char v587;
  void *v588;
  char v589;
  void *v590;
  char v591;
  void *v592;
  char v593;
  std::string v594;
  void *v595;
  char v596;
  std::string v597;
  void *v598;
  char v599;
  std::string v600;
  void *v601;
  char v602;
  std::string v603;
  void *v604;
  char v605;
  std::string v606;
  void *v607;
  char v608;
  std::string v609;
  void *v610;
  char v611;
  std::string v612;
  void *v613;
  char v614;
  std::string v615;
  void *v616;
  char v617;
  std::string v618;
  void *v619;
  char v620;
  std::string v621;
  void *v622;
  char v623;
  std::string v624;
  void *v625;
  char v626;
  std::string v627;
  void *v628;
  char v629;
  std::string v630;
  void *v631;
  char v632;
  void *v633;
  char v634;
  void *v635;
  char v636;
  void *v637;
  char v638;
  void *v639;
  char v640;
  void *v641;
  char v642;
  void *v643;
  char v644;
  void *v645;
  char v646;
  void *v647;
  char v648;
  void *v649;
  char v650;
  void *v651;
  char v652;
  void *v653;
  char v654;
  void *v655;
  char v656;
  void *v657;
  char v658;
  void *v659;
  char v660;
  void *v661;
  char v662;
  void *v663;
  char v664;
  std::string v665;
  void *v666;
  char v667;
  std::string v668;
  void *v669;
  char v670;
  std::string v671;
  void *v672;
  char v673;
  std::string v674;
  void *v675;
  char v676;
  std::string v677;
  void *v678;
  char v679;
  std::string v680;
  void *v681;
  char v682;
  std::string v683;
  void *v684;
  char v685;
  std::string v686;
  void *v687;
  char v688;
  void *v689;
  char v690;
  void *v691;
  char v692;
  void *v693;
  char v694;
  void *v695;
  char v696;
  void *v697;
  char v698;
  void *v699;
  char v700;
  void *v701;
  char v702;
  void *v703;
  char v704;
  std::string v705;
  void *v706;
  char v707;
  void *v708;
  char v709;
  void *v710;
  char v711;
  void *v712;
  char v713;
  void *v714;
  char v715;
  void *v716;
  char v717;
  void *v718;
  char v719;
  void *v720;
  char v721;
  std::string __p;
  void *v723;
  char v724;
  std::string v725;
  void *v726;
  char v727;
  std::string v728;
  void *v729;
  char v730;
  std::string v731;
  void *v732;
  char v733;
  std::string v734;
  std::string v735;
  std::string v736;
  void *v737;
  char v738;
  std::string v739;

  v6 = *a3;
  v7 = BYTE2(*a3);
  v8 = *a3;
  if (v8 == 3)
  {
    sub_2310FF330(&v737, "trace");
    profile_decoder::key(&v739);
    if ((v739.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v9 = &v739;
    else
      v9 = (std::string *)v739.__r_.__value_.__r.__words[0];
    if ((v739.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      size = HIBYTE(v739.__r_.__value_.__r.__words[2]);
    else
      size = v739.__r_.__value_.__l.__size_;
    v11 = sub_2310FF468((_QWORD *)(a2 + 16), (uint64_t)v9, size);
    *(_QWORD *)((char *)v11 + *(_QWORD *)(*v11 - 24) + 24) = 25;
    sshb_decoder::subtype_name(a1, (profile_decoder *)a3[4], v7, &v735);
    profile_decoder::str(&v736);
    if ((v736.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v12 = &v736;
    else
      v12 = (std::string *)v736.__r_.__value_.__r.__words[0];
    if ((v736.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v13 = HIBYTE(v736.__r_.__value_.__r.__words[2]);
    else
      v13 = v736.__r_.__value_.__l.__size_;
    v14 = sub_2310FF468(v11, (uint64_t)v12, v13);
    v15 = sub_2310FF468(v14, (uint64_t)",", 1);
    sub_2310FF330(&v732, "thread");
    profile_decoder::key(&v734);
    if ((v734.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v16 = &v734;
    else
      v16 = (std::string *)v734.__r_.__value_.__r.__words[0];
    if ((v734.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v17 = HIBYTE(v734.__r_.__value_.__r.__words[2]);
    else
      v17 = v734.__r_.__value_.__l.__size_;
    v18 = sub_2310FF468(v15, (uint64_t)v16, v17);
    *(_QWORD *)((char *)v18 + *(_QWORD *)(*v18 - 24) + 24) = 10;
    v19 = (_QWORD *)std::ostream::operator<<();
    v20 = sub_2310FF468(v19, (uint64_t)",", 1);
    sub_2310FF330(&v729, "arg1");
    profile_decoder::key(&v731);
    if ((v731.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v21 = &v731;
    else
      v21 = (std::string *)v731.__r_.__value_.__r.__words[0];
    if ((v731.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v22 = HIBYTE(v731.__r_.__value_.__r.__words[2]);
    else
      v22 = v731.__r_.__value_.__l.__size_;
    v23 = sub_2310FF468(v20, (uint64_t)v21, v22);
    *(_QWORD *)((char *)v23 + *(_QWORD *)(*v23 - 24) + 24) = 10;
    v24 = (_QWORD *)std::ostream::operator<<();
    v25 = sub_2310FF468(v24, (uint64_t)",", 1);
    sub_2310FF330(&v726, "arg2");
    profile_decoder::key(&v728);
    if ((v728.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v26 = &v728;
    else
      v26 = (std::string *)v728.__r_.__value_.__r.__words[0];
    if ((v728.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v27 = HIBYTE(v728.__r_.__value_.__r.__words[2]);
    else
      v27 = v728.__r_.__value_.__l.__size_;
    v28 = sub_2310FF468(v25, (uint64_t)v26, v27);
    *(_QWORD *)((char *)v28 + *(_QWORD *)(*v28 - 24) + 24) = 10;
    v29 = (_QWORD *)std::ostream::operator<<();
    v30 = sub_2310FF468(v29, (uint64_t)",", 1);
    sub_2310FF330(&v723, "arg3");
    profile_decoder::key(&v725);
    if ((v725.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v31 = &v725;
    else
      v31 = (std::string *)v725.__r_.__value_.__r.__words[0];
    if ((v725.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v32 = HIBYTE(v725.__r_.__value_.__r.__words[2]);
    else
      v32 = v725.__r_.__value_.__l.__size_;
    v33 = sub_2310FF468(v30, (uint64_t)v31, v32);
    *(_QWORD *)((char *)v33 + *(_QWORD *)(*v33 - 24) + 24) = 10;
    v34 = (_QWORD *)std::ostream::operator<<();
    v35 = sub_2310FF468(v34, (uint64_t)",", 1);
    sub_2310FF330(&v720, "arg4");
    profile_decoder::key(&__p);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      p_p = &__p;
    else
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v37 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
    else
      v37 = __p.__r_.__value_.__l.__size_;
    v38 = sub_2310FF468(v35, (uint64_t)p_p, v37);
    *(_QWORD *)((char *)v38 + *(_QWORD *)(*v38 - 24) + 24) = 10;
    v39 = (_QWORD *)std::ostream::operator<<();
    sub_2310FF468(v39, (uint64_t)",", 1);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    if (v721 < 0)
      operator delete(v720);
    if (SHIBYTE(v725.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v725.__r_.__value_.__l.__data_);
    if (v724 < 0)
      operator delete(v723);
    if (SHIBYTE(v728.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v728.__r_.__value_.__l.__data_);
    if (v727 < 0)
      operator delete(v726);
    if (SHIBYTE(v731.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v731.__r_.__value_.__l.__data_);
    if (v730 < 0)
      operator delete(v729);
    if (SHIBYTE(v734.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v734.__r_.__value_.__l.__data_);
    if (v733 < 0)
      operator delete(v732);
    if (SHIBYTE(v736.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v736.__r_.__value_.__l.__data_);
    if (SHIBYTE(v735.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v735.__r_.__value_.__l.__data_);
    if (SHIBYTE(v739.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v739.__r_.__value_.__l.__data_);
    if (v738 < 0)
      operator delete(v737);
    if (v7 == 7)
    {
      sub_2310FF330(&v510, "trace");
      profile_decoder::key(&v739);
      if ((v739.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v40 = &v739;
      else
        v40 = (std::string *)v739.__r_.__value_.__r.__words[0];
      if ((v739.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v41 = HIBYTE(v739.__r_.__value_.__r.__words[2]);
      else
        v41 = v739.__r_.__value_.__l.__size_;
      v42 = sub_2310FF468((_QWORD *)(a2 + 16), (uint64_t)v40, v41);
      *(_QWORD *)((char *)v42 + *(_QWORD *)(*v42 - 24) + 24) = 25;
      profile_decoder::find_in_table((const entry *)&unk_24FFFEA88, a3[4], 0x11u, &v509);
      profile_decoder::str(&v736);
      if ((v736.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v43 = &v736;
      else
        v43 = (std::string *)v736.__r_.__value_.__r.__words[0];
      if ((v736.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v44 = HIBYTE(v736.__r_.__value_.__r.__words[2]);
      else
        v44 = v736.__r_.__value_.__l.__size_;
      v45 = sub_2310FF468(v42, (uint64_t)v43, v44);
      v46 = sub_2310FF468(v45, (uint64_t)",", 1);
      sub_2310FF330(&v507, "thread");
      profile_decoder::key(&v734);
      if ((v734.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v47 = &v734;
      else
        v47 = (std::string *)v734.__r_.__value_.__r.__words[0];
      if ((v734.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v48 = HIBYTE(v734.__r_.__value_.__r.__words[2]);
      else
        v48 = v734.__r_.__value_.__l.__size_;
      v49 = sub_2310FF468(v46, (uint64_t)v47, v48);
      *(_QWORD *)((char *)v49 + *(_QWORD *)(*v49 - 24) + 24) = 10;
      v50 = (_QWORD *)std::ostream::operator<<();
      v51 = sub_2310FF468(v50, (uint64_t)",", 1);
      sub_2310FF330(&v505, "arg1");
      profile_decoder::key(&v731);
      if ((v731.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v52 = &v731;
      else
        v52 = (std::string *)v731.__r_.__value_.__r.__words[0];
      if ((v731.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v53 = HIBYTE(v731.__r_.__value_.__r.__words[2]);
      else
        v53 = v731.__r_.__value_.__l.__size_;
      v54 = sub_2310FF468(v51, (uint64_t)v52, v53);
      *(_QWORD *)((char *)v54 + *(_QWORD *)(*v54 - 24) + 24) = 10;
      v55 = (_QWORD *)std::ostream::operator<<();
      v56 = sub_2310FF468(v55, (uint64_t)",", 1);
      sub_2310FF330(&v503, "arg2");
      profile_decoder::key(&v728);
      if ((v728.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v57 = &v728;
      else
        v57 = (std::string *)v728.__r_.__value_.__r.__words[0];
      if ((v728.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v58 = HIBYTE(v728.__r_.__value_.__r.__words[2]);
      else
        v58 = v728.__r_.__value_.__l.__size_;
      v59 = sub_2310FF468(v56, (uint64_t)v57, v58);
      *(_QWORD *)((char *)v59 + *(_QWORD *)(*v59 - 24) + 24) = 10;
      v60 = (_QWORD *)std::ostream::operator<<();
      v61 = sub_2310FF468(v60, (uint64_t)",", 1);
      sub_2310FF330(&v501, "arg3");
      profile_decoder::key(&v725);
      if ((v725.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v62 = &v725;
      else
        v62 = (std::string *)v725.__r_.__value_.__r.__words[0];
      if ((v725.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v63 = HIBYTE(v725.__r_.__value_.__r.__words[2]);
      else
        v63 = v725.__r_.__value_.__l.__size_;
      v64 = sub_2310FF468(v61, (uint64_t)v62, v63);
      *(_QWORD *)((char *)v64 + *(_QWORD *)(*v64 - 24) + 24) = 10;
      v65 = (_QWORD *)std::ostream::operator<<();
      v66 = sub_2310FF468(v65, (uint64_t)",", 1);
      sub_2310FF330(&v499, "arg4");
      profile_decoder::key(&__p);
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v67 = &__p;
      else
        v67 = (std::string *)__p.__r_.__value_.__r.__words[0];
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v68 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
      else
        v68 = __p.__r_.__value_.__l.__size_;
      v69 = sub_2310FF468(v66, (uint64_t)v67, v68);
      *(_QWORD *)((char *)v69 + *(_QWORD *)(*v69 - 24) + 24) = 10;
      v70 = (_QWORD *)std::ostream::operator<<();
      sub_2310FF468(v70, (uint64_t)",", 1);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
      if (v500 < 0)
        operator delete(v499);
      if (SHIBYTE(v725.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v725.__r_.__value_.__l.__data_);
      if (v502 < 0)
        operator delete(v501);
      if (SHIBYTE(v728.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v728.__r_.__value_.__l.__data_);
      if (v504 < 0)
        operator delete(v503);
      if (SHIBYTE(v731.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v731.__r_.__value_.__l.__data_);
      if (v506 < 0)
        operator delete(v505);
      if (SHIBYTE(v734.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v734.__r_.__value_.__l.__data_);
      if (v508 < 0)
        operator delete(v507);
      if (SHIBYTE(v736.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v736.__r_.__value_.__l.__data_);
      if (SHIBYTE(v509.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v509.__r_.__value_.__l.__data_);
      if (SHIBYTE(v739.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v739.__r_.__value_.__l.__data_);
      if (v511 < 0)
      {
        v71 = v510;
LABEL_1162:
        operator delete(v71);
        return;
      }
      return;
    }
LABEL_1163:
    profile_decoder::parse_datatype((uint64_t)a1, a2, (uint64_t)a3);
    return;
  }
  v72 = BYTE1(v6);
  if (v8 == 2 && BYTE1(v6) != 2)
  {
    if (BYTE1(v6) == 3)
    {
      sub_2310FF330(&v718, "status-timestamp");
      profile_decoder::key(&v739);
      if ((v739.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v139 = &v739;
      else
        v139 = (std::string *)v739.__r_.__value_.__r.__words[0];
      if ((v739.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v140 = HIBYTE(v739.__r_.__value_.__r.__words[2]);
      else
        v140 = v739.__r_.__value_.__l.__size_;
      v141 = sub_2310FF468((_QWORD *)(a2 + 16), (uint64_t)v139, v140);
      *(_QWORD *)((char *)v141 + *(_QWORD *)(*v141 - 24) + 24) = 10;
      v142 = (_QWORD *)std::ostream::operator<<();
      v143 = sub_2310FF468(v142, (uint64_t)",", 1);
      sub_2310FF330(&v716, "fingerState");
      profile_decoder::key(&v736);
      if ((v736.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v144 = &v736;
      else
        v144 = (std::string *)v736.__r_.__value_.__r.__words[0];
      if ((v736.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v145 = HIBYTE(v736.__r_.__value_.__r.__words[2]);
      else
        v145 = v736.__r_.__value_.__l.__size_;
      v146 = sub_2310FF468(v143, (uint64_t)v144, v145);
      *(_QWORD *)((char *)v146 + *(_QWORD *)(*v146 - 24) + 24) = 10;
      v147 = (_QWORD *)std::ostream::operator<<();
      v148 = sub_2310FF468(v147, (uint64_t)",", 1);
      sub_2310FF330(&v714, "buttonState");
      profile_decoder::key(&v734);
      if ((v734.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v149 = &v734;
      else
        v149 = (std::string *)v734.__r_.__value_.__r.__words[0];
      if ((v734.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v150 = HIBYTE(v734.__r_.__value_.__r.__words[2]);
      else
        v150 = v734.__r_.__value_.__l.__size_;
      v151 = sub_2310FF468(v148, (uint64_t)v149, v150);
      *(_QWORD *)((char *)v151 + *(_QWORD *)(*v151 - 24) + 24) = 10;
      v152 = (_QWORD *)std::ostream::operator<<();
      v153 = sub_2310FF468(v152, (uint64_t)",", 1);
      sub_2310FF330(&v712, "buttonProgress");
      profile_decoder::key(&v731);
      if ((v731.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v154 = &v731;
      else
        v154 = (std::string *)v731.__r_.__value_.__r.__words[0];
      if ((v731.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v155 = HIBYTE(v731.__r_.__value_.__r.__words[2]);
      else
        v155 = v731.__r_.__value_.__l.__size_;
      v156 = sub_2310FF468(v153, (uint64_t)v154, v155);
      *(_QWORD *)((char *)v156 + *(_QWORD *)(*v156 - 24) + 24) = 10;
      v157 = (_QWORD *)std::ostream::operator<<();
      v158 = sub_2310FF468(v157, (uint64_t)",", 1);
      sub_2310FF330(&v710, "clickCount");
      profile_decoder::key(&v728);
      if ((v728.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v159 = &v728;
      else
        v159 = (std::string *)v728.__r_.__value_.__r.__words[0];
      if ((v728.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v160 = HIBYTE(v728.__r_.__value_.__r.__words[2]);
      else
        v160 = v728.__r_.__value_.__l.__size_;
      v161 = sub_2310FF468(v158, (uint64_t)v159, v160);
      *(_QWORD *)((char *)v161 + *(_QWORD *)(*v161 - 24) + 24) = 10;
      v162 = (_QWORD *)std::ostream::operator<<();
      v163 = sub_2310FF468(v162, (uint64_t)",", 1);
      sub_2310FF330(&v708, "clickCountIsTerminal");
      profile_decoder::key(&v725);
      if ((v725.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v164 = &v725;
      else
        v164 = (std::string *)v725.__r_.__value_.__r.__words[0];
      if ((v725.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v165 = HIBYTE(v725.__r_.__value_.__r.__words[2]);
      else
        v165 = v725.__r_.__value_.__l.__size_;
      v166 = sub_2310FF468(v163, (uint64_t)v164, v165);
      *(_QWORD *)((char *)v166 + *(_QWORD *)(*v166 - 24) + 24) = 10;
      v167 = (_QWORD *)std::ostream::operator<<();
      v168 = sub_2310FF468(v167, (uint64_t)",", 1);
      sub_2310FF330(&v706, "clickIsLong");
      profile_decoder::key(&__p);
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v169 = &__p;
      else
        v169 = (std::string *)__p.__r_.__value_.__r.__words[0];
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v170 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
      else
        v170 = __p.__r_.__value_.__l.__size_;
      v171 = sub_2310FF468(v168, (uint64_t)v169, v170);
      *(_QWORD *)((char *)v171 + *(_QWORD *)(*v171 - 24) + 24) = 10;
      v172 = (_QWORD *)std::ostream::operator<<();
      v173 = sub_2310FF468(v172, (uint64_t)",", 1);
      sub_2310FF330(&v703, "clickSpeed");
      profile_decoder::key(&v705);
      if ((v705.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v174 = &v705;
      else
        v174 = (std::string *)v705.__r_.__value_.__r.__words[0];
      if ((v705.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v175 = HIBYTE(v705.__r_.__value_.__r.__words[2]);
      else
        v175 = v705.__r_.__value_.__l.__size_;
      v176 = sub_2310FF468(v173, (uint64_t)v174, v175);
      *(_QWORD *)((char *)v176 + *(_QWORD *)(*v176 - 24) + 24) = 10;
      v177 = (_QWORD *)std::ostream::operator<<();
      sub_2310FF468(v177, (uint64_t)",", 1);
      if (SHIBYTE(v705.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v705.__r_.__value_.__l.__data_);
      if (v704 < 0)
        operator delete(v703);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
      if (v707 < 0)
        operator delete(v706);
      if (SHIBYTE(v725.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v725.__r_.__value_.__l.__data_);
      if (v709 < 0)
        operator delete(v708);
      if (SHIBYTE(v728.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v728.__r_.__value_.__l.__data_);
      if (v711 < 0)
        operator delete(v710);
      if (SHIBYTE(v731.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v731.__r_.__value_.__l.__data_);
      if (v713 < 0)
        operator delete(v712);
      if (SHIBYTE(v734.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v734.__r_.__value_.__l.__data_);
      if (v715 < 0)
        operator delete(v714);
      if (SHIBYTE(v736.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v736.__r_.__value_.__l.__data_);
      if (v717 < 0)
        operator delete(v716);
      if (SHIBYTE(v739.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v739.__r_.__value_.__l.__data_);
      if (v719 < 0)
      {
        v178 = v718;
LABEL_1087:
        operator delete(v178);
        goto LABEL_1088;
      }
      goto LABEL_1088;
    }
LABEL_826:
    profile_decoder::parse_datatype((uint64_t)a1, a2, (uint64_t)a3);
    goto LABEL_1088;
  }
  if (v8 != 10)
    goto LABEL_1088;
  v74 = *((unsigned __int16 *)a3 + 8);
  if (v74 == 4)
  {
    sub_2310FF330(&v661, "context-version");
    profile_decoder::key(&v739);
    if ((v739.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v179 = &v739;
    else
      v179 = (std::string *)v739.__r_.__value_.__r.__words[0];
    if ((v739.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v180 = HIBYTE(v739.__r_.__value_.__r.__words[2]);
    else
      v180 = v739.__r_.__value_.__l.__size_;
    sub_2310FF468((_QWORD *)(a2 + 16), (uint64_t)v179, v180);
    v181 = (_QWORD *)std::ostream::operator<<();
    v182 = sub_2310FF468(v181, (uint64_t)",", 1);
    sub_2310FF330(&v659, "mclk_aop_enabled");
    profile_decoder::key(&v736);
    if ((v736.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v183 = &v736;
    else
      v183 = (std::string *)v736.__r_.__value_.__r.__words[0];
    if ((v736.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v184 = HIBYTE(v736.__r_.__value_.__r.__words[2]);
    else
      v184 = v736.__r_.__value_.__l.__size_;
    sub_2310FF468(v182, (uint64_t)v183, v184);
    v185 = (_QWORD *)std::ostream::operator<<();
    v186 = sub_2310FF468(v185, (uint64_t)",", 1);
    sub_2310FF330(&v657, "mclk_ap_enabled");
    profile_decoder::key(&v734);
    if ((v734.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v187 = &v734;
    else
      v187 = (std::string *)v734.__r_.__value_.__r.__words[0];
    if ((v734.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v188 = HIBYTE(v734.__r_.__value_.__r.__words[2]);
    else
      v188 = v734.__r_.__value_.__l.__size_;
    sub_2310FF468(v186, (uint64_t)v187, v188);
    v189 = (_QWORD *)std::ostream::operator<<();
    v190 = sub_2310FF468(v189, (uint64_t)",", 1);
    sub_2310FF330(&v655, "maggie_aop_enabled");
    profile_decoder::key(&v731);
    if ((v731.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v191 = &v731;
    else
      v191 = (std::string *)v731.__r_.__value_.__r.__words[0];
    if ((v731.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v192 = HIBYTE(v731.__r_.__value_.__r.__words[2]);
    else
      v192 = v731.__r_.__value_.__l.__size_;
    sub_2310FF468(v190, (uint64_t)v191, v192);
    v193 = (_QWORD *)std::ostream::operator<<();
    v194 = sub_2310FF468(v193, (uint64_t)",", 1);
    sub_2310FF330(&v653, "maggie_ap_enabled");
    profile_decoder::key(&v728);
    if ((v728.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v195 = &v728;
    else
      v195 = (std::string *)v728.__r_.__value_.__r.__words[0];
    if ((v728.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v196 = HIBYTE(v728.__r_.__value_.__r.__words[2]);
    else
      v196 = v728.__r_.__value_.__l.__size_;
    sub_2310FF468(v194, (uint64_t)v195, v196);
    v197 = (_QWORD *)std::ostream::operator<<();
    v198 = sub_2310FF468(v197, (uint64_t)",", 1);
    sub_2310FF330(&v651, "maggieBusy");
    profile_decoder::key(&v725);
    if ((v725.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v199 = &v725;
    else
      v199 = (std::string *)v725.__r_.__value_.__r.__words[0];
    if ((v725.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v200 = HIBYTE(v725.__r_.__value_.__r.__words[2]);
    else
      v200 = v725.__r_.__value_.__l.__size_;
    sub_2310FF468(v198, (uint64_t)v199, v200);
    v201 = (_QWORD *)std::ostream::operator<<();
    v202 = sub_2310FF468(v201, (uint64_t)",", 1);
    sub_2310FF330(&v649, "enableARC");
    profile_decoder::key(&__p);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v203 = &__p;
    else
      v203 = (std::string *)__p.__r_.__value_.__r.__words[0];
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v204 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
    else
      v204 = __p.__r_.__value_.__l.__size_;
    sub_2310FF468(v202, (uint64_t)v203, v204);
    v205 = (_QWORD *)std::ostream::operator<<();
    v206 = sub_2310FF468(v205, (uint64_t)",", 1);
    sub_2310FF330(&v647, "enableSpkr");
    profile_decoder::key(&v705);
    if ((v705.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v207 = &v705;
    else
      v207 = (std::string *)v705.__r_.__value_.__r.__words[0];
    if ((v705.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v208 = HIBYTE(v705.__r_.__value_.__r.__words[2]);
    else
      v208 = v705.__r_.__value_.__l.__size_;
    sub_2310FF468(v206, (uint64_t)v207, v208);
    v209 = (_QWORD *)std::ostream::operator<<();
    v210 = sub_2310FF468(v209, (uint64_t)",", 1);
    sub_2310FF330(&v645, "mclk_on");
    profile_decoder::key(&v686);
    if ((v686.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v211 = &v686;
    else
      v211 = (std::string *)v686.__r_.__value_.__r.__words[0];
    if ((v686.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v212 = HIBYTE(v686.__r_.__value_.__r.__words[2]);
    else
      v212 = v686.__r_.__value_.__l.__size_;
    sub_2310FF468(v210, (uint64_t)v211, v212);
    v213 = (_QWORD *)std::ostream::operator<<();
    v214 = sub_2310FF468(v213, (uint64_t)",", 1);
    sub_2310FF330(&v643, "maggie_on");
    profile_decoder::key(&v683);
    if ((v683.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v215 = &v683;
    else
      v215 = (std::string *)v683.__r_.__value_.__r.__words[0];
    if ((v683.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v216 = HIBYTE(v683.__r_.__value_.__r.__words[2]);
    else
      v216 = v683.__r_.__value_.__l.__size_;
    sub_2310FF468(v214, (uint64_t)v215, v216);
    v217 = (_QWORD *)std::ostream::operator<<();
    v218 = sub_2310FF468(v217, (uint64_t)",", 1);
    sub_2310FF330(&v641, "maggiePending");
    profile_decoder::key(&v680);
    if ((v680.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v219 = &v680;
    else
      v219 = (std::string *)v680.__r_.__value_.__r.__words[0];
    if ((v680.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v220 = HIBYTE(v680.__r_.__value_.__r.__words[2]);
    else
      v220 = v680.__r_.__value_.__l.__size_;
    sub_2310FF468(v218, (uint64_t)v219, v220);
    v221 = (_QWORD *)std::ostream::operator<<();
    v222 = sub_2310FF468(v221, (uint64_t)",", 1);
    sub_2310FF330(&v639, "ampsEnabling");
    profile_decoder::key(&v677);
    if ((v677.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v223 = &v677;
    else
      v223 = (std::string *)v677.__r_.__value_.__r.__words[0];
    if ((v677.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v224 = HIBYTE(v677.__r_.__value_.__r.__words[2]);
    else
      v224 = v677.__r_.__value_.__l.__size_;
    sub_2310FF468(v222, (uint64_t)v223, v224);
    v225 = (_QWORD *)std::ostream::operator<<();
    v226 = sub_2310FF468(v225, (uint64_t)",", 1);
    sub_2310FF330(&v637, "mesa_ready");
    profile_decoder::key(&v674);
    if ((v674.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v227 = &v674;
    else
      v227 = (std::string *)v674.__r_.__value_.__r.__words[0];
    if ((v674.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v228 = HIBYTE(v674.__r_.__value_.__r.__words[2]);
    else
      v228 = v674.__r_.__value_.__l.__size_;
    sub_2310FF468(v226, (uint64_t)v227, v228);
    v229 = (_QWORD *)std::ostream::operator<<();
    v230 = sub_2310FF468(v229, (uint64_t)",", 1);
    sub_2310FF330(&v635, "ampsPrewarming");
    profile_decoder::key(&v671);
    if ((v671.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v231 = &v671;
    else
      v231 = (std::string *)v671.__r_.__value_.__r.__words[0];
    if ((v671.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v232 = HIBYTE(v671.__r_.__value_.__r.__words[2]);
    else
      v232 = v671.__r_.__value_.__l.__size_;
    sub_2310FF468(v230, (uint64_t)v231, v232);
    v233 = (_QWORD *)std::ostream::operator<<();
    v234 = sub_2310FF468(v233, (uint64_t)",", 1);
    sub_2310FF330(&v633, "ampsDisabling");
    profile_decoder::key(&v668);
    if ((v668.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v235 = &v668;
    else
      v235 = (std::string *)v668.__r_.__value_.__r.__words[0];
    if ((v668.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v236 = HIBYTE(v668.__r_.__value_.__r.__words[2]);
    else
      v236 = v668.__r_.__value_.__l.__size_;
    sub_2310FF468(v234, (uint64_t)v235, v236);
    v237 = (_QWORD *)std::ostream::operator<<();
    v238 = sub_2310FF468(v237, (uint64_t)",", 1);
    sub_2310FF330(&v631, "ampsPending");
    profile_decoder::key(&v665);
    if ((v665.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v239 = &v665;
    else
      v239 = (std::string *)v665.__r_.__value_.__r.__words[0];
    if ((v665.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v240 = HIBYTE(v665.__r_.__value_.__r.__words[2]);
    else
      v240 = v665.__r_.__value_.__l.__size_;
    sub_2310FF468(v238, (uint64_t)v239, v240);
    v241 = (_QWORD *)std::ostream::operator<<();
    v242 = sub_2310FF468(v241, (uint64_t)",", 1);
    sub_2310FF330(&v628, "clickState");
    profile_decoder::key(&v630);
    if ((v630.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v243 = &v630;
    else
      v243 = (std::string *)v630.__r_.__value_.__r.__words[0];
    if ((v630.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v244 = HIBYTE(v630.__r_.__value_.__r.__words[2]);
    else
      v244 = v630.__r_.__value_.__l.__size_;
    sub_2310FF468(v242, (uint64_t)v243, v244);
    v245 = (_QWORD *)std::ostream::operator<<();
    v246 = sub_2310FF468(v245, (uint64_t)",", 1);
    sub_2310FF330(&v625, "clickSpeed");
    profile_decoder::key(&v627);
    if ((v627.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v247 = &v627;
    else
      v247 = (std::string *)v627.__r_.__value_.__r.__words[0];
    if ((v627.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v248 = HIBYTE(v627.__r_.__value_.__r.__words[2]);
    else
      v248 = v627.__r_.__value_.__l.__size_;
    sub_2310FF468(v246, (uint64_t)v247, v248);
    v249 = (_QWORD *)std::ostream::operator<<();
    v250 = sub_2310FF468(v249, (uint64_t)",", 1);
    sub_2310FF330(&v622, "test_mode");
    profile_decoder::key(&v624);
    if ((v624.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v251 = &v624;
    else
      v251 = (std::string *)v624.__r_.__value_.__r.__words[0];
    if ((v624.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v252 = HIBYTE(v624.__r_.__value_.__r.__words[2]);
    else
      v252 = v624.__r_.__value_.__l.__size_;
    sub_2310FF468(v250, (uint64_t)v251, v252);
    v253 = (_QWORD *)std::ostream::operator<<();
    v254 = sub_2310FF468(v253, (uint64_t)",", 1);
    sub_2310FF330(&v619, "cl_enable");
    profile_decoder::key(&v621);
    if ((v621.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v255 = &v621;
    else
      v255 = (std::string *)v621.__r_.__value_.__r.__words[0];
    if ((v621.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v256 = HIBYTE(v621.__r_.__value_.__r.__words[2]);
    else
      v256 = v621.__r_.__value_.__l.__size_;
    sub_2310FF468(v254, (uint64_t)v255, v256);
    v257 = (_QWORD *)std::ostream::operator<<();
    v258 = sub_2310FF468(v257, (uint64_t)",", 1);
    sub_2310FF330(&v616, "cl_aop_enable");
    profile_decoder::key(&v618);
    if ((v618.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v259 = &v618;
    else
      v259 = (std::string *)v618.__r_.__value_.__r.__words[0];
    if ((v618.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v260 = HIBYTE(v618.__r_.__value_.__r.__words[2]);
    else
      v260 = v618.__r_.__value_.__l.__size_;
    sub_2310FF468(v258, (uint64_t)v259, v260);
    v261 = (_QWORD *)std::ostream::operator<<();
    v262 = sub_2310FF468(v261, (uint64_t)",", 1);
    sub_2310FF330(&v613, "cl_ap_enable");
    profile_decoder::key(&v615);
    if ((v615.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v263 = &v615;
    else
      v263 = (std::string *)v615.__r_.__value_.__r.__words[0];
    if ((v615.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v264 = HIBYTE(v615.__r_.__value_.__r.__words[2]);
    else
      v264 = v615.__r_.__value_.__l.__size_;
    sub_2310FF468(v262, (uint64_t)v263, v264);
    v265 = (_QWORD *)std::ostream::operator<<();
    v266 = sub_2310FF468(v265, (uint64_t)",", 1);
    sub_2310FF330(&v610, "maggie_ready");
    profile_decoder::key(&v612);
    if ((v612.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v267 = &v612;
    else
      v267 = (std::string *)v612.__r_.__value_.__r.__words[0];
    if ((v612.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v268 = HIBYTE(v612.__r_.__value_.__r.__words[2]);
    else
      v268 = v612.__r_.__value_.__l.__size_;
    sub_2310FF468(v266, (uint64_t)v267, v268);
    v269 = (_QWORD *)std::ostream::operator<<();
    v270 = sub_2310FF468(v269, (uint64_t)",", 1);
    sub_2310FF330(&v607, "apState0");
    profile_decoder::key(&v609);
    if ((v609.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v271 = &v609;
    else
      v271 = (std::string *)v609.__r_.__value_.__r.__words[0];
    if ((v609.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v272 = HIBYTE(v609.__r_.__value_.__r.__words[2]);
    else
      v272 = v609.__r_.__value_.__l.__size_;
    sub_2310FF468(v270, (uint64_t)v271, v272);
    v273 = (_QWORD *)std::ostream::operator<<();
    v274 = sub_2310FF468(v273, (uint64_t)",", 1);
    sub_2310FF330(&v604, "apState1");
    profile_decoder::key(&v606);
    if ((v606.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v275 = &v606;
    else
      v275 = (std::string *)v606.__r_.__value_.__r.__words[0];
    if ((v606.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v276 = HIBYTE(v606.__r_.__value_.__r.__words[2]);
    else
      v276 = v606.__r_.__value_.__l.__size_;
    sub_2310FF468(v274, (uint64_t)v275, v276);
    v277 = (_QWORD *)std::ostream::operator<<();
    v278 = sub_2310FF468(v277, (uint64_t)",", 1);
    sub_2310FF330(&v601, "aopState0");
    profile_decoder::key(&v603);
    if ((v603.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v279 = &v603;
    else
      v279 = (std::string *)v603.__r_.__value_.__r.__words[0];
    if ((v603.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v280 = HIBYTE(v603.__r_.__value_.__r.__words[2]);
    else
      v280 = v603.__r_.__value_.__l.__size_;
    sub_2310FF468(v278, (uint64_t)v279, v280);
    v281 = (_QWORD *)std::ostream::operator<<();
    v282 = sub_2310FF468(v281, (uint64_t)",", 1);
    sub_2310FF330(&v598, "aopState1");
    profile_decoder::key(&v600);
    if ((v600.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v283 = &v600;
    else
      v283 = (std::string *)v600.__r_.__value_.__r.__words[0];
    if ((v600.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v284 = HIBYTE(v600.__r_.__value_.__r.__words[2]);
    else
      v284 = v600.__r_.__value_.__l.__size_;
    sub_2310FF468(v282, (uint64_t)v283, v284);
    v285 = (_QWORD *)std::ostream::operator<<();
    v286 = sub_2310FF468(v285, (uint64_t)",", 1);
    sub_2310FF330(&v595, "state0");
    profile_decoder::key(&v597);
    if ((v597.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v287 = &v597;
    else
      v287 = (std::string *)v597.__r_.__value_.__r.__words[0];
    if ((v597.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v288 = HIBYTE(v597.__r_.__value_.__r.__words[2]);
    else
      v288 = v597.__r_.__value_.__l.__size_;
    sub_2310FF468(v286, (uint64_t)v287, v288);
    v289 = (_QWORD *)std::ostream::operator<<();
    v290 = sub_2310FF468(v289, (uint64_t)",", 1);
    sub_2310FF330(&v592, "state1");
    profile_decoder::key(&v594);
    if ((v594.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v291 = &v594;
    else
      v291 = (std::string *)v594.__r_.__value_.__r.__words[0];
    if ((v594.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v292 = HIBYTE(v594.__r_.__value_.__r.__words[2]);
    else
      v292 = v594.__r_.__value_.__l.__size_;
    sub_2310FF468(v290, (uint64_t)v291, v292);
    v293 = (_QWORD *)std::ostream::operator<<();
    sub_2310FF468(v293, (uint64_t)",", 1);
    if (SHIBYTE(v594.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v594.__r_.__value_.__l.__data_);
    if (v593 < 0)
      operator delete(v592);
    if (SHIBYTE(v597.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v597.__r_.__value_.__l.__data_);
    if (v596 < 0)
      operator delete(v595);
    if (SHIBYTE(v600.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v600.__r_.__value_.__l.__data_);
    if (v599 < 0)
      operator delete(v598);
    if (SHIBYTE(v603.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v603.__r_.__value_.__l.__data_);
    if (v602 < 0)
      operator delete(v601);
    if (SHIBYTE(v606.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v606.__r_.__value_.__l.__data_);
    if (v605 < 0)
      operator delete(v604);
    if (SHIBYTE(v609.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v609.__r_.__value_.__l.__data_);
    if (v608 < 0)
      operator delete(v607);
    if (SHIBYTE(v612.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v612.__r_.__value_.__l.__data_);
    if (v611 < 0)
      operator delete(v610);
    if (SHIBYTE(v615.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v615.__r_.__value_.__l.__data_);
    if (v614 < 0)
      operator delete(v613);
    if (SHIBYTE(v618.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v618.__r_.__value_.__l.__data_);
    if (v617 < 0)
      operator delete(v616);
    if (SHIBYTE(v621.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v621.__r_.__value_.__l.__data_);
    if (v620 < 0)
      operator delete(v619);
    if (SHIBYTE(v624.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v624.__r_.__value_.__l.__data_);
    if (v623 < 0)
      operator delete(v622);
    if (SHIBYTE(v627.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v627.__r_.__value_.__l.__data_);
    if (v626 < 0)
      operator delete(v625);
    if (SHIBYTE(v630.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v630.__r_.__value_.__l.__data_);
    if (v629 < 0)
      operator delete(v628);
    if (SHIBYTE(v665.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v665.__r_.__value_.__l.__data_);
    if (v632 < 0)
      operator delete(v631);
    if (SHIBYTE(v668.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v668.__r_.__value_.__l.__data_);
    if (v634 < 0)
      operator delete(v633);
    if (SHIBYTE(v671.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v671.__r_.__value_.__l.__data_);
    if (v636 < 0)
      operator delete(v635);
    if (SHIBYTE(v674.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v674.__r_.__value_.__l.__data_);
    if (v638 < 0)
      operator delete(v637);
    if (SHIBYTE(v677.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v677.__r_.__value_.__l.__data_);
    if (v640 < 0)
      operator delete(v639);
    if (SHIBYTE(v680.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v680.__r_.__value_.__l.__data_);
    if (v642 < 0)
      operator delete(v641);
    if (SHIBYTE(v683.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v683.__r_.__value_.__l.__data_);
    if (v644 < 0)
      operator delete(v643);
    if (SHIBYTE(v686.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v686.__r_.__value_.__l.__data_);
    if (v646 < 0)
      operator delete(v645);
    if (SHIBYTE(v705.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v705.__r_.__value_.__l.__data_);
    if (v648 < 0)
      operator delete(v647);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    if (v650 < 0)
      operator delete(v649);
    if (SHIBYTE(v725.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v725.__r_.__value_.__l.__data_);
    if (v652 < 0)
      operator delete(v651);
    if (SHIBYTE(v728.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v728.__r_.__value_.__l.__data_);
    if (v654 < 0)
      operator delete(v653);
    if (SHIBYTE(v731.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v731.__r_.__value_.__l.__data_);
    if (v656 < 0)
      operator delete(v655);
    if (SHIBYTE(v734.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v734.__r_.__value_.__l.__data_);
    if (v658 < 0)
      operator delete(v657);
    if (SHIBYTE(v736.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v736.__r_.__value_.__l.__data_);
    if (v660 < 0)
      operator delete(v659);
    if (SHIBYTE(v739.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v739.__r_.__value_.__l.__data_);
    if ((v662 & 0x80000000) == 0)
      goto LABEL_683;
    v138 = v661;
    goto LABEL_682;
  }
  if (v74 != 3)
    goto LABEL_684;
  sub_2310FF330(&v701, "context-version");
  profile_decoder::key(&v739);
  if ((v739.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v75 = &v739;
  else
    v75 = (std::string *)v739.__r_.__value_.__r.__words[0];
  if ((v739.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v76 = HIBYTE(v739.__r_.__value_.__r.__words[2]);
  else
    v76 = v739.__r_.__value_.__l.__size_;
  sub_2310FF468((_QWORD *)(a2 + 16), (uint64_t)v75, v76);
  v77 = (_QWORD *)std::ostream::operator<<();
  v78 = sub_2310FF468(v77, (uint64_t)",", 1);
  sub_2310FF330(&v699, "currentContext0");
  profile_decoder::key(&v736);
  if ((v736.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v79 = &v736;
  else
    v79 = (std::string *)v736.__r_.__value_.__r.__words[0];
  if ((v736.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v80 = HIBYTE(v736.__r_.__value_.__r.__words[2]);
  else
    v80 = v736.__r_.__value_.__l.__size_;
  sub_2310FF468(v78, (uint64_t)v79, v80);
  v81 = (_QWORD *)std::ostream::operator<<();
  v82 = sub_2310FF468(v81, (uint64_t)",", 1);
  sub_2310FF330(&v697, "currentContext1");
  profile_decoder::key(&v734);
  if ((v734.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v83 = &v734;
  else
    v83 = (std::string *)v734.__r_.__value_.__r.__words[0];
  if ((v734.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v84 = HIBYTE(v734.__r_.__value_.__r.__words[2]);
  else
    v84 = v734.__r_.__value_.__l.__size_;
  sub_2310FF468(v82, (uint64_t)v83, v84);
  v85 = (_QWORD *)std::ostream::operator<<();
  v86 = sub_2310FF468(v85, (uint64_t)",", 1);
  sub_2310FF330(&v695, "ampsEnabled");
  profile_decoder::key(&v731);
  if ((v731.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v87 = &v731;
  else
    v87 = (std::string *)v731.__r_.__value_.__r.__words[0];
  if ((v731.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v88 = HIBYTE(v731.__r_.__value_.__r.__words[2]);
  else
    v88 = v731.__r_.__value_.__l.__size_;
  sub_2310FF468(v86, (uint64_t)v87, v88);
  v89 = (_QWORD *)std::ostream::operator<<();
  v90 = sub_2310FF468(v89, (uint64_t)",", 1);
  sub_2310FF330(&v693, "enabled");
  profile_decoder::key(&v728);
  if ((v728.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v91 = &v728;
  else
    v91 = (std::string *)v728.__r_.__value_.__r.__words[0];
  if ((v728.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v92 = HIBYTE(v728.__r_.__value_.__r.__words[2]);
  else
    v92 = v728.__r_.__value_.__l.__size_;
  sub_2310FF468(v90, (uint64_t)v91, v92);
  v93 = (_QWORD *)std::ostream::operator<<();
  v94 = sub_2310FF468(v93, (uint64_t)",", 1);
  sub_2310FF330(&v691, "mode");
  profile_decoder::key(&v725);
  if ((v725.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v95 = &v725;
  else
    v95 = (std::string *)v725.__r_.__value_.__r.__words[0];
  if ((v725.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v96 = HIBYTE(v725.__r_.__value_.__r.__words[2]);
  else
    v96 = v725.__r_.__value_.__l.__size_;
  sub_2310FF468(v94, (uint64_t)v95, v96);
  v97 = (_QWORD *)std::ostream::operator<<();
  v98 = sub_2310FF468(v97, (uint64_t)",", 1);
  sub_2310FF330(&v689, "scan_time");
  profile_decoder::key(&__p);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v99 = &__p;
  else
    v99 = (std::string *)__p.__r_.__value_.__r.__words[0];
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v100 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  else
    v100 = __p.__r_.__value_.__l.__size_;
  sub_2310FF468(v98, (uint64_t)v99, v100);
  v101 = (_QWORD *)std::ostream::operator<<();
  v102 = sub_2310FF468(v101, (uint64_t)",", 1);
  sub_2310FF330(&v687, "active_scan_interval");
  profile_decoder::key(&v705);
  if ((v705.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v103 = &v705;
  else
    v103 = (std::string *)v705.__r_.__value_.__r.__words[0];
  if ((v705.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v104 = HIBYTE(v705.__r_.__value_.__r.__words[2]);
  else
    v104 = v705.__r_.__value_.__l.__size_;
  sub_2310FF468(v102, (uint64_t)v103, v104);
  v105 = (_QWORD *)std::ostream::operator<<();
  v106 = sub_2310FF468(v105, (uint64_t)",", 1);
  sub_2310FF330(&v684, "background_scan_interval");
  profile_decoder::key(&v686);
  if ((v686.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v107 = &v686;
  else
    v107 = (std::string *)v686.__r_.__value_.__r.__words[0];
  if ((v686.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v108 = HIBYTE(v686.__r_.__value_.__r.__words[2]);
  else
    v108 = v686.__r_.__value_.__l.__size_;
  sub_2310FF468(v106, (uint64_t)v107, v108);
  v109 = (_QWORD *)std::ostream::operator<<();
  v110 = sub_2310FF468(v109, (uint64_t)",", 1);
  sub_2310FF330(&v681, "fingerDetect");
  profile_decoder::key(&v683);
  if ((v683.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v111 = &v683;
  else
    v111 = (std::string *)v683.__r_.__value_.__r.__words[0];
  if ((v683.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v112 = HIBYTE(v683.__r_.__value_.__r.__words[2]);
  else
    v112 = v683.__r_.__value_.__l.__size_;
  sub_2310FF468(v110, (uint64_t)v111, v112);
  v113 = (_QWORD *)std::ostream::operator<<();
  v114 = sub_2310FF468(v113, (uint64_t)",", 1);
  sub_2310FF330(&v678, "buttonState");
  profile_decoder::key(&v680);
  if ((v680.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v115 = &v680;
  else
    v115 = (std::string *)v680.__r_.__value_.__r.__words[0];
  if ((v680.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v116 = HIBYTE(v680.__r_.__value_.__r.__words[2]);
  else
    v116 = v680.__r_.__value_.__l.__size_;
  sub_2310FF468(v114, (uint64_t)v115, v116);
  v117 = (_QWORD *)std::ostream::operator<<();
  v118 = sub_2310FF468(v117, (uint64_t)",", 1);
  sub_2310FF330(&v675, "pressCount");
  profile_decoder::key(&v677);
  if ((v677.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v119 = &v677;
  else
    v119 = (std::string *)v677.__r_.__value_.__r.__words[0];
  if ((v677.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v120 = HIBYTE(v677.__r_.__value_.__r.__words[2]);
  else
    v120 = v677.__r_.__value_.__l.__size_;
  sub_2310FF468(v118, (uint64_t)v119, v120);
  v121 = (_QWORD *)std::ostream::operator<<();
  v122 = sub_2310FF468(v121, (uint64_t)",", 1);
  sub_2310FF330(&v672, "longPress");
  profile_decoder::key(&v674);
  if ((v674.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v123 = &v674;
  else
    v123 = (std::string *)v674.__r_.__value_.__r.__words[0];
  if ((v674.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v124 = HIBYTE(v674.__r_.__value_.__r.__words[2]);
  else
    v124 = v674.__r_.__value_.__l.__size_;
  sub_2310FF468(v122, (uint64_t)v123, v124);
  v125 = (_QWORD *)std::ostream::operator<<();
  v126 = sub_2310FF468(v125, (uint64_t)",", 1);
  sub_2310FF330(&v669, "terminalEvent");
  profile_decoder::key(&v671);
  if ((v671.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v127 = &v671;
  else
    v127 = (std::string *)v671.__r_.__value_.__r.__words[0];
  if ((v671.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v128 = HIBYTE(v671.__r_.__value_.__r.__words[2]);
  else
    v128 = v671.__r_.__value_.__l.__size_;
  sub_2310FF468(v126, (uint64_t)v127, v128);
  v129 = (_QWORD *)std::ostream::operator<<();
  v130 = sub_2310FF468(v129, (uint64_t)",", 1);
  sub_2310FF330(&v666, "speed");
  profile_decoder::key(&v668);
  if ((v668.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v131 = &v668;
  else
    v131 = (std::string *)v668.__r_.__value_.__r.__words[0];
  if ((v668.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v132 = HIBYTE(v668.__r_.__value_.__r.__words[2]);
  else
    v132 = v668.__r_.__value_.__l.__size_;
  sub_2310FF468(v130, (uint64_t)v131, v132);
  v133 = (_QWORD *)std::ostream::operator<<();
  v134 = sub_2310FF468(v133, (uint64_t)",", 1);
  sub_2310FF330(&v663, "stage");
  profile_decoder::key(&v665);
  if ((v665.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v135 = &v665;
  else
    v135 = (std::string *)v665.__r_.__value_.__r.__words[0];
  if ((v665.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v136 = HIBYTE(v665.__r_.__value_.__r.__words[2]);
  else
    v136 = v665.__r_.__value_.__l.__size_;
  sub_2310FF468(v134, (uint64_t)v135, v136);
  v137 = (_QWORD *)std::ostream::operator<<();
  sub_2310FF468(v137, (uint64_t)",", 1);
  if (SHIBYTE(v665.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v665.__r_.__value_.__l.__data_);
  if (v664 < 0)
    operator delete(v663);
  if (SHIBYTE(v668.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v668.__r_.__value_.__l.__data_);
  if (v667 < 0)
    operator delete(v666);
  if (SHIBYTE(v671.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v671.__r_.__value_.__l.__data_);
  if (v670 < 0)
    operator delete(v669);
  if (SHIBYTE(v674.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v674.__r_.__value_.__l.__data_);
  if (v673 < 0)
    operator delete(v672);
  if (SHIBYTE(v677.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v677.__r_.__value_.__l.__data_);
  if (v676 < 0)
    operator delete(v675);
  if (SHIBYTE(v680.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v680.__r_.__value_.__l.__data_);
  if (v679 < 0)
    operator delete(v678);
  if (SHIBYTE(v683.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v683.__r_.__value_.__l.__data_);
  if (v682 < 0)
    operator delete(v681);
  if (SHIBYTE(v686.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v686.__r_.__value_.__l.__data_);
  if (v685 < 0)
    operator delete(v684);
  if (SHIBYTE(v705.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v705.__r_.__value_.__l.__data_);
  if (v688 < 0)
    operator delete(v687);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (v690 < 0)
    operator delete(v689);
  if (SHIBYTE(v725.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v725.__r_.__value_.__l.__data_);
  if (v692 < 0)
    operator delete(v691);
  if (SHIBYTE(v728.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v728.__r_.__value_.__l.__data_);
  if (v694 < 0)
    operator delete(v693);
  if (SHIBYTE(v731.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v731.__r_.__value_.__l.__data_);
  if (v696 < 0)
    operator delete(v695);
  if (SHIBYTE(v734.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v734.__r_.__value_.__l.__data_);
  if (v698 < 0)
    operator delete(v697);
  if (SHIBYTE(v736.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v736.__r_.__value_.__l.__data_);
  if (v700 < 0)
    operator delete(v699);
  if (SHIBYTE(v739.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v739.__r_.__value_.__l.__data_);
  if (v702 < 0)
  {
    v138 = v701;
LABEL_682:
    operator delete(v138);
  }
LABEL_683:
  v74 = *((unsigned __int16 *)a3 + 8);
LABEL_684:
  if (v74 == 7)
  {
    sub_2310FF330(&v562, "context-version");
    profile_decoder::key(&v739);
    if ((v739.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v349 = &v739;
    else
      v349 = (std::string *)v739.__r_.__value_.__r.__words[0];
    if ((v739.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v350 = HIBYTE(v739.__r_.__value_.__r.__words[2]);
    else
      v350 = v739.__r_.__value_.__l.__size_;
    sub_2310FF468((_QWORD *)(a2 + 16), (uint64_t)v349, v350);
    v351 = (_QWORD *)std::ostream::operator<<();
    v352 = sub_2310FF468(v351, (uint64_t)",", 1);
    sub_2310FF330(&v560, "mclk_aop_enabled");
    profile_decoder::key(&v736);
    if ((v736.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v353 = &v736;
    else
      v353 = (std::string *)v736.__r_.__value_.__r.__words[0];
    if ((v736.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v354 = HIBYTE(v736.__r_.__value_.__r.__words[2]);
    else
      v354 = v736.__r_.__value_.__l.__size_;
    sub_2310FF468(v352, (uint64_t)v353, v354);
    v355 = (_QWORD *)std::ostream::operator<<();
    v356 = sub_2310FF468(v355, (uint64_t)",", 1);
    sub_2310FF330(&v558, "mclk_ap_enabled");
    profile_decoder::key(&v734);
    if ((v734.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v357 = &v734;
    else
      v357 = (std::string *)v734.__r_.__value_.__r.__words[0];
    if ((v734.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v358 = HIBYTE(v734.__r_.__value_.__r.__words[2]);
    else
      v358 = v734.__r_.__value_.__l.__size_;
    sub_2310FF468(v356, (uint64_t)v357, v358);
    v359 = (_QWORD *)std::ostream::operator<<();
    v360 = sub_2310FF468(v359, (uint64_t)",", 1);
    sub_2310FF330(&v556, "maggie_aop_enabled");
    profile_decoder::key(&v731);
    if ((v731.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v361 = &v731;
    else
      v361 = (std::string *)v731.__r_.__value_.__r.__words[0];
    if ((v731.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v362 = HIBYTE(v731.__r_.__value_.__r.__words[2]);
    else
      v362 = v731.__r_.__value_.__l.__size_;
    sub_2310FF468(v360, (uint64_t)v361, v362);
    v363 = (_QWORD *)std::ostream::operator<<();
    v364 = sub_2310FF468(v363, (uint64_t)",", 1);
    sub_2310FF330(&v554, "maggie_ap_enabled");
    profile_decoder::key(&v728);
    if ((v728.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v365 = &v728;
    else
      v365 = (std::string *)v728.__r_.__value_.__r.__words[0];
    if ((v728.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v366 = HIBYTE(v728.__r_.__value_.__r.__words[2]);
    else
      v366 = v728.__r_.__value_.__l.__size_;
    sub_2310FF468(v364, (uint64_t)v365, v366);
    v367 = (_QWORD *)std::ostream::operator<<();
    v368 = sub_2310FF468(v367, (uint64_t)",", 1);
    sub_2310FF330(&v552, "maggieBusy");
    profile_decoder::key(&v725);
    if ((v725.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v369 = &v725;
    else
      v369 = (std::string *)v725.__r_.__value_.__r.__words[0];
    if ((v725.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v370 = HIBYTE(v725.__r_.__value_.__r.__words[2]);
    else
      v370 = v725.__r_.__value_.__l.__size_;
    sub_2310FF468(v368, (uint64_t)v369, v370);
    v371 = (_QWORD *)std::ostream::operator<<();
    v372 = sub_2310FF468(v371, (uint64_t)",", 1);
    sub_2310FF330(&v550, "enableARC");
    profile_decoder::key(&__p);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v373 = &__p;
    else
      v373 = (std::string *)__p.__r_.__value_.__r.__words[0];
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v374 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
    else
      v374 = __p.__r_.__value_.__l.__size_;
    sub_2310FF468(v372, (uint64_t)v373, v374);
    v375 = (_QWORD *)std::ostream::operator<<();
    v376 = sub_2310FF468(v375, (uint64_t)",", 1);
    sub_2310FF330(&v548, "enableSpkr");
    profile_decoder::key(&v705);
    if ((v705.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v377 = &v705;
    else
      v377 = (std::string *)v705.__r_.__value_.__r.__words[0];
    if ((v705.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v378 = HIBYTE(v705.__r_.__value_.__r.__words[2]);
    else
      v378 = v705.__r_.__value_.__l.__size_;
    sub_2310FF468(v376, (uint64_t)v377, v378);
    v379 = (_QWORD *)std::ostream::operator<<();
    v380 = sub_2310FF468(v379, (uint64_t)",", 1);
    sub_2310FF330(&v546, "mclk_on");
    profile_decoder::key(&v686);
    if ((v686.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v381 = &v686;
    else
      v381 = (std::string *)v686.__r_.__value_.__r.__words[0];
    if ((v686.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v382 = HIBYTE(v686.__r_.__value_.__r.__words[2]);
    else
      v382 = v686.__r_.__value_.__l.__size_;
    sub_2310FF468(v380, (uint64_t)v381, v382);
    v383 = (_QWORD *)std::ostream::operator<<();
    v384 = sub_2310FF468(v383, (uint64_t)",", 1);
    sub_2310FF330(&v544, "maggie_on");
    profile_decoder::key(&v683);
    if ((v683.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v385 = &v683;
    else
      v385 = (std::string *)v683.__r_.__value_.__r.__words[0];
    if ((v683.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v386 = HIBYTE(v683.__r_.__value_.__r.__words[2]);
    else
      v386 = v683.__r_.__value_.__l.__size_;
    sub_2310FF468(v384, (uint64_t)v385, v386);
    v387 = (_QWORD *)std::ostream::operator<<();
    v388 = sub_2310FF468(v387, (uint64_t)",", 1);
    sub_2310FF330(&v542, "maggiePending");
    profile_decoder::key(&v680);
    if ((v680.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v389 = &v680;
    else
      v389 = (std::string *)v680.__r_.__value_.__r.__words[0];
    if ((v680.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v390 = HIBYTE(v680.__r_.__value_.__r.__words[2]);
    else
      v390 = v680.__r_.__value_.__l.__size_;
    sub_2310FF468(v388, (uint64_t)v389, v390);
    v391 = (_QWORD *)std::ostream::operator<<();
    v392 = sub_2310FF468(v391, (uint64_t)",", 1);
    sub_2310FF330(&v540, "mesa_ready");
    profile_decoder::key(&v677);
    if ((v677.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v393 = &v677;
    else
      v393 = (std::string *)v677.__r_.__value_.__r.__words[0];
    if ((v677.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v394 = HIBYTE(v677.__r_.__value_.__r.__words[2]);
    else
      v394 = v677.__r_.__value_.__l.__size_;
    sub_2310FF468(v392, (uint64_t)v393, v394);
    v395 = (_QWORD *)std::ostream::operator<<();
    v396 = sub_2310FF468(v395, (uint64_t)",", 1);
    sub_2310FF330(&v538, "ampsState");
    profile_decoder::key(&v674);
    if ((v674.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v397 = &v674;
    else
      v397 = (std::string *)v674.__r_.__value_.__r.__words[0];
    if ((v674.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v398 = HIBYTE(v674.__r_.__value_.__r.__words[2]);
    else
      v398 = v674.__r_.__value_.__l.__size_;
    sub_2310FF468(v396, (uint64_t)v397, v398);
    v399 = (_QWORD *)std::ostream::operator<<();
    v400 = sub_2310FF468(v399, (uint64_t)",", 1);
    sub_2310FF330(&v536, "clickState");
    profile_decoder::key(&v671);
    if ((v671.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v401 = &v671;
    else
      v401 = (std::string *)v671.__r_.__value_.__r.__words[0];
    if ((v671.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v402 = HIBYTE(v671.__r_.__value_.__r.__words[2]);
    else
      v402 = v671.__r_.__value_.__l.__size_;
    sub_2310FF468(v400, (uint64_t)v401, v402);
    v403 = (_QWORD *)std::ostream::operator<<();
    v404 = sub_2310FF468(v403, (uint64_t)",", 1);
    sub_2310FF330(&v534, "clickSpeed");
    profile_decoder::key(&v668);
    if ((v668.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v405 = &v668;
    else
      v405 = (std::string *)v668.__r_.__value_.__r.__words[0];
    if ((v668.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v406 = HIBYTE(v668.__r_.__value_.__r.__words[2]);
    else
      v406 = v668.__r_.__value_.__l.__size_;
    sub_2310FF468(v404, (uint64_t)v405, v406);
    v407 = (_QWORD *)std::ostream::operator<<();
    v408 = sub_2310FF468(v407, (uint64_t)",", 1);
    sub_2310FF330(&v532, "test_mode");
    profile_decoder::key(&v665);
    if ((v665.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v409 = &v665;
    else
      v409 = (std::string *)v665.__r_.__value_.__r.__words[0];
    if ((v665.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v410 = HIBYTE(v665.__r_.__value_.__r.__words[2]);
    else
      v410 = v665.__r_.__value_.__l.__size_;
    sub_2310FF468(v408, (uint64_t)v409, v410);
    v411 = (_QWORD *)std::ostream::operator<<();
    v412 = sub_2310FF468(v411, (uint64_t)",", 1);
    sub_2310FF330(&v530, "cl_enable");
    profile_decoder::key(&v630);
    if ((v630.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v413 = &v630;
    else
      v413 = (std::string *)v630.__r_.__value_.__r.__words[0];
    if ((v630.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v414 = HIBYTE(v630.__r_.__value_.__r.__words[2]);
    else
      v414 = v630.__r_.__value_.__l.__size_;
    sub_2310FF468(v412, (uint64_t)v413, v414);
    v415 = (_QWORD *)std::ostream::operator<<();
    v416 = sub_2310FF468(v415, (uint64_t)",", 1);
    sub_2310FF330(&v528, "cl_aop_enable");
    profile_decoder::key(&v627);
    if ((v627.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v417 = &v627;
    else
      v417 = (std::string *)v627.__r_.__value_.__r.__words[0];
    if ((v627.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v418 = HIBYTE(v627.__r_.__value_.__r.__words[2]);
    else
      v418 = v627.__r_.__value_.__l.__size_;
    sub_2310FF468(v416, (uint64_t)v417, v418);
    v419 = (_QWORD *)std::ostream::operator<<();
    v420 = sub_2310FF468(v419, (uint64_t)",", 1);
    sub_2310FF330(&v526, "cl_ap_enable");
    profile_decoder::key(&v624);
    if ((v624.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v421 = &v624;
    else
      v421 = (std::string *)v624.__r_.__value_.__r.__words[0];
    if ((v624.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v422 = HIBYTE(v624.__r_.__value_.__r.__words[2]);
    else
      v422 = v624.__r_.__value_.__l.__size_;
    sub_2310FF468(v420, (uint64_t)v421, v422);
    v423 = (_QWORD *)std::ostream::operator<<();
    v424 = sub_2310FF468(v423, (uint64_t)",", 1);
    sub_2310FF330(&v524, "maggie_ready");
    profile_decoder::key(&v621);
    if ((v621.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v425 = &v621;
    else
      v425 = (std::string *)v621.__r_.__value_.__r.__words[0];
    if ((v621.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v426 = HIBYTE(v621.__r_.__value_.__r.__words[2]);
    else
      v426 = v621.__r_.__value_.__l.__size_;
    sub_2310FF468(v424, (uint64_t)v425, v426);
    v427 = (_QWORD *)std::ostream::operator<<();
    v428 = sub_2310FF468(v427, (uint64_t)",", 1);
    sub_2310FF330(&v522, "apState0");
    profile_decoder::key(&v618);
    if ((v618.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v429 = &v618;
    else
      v429 = (std::string *)v618.__r_.__value_.__r.__words[0];
    if ((v618.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v430 = HIBYTE(v618.__r_.__value_.__r.__words[2]);
    else
      v430 = v618.__r_.__value_.__l.__size_;
    sub_2310FF468(v428, (uint64_t)v429, v430);
    v431 = (_QWORD *)std::ostream::operator<<();
    v432 = sub_2310FF468(v431, (uint64_t)",", 1);
    sub_2310FF330(&v520, "apState1");
    profile_decoder::key(&v615);
    if ((v615.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v433 = &v615;
    else
      v433 = (std::string *)v615.__r_.__value_.__r.__words[0];
    if ((v615.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v434 = HIBYTE(v615.__r_.__value_.__r.__words[2]);
    else
      v434 = v615.__r_.__value_.__l.__size_;
    sub_2310FF468(v432, (uint64_t)v433, v434);
    v435 = (_QWORD *)std::ostream::operator<<();
    v436 = sub_2310FF468(v435, (uint64_t)",", 1);
    sub_2310FF330(&v518, "aopState0");
    profile_decoder::key(&v612);
    if ((v612.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v437 = &v612;
    else
      v437 = (std::string *)v612.__r_.__value_.__r.__words[0];
    if ((v612.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v438 = HIBYTE(v612.__r_.__value_.__r.__words[2]);
    else
      v438 = v612.__r_.__value_.__l.__size_;
    sub_2310FF468(v436, (uint64_t)v437, v438);
    v439 = (_QWORD *)std::ostream::operator<<();
    v440 = sub_2310FF468(v439, (uint64_t)",", 1);
    sub_2310FF330(&v516, "aopState1");
    profile_decoder::key(&v609);
    if ((v609.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v441 = &v609;
    else
      v441 = (std::string *)v609.__r_.__value_.__r.__words[0];
    if ((v609.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v442 = HIBYTE(v609.__r_.__value_.__r.__words[2]);
    else
      v442 = v609.__r_.__value_.__l.__size_;
    sub_2310FF468(v440, (uint64_t)v441, v442);
    v443 = (_QWORD *)std::ostream::operator<<();
    v444 = sub_2310FF468(v443, (uint64_t)",", 1);
    sub_2310FF330(&v514, "state0");
    profile_decoder::key(&v606);
    if ((v606.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v445 = &v606;
    else
      v445 = (std::string *)v606.__r_.__value_.__r.__words[0];
    if ((v606.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v446 = HIBYTE(v606.__r_.__value_.__r.__words[2]);
    else
      v446 = v606.__r_.__value_.__l.__size_;
    sub_2310FF468(v444, (uint64_t)v445, v446);
    v447 = (_QWORD *)std::ostream::operator<<();
    v448 = sub_2310FF468(v447, (uint64_t)",", 1);
    sub_2310FF330(&v512, "state1");
    profile_decoder::key(&v603);
    if ((v603.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v449 = &v603;
    else
      v449 = (std::string *)v603.__r_.__value_.__r.__words[0];
    if ((v603.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v450 = HIBYTE(v603.__r_.__value_.__r.__words[2]);
    else
      v450 = v603.__r_.__value_.__l.__size_;
    sub_2310FF468(v448, (uint64_t)v449, v450);
    v451 = (_QWORD *)std::ostream::operator<<();
    sub_2310FF468(v451, (uint64_t)",", 1);
    if (SHIBYTE(v603.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v603.__r_.__value_.__l.__data_);
    if (v513 < 0)
      operator delete(v512);
    if (SHIBYTE(v606.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v606.__r_.__value_.__l.__data_);
    if (v515 < 0)
      operator delete(v514);
    if (SHIBYTE(v609.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v609.__r_.__value_.__l.__data_);
    if (v517 < 0)
      operator delete(v516);
    if (SHIBYTE(v612.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v612.__r_.__value_.__l.__data_);
    if (v519 < 0)
      operator delete(v518);
    if (SHIBYTE(v615.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v615.__r_.__value_.__l.__data_);
    if (v521 < 0)
      operator delete(v520);
    if (SHIBYTE(v618.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v618.__r_.__value_.__l.__data_);
    if (v523 < 0)
      operator delete(v522);
    if (SHIBYTE(v621.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v621.__r_.__value_.__l.__data_);
    if (v525 < 0)
      operator delete(v524);
    if (SHIBYTE(v624.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v624.__r_.__value_.__l.__data_);
    if (v527 < 0)
      operator delete(v526);
    if (SHIBYTE(v627.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v627.__r_.__value_.__l.__data_);
    if (v529 < 0)
      operator delete(v528);
    if (SHIBYTE(v630.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v630.__r_.__value_.__l.__data_);
    if (v531 < 0)
      operator delete(v530);
    if (SHIBYTE(v665.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v665.__r_.__value_.__l.__data_);
    if (v533 < 0)
      operator delete(v532);
    if (SHIBYTE(v668.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v668.__r_.__value_.__l.__data_);
    if (v535 < 0)
      operator delete(v534);
    if (SHIBYTE(v671.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v671.__r_.__value_.__l.__data_);
    if (v537 < 0)
      operator delete(v536);
    if (SHIBYTE(v674.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v674.__r_.__value_.__l.__data_);
    if (v539 < 0)
      operator delete(v538);
    if (SHIBYTE(v677.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v677.__r_.__value_.__l.__data_);
    if (v541 < 0)
      operator delete(v540);
    if (SHIBYTE(v680.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v680.__r_.__value_.__l.__data_);
    if (v543 < 0)
      operator delete(v542);
    if (SHIBYTE(v683.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v683.__r_.__value_.__l.__data_);
    if (v545 < 0)
      operator delete(v544);
    if (SHIBYTE(v686.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v686.__r_.__value_.__l.__data_);
    if (v547 < 0)
      operator delete(v546);
    if (SHIBYTE(v705.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v705.__r_.__value_.__l.__data_);
    if (v549 < 0)
      operator delete(v548);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    if (v551 < 0)
      operator delete(v550);
    if (SHIBYTE(v725.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v725.__r_.__value_.__l.__data_);
    if (v553 < 0)
      operator delete(v552);
    if (SHIBYTE(v728.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v728.__r_.__value_.__l.__data_);
    if (v555 < 0)
      operator delete(v554);
    if (SHIBYTE(v731.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v731.__r_.__value_.__l.__data_);
    if (v557 < 0)
      operator delete(v556);
    if (SHIBYTE(v734.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v734.__r_.__value_.__l.__data_);
    if (v559 < 0)
      operator delete(v558);
    if (SHIBYTE(v736.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v736.__r_.__value_.__l.__data_);
    if (v561 < 0)
      operator delete(v560);
    if (SHIBYTE(v739.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v739.__r_.__value_.__l.__data_);
    if (v563 < 0)
    {
      v178 = v562;
      goto LABEL_1087;
    }
    goto LABEL_1088;
  }
  if (v74 != 5)
    goto LABEL_826;
  sub_2310FF330(&v590, "context-version");
  profile_decoder::key(&v739);
  if ((v739.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v294 = &v739;
  else
    v294 = (std::string *)v739.__r_.__value_.__r.__words[0];
  if ((v739.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v295 = HIBYTE(v739.__r_.__value_.__r.__words[2]);
  else
    v295 = v739.__r_.__value_.__l.__size_;
  sub_2310FF468((_QWORD *)(a2 + 16), (uint64_t)v294, v295);
  v296 = (_QWORD *)std::ostream::operator<<();
  v297 = sub_2310FF468(v296, (uint64_t)",", 1);
  sub_2310FF330(&v588, "currentContext0");
  profile_decoder::key(&v736);
  if ((v736.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v298 = &v736;
  else
    v298 = (std::string *)v736.__r_.__value_.__r.__words[0];
  if ((v736.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v299 = HIBYTE(v736.__r_.__value_.__r.__words[2]);
  else
    v299 = v736.__r_.__value_.__l.__size_;
  sub_2310FF468(v297, (uint64_t)v298, v299);
  v300 = (_QWORD *)std::ostream::operator<<();
  v301 = sub_2310FF468(v300, (uint64_t)",", 1);
  sub_2310FF330(&v586, "currentContext1");
  profile_decoder::key(&v734);
  if ((v734.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v302 = &v734;
  else
    v302 = (std::string *)v734.__r_.__value_.__r.__words[0];
  if ((v734.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v303 = HIBYTE(v734.__r_.__value_.__r.__words[2]);
  else
    v303 = v734.__r_.__value_.__l.__size_;
  sub_2310FF468(v301, (uint64_t)v302, v303);
  v304 = (_QWORD *)std::ostream::operator<<();
  v305 = sub_2310FF468(v304, (uint64_t)",", 1);
  sub_2310FF330(&v584, "ampsEnabled");
  profile_decoder::key(&v731);
  if ((v731.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v306 = &v731;
  else
    v306 = (std::string *)v731.__r_.__value_.__r.__words[0];
  if ((v731.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v307 = HIBYTE(v731.__r_.__value_.__r.__words[2]);
  else
    v307 = v731.__r_.__value_.__l.__size_;
  sub_2310FF468(v305, (uint64_t)v306, v307);
  v308 = (_QWORD *)std::ostream::operator<<();
  v309 = sub_2310FF468(v308, (uint64_t)",", 1);
  sub_2310FF330(&v582, "enabled");
  profile_decoder::key(&v728);
  if ((v728.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v310 = &v728;
  else
    v310 = (std::string *)v728.__r_.__value_.__r.__words[0];
  if ((v728.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v311 = HIBYTE(v728.__r_.__value_.__r.__words[2]);
  else
    v311 = v728.__r_.__value_.__l.__size_;
  sub_2310FF468(v309, (uint64_t)v310, v311);
  v312 = (_QWORD *)std::ostream::operator<<();
  v313 = sub_2310FF468(v312, (uint64_t)",", 1);
  sub_2310FF330(&v580, "scan_period");
  profile_decoder::key(&v725);
  if ((v725.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v314 = &v725;
  else
    v314 = (std::string *)v725.__r_.__value_.__r.__words[0];
  if ((v725.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v315 = HIBYTE(v725.__r_.__value_.__r.__words[2]);
  else
    v315 = v725.__r_.__value_.__l.__size_;
  sub_2310FF468(v313, (uint64_t)v314, v315);
  v316 = (_QWORD *)std::ostream::operator<<();
  v317 = sub_2310FF468(v316, (uint64_t)",", 1);
  sub_2310FF330(&v578, "scan_time");
  profile_decoder::key(&__p);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v318 = &__p;
  else
    v318 = (std::string *)__p.__r_.__value_.__r.__words[0];
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v319 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
  else
    v319 = __p.__r_.__value_.__l.__size_;
  sub_2310FF468(v317, (uint64_t)v318, v319);
  v320 = (_QWORD *)std::ostream::operator<<();
  v321 = sub_2310FF468(v320, (uint64_t)",", 1);
  sub_2310FF330(&v576, "fingerDetect");
  profile_decoder::key(&v705);
  if ((v705.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v322 = &v705;
  else
    v322 = (std::string *)v705.__r_.__value_.__r.__words[0];
  if ((v705.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v323 = HIBYTE(v705.__r_.__value_.__r.__words[2]);
  else
    v323 = v705.__r_.__value_.__l.__size_;
  sub_2310FF468(v321, (uint64_t)v322, v323);
  v324 = (_QWORD *)std::ostream::operator<<();
  v325 = sub_2310FF468(v324, (uint64_t)",", 1);
  sub_2310FF330(&v574, "buttonState");
  profile_decoder::key(&v686);
  if ((v686.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v326 = &v686;
  else
    v326 = (std::string *)v686.__r_.__value_.__r.__words[0];
  if ((v686.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v327 = HIBYTE(v686.__r_.__value_.__r.__words[2]);
  else
    v327 = v686.__r_.__value_.__l.__size_;
  sub_2310FF468(v325, (uint64_t)v326, v327);
  v328 = (_QWORD *)std::ostream::operator<<();
  v329 = sub_2310FF468(v328, (uint64_t)",", 1);
  sub_2310FF330(&v572, "pressCount");
  profile_decoder::key(&v683);
  if ((v683.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v330 = &v683;
  else
    v330 = (std::string *)v683.__r_.__value_.__r.__words[0];
  if ((v683.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v331 = HIBYTE(v683.__r_.__value_.__r.__words[2]);
  else
    v331 = v683.__r_.__value_.__l.__size_;
  sub_2310FF468(v329, (uint64_t)v330, v331);
  v332 = (_QWORD *)std::ostream::operator<<();
  v333 = sub_2310FF468(v332, (uint64_t)",", 1);
  sub_2310FF330(&v570, "longPress");
  profile_decoder::key(&v680);
  if ((v680.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v334 = &v680;
  else
    v334 = (std::string *)v680.__r_.__value_.__r.__words[0];
  if ((v680.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v335 = HIBYTE(v680.__r_.__value_.__r.__words[2]);
  else
    v335 = v680.__r_.__value_.__l.__size_;
  sub_2310FF468(v333, (uint64_t)v334, v335);
  v336 = (_QWORD *)std::ostream::operator<<();
  v337 = sub_2310FF468(v336, (uint64_t)",", 1);
  sub_2310FF330(&v568, "terminalEvent");
  profile_decoder::key(&v677);
  if ((v677.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v338 = &v677;
  else
    v338 = (std::string *)v677.__r_.__value_.__r.__words[0];
  if ((v677.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v339 = HIBYTE(v677.__r_.__value_.__r.__words[2]);
  else
    v339 = v677.__r_.__value_.__l.__size_;
  sub_2310FF468(v337, (uint64_t)v338, v339);
  v340 = (_QWORD *)std::ostream::operator<<();
  v341 = sub_2310FF468(v340, (uint64_t)",", 1);
  sub_2310FF330(&v566, "speed");
  profile_decoder::key(&v674);
  if ((v674.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v342 = &v674;
  else
    v342 = (std::string *)v674.__r_.__value_.__r.__words[0];
  if ((v674.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v343 = HIBYTE(v674.__r_.__value_.__r.__words[2]);
  else
    v343 = v674.__r_.__value_.__l.__size_;
  sub_2310FF468(v341, (uint64_t)v342, v343);
  v344 = (_QWORD *)std::ostream::operator<<();
  v345 = sub_2310FF468(v344, (uint64_t)",", 1);
  sub_2310FF330(&v564, "stage");
  profile_decoder::key(&v671);
  if ((v671.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v346 = &v671;
  else
    v346 = (std::string *)v671.__r_.__value_.__r.__words[0];
  if ((v671.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v347 = HIBYTE(v671.__r_.__value_.__r.__words[2]);
  else
    v347 = v671.__r_.__value_.__l.__size_;
  sub_2310FF468(v345, (uint64_t)v346, v347);
  v348 = (_QWORD *)std::ostream::operator<<();
  sub_2310FF468(v348, (uint64_t)",", 1);
  if (SHIBYTE(v671.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v671.__r_.__value_.__l.__data_);
  if (v565 < 0)
    operator delete(v564);
  if (SHIBYTE(v674.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v674.__r_.__value_.__l.__data_);
  if (v567 < 0)
    operator delete(v566);
  if (SHIBYTE(v677.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v677.__r_.__value_.__l.__data_);
  if (v569 < 0)
    operator delete(v568);
  if (SHIBYTE(v680.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v680.__r_.__value_.__l.__data_);
  if (v571 < 0)
    operator delete(v570);
  if (SHIBYTE(v683.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v683.__r_.__value_.__l.__data_);
  if (v573 < 0)
    operator delete(v572);
  if (SHIBYTE(v686.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v686.__r_.__value_.__l.__data_);
  if (v575 < 0)
    operator delete(v574);
  if (SHIBYTE(v705.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v705.__r_.__value_.__l.__data_);
  if (v577 < 0)
    operator delete(v576);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (v579 < 0)
    operator delete(v578);
  if (SHIBYTE(v725.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v725.__r_.__value_.__l.__data_);
  if (v581 < 0)
    operator delete(v580);
  if (SHIBYTE(v728.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v728.__r_.__value_.__l.__data_);
  if (v583 < 0)
    operator delete(v582);
  if (SHIBYTE(v731.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v731.__r_.__value_.__l.__data_);
  if (v585 < 0)
    operator delete(v584);
  if (SHIBYTE(v734.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v734.__r_.__value_.__l.__data_);
  if (v587 < 0)
    operator delete(v586);
  if (SHIBYTE(v736.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v736.__r_.__value_.__l.__data_);
  if (v589 < 0)
    operator delete(v588);
  if (SHIBYTE(v739.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v739.__r_.__value_.__l.__data_);
  if (v591 < 0)
  {
    v178 = v590;
    goto LABEL_1087;
  }
LABEL_1088:
  if (v7 != 7)
    goto LABEL_1163;
  if (v8 != 2)
    return;
  if (v72 != 1)
  {
    if (v72 == 2)
    {
      sub_2310FF330(&v491, "ampType");
      profile_decoder::key(&v739);
      if ((v739.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v466 = &v739;
      else
        v466 = (std::string *)v739.__r_.__value_.__r.__words[0];
      if ((v739.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v467 = HIBYTE(v739.__r_.__value_.__r.__words[2]);
      else
        v467 = v739.__r_.__value_.__l.__size_;
      v468 = sub_2310FF468((_QWORD *)(a2 + 16), (uint64_t)v466, v467);
      *(_QWORD *)((char *)v468 + *(_QWORD *)(*v468 - 24) + 24) = 10;
      v469 = (_QWORD *)std::ostream::operator<<();
      v470 = sub_2310FF468(v469, (uint64_t)",", 1);
      sub_2310FF330(&v489, "index");
      profile_decoder::key(&v736);
      if ((v736.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v471 = &v736;
      else
        v471 = (std::string *)v736.__r_.__value_.__r.__words[0];
      if ((v736.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v472 = HIBYTE(v736.__r_.__value_.__r.__words[2]);
      else
        v472 = v736.__r_.__value_.__l.__size_;
      v473 = sub_2310FF468(v470, (uint64_t)v471, v472);
      *(_QWORD *)((char *)v473 + *(_QWORD *)(*v473 - 24) + 24) = 10;
      v474 = (_QWORD *)std::ostream::operator<<();
      v475 = sub_2310FF468(v474, (uint64_t)",", 1);
      sub_2310FF330(&v487, "presilence");
      profile_decoder::key(&v734);
      if ((v734.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v476 = &v734;
      else
        v476 = (std::string *)v734.__r_.__value_.__r.__words[0];
      if ((v734.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v477 = HIBYTE(v734.__r_.__value_.__r.__words[2]);
      else
        v477 = v734.__r_.__value_.__l.__size_;
      v478 = sub_2310FF468(v475, (uint64_t)v476, v477);
      *(_QWORD *)((char *)v478 + *(_QWORD *)(*v478 - 24) + 24) = 10;
      v479 = (_QWORD *)std::ostream::operator<<();
      v480 = sub_2310FF468(v479, (uint64_t)",", 1);
      sub_2310FF330(&v485, "gain");
      profile_decoder::key(&v731);
      if ((v731.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v481 = &v731;
      else
        v481 = (std::string *)v731.__r_.__value_.__r.__words[0];
      if ((v731.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v482 = HIBYTE(v731.__r_.__value_.__r.__words[2]);
      else
        v482 = v731.__r_.__value_.__l.__size_;
      v483 = sub_2310FF468(v480, (uint64_t)v481, v482);
      *(_QWORD *)((char *)v483 + *(_QWORD *)(*v483 - 24) + 24) = 10;
      v484 = (_QWORD *)std::ostream::operator<<();
      sub_2310FF468(v484, (uint64_t)",", 1);
      if (SHIBYTE(v731.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v731.__r_.__value_.__l.__data_);
      if (v486 < 0)
        operator delete(v485);
      if (SHIBYTE(v734.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v734.__r_.__value_.__l.__data_);
      if (v488 < 0)
        operator delete(v487);
      if (SHIBYTE(v736.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v736.__r_.__value_.__l.__data_);
      if (v490 < 0)
        operator delete(v489);
      if (SHIBYTE(v739.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v739.__r_.__value_.__l.__data_);
      if (v492 < 0)
      {
        v71 = v491;
        goto LABEL_1162;
      }
      return;
    }
    goto LABEL_1163;
  }
  sub_2310FF330(&v497, "ampType");
  profile_decoder::key(&v739);
  if ((v739.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v452 = &v739;
  else
    v452 = (std::string *)v739.__r_.__value_.__r.__words[0];
  if ((v739.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v453 = HIBYTE(v739.__r_.__value_.__r.__words[2]);
  else
    v453 = v739.__r_.__value_.__l.__size_;
  v454 = sub_2310FF468((_QWORD *)(a2 + 16), (uint64_t)v452, v453);
  *(_QWORD *)((char *)v454 + *(_QWORD *)(*v454 - 24) + 24) = 10;
  v455 = (_QWORD *)std::ostream::operator<<();
  v456 = sub_2310FF468(v455, (uint64_t)",", 1);
  sub_2310FF330(&v495, "state");
  profile_decoder::key(&v736);
  if ((v736.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v457 = &v736;
  else
    v457 = (std::string *)v736.__r_.__value_.__r.__words[0];
  if ((v736.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v458 = HIBYTE(v736.__r_.__value_.__r.__words[2]);
  else
    v458 = v736.__r_.__value_.__l.__size_;
  v459 = sub_2310FF468(v456, (uint64_t)v457, v458);
  *(_QWORD *)((char *)v459 + *(_QWORD *)(*v459 - 24) + 24) = 10;
  v460 = (_QWORD *)std::ostream::operator<<();
  v461 = sub_2310FF468(v460, (uint64_t)",", 1);
  sub_2310FF330(&v493, "refCount");
  profile_decoder::key(&v734);
  if ((v734.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v462 = &v734;
  else
    v462 = (std::string *)v734.__r_.__value_.__r.__words[0];
  if ((v734.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v463 = HIBYTE(v734.__r_.__value_.__r.__words[2]);
  else
    v463 = v734.__r_.__value_.__l.__size_;
  v464 = sub_2310FF468(v461, (uint64_t)v462, v463);
  *(_QWORD *)((char *)v464 + *(_QWORD *)(*v464 - 24) + 24) = 10;
  v465 = (_QWORD *)std::ostream::operator<<();
  sub_2310FF468(v465, (uint64_t)",", 1);
  if (SHIBYTE(v734.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v734.__r_.__value_.__l.__data_);
  if (v494 < 0)
    operator delete(v493);
  if (SHIBYTE(v736.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v736.__r_.__value_.__l.__data_);
  if (v496 < 0)
    operator delete(v495);
  if (SHIBYTE(v739.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v739.__r_.__value_.__l.__data_);
  if (v498 < 0)
  {
    v71 = v497;
    goto LABEL_1162;
  }
}

void sub_2310FCC00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27,void *a28,uint64_t a29,int a30,__int16 a31,char a32,char a33)
{
  uint64_t v33;

  if (*(char *)(v33 - 225) < 0)
    operator delete(*(void **)(v33 - 248));
  if (a15 < 0)
    operator delete(__p);
  if (*(char *)(v33 - 177) < 0)
    operator delete(*(void **)(v33 - 200));
  if (a21 < 0)
    operator delete(a16);
  if (*(char *)(v33 - 129) < 0)
    operator delete(*(void **)(v33 - 152));
  if (a27 < 0)
    operator delete(a22);
  if (*(char *)(v33 - 81) < 0)
    operator delete(*(void **)(v33 - 104));
  if (a33 < 0)
    operator delete(a28);
  _Unwind_Resume(a1);
}

std::string *haptics_decoder::component_name@<X0>(unsigned int __val@<W1>, std::string *a2@<X8>)
{
  return profile_decoder::find_in_table((const entry *)&unk_24FFFEB98, __val, 4u, a2);
}

std::string *haptics_decoder::event_name@<X0>(unsigned int __val@<W2>, std::string *a2@<X8>)
{
  return profile_decoder::find_in_table((const entry *)&unk_24FFFEBD8, __val, 3u, a2);
}

void haptics_decoder::parse_datatype(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  int v5;
  std::string *v6;
  std::string::size_type size;
  _QWORD *v8;
  std::string *v9;
  std::string::size_type v10;
  _QWORD *v11;
  _QWORD *v12;
  std::string *v13;
  std::string::size_type v14;
  _QWORD *v15;
  _QWORD *v16;
  _QWORD *v17;
  std::string *v18;
  std::string::size_type v19;
  _QWORD *v20;
  _QWORD *v21;
  _QWORD *v22;
  std::string *v23;
  std::string::size_type v24;
  _QWORD *v25;
  _QWORD *v26;
  _QWORD *v27;
  std::string *v28;
  std::string::size_type v29;
  _QWORD *v30;
  _QWORD *v31;
  _QWORD *v32;
  std::string *p_p;
  std::string::size_type v34;
  _QWORD *v35;
  _QWORD *v36;
  void *v37;
  int v38;
  std::string *v39;
  std::string::size_type v40;
  _QWORD *v41;
  _QWORD *v42;
  _QWORD *v43;
  std::string *v44;
  std::string::size_type v45;
  _QWORD *v46;
  _QWORD *v47;
  _QWORD *v48;
  std::string *v49;
  std::string::size_type v50;
  _QWORD *v51;
  _QWORD *v52;
  std::string *v53;
  std::string::size_type v54;
  _QWORD *v55;
  _QWORD *v56;
  _QWORD *v57;
  std::string *v58;
  std::string::size_type v59;
  _QWORD *v60;
  _QWORD *v61;
  _QWORD *v62;
  std::string *v63;
  std::string::size_type v64;
  _QWORD *v65;
  _QWORD *v66;
  _QWORD *v67;
  std::string *v68;
  std::string::size_type v69;
  _QWORD *v70;
  _QWORD *v71;
  void *v72;
  char v73;
  void *v74;
  char v75;
  void *v76;
  char v77;
  void *v78;
  char v79;
  void *v80;
  char v81;
  void *v82;
  char v83;
  void *v84;
  char v85;
  void *v86;
  char v87;
  std::string __p;
  void *v89;
  char v90;
  std::string v91;
  void *v92;
  char v93;
  std::string v94;
  void *v95;
  char v96;
  std::string v97;
  void *v98;
  char v99;
  std::string v100;
  std::string v101;
  std::string v102;
  void *v103;
  char v104;
  std::string v105;

  v5 = BYTE2(*a3);
  if ((v5 - 5) <= 1)
    goto LABEL_106;
  if (*a3 != 2)
  {
    if (*a3 == 3)
    {
      sub_2310FF330(&v103, "trace");
      profile_decoder::key(&v105);
      if ((v105.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v6 = &v105;
      else
        v6 = (std::string *)v105.__r_.__value_.__r.__words[0];
      if ((v105.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        size = HIBYTE(v105.__r_.__value_.__r.__words[2]);
      else
        size = v105.__r_.__value_.__l.__size_;
      v8 = sub_2310FF468((_QWORD *)(a2 + 16), (uint64_t)v6, size);
      *(_QWORD *)((char *)v8 + *(_QWORD *)(*v8 - 24) + 24) = 25;
      haptics_decoder::subtype_name((profile_decoder *)a3[4], v5, &v101);
      profile_decoder::str(&v102);
      if ((v102.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v9 = &v102;
      else
        v9 = (std::string *)v102.__r_.__value_.__r.__words[0];
      if ((v102.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v10 = HIBYTE(v102.__r_.__value_.__r.__words[2]);
      else
        v10 = v102.__r_.__value_.__l.__size_;
      v11 = sub_2310FF468(v8, (uint64_t)v9, v10);
      v12 = sub_2310FF468(v11, (uint64_t)",", 1);
      sub_2310FF330(&v98, "thread");
      profile_decoder::key(&v100);
      if ((v100.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v13 = &v100;
      else
        v13 = (std::string *)v100.__r_.__value_.__r.__words[0];
      if ((v100.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v14 = HIBYTE(v100.__r_.__value_.__r.__words[2]);
      else
        v14 = v100.__r_.__value_.__l.__size_;
      v15 = sub_2310FF468(v12, (uint64_t)v13, v14);
      *(_QWORD *)((char *)v15 + *(_QWORD *)(*v15 - 24) + 24) = 10;
      v16 = (_QWORD *)std::ostream::operator<<();
      v17 = sub_2310FF468(v16, (uint64_t)",", 1);
      sub_2310FF330(&v95, "arg1");
      profile_decoder::key(&v97);
      if ((v97.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v18 = &v97;
      else
        v18 = (std::string *)v97.__r_.__value_.__r.__words[0];
      if ((v97.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v19 = HIBYTE(v97.__r_.__value_.__r.__words[2]);
      else
        v19 = v97.__r_.__value_.__l.__size_;
      v20 = sub_2310FF468(v17, (uint64_t)v18, v19);
      *(_QWORD *)((char *)v20 + *(_QWORD *)(*v20 - 24) + 24) = 10;
      v21 = (_QWORD *)std::ostream::operator<<();
      v22 = sub_2310FF468(v21, (uint64_t)",", 1);
      sub_2310FF330(&v92, "arg2");
      profile_decoder::key(&v94);
      if ((v94.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v23 = &v94;
      else
        v23 = (std::string *)v94.__r_.__value_.__r.__words[0];
      if ((v94.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v24 = HIBYTE(v94.__r_.__value_.__r.__words[2]);
      else
        v24 = v94.__r_.__value_.__l.__size_;
      v25 = sub_2310FF468(v22, (uint64_t)v23, v24);
      *(_QWORD *)((char *)v25 + *(_QWORD *)(*v25 - 24) + 24) = 10;
      v26 = (_QWORD *)std::ostream::operator<<();
      v27 = sub_2310FF468(v26, (uint64_t)",", 1);
      sub_2310FF330(&v89, "arg3");
      profile_decoder::key(&v91);
      if ((v91.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v28 = &v91;
      else
        v28 = (std::string *)v91.__r_.__value_.__r.__words[0];
      if ((v91.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v29 = HIBYTE(v91.__r_.__value_.__r.__words[2]);
      else
        v29 = v91.__r_.__value_.__l.__size_;
      v30 = sub_2310FF468(v27, (uint64_t)v28, v29);
      *(_QWORD *)((char *)v30 + *(_QWORD *)(*v30 - 24) + 24) = 10;
      v31 = (_QWORD *)std::ostream::operator<<();
      v32 = sub_2310FF468(v31, (uint64_t)",", 1);
      sub_2310FF330(&v86, "arg4");
      profile_decoder::key(&__p);
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        p_p = &__p;
      else
        p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v34 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
      else
        v34 = __p.__r_.__value_.__l.__size_;
      v35 = sub_2310FF468(v32, (uint64_t)p_p, v34);
      *(_QWORD *)((char *)v35 + *(_QWORD *)(*v35 - 24) + 24) = 10;
      v36 = (_QWORD *)std::ostream::operator<<();
      sub_2310FF468(v36, (uint64_t)",", 1);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
      if (v87 < 0)
        operator delete(v86);
      if (SHIBYTE(v91.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v91.__r_.__value_.__l.__data_);
      if (v90 < 0)
        operator delete(v89);
      if (SHIBYTE(v94.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v94.__r_.__value_.__l.__data_);
      if (v93 < 0)
        operator delete(v92);
      if (SHIBYTE(v97.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v97.__r_.__value_.__l.__data_);
      if (v96 < 0)
        operator delete(v95);
      if (SHIBYTE(v100.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v100.__r_.__value_.__l.__data_);
      if (v99 < 0)
        operator delete(v98);
      if (SHIBYTE(v102.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v102.__r_.__value_.__l.__data_);
      if (SHIBYTE(v101.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v101.__r_.__value_.__l.__data_);
      if (SHIBYTE(v105.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v105.__r_.__value_.__l.__data_);
      if (v104 < 0)
      {
        v37 = v103;
LABEL_147:
        operator delete(v37);
        return;
      }
      return;
    }
LABEL_106:
    profile_decoder::parse_datatype(a1, a2, (uint64_t)a3);
    return;
  }
  v38 = BYTE1(*a3);
  if (v38 == 2)
  {
    sub_2310FF330(&v78, "ampType");
    profile_decoder::key(&v105);
    if ((v105.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v53 = &v105;
    else
      v53 = (std::string *)v105.__r_.__value_.__r.__words[0];
    if ((v105.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v54 = HIBYTE(v105.__r_.__value_.__r.__words[2]);
    else
      v54 = v105.__r_.__value_.__l.__size_;
    v55 = sub_2310FF468((_QWORD *)(a2 + 16), (uint64_t)v53, v54);
    *(_QWORD *)((char *)v55 + *(_QWORD *)(*v55 - 24) + 24) = 10;
    v56 = (_QWORD *)std::ostream::operator<<();
    v57 = sub_2310FF468(v56, (uint64_t)",", 1);
    sub_2310FF330(&v76, "index");
    profile_decoder::key(&v102);
    if ((v102.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v58 = &v102;
    else
      v58 = (std::string *)v102.__r_.__value_.__r.__words[0];
    if ((v102.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v59 = HIBYTE(v102.__r_.__value_.__r.__words[2]);
    else
      v59 = v102.__r_.__value_.__l.__size_;
    v60 = sub_2310FF468(v57, (uint64_t)v58, v59);
    *(_QWORD *)((char *)v60 + *(_QWORD *)(*v60 - 24) + 24) = 10;
    v61 = (_QWORD *)std::ostream::operator<<();
    v62 = sub_2310FF468(v61, (uint64_t)",", 1);
    sub_2310FF330(&v74, "presilence");
    profile_decoder::key(&v100);
    if ((v100.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v63 = &v100;
    else
      v63 = (std::string *)v100.__r_.__value_.__r.__words[0];
    if ((v100.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v64 = HIBYTE(v100.__r_.__value_.__r.__words[2]);
    else
      v64 = v100.__r_.__value_.__l.__size_;
    v65 = sub_2310FF468(v62, (uint64_t)v63, v64);
    *(_QWORD *)((char *)v65 + *(_QWORD *)(*v65 - 24) + 24) = 10;
    v66 = (_QWORD *)std::ostream::operator<<();
    v67 = sub_2310FF468(v66, (uint64_t)",", 1);
    sub_2310FF330(&v72, "gain");
    profile_decoder::key(&v97);
    if ((v97.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v68 = &v97;
    else
      v68 = (std::string *)v97.__r_.__value_.__r.__words[0];
    if ((v97.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v69 = HIBYTE(v97.__r_.__value_.__r.__words[2]);
    else
      v69 = v97.__r_.__value_.__l.__size_;
    v70 = sub_2310FF468(v67, (uint64_t)v68, v69);
    *(_QWORD *)((char *)v70 + *(_QWORD *)(*v70 - 24) + 24) = 10;
    v71 = (_QWORD *)std::ostream::operator<<();
    sub_2310FF468(v71, (uint64_t)",", 1);
    if (SHIBYTE(v97.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v97.__r_.__value_.__l.__data_);
    if (v73 < 0)
      operator delete(v72);
    if (SHIBYTE(v100.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v100.__r_.__value_.__l.__data_);
    if (v75 < 0)
      operator delete(v74);
    if (SHIBYTE(v102.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v102.__r_.__value_.__l.__data_);
    if (v77 < 0)
      operator delete(v76);
    if (SHIBYTE(v105.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v105.__r_.__value_.__l.__data_);
    if (v79 < 0)
    {
      v37 = v78;
      goto LABEL_147;
    }
    return;
  }
  if (v38 != 1)
    goto LABEL_106;
  sub_2310FF330(&v84, "ampType");
  profile_decoder::key(&v105);
  if ((v105.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v39 = &v105;
  else
    v39 = (std::string *)v105.__r_.__value_.__r.__words[0];
  if ((v105.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v40 = HIBYTE(v105.__r_.__value_.__r.__words[2]);
  else
    v40 = v105.__r_.__value_.__l.__size_;
  v41 = sub_2310FF468((_QWORD *)(a2 + 16), (uint64_t)v39, v40);
  *(_QWORD *)((char *)v41 + *(_QWORD *)(*v41 - 24) + 24) = 10;
  v42 = (_QWORD *)std::ostream::operator<<();
  v43 = sub_2310FF468(v42, (uint64_t)",", 1);
  sub_2310FF330(&v82, "state");
  profile_decoder::key(&v102);
  if ((v102.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v44 = &v102;
  else
    v44 = (std::string *)v102.__r_.__value_.__r.__words[0];
  if ((v102.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v45 = HIBYTE(v102.__r_.__value_.__r.__words[2]);
  else
    v45 = v102.__r_.__value_.__l.__size_;
  v46 = sub_2310FF468(v43, (uint64_t)v44, v45);
  *(_QWORD *)((char *)v46 + *(_QWORD *)(*v46 - 24) + 24) = 10;
  v47 = (_QWORD *)std::ostream::operator<<();
  v48 = sub_2310FF468(v47, (uint64_t)",", 1);
  sub_2310FF330(&v80, "refCount");
  profile_decoder::key(&v100);
  if ((v100.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v49 = &v100;
  else
    v49 = (std::string *)v100.__r_.__value_.__r.__words[0];
  if ((v100.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v50 = HIBYTE(v100.__r_.__value_.__r.__words[2]);
  else
    v50 = v100.__r_.__value_.__l.__size_;
  v51 = sub_2310FF468(v48, (uint64_t)v49, v50);
  *(_QWORD *)((char *)v51 + *(_QWORD *)(*v51 - 24) + 24) = 10;
  v52 = (_QWORD *)std::ostream::operator<<();
  sub_2310FF468(v52, (uint64_t)",", 1);
  if (SHIBYTE(v100.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v100.__r_.__value_.__l.__data_);
  if (v81 < 0)
    operator delete(v80);
  if (SHIBYTE(v102.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v102.__r_.__value_.__l.__data_);
  if (v83 < 0)
    operator delete(v82);
  if (SHIBYTE(v105.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v105.__r_.__value_.__l.__data_);
  if (v85 < 0)
  {
    v37 = v84;
    goto LABEL_147;
  }
}

void sub_2310FEBA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15, void *a16, uint64_t a17, int a18, __int16 a19, char a20,char a21,void *a22,uint64_t a23,int a24,__int16 a25,char a26,char a27,void *a28,uint64_t a29,int a30,__int16 a31,char a32,char a33)
{
  uint64_t v33;

  if (*(char *)(v33 - 193) < 0)
    operator delete(*(void **)(v33 - 216));
  if (a15 < 0)
    operator delete(__p);
  if (*(char *)(v33 - 145) < 0)
    operator delete(*(void **)(v33 - 168));
  if (a21 < 0)
    operator delete(a16);
  if (*(char *)(v33 - 97) < 0)
    operator delete(*(void **)(v33 - 120));
  if (a27 < 0)
    operator delete(a22);
  if (*(char *)(v33 - 49) < 0)
    operator delete(*(void **)(v33 - 72));
  if (a33 < 0)
    operator delete(a28);
  _Unwind_Resume(a1);
}

std::string *haptics_decoder::subtype_name@<X0>(profile_decoder *a1@<X2>, int a2@<W1>, std::string *a3@<X8>)
{
  if ((a2 - 7) > 2)
    return std::to_string(a3, a1);
  else
    return profile_decoder::find_in_table((const entry *)&unk_24FFFEC08, a1, 0x18u, a3);
}

std::string *scm_decoder::component_name@<X0>(unsigned int __val@<W1>, std::string *a2@<X8>)
{
  return profile_decoder::find_in_table((const entry *)&unk_24FFFED88, __val, 6u, a2);
}

std::string *scm_decoder::event_name@<X0>(unsigned int __val@<W2>, std::string *a2@<X8>)
{
  return std::to_string(a2, __val);
}

std::string *wake_decoder::component_name@<X0>(unsigned int __val@<W1>, std::string *a2@<X8>)
{
  return profile_decoder::find_in_table(&stru_24FFFEDE8, __val, 1u, a2);
}

std::string *wake_decoder::event_name@<X0>(unsigned int __val@<W2>, std::string *a2@<X8>)
{
  return profile_decoder::find_in_table((const entry *)&unk_24FFFEDF8, __val, 3u, a2);
}

void wake_decoder::parse_datatype(uint64_t a1, uint64_t a2, int *a3)
{
  int v6;
  std::string *v7;
  std::string::size_type size;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  std::string *p_p;
  std::string::size_type v13;
  _QWORD *v14;
  _QWORD *v15;
  std::string *v16;
  std::string::size_type v17;
  _QWORD *v18;
  _QWORD *v19;
  _QWORD *v20;
  std::string *v21;
  std::string::size_type v22;
  _QWORD *v23;
  _QWORD *v24;
  void *v25;
  char v26;
  void *v27;
  char v28;
  void *v29;
  char v30;
  std::string __p;
  void *v32;
  char v33;
  std::string v34;

  v6 = *a3;
  if (*a3 == 167772429)
  {
    sub_2310FF330(&v32, "wake_reason");
    profile_decoder::key(&v34);
    if ((v34.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v7 = &v34;
    else
      v7 = (std::string *)v34.__r_.__value_.__r.__words[0];
    if ((v34.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      size = HIBYTE(v34.__r_.__value_.__r.__words[2]);
    else
      size = v34.__r_.__value_.__l.__size_;
    v9 = sub_2310FF468((_QWORD *)(a2 + 16), (uint64_t)v7, size);
    *(_QWORD *)((char *)v9 + *(_QWORD *)(*v9 - 24) + 24) = 10;
    v10 = (_QWORD *)std::ostream::operator<<();
    v11 = sub_2310FF468(v10, (uint64_t)",", 1);
    sub_2310FF330(&v29, "endpoint_ref");
    profile_decoder::key(&__p);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      p_p = &__p;
    else
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v13 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
    else
      v13 = __p.__r_.__value_.__l.__size_;
    v14 = sub_2310FF468(v11, (uint64_t)p_p, v13);
    *(_QWORD *)((char *)v14 + *(_QWORD *)(*v14 - 24) + 24) = 10;
    v15 = (_QWORD *)std::ostream::operator<<();
    sub_2310FF468(v15, (uint64_t)",", 1);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    if (v30 < 0)
      operator delete(v29);
    if (SHIBYTE(v34.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v34.__r_.__value_.__l.__data_);
    if (v33 < 0)
      operator delete(v32);
    v6 = *a3;
  }
  if (v6 == 167772675)
  {
    sub_2310FF330(&v27, "wake_reason");
    profile_decoder::key(&v34);
    if ((v34.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v16 = &v34;
    else
      v16 = (std::string *)v34.__r_.__value_.__r.__words[0];
    if ((v34.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v17 = HIBYTE(v34.__r_.__value_.__r.__words[2]);
    else
      v17 = v34.__r_.__value_.__l.__size_;
    v18 = sub_2310FF468((_QWORD *)(a2 + 16), (uint64_t)v16, v17);
    *(_QWORD *)((char *)v18 + *(_QWORD *)(*v18 - 24) + 24) = 10;
    v19 = (_QWORD *)std::ostream::operator<<();
    v20 = sub_2310FF468(v19, (uint64_t)",", 1);
    sub_2310FF330(&v25, "service_id");
    profile_decoder::key(&__p);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v21 = &__p;
    else
      v21 = (std::string *)__p.__r_.__value_.__r.__words[0];
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v22 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
    else
      v22 = __p.__r_.__value_.__l.__size_;
    v23 = sub_2310FF468(v20, (uint64_t)v21, v22);
    *(_QWORD *)((char *)v23 + *(_QWORD *)(*v23 - 24) + 24) = 10;
    v24 = (_QWORD *)std::ostream::operator<<();
    sub_2310FF468(v24, (uint64_t)",", 1);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    if (v26 < 0)
      operator delete(v25);
    if (SHIBYTE(v34.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v34.__r_.__value_.__l.__data_);
    if (v28 < 0)
      operator delete(v27);
  }
  else
  {
    profile_decoder::parse_datatype(a1, a2, (uint64_t)a3);
  }
}

void sub_2310FF1B8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9, uint64_t a10, int a11, __int16 a12, char a13, char a14, void *a15, uint64_t a16, int a17, __int16 a18, char a19, char a20,void *a21,uint64_t a22,int a23,__int16 a24,char a25,char a26,void *__p,uint64_t a28,int a29,__int16 a30,char a31,char a32,uint64_t a33,uint64_t a34,int a35,__int16 a36,char a37,char a38)
{
  uint64_t v38;

  if (a32 < 0)
    operator delete(__p);
  if (a14 < 0)
    operator delete(a9);
  if (*(char *)(v38 - 49) < 0)
    operator delete(*(void **)(v38 - 72));
  if (a20 < 0)
    operator delete(a15);
  _Unwind_Resume(exception_object);
}

void AOPLogDecoder::to_string(_QWORD *a1)
{
  unint64_t v2;
  void (***v3)(_QWORD, _QWORD *);

  v2 = *(unsigned int *)a1;
  if (v2 >> 25 <= 6
    && (v3 = *(void (****)(_QWORD, _QWORD *))((char *)&AOPLogDecoder::_decoders + ((v2 >> 21) & 0x7F8))) != 0)
  {
    (**v3)(v3, a1);
  }
  else
  {
    profile_decoder::to_string((uint64_t)&AOPLogDecoder::_default, a1);
  }
}

std::string *AOPLogDecoder::category_to_string@<X0>(AOPLogDecoder *this@<X0>, std::string *a2@<X8>)
{
  _UNKNOWN **v3;

  if (this <= 0xD && (v3 = (&AOPLogDecoder::_decoders)[this]) != 0)
    return (std::string *)(*((uint64_t (**)(_UNKNOWN **, AOPLogDecoder *))*v3 + 1))(v3, this);
  else
    return std::to_string(a2, this);
}

std::string *AOPLogDecoder::component_to_string@<X0>(AOPLogDecoder *this@<X0>, uint64_t __val@<X1>, std::string *a3@<X8>)
{
  _UNKNOWN **v3;

  if (this <= 0xD && (v3 = (&AOPLogDecoder::_decoders)[this]) != 0)
    return (std::string *)(*((uint64_t (**)(_UNKNOWN **, uint64_t))*v3 + 2))(v3, __val);
  else
    return std::to_string(a3, __val);
}

_QWORD *sub_2310FF330(_QWORD *a1, char *__s)
{
  size_t v4;
  size_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8)
    sub_2310FF3E0();
  v5 = v4;
  if (v4 >= 0x17)
  {
    v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17)
      v7 = v4 | 7;
    v8 = v7 + 1;
    v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((_BYTE *)a1 + 23) = v4;
    v6 = a1;
    if (!v4)
      goto LABEL_9;
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((_BYTE *)v6 + v5) = 0;
  return a1;
}

void sub_2310FF3E0()
{
  sub_2310FF3F4("basic_string");
}

void sub_2310FF3F4(const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  sub_2310FF444(exception, a1);
  __cxa_throw(exception, (struct type_info *)off_24FFFD800, MEMORY[0x24BEDAAF0]);
}

void sub_2310FF430(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *sub_2310FF444(std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x24BEDB8B8] + 16);
  return result;
}

_QWORD *sub_2310FF468(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  const std::locale::facet *v10;
  uint64_t v11;
  _BYTE v13[16];
  std::locale v14;

  MEMORY[0x2348D19F4](v13, a1);
  if (v13[0])
  {
    v6 = (uint64_t)a1 + *(_QWORD *)(*a1 - 24);
    v7 = *(_QWORD *)(v6 + 40);
    v8 = *(_DWORD *)(v6 + 8);
    v9 = *(_DWORD *)(v6 + 144);
    if (v9 == -1)
    {
      std::ios_base::getloc((const std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)));
      v10 = std::locale::use_facet(&v14, MEMORY[0x24BEDB350]);
      v9 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v10->__vftable[2].~facet_0)(v10, 32);
      std::locale::~locale(&v14);
      *(_DWORD *)(v6 + 144) = v9;
    }
    if ((v8 & 0xB0) == 0x20)
      v11 = a2 + a3;
    else
      v11 = a2;
    if (!sub_2310FF5CC(v7, a2, v11, a2 + a3, v6, (char)v9))
      std::ios_base::clear((std::ios_base *)((char *)a1 + *(_QWORD *)(*a1 - 24)), *(_DWORD *)((char *)a1 + *(_QWORD *)(*a1 - 24) + 32) | 5);
  }
  MEMORY[0x2348D1A00](v13);
  return a1;
}

void sub_2310FF570(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, char a10, uint64_t a11, std::locale a12)
{
  _QWORD *v12;

  MEMORY[0x2348D1A00](&a10);
  __cxa_begin_catch(a1);
  std::ios_base::__set_badbit_and_consider_rethrow((std::ios_base *)((char *)v12 + *(_QWORD *)(*v12 - 24)));
  __cxa_end_catch();
  JUMPOUT(0x2310FF550);
}

void sub_2310FF5B8(_Unwind_Exception *a1)
{
  __cxa_end_catch();
  _Unwind_Resume(a1);
}

uint64_t sub_2310FF5CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int __c)
{
  uint64_t v6;
  uint64_t v11;
  int64_t v12;
  void **v13;
  uint64_t v14;
  uint64_t v15;
  void *__p[2];
  char v18;

  v6 = a1;
  if (a1)
  {
    v11 = *(_QWORD *)(a5 + 24);
    if (v11 <= a4 - a2)
      v12 = 0;
    else
      v12 = v11 - (a4 - a2);
    if (a3 - a2 >= 1 && (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 96))(a1) != a3 - a2)
      return 0;
    if (v12 >= 1)
    {
      sub_2310FF708(__p, v12, __c);
      v13 = v18 >= 0 ? __p : (void **)__p[0];
      v14 = (*(uint64_t (**)(uint64_t, void **, int64_t))(*(_QWORD *)v6 + 96))(v6, v13, v12);
      if (v18 < 0)
        operator delete(__p[0]);
      if (v14 != v12)
        return 0;
    }
    v15 = a4 - a3;
    if (v15 < 1 || (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)v6 + 96))(v6, a3, v15) == v15)
      *(_QWORD *)(a5 + 24) = 0;
    else
      return 0;
  }
  return v6;
}

void sub_2310FF6EC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11, int a12, __int16 a13, char a14, char a15)
{
  if (a15 < 0)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

_QWORD *sub_2310FF708(_QWORD *__b, size_t __len, int __c)
{
  void *v6;
  size_t v7;
  size_t v8;

  if (__len >= 0x7FFFFFFFFFFFFFF8)
    sub_2310FF3E0();
  if (__len >= 0x17)
  {
    v7 = (__len & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((__len | 7) != 0x17)
      v7 = __len | 7;
    v8 = v7 + 1;
    v6 = operator new(v7 + 1);
    __b[1] = __len;
    __b[2] = v8 | 0x8000000000000000;
    *__b = v6;
  }
  else
  {
    *((_BYTE *)__b + 23) = __len;
    v6 = __b;
    if (!__len)
      goto LABEL_9;
  }
  memset(v6, __c, __len);
LABEL_9:
  *((_BYTE *)v6 + __len) = 0;
  return __b;
}

void *sub_2310FF7B0(_BYTE *__dst, void *__src, unint64_t a3)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v5 = __dst;
  if (a3 > 0x16)
  {
    if (a3 >= 0x7FFFFFFFFFFFFFF8)
      sub_2310FF3E0();
    v6 = (a3 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((a3 | 7) != 0x17)
      v6 = a3 | 7;
    v7 = v6 + 1;
    v8 = operator new(v6 + 1);
    v5[1] = a3;
    v5[2] = v7 | 0x8000000000000000;
    *v5 = v8;
    v5 = v8;
  }
  else
  {
    __dst[23] = a3;
  }
  return memmove(v5, __src, a3 + 1);
}

uint64_t SPU_log_get_report_size(uint64_t a1)
{
  return ((*(_QWORD *)(a1 + 8) >> 2) & 0xF0) + 16;
}

uint64_t SPU_log_next_report(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int v3;

  v1 = a1 + ((*(_QWORD *)(a1 + 8) >> 2) & 0xF0);
  v3 = *(_DWORD *)(v1 + 16);
  v2 = v1 + 16;
  if (v3)
    return v2;
  else
    return 0;
}

uint64_t SPU_log_end_iterator(uint64_t a1)
{
  return a1 + 256;
}

uint64_t SPU_log_get_num_reports(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;

  if (result)
  {
    v1 = result;
    result = 0;
    v2 = v1 + 256;
    do
    {
      if (!*(_DWORD *)v1)
        break;
      ++result;
      v3 = v1 + ((*(_QWORD *)(v1 + 8) >> 2) & 0xF0);
      v4 = *(_DWORD *)(v3 + 16);
      v1 = v3 + 16;
      v5 = v4 ? v1 : 0;
    }
    while (v5 && v5 != v2);
  }
  return result;
}

uint64_t spu_log_device_time_to_mach_time(uint64_t a1, unint64_t *a2, unint64_t *a3, unint64_t *a4)
{
  mach_port_t v8;
  const __CFDictionary *v9;
  io_service_t MatchingService;
  io_object_t v11;
  const __CFDictionary *CFProperty;
  const __CFDictionary *v13;
  const __CFNumber *Value;
  Boolean v15;
  const __CFNumber *v16;
  char v17;
  const __CFNumber *v18;
  unsigned __int8 v19;
  const __CFNumber *v20;
  Boolean v21;
  uint64_t v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t valuePtr;

  v8 = *MEMORY[0x24BDD8B20];
  v9 = IOServiceMatching("AppleSPUTimesync");
  MatchingService = IOServiceGetMatchingService(v8, v9);
  if (MatchingService)
  {
    v11 = MatchingService;
    v26 = 0;
    valuePtr = 0;
    v24 = 0;
    v25 = 0;
    CFProperty = (const __CFDictionary *)IORegistryEntryCreateCFProperty(MatchingService, CFSTR("timesync"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
    if (CFProperty)
    {
      v13 = CFProperty;
      Value = (const __CFNumber *)CFDictionaryGetValue(CFProperty, CFSTR("ap"));
      v15 = CFNumberGetValue(Value, kCFNumberLongLongType, &valuePtr);
      v16 = (const __CFNumber *)CFDictionaryGetValue(v13, CFSTR("ap-cont"));
      v17 = v15 & CFNumberGetValue(v16, kCFNumberLongLongType, &v26);
      v18 = (const __CFNumber *)CFDictionaryGetValue(v13, CFSTR("spu"));
      v19 = v17 & CFNumberGetValue(v18, kCFNumberLongLongType, &v25);
      v20 = (const __CFNumber *)CFDictionaryGetValue(v13, CFSTR("calendar"));
      v21 = CFNumberGetValue(v20, kCFNumberLongLongType, &v24);
      if (a2)
        *a2 = valuePtr + 1000 * a1 - v25;
      if (a3)
        *a3 = v26 + 1000 * a1 - v25;
      v22 = v19 & 1u & v21;
      if (a4)
        *a4 = v24 + 1000 * a1 - v25;
      CFRelease(v13);
    }
    else
    {
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "timesync != __null", (const char *)&unk_231101D67, "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/liblog_aop/liblog_aop.cpp", 32, 0);
      v22 = 0;
    }
    IOObjectRelease(v11);
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "service != 0", (const char *)&unk_231101D67, "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/liblog_aop/liblog_aop.cpp", 29, 0);
    return 0;
  }
  return v22;
}

uint64_t spu_log_calendar_time_to_walltime(unint64_t a1, char *a2, size_t a3)
{
  tm *v5;
  time_t v7;

  v7 = a1 / 0x3B9ACA00;
  v5 = localtime(&v7);
  strftime(a2, a3, "%b %d %T", v5);
  return 1;
}

unint64_t spu_log_ns_to_mach_time(unint64_t a1)
{
  double v2;
  unint64_t v3;
  unint64_t v4;
  mach_timebase_info info;

  v2 = *(double *)&qword_255EB4EC8;
  if (*(double *)&qword_255EB4EC8 == 0.0)
  {
    mach_timebase_info(&info);
    LODWORD(v3) = info.numer;
    LODWORD(v4) = info.denom;
    v2 = (double)v3 / (double)v4;
    qword_255EB4EC8 = *(_QWORD *)&v2;
  }
  return (unint64_t)((double)a1 / v2);
}

uint64_t spu_log_report_to_string(uint64_t result, _BYTE *a2, unint64_t a3, int a4, char *a5, size_t a6)
{
  const char *v11;
  size_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;

  if (result)
  {
    v11 = (const char *)result;
    v12 = strlen((const char *)result);
    v13 = 2;
    if (a4)
      v13 = 3;
    if (v12 + v13 * a3 + 2 >= a6)
    {
      return 0;
    }
    else
    {
      strlcpy(a5, v11, a6);
      strlcat(a5, " ", a6);
      v14 = &a5[strlen(a5)];
      if (a3)
      {
        v15 = 0;
        do
        {
          *v14 = a0123456789abcd[(unint64_t)a2[v15] >> 4];
          v14[1] = a0123456789abcd[a2[v15] & 0xF];
          if (a4)
          {
            v14[2] = 32;
            v14 += 3;
          }
          else
          {
            v14 += 2;
          }
          ++v15;
        }
        while (a3 > v15);
      }
      *v14 = 0;
      return 1;
    }
  }
  return result;
}

uint64_t spu_log_print_report(void *a1, const char *a2, _BYTE *a3, unint64_t a4, int a5)
{
  uint64_t result;
  char v6[2048];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  result = spu_log_report_to_string((uint64_t)a2, a3, a4, a5, v6, 0x800uLL);
  if ((_DWORD)result)
    return puts(v6);
  return result;
}

BOOL spu_log_get_aop_logs(int a1, uint64_t a2, void (*a3)(void *, const char *, const void *, unint64_t, BOOL), void *a4)
{
  char *outputStruct;
  kern_return_t v6;
  uint64_t v7;
  size_t v8;
  unsigned __int8 v9;
  char *v10;
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
  char *v23;
  char *v24;
  int v25;
  char *v26;
  int v27;
  char *v28;
  unint64_t *v30;
  unint64_t v31;
  unint64_t v32;
  char *v33;
  int v34;
  char *v35;
  BOOL v36;
  _BOOL8 v37;
  _BOOL4 v39;
  unint64_t v42;
  unint64_t v43;
  unint64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _BYTE v63[184];
  size_t v64;
  void (**v65)(AOPServiceConnect *__hidden);
  uint64_t v66[3];
  uint64_t v67;
  int inputStruct;
  uint64_t input[4];

  input[1] = *MEMORY[0x24BDAC8D0];
  inputStruct = a1;
  v65 = &off_24FFFF1F0;
  sub_2310FF330(v66, "AOP_log");
  v67 = 0;
  input[0] = 35;
  v64 = a2 << 8;
  outputStruct = (char *)malloc_type_malloc(a2 << 8, 0x50856C2AuLL);
  if (outputStruct)
  {
    v39 = AOPServiceConnect::connect((AOPServiceConnect *)&v65);
    if (v39)
    {
      v6 = IOConnectCallMethod(v67, 3u, input, 1u, &inputStruct, 4uLL, 0, 0, outputStruct, &v64);
      if (v6)
      {
        fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "kr == 0 ", (const char *)&unk_231101D67, "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/liblog_aop/liblog_aop.cpp", 138, v6);
      }
      else if (v64 >= 0x100)
      {
        v7 = 0;
        v8 = v64 >> 8;
        do
        {
          v9 = 0;
          v62 = 0u;
          memset(v63, 0, 176);
          v60 = 0u;
          v61 = 0u;
          v58 = 0u;
          v59 = 0u;
          v56 = 0u;
          v57 = 0u;
          v54 = 0u;
          v55 = 0u;
          v52 = 0u;
          v53 = 0u;
          v50 = 0u;
          v51 = 0u;
          v48 = 0u;
          v49 = 0u;
          v46 = 0u;
          v47 = 0u;
          v45 = 0u;
          v43 = 0;
          v44 = 0;
          v42 = 0;
          v10 = &outputStruct[256 * v7];
          v11 = *((_OWORD *)v10 + 3);
          v13 = *(_OWORD *)v10;
          v12 = *((_OWORD *)v10 + 1);
          v48 = *((_OWORD *)v10 + 2);
          v49 = v11;
          v46 = v13;
          v47 = v12;
          v14 = *((_OWORD *)v10 + 7);
          v16 = *((_OWORD *)v10 + 4);
          v15 = *((_OWORD *)v10 + 5);
          v52 = *((_OWORD *)v10 + 6);
          v53 = v14;
          v50 = v16;
          v51 = v15;
          v17 = *((_OWORD *)v10 + 11);
          v19 = *((_OWORD *)v10 + 8);
          v18 = *((_OWORD *)v10 + 9);
          v56 = *((_OWORD *)v10 + 10);
          v57 = v17;
          v54 = v19;
          v55 = v18;
          v20 = *((_OWORD *)v10 + 15);
          v22 = *((_OWORD *)v10 + 12);
          v21 = *((_OWORD *)v10 + 13);
          v60 = *((_OWORD *)v10 + 14);
          v61 = v20;
          v58 = v22;
          v59 = v21;
          v23 = v10 + 256;
          v24 = v10;
          v25 = *(_DWORD *)v10;
          do
          {
            if (!v25)
              break;
            ++v9;
            v26 = &v24[(*((_QWORD *)v24 + 1) >> 2) & 0xF0];
            v27 = *((_DWORD *)v26 + 4);
            v24 = v26 + 16;
            v25 = v27;
            v28 = v27 ? v24 : 0;
          }
          while (v28 && v28 != v23);
          BYTE3(v45) = v9;
          LOWORD(v45) = 24 * v9 + 272;
          v30 = (unint64_t *)v63;
          do
          {
            spu_log_device_time_to_mach_time(*((_QWORD *)v10 + 1) >> 10, &v44, &v43, &v42);
            *((_DWORD *)v30 - 4) = *((_DWORD *)v10 + 1);
            v31 = spu_log_ns_to_mach_time(v43);
            v32 = v42;
            *(v30 - 1) = v31;
            *v30 = v32;
            v33 = &v10[(*((_QWORD *)v10 + 1) >> 2) & 0xF0];
            v34 = *((_DWORD *)v33 + 4);
            v10 = v33 + 16;
            if (v34)
              v35 = v10;
            else
              v35 = 0;
            v30 += 3;
            if (v35)
              v36 = v35 == v23;
            else
              v36 = 1;
          }
          while (!v36);
          a3(a4, "AOPLOG", &v45, (unsigned __int16)v45, 0);
          ++v7;
        }
        while (v7 != v8);
      }
    }
    else
    {
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "success", (const char *)&unk_231101D67, "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/liblog_aop/liblog_aop.cpp", 135, 0);
    }
    free(outputStruct);
    v37 = v39;
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "AssertMacros: %s, %s file: %s, line: %d, value: %lld\n", "aop_reports", (const char *)&unk_231101D67, "/Library/Caches/com.apple.xbs/Sources/AppleSPUKext/liblog_aop/liblog_aop.cpp", 132, 0);
    v37 = 0;
  }
  AOPServiceConnect::~AOPServiceConnect((AOPServiceConnect *)&v65);
  return v37;
}

void sub_231100084(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void AOPServiceConnect::~AOPServiceConnect(void **this)
{
  *this = &off_24FFFF1F0;
  AOPServiceConnect::disconnect((AOPServiceConnect *)this);
  if (*((char *)this + 31) < 0)
    operator delete(this[1]);
}

{
  AOPServiceConnect::~AOPServiceConnect(this);
  JUMPOUT(0x2348D1AE4);
}

BOOL AOPServiceConnect::connect(AOPServiceConnect *this)
{
  mach_port_t v2;
  const char *v3;
  const __CFDictionary *v4;
  io_service_t MatchingService;

  v2 = *MEMORY[0x24BDD8B20];
  v3 = (char *)this + 8;
  if (*((char *)this + 31) < 0)
    v3 = *(const char **)v3;
  v4 = IOServiceNameMatching(v3);
  MatchingService = IOServiceGetMatchingService(v2, v4);
  *((_DWORD *)this + 9) = MatchingService;
  return MatchingService && !IOServiceOpen(MatchingService, *MEMORY[0x24BDAEC58], 0, (io_connect_t *)this + 8);
}

uint64_t AOPServiceConnect::disconnect(AOPServiceConnect *this)
{
  io_connect_t v2;
  uint64_t result;

  v2 = *((_DWORD *)this + 8);
  if (v2)
  {
    IOServiceClose(v2);
    *((_DWORD *)this + 8) = 0;
  }
  result = *((unsigned int *)this + 9);
  if ((_DWORD)result)
  {
    result = IOObjectRelease(result);
    *((_DWORD *)this + 9) = 0;
  }
  return result;
}

void sub_2311001C8(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_2310F1000, log, OS_LOG_TYPE_FAULT, "fault!", v1, 2u);
}

uint64_t ADClientAddValueForScalarKey()
{
  return MEMORY[0x24BE02948]();
}

uint64_t ADClientClearDistributionKey()
{
  return MEMORY[0x24BE02950]();
}

uint64_t ADClientClearScalarKey()
{
  return MEMORY[0x24BE02958]();
}

uint64_t ADClientPushValueForDistributionKey()
{
  return MEMORY[0x24BE02960]();
}

uint64_t ADClientSetValueForDistributionKey()
{
  return MEMORY[0x24BE02968]();
}

uint64_t ADClientSetValueForScalarKey()
{
  return MEMORY[0x24BE02970]();
}

void *__cdecl CFAllocatorAllocate(CFAllocatorRef allocator, CFIndex size, CFOptionFlags hint)
{
  return (void *)MEMORY[0x24BDBB790](allocator, size, hint);
}

void CFAllocatorDeallocate(CFAllocatorRef allocator, void *ptr)
{
  MEMORY[0x24BDBB7A0](allocator, ptr);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x24BDBB7C8](theArray, value);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x24BDBB808](allocator, capacity, callBacks);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x24BDBBA18]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x24BDBBA20](BOOLean);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x24BDBBE68](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
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

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x24BDBC568](alloc, cStr, *(_QWORD *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x24BDBC610](theString, *(_QWORD *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x24BDBC698]();
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

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x24BDD7EF8](*(_QWORD *)&connection, *(_QWORD *)&selector, input, *(_QWORD *)&inputCnt, inputStruct, inputStructCnt, output, outputCnt);
}

kern_return_t IOCreatePlugInInterfaceForService(io_service_t service, CFUUIDRef pluginType, CFUUIDRef interfaceType, IOCFPlugInInterface ***theInterface, SInt32 *theScore)
{
  return MEMORY[0x24BDD7F90](*(_QWORD *)&service, pluginType, interfaceType, theInterface, theScore);
}

uint64_t IOHIDServiceCopyProperty()
{
  return MEMORY[0x24BDD8568]();
}

uint64_t IOHIDServiceGetProperty()
{
  return MEMORY[0x24BDD8570]();
}

uint64_t IOHIDServiceGetRegistryID()
{
  return MEMORY[0x24BDD8578]();
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x24BDD86F8](*(_QWORD *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x24BDD88B0](*(_QWORD *)&entry, key, allocator, *(_QWORD *)&options);
}

kern_return_t IORegistryEntryGetName(io_registry_entry_t entry, io_name_t name)
{
  return MEMORY[0x24BDD88E0](*(_QWORD *)&entry, name);
}

kern_return_t IORegistryEntryGetParentEntry(io_registry_entry_t entry, const io_name_t plane, io_registry_entry_t *parent)
{
  return MEMORY[0x24BDD88F0](*(_QWORD *)&entry, plane, parent);
}

CFMutableDictionaryRef IORegistryEntryIDMatching(uint64_t entryID)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDD8918](entryID);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x24BDD8970](*(_QWORD *)&connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x24BDD8988](*(_QWORD *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDD89A8](name);
}

CFMutableDictionaryRef IOServiceNameMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDD89B0](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x24BDD89B8](*(_QWORD *)&service, *(_QWORD *)&owningTask, *(_QWORD *)&type, connect);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t std::stringbuf::str()
{
  return MEMORY[0x24BEDA9E0]();
}

const std::locale::facet *__cdecl std::locale::use_facet(const std::locale *this, std::locale::id *a2)
{
  return (const std::locale::facet *)MEMORY[0x24BEDAA60](this, a2);
}

std::locale std::ios_base::getloc(const std::ios_base *this)
{
  return (std::locale)MEMORY[0x24BEDAA70](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x24BEDAAA8](this, a2);
}

std::string *__cdecl std::string::append(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x24BEDAC38](this, __s);
}

std::string *__cdecl std::string::assign(std::string *this, const std::string::value_type *__s)
{
  return (std::string *)MEMORY[0x24BEDAC58](this, __s);
}

uint64_t std::ostream::sentry::sentry()
{
  return MEMORY[0x24BEDAEF8]();
}

uint64_t std::ostream::sentry::~sentry()
{
  return MEMORY[0x24BEDAF00]();
}

uint64_t std::ostream::operator<<()
{
  return MEMORY[0x24BEDAF30]();
}

{
  return MEMORY[0x24BEDAF48]();
}

{
  return MEMORY[0x24BEDAF50]();
}

{
  return MEMORY[0x24BEDAF60]();
}

{
  return MEMORY[0x24BEDAF70]();
}

{
  return MEMORY[0x24BEDAF80]();
}

uint64_t std::iostream::~basic_iostream()
{
  return MEMORY[0x24BEDB010]();
}

uint64_t std::streambuf::basic_streambuf()
{
  return MEMORY[0x24BEDB048]();
}

uint64_t std::streambuf::~streambuf()
{
  return MEMORY[0x24BEDB050]();
}

void std::locale::~locale(std::locale *this)
{
  MEMORY[0x24BEDB448](this);
}

void std::ios_base::__set_badbit_and_consider_rethrow(std::ios_base *this)
{
  MEMORY[0x24BEDB500](this);
}

void std::ios_base::init(std::ios_base *this, void *__sb)
{
  MEMORY[0x24BEDB518](this, __sb);
}

void std::ios_base::clear(std::ios_base *this, std::ios_base::iostate __state)
{
  MEMORY[0x24BEDB530](this, *(_QWORD *)&__state);
}

uint64_t std::ios::~ios()
{
  return MEMORY[0x24BEDB5E8]();
}

std::string *__cdecl std::to_string(std::string *__return_ptr retstr, unsigned int __val)
{
  return (std::string *)MEMORY[0x24BEDB610](retstr, *(_QWORD *)&__val);
}

uint64_t std::operator+<char>()
{
  return MEMORY[0x24BEDB638]();
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

void operator delete(void *__p)
{
  off_24FFFD828(__p);
}

uint64_t operator delete()
{
  return off_24FFFD830();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_24FFFD838(__sz);
}

uint64_t operator new()
{
  return off_24FFFD840();
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x24BEDB8F8](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x24BEDB910](a1);
}

void __cxa_end_catch(void)
{
  MEMORY[0x24BEDB928]();
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x24BEDB930](a1);
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x24BEDB960](a1, lptinfo, a3);
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

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAE428](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

tm *__cdecl localtime(const time_t *a1)
{
  return (tm *)MEMORY[0x24BDAEA98](a1);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x24BDAEC68](info);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x24BDAEEA8](__b, *(_QWORD *)&__c, __len);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x24BDAF170](name, out_token, queue, handler);
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

int puts(const char *a1)
{
  return MEMORY[0x24BDAF9F8](a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

size_t strftime(char *a1, size_t a2, const char *a3, const tm *a4)
{
  return MEMORY[0x24BDAFF28](a1, a2, a3, a4);
}

size_t strlcat(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x24BDAFF30](__dst, __source, __size);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x24BDAFF38](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

