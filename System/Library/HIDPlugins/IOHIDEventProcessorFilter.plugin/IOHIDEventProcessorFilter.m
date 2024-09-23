_QWORD *IOHIDEventProcessor::setEventCallback(_QWORD *result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  result[5] = a2;
  result[6] = a3;
  result[7] = a4;
  return result;
}

{
  result[5] = a2;
  result[6] = a3;
  result[7] = a4;
  return result;
}

void IOHIDEventProcessor::unscheduleFromDispatchQueue(IOHIDEventProcessor *this, void *a2, dispatch_queue_s *a3)
{
  uint64_t v4;

  if (*((void **)this + 3) == a2)
  {
    v4 = *((_QWORD *)this + 20);
    if (*(_QWORD *)v4)
      dispatch_source_cancel(*(dispatch_source_t *)v4);
    *(_QWORD *)(v4 + 8) = 0;
    *((_QWORD *)this + 3) = 0;
  }
}

uint64_t IOHIDEventProcessor::match(uint64_t a1, uint64_t a2)
{
  const __CFNumber *v4;
  const __CFNumber *v5;
  NSObject *v6;
  int valuePtr;

  v4 = (const __CFNumber *)IOHIDServiceCopyProperty();
  if (v4)
  {
    v5 = v4;
    valuePtr = 0;
    CFNumberGetValue(v4, kCFNumberSInt32Type, &valuePtr);
    if (valuePtr)
    {
      *(_DWORD *)(a1 + 20) = 200;
      *(_QWORD *)(a1 + 32) = a2;
    }
    CFRelease(v5);
  }
  else
  {
    *(_DWORD *)(a1 + 20) = 200;
    *(_QWORD *)(a1 + 32) = a2;
  }
  v6 = _IOHIDLogCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    sub_2311090F0(a1, a2, v6);
  return *(unsigned int *)(a1 + 20);
}

void IOHIDEventProcessor::IOHIDEventProcessor(IOHIDEventProcessor *this, CFTypeRef cf)
{
  _QWORD *v4;

  *(_QWORD *)this = &IOHIDEventProcessor::sIOHIDEventProcessorFtbl;
  *((_QWORD *)this + 1) = CFRetain(cf);
  *((_DWORD *)this + 4) = 1;
  *(_OWORD *)((char *)this + 20) = 0u;
  *(_OWORD *)((char *)this + 36) = 0u;
  *(_OWORD *)((char *)this + 49) = 0u;
  *((_QWORD *)this + 10) = 0;
  *((_QWORD *)this + 11) = 0;
  *((_QWORD *)this + 9) = 0;
  *((_BYTE *)this + 96) = 0;
  *((_QWORD *)this + 13) = 0;
  *((_QWORD *)this + 14) = 0;
  *((_BYTE *)this + 120) = 0;
  *((_OWORD *)this + 8) = 0u;
  *((_OWORD *)this + 9) = 0u;
  v4 = (_QWORD *)operator new();
  v4[1] = 0;
  v4[2] = 0;
  *v4 = 0;
  *((_QWORD *)this + 20) = v4;
  CFPlugInAddInstanceForFactory((CFUUIDRef)cf);
  if (!dword_25414D8D4)
    mach_timebase_info((mach_timebase_info_t)&dword_25414D8D0);
}

IOHIDEventProcessor *IOHIDEventProcessorFactory(uint64_t a1, const void *a2)
{
  const __CFAllocator *v3;
  CFUUIDRef v4;
  IOHIDEventProcessor *v5;
  CFUUIDRef v6;

  v3 = (const __CFAllocator *)*MEMORY[0x24BDBD260];
  v4 = CFUUIDGetConstantUUIDWithBytes((CFAllocatorRef)*MEMORY[0x24BDBD260], 0x6Bu, 3u, 0x40u, 0xD3u, 0x57u, 0x98u, 0x40u, 0x64u, 0xAAu, 0x17u, 0x92u, 4u, 0xC7u, 0xB0u, 0x6Fu, 0xFDu);
  if (!CFEqual(a2, v4))
    return 0;
  v5 = (IOHIDEventProcessor *)CFAllocatorAllocate((CFAllocatorRef)*MEMORY[0x24BDBD240], 168, 0);
  v6 = CFUUIDGetConstantUUIDWithBytes(v3, 0x7Du, 0xCFu, 0x18u, 0xB5u, 7u, 0xBEu, 0x4Fu, 0xF5u, 0x87u, 0xCFu, 0x44u, 0xB3u, 0xC1u, 0x7Cu, 0x92u, 0x16u);
  IOHIDEventProcessor::IOHIDEventProcessor(v5, v6);
  return v5;
}

uint64_t IOHIDEventProcessor::Release(IOHIDEventProcessor *this)
{
  int v1;
  uint64_t v2;

  v1 = *((_DWORD *)this + 4);
  v2 = (v1 - 1);
  *((_DWORD *)this + 4) = v2;
  if (v1 == 1)
  {
    IOHIDEventProcessor::~IOHIDEventProcessor(this);
    MEMORY[0x2348D1DF4]();
  }
  return v2;
}

void IOHIDEventProcessor::~IOHIDEventProcessor(IOHIDEventProcessor *this)
{
  const void *v2;
  _QWORD *v3;
  _QWORD *v4;
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD *v8;
  uint64_t v9;

  v2 = (const void *)*((_QWORD *)this + 9);
  if (v2)
    CFRelease(v2);
  v3 = (_QWORD *)*((_QWORD *)this + 18);
  if (v3)
  {
    do
    {
      v4 = (_QWORD *)v3[2];
      (*(void (**)(_QWORD *))(*v3 + 8))(v3);
      v3 = v4;
    }
    while (v4);
  }
  v5 = (_QWORD *)*((_QWORD *)this + 19);
  if (v5)
  {
    do
    {
      v6 = (_QWORD *)v5[2];
      (*(void (**)(_QWORD *))(*v5 + 8))(v5);
      v5 = v6;
    }
    while (v6);
  }
  v7 = (_QWORD *)*((_QWORD *)this + 17);
  if (v7)
  {
    do
    {
      v8 = (_QWORD *)v7[2];
      (*(void (**)(_QWORD *))(*v7 + 8))(v7);
      v7 = v8;
    }
    while (v8);
  }
  v9 = *((_QWORD *)this + 20);
  if (v9)
    MEMORY[0x2348D1DF4](v9, 0x20C40960023A9);
  CFPlugInRemoveInstanceForFactory(*((CFUUIDRef *)this + 1));
  CFRelease(*((CFTypeRef *)this + 1));
}

void IOHIDEventProcessor::open(IOHIDEventProcessor *a1)
{
  uint64_t i;
  const __CFString *v3;
  const void *v4;
  const void *v5;
  const void *v6;

  for (i = 0; i != 9; ++i)
  {
    v3 = off_24FFFF520[i];
    v4 = (const void *)IOHIDServiceCopyProperty();
    if (v4)
    {
      v6 = v4;
      IOHIDEventProcessor::setPropertyForClient(a1, v3, v4, v5);
      CFRelease(v6);
    }
  }
}

uint64_t IOHIDEventProcessor::QueryInterface(IOHIDEventProcessor *this, CFUUIDBytes a2, void **a3)
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

void Timer::init(Timer *this, dispatch_queue_t queue)
{
  NSObject *v3;
  uint64_t v4;
  _QWORD v5[5];
  _QWORD handler[5];

  *((_QWORD *)this + 1) = queue;
  if (!*(_QWORD *)this)
  {
    v3 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 1uLL, queue);
    v4 = MEMORY[0x24BDAC760];
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 0x40000000;
    handler[2] = sub_2311087DC;
    handler[3] = &unk_24FFFF668;
    handler[4] = this;
    dispatch_source_set_event_handler(v3, handler);
    v5[0] = v4;
    v5[1] = 0x40000000;
    v5[2] = sub_231106F4C;
    v5[3] = &unk_24FFFF688;
    v5[4] = v3;
    dispatch_source_set_cancel_handler(v3, v5);
    dispatch_source_set_timer(v3, 0xFFFFFFFFFFFFFFFFLL, 0, 0);
    *(_QWORD *)this = v3;
    dispatch_resume(v3);
  }
}

CFTypeRef IOHIDEventProcessor::copyPropertyForClient(IOHIDEventProcessor *this, CFTypeRef cf1, const void *a3)
{
  CFTypeRef v4;
  unint64_t v6;
  CFTypeRef cf;

  if (!CFEqual(cf1, CFSTR("ServiceFilterDebug")))
    return 0;
  v6 = 0xAAAAAAAAAAAAAAAALL;
  cf = (CFTypeRef)0xAAAAAAAAAAAAAAAALL;
  sub_2311089C8(&v6, 0);
  if (cf)
  {
    IOHIDEventProcessor::serialize(this, (__CFDictionary *)cf);
    v4 = CFRetain(cf);
  }
  else
  {
    v4 = 0;
  }
  sub_231108AA0(&v6);
  return v4;
}

void sub_231106738(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  sub_231108AA0(&a9);
  _Unwind_Resume(a1);
}

uint64_t IOHIDEventProcessor::filter(uint64_t a1, uint64_t a2)
{
  int Type;
  int v5;
  unint64_t *v6;
  unint64_t *v7;
  uint64_t *v8;
  unint64_t v9;
  unint64_t v10;
  int IntegerValue;
  int v12;
  NSObject *v13;
  const __CFArray *v14;
  CFIndex Count;
  CFIndex v16;
  CFIndex v17;
  char v18;
  const __CFNumber *ValueAtIndex;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  uint64_t v23;
  unint64_t v24;
  NSObject *v25;
  int v26;
  BOOL v27;
  double v28;
  int v29;
  unint64_t v31;
  uint64_t *v32;
  unint64_t valuePtr;
  __int16 v34;
  int v35;
  __int16 v36;
  int v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  if (!*(_QWORD *)(a1 + 24))
    return a2;
  Type = IOHIDEventGetType();
  v5 = Type;
  if (Type == 3)
  {
    if (!*(_BYTE *)(a1 + 64))
      return a2;
    v6 = (unint64_t *)(a1 + 80);
    v7 = (unint64_t *)(a1 + 88);
    v8 = (uint64_t *)(a1 + 144);
  }
  else
  {
    if (Type != 29 || !*(_BYTE *)(a1 + 96))
      return a2;
    v6 = (unint64_t *)(a1 + 104);
    v7 = (unint64_t *)(a1 + 112);
    v8 = (uint64_t *)(a1 + 152);
  }
  v32 = v8;
  v9 = *v7;
  v10 = *v6;
  IntegerValue = IOHIDEventGetIntegerValue();
  v12 = IOHIDEventGetIntegerValue();
  v13 = _IOHIDLogCategory();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(valuePtr) = 67109632;
    HIDWORD(valuePtr) = v5;
    v34 = 1024;
    v35 = IntegerValue;
    v36 = 1024;
    v37 = v12;
    _os_log_debug_impl(&dword_231105000, v13, OS_LOG_TYPE_DEBUG, "filter: type = %d p = %d u = %d\n", (uint8_t *)&valuePtr, 0x14u);
  }
  if (v5 != 3)
    goto LABEL_16;
  v14 = *(const __CFArray **)(a1 + 72);
  if (!v14)
    goto LABEL_16;
  Count = CFArrayGetCount(v14);
  if (Count < 1)
    goto LABEL_22;
  v16 = Count;
  v31 = v9;
  v17 = 0;
  v18 = 0;
  do
  {
    ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(*(CFArrayRef *)(a1 + 72), v17);
    valuePtr = 0xAAAAAAAAAAAAAAAALL;
    CFNumberGetValue(ValueAtIndex, kCFNumberLongLongType, &valuePtr);
    v18 |= (v12 | (IntegerValue << 16)) == valuePtr;
    ++v17;
  }
  while (v16 != v17);
  v9 = v31;
  if ((v18 & 1) == 0)
  {
LABEL_22:
    v22 = _IOHIDLogCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      sub_23110922C();
  }
  else
  {
LABEL_16:
    if ((IOHIDEventGetPhase() & 4) != 0)
    {
      v21 = _IOHIDLogCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        sub_231109200();
    }
    else
    {
      if (IOHIDEventGetIntegerValue())
      {
        v20 = _IOHIDLogCategory();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          sub_2311091D4();
        return a2;
      }
      v23 = *(_QWORD *)(a1 + 136);
      if (v23)
      {
        while (*(_DWORD *)(v23 + 44) != v5 || *(_DWORD *)(v23 + 52) != v12 || *(_DWORD *)(v23 + 48) != IntegerValue)
        {
          v23 = *(_QWORD *)(v23 + 16);
          if (!v23)
            goto LABEL_29;
        }
LABEL_36:
        v26 = IOHIDEventGetType();
        if (v26 == 29)
        {
          IOHIDEventGetFloatValue();
          v27 = v28 == 1.0;
        }
        else
        {
          if (v26 != 3)
          {
            v29 = 0;
LABEL_44:
            Event::stateHandler(v23, v29 ^ 1, a2);
            return a2;
          }
          v27 = IOHIDEventGetIntegerValue() == 1;
        }
        v29 = v27;
        goto LABEL_44;
      }
LABEL_29:
      v23 = *v32;
      if (*v32)
      {
        *v32 = *(_QWORD *)(v23 + 16);
        if (v5 == 3)
          v24 = *(_QWORD *)(a1 + 128);
        else
          v24 = 0;
        Event::init((Event *)v23, (IOHIDEventProcessor *)a1, *(Timer **)(a1 + 160), v5, IntegerValue, v12, v10, v9, v24, *(_BYTE *)(a1 + 120));
        *(_QWORD *)(v23 + 16) = *(_QWORD *)(a1 + 136);
        *(_QWORD *)(a1 + 136) = v23;
        goto LABEL_36;
      }
      v25 = _IOHIDLogCategory();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        sub_23110919C();
    }
  }
  return a2;
}

void IOHIDEventProcessor::setPropertyForClient(IOHIDEventProcessor *this, CFStringRef theString1, const void *a3, const void *a4)
{
  uint64_t v7;
  NSObject *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  const void *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t valuePtr;

  valuePtr = 0;
  if (theString1 && a3)
  {
    v7 = 0;
    if (CFStringCompare(theString1, CFSTR("PressCountTrackingEnabled"), 0) == kCFCompareEqualTo)
    {
      *((_BYTE *)this + 64) = *MEMORY[0x24BDBD270] == (_QWORD)a3;
      v8 = _IOHIDLogCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        sub_231109074();
      if (*((_BYTE *)this + 64) && !*((_QWORD *)this + 18))
      {
        v7 = 0;
        v9 = 11;
        do
        {
          v10 = v7;
          v11 = operator new();
          v7 = v11;
          *(_OWORD *)(v11 + 8) = 0u;
          *(_OWORD *)(v11 + 24) = 0u;
          *(_BYTE *)(v11 + 40) = 1;
          *(_OWORD *)(v11 + 44) = 0u;
          *(_OWORD *)(v11 + 60) = 0u;
          *(_DWORD *)(v11 + 75) = 0;
          *(_OWORD *)(v11 + 80) = 0u;
          *(_OWORD *)(v11 + 96) = 0u;
          *(_QWORD *)v11 = &off_24FFFF6B8;
          *(_QWORD *)(v11 + 16) = v10;
          --v9;
        }
        while (v9);
        *((_QWORD *)this + 18) = v11;
      }
      else
      {
        v7 = 0;
      }
    }
    if (CFStringCompare(theString1, CFSTR("PressCountUsagePairs"), 0) == kCFCompareEqualTo)
    {
      v12 = (const void *)*((_QWORD *)this + 9);
      if (v12)
        CFRelease(v12);
      *((_QWORD *)this + 9) = a3;
      CFRetain(a3);
      v13 = _IOHIDLogCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        sub_231109014();
    }
    if (CFStringCompare(theString1, CFSTR("PressCountDoublePressTimeout"), 0) == kCFCompareEqualTo)
    {
      CFNumberGetValue((CFNumberRef)a3, kCFNumberLongLongType, &valuePtr);
      *((_QWORD *)this + 10) = valuePtr;
      v14 = _IOHIDLogCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        sub_231108FB4();
    }
    if (CFStringCompare(theString1, CFSTR("PressCountTriplePressTimeout"), 0) == kCFCompareEqualTo)
    {
      CFNumberGetValue((CFNumberRef)a3, kCFNumberLongLongType, &valuePtr);
      *((_QWORD *)this + 11) = valuePtr;
      v15 = _IOHIDLogCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        sub_231108F54();
    }
    if (CFStringCompare(theString1, CFSTR("LongPressTimeout"), 0) == kCFCompareEqualTo)
    {
      CFNumberGetValue((CFNumberRef)a3, kCFNumberLongLongType, &valuePtr);
      *((_QWORD *)this + 16) = valuePtr;
      v16 = _IOHIDLogCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        sub_231108EF4();
    }
    if (CFStringCompare(theString1, CFSTR("AlternateLongPressHandling"), 0) == kCFCompareEqualTo)
    {
      *((_BYTE *)this + 120) = *MEMORY[0x24BDBD270] == (_QWORD)a3;
      v17 = _IOHIDLogCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        sub_231108E78();
    }
    if (CFStringCompare(theString1, CFSTR("TapTrackingEnabled"), 0) == kCFCompareEqualTo)
    {
      *((_BYTE *)this + 96) = *MEMORY[0x24BDBD270] == (_QWORD)a3;
      v20 = _IOHIDLogCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        sub_231108DFC();
      if (*((_BYTE *)this + 96) && !*((_QWORD *)this + 19))
      {
        v21 = operator new();
        *(_OWORD *)(v21 + 8) = 0u;
        *(_OWORD *)(v21 + 24) = 0u;
        *(_BYTE *)(v21 + 40) = 1;
        *(_OWORD *)(v21 + 44) = 0u;
        *(_OWORD *)(v21 + 60) = 0u;
        *(_DWORD *)(v21 + 75) = 0;
        *(_OWORD *)(v21 + 80) = 0u;
        *(_OWORD *)(v21 + 96) = 0u;
        *(_QWORD *)v21 = &off_24FFFF760;
        *(_QWORD *)(v21 + 16) = v7;
        *((_QWORD *)this + 19) = v21;
      }
    }
    if (CFStringCompare(theString1, CFSTR("DoubleTapTimeout"), 0) == kCFCompareEqualTo)
    {
      CFNumberGetValue((CFNumberRef)a3, kCFNumberLongLongType, &valuePtr);
      *((_QWORD *)this + 13) = valuePtr;
      v18 = _IOHIDLogCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        sub_231108D9C();
    }
    if (CFStringCompare(theString1, CFSTR("TripleTapTimeout"), 0) == kCFCompareEqualTo)
    {
      CFNumberGetValue((CFNumberRef)a3, kCFNumberLongLongType, &valuePtr);
      *((_QWORD *)this + 14) = valuePtr;
      v19 = _IOHIDLogCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        sub_231108D3C();
    }
  }
}

void IOHIDEventProcessor::scheduleWithDispatchQueue(IOHIDEventProcessor *this, NSObject *a2, dispatch_queue_s *a3)
{
  *((_QWORD *)this + 3) = a2;
  Timer::init(*((Timer **)this + 20), a2);
}

uint64_t IOHIDEventProcessor::filterCopyEvent(uint64_t a1, uint64_t a2)
{
  return a2;
}

{
  return a2;
}

void sub_231106F4C(uint64_t a1)
{
  dispatch_release(*(dispatch_object_t *)(a1 + 32));
}

uint64_t IOHIDEventProcessor::AddRef(IOHIDEventProcessor *this, void *a2)
{
  uint64_t v2;

  v2 = (*((_DWORD *)this + 4) + 1);
  *((_DWORD *)this + 4) = v2;
  return v2;
}

void Timer::Timer(Timer *this)
{
  *(_QWORD *)this = 0;
  *((_QWORD *)this + 1) = 0;
  *((_QWORD *)this + 2) = 0;
}

{
  *(_QWORD *)this = 0;
  *((_QWORD *)this + 1) = 0;
  *((_QWORD *)this + 2) = 0;
}

void sub_231106F78(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

uint64_t IOHIDEventProcessor::AddRef(IOHIDEventProcessor *this)
{
  uint64_t v1;

  v1 = (*((_DWORD *)this + 4) + 1);
  *((_DWORD *)this + 4) = v1;
  return v1;
}

_QWORD *IOHIDEventProcessor::serialize(IOHIDEventProcessor *this, __CFDictionary *a2)
{
  const void *v3;
  void *v5;
  CFMutableDictionaryRef theDict;

  v5 = (void *)0xAAAAAAAAAAAAAAAALL;
  theDict = (CFMutableDictionaryRef)0xAAAAAAAAAAAAAAAALL;
  sub_231108AE0(&v5, a2, 0);
  v5 = &unk_24FFFF7F8;
  CFDictionarySetValue(theDict, CFSTR("Class"), CFSTR("IOHIDEventProcessor"));
  sub_2311075EC((uint64_t)&v5, CFSTR("PressCountTrackingEnabled"), *((_BYTE *)this + 64));
  v3 = (const void *)*((_QWORD *)this + 9);
  if (v3)
    CFDictionarySetValue(theDict, CFSTR("PressCountUsagePairs"), v3);
  sub_231107658((uint64_t)&v5, CFSTR("PressCountDoublePressTimeout"), *((_QWORD *)this + 10));
  sub_231107658((uint64_t)&v5, CFSTR("PressCountTriplePressTimeout"), *((_QWORD *)this + 11));
  sub_231107658((uint64_t)&v5, CFSTR("LongPressTimeout"), *((_QWORD *)this + 16));
  sub_2311075EC((uint64_t)&v5, CFSTR("AlternateLongPressHandling"), *((_BYTE *)this + 120));
  sub_231107658((uint64_t)&v5, CFSTR("TapTrackingEnabled"), *((_QWORD *)this + 11));
  sub_231107658((uint64_t)&v5, CFSTR("DoubleTapTimeout"), *((_QWORD *)this + 13));
  sub_231107658((uint64_t)&v5, CFSTR("TripleTapTimeout"), *((_QWORD *)this + 14));
  sub_231107658((uint64_t)&v5, CFSTR("MatchScore"), *((int *)this + 5));
  return sub_231108AA0(&v5);
}

void sub_2311070F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  sub_231108AA0(&a9);
  _Unwind_Resume(a1);
}

BOOL Event::conformsTo(Event *this, int a2, int a3, int a4)
{
  return *((_DWORD *)this + 11) == a2 && *((_DWORD *)this + 13) == a4 && *((_DWORD *)this + 12) == a3;
}

void Event::init(Event *this, IOHIDEventProcessor *a2, Timer *a3, int a4, int a5, int a6, unint64_t a7, unint64_t a8, unint64_t a9, BOOL a10)
{
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  *((_DWORD *)this + 11) = a4;
  *((_DWORD *)this + 12) = a5;
  *((_DWORD *)this + 13) = a6;
  *((_QWORD *)this + 10) = a7;
  *((_QWORD *)this + 11) = a8;
  *((_QWORD *)this + 12) = 0;
  *((_QWORD *)this + 13) = a9;
  *((_BYTE *)this + 40) = 0;
  *((_QWORD *)this + 3) = 0;
  *((_QWORD *)this + 4) = a2;
  *((_QWORD *)this + 1) = 0;
  *((_QWORD *)this + 2) = 0;
  *((_QWORD *)this + 7) = a3;
  *((_QWORD *)this + 8) = 0;
  *(_QWORD *)((char *)this + 70) = 0;
  *((_BYTE *)this + 78) = a10;
  if (a9)
  {
    if (a9 == a7)
    {
      a7 = a9 + 1;
      *((_QWORD *)this + 10) = a9 + 1;
    }
    if (a9 == a8)
    {
      a8 = a9 + 1;
      *((_QWORD *)this + 11) = a9 + 1;
    }
  }
  if (a7 > a9 || a8 > a9)
  {
    v11 = _IOHIDLogCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      v12 = *((_QWORD *)this + 13);
      v13 = *((_QWORD *)this + 10);
      v14 = *((_QWORD *)this + 11);
      v15 = 134218496;
      v16 = v12;
      v17 = 2048;
      v18 = v13;
      v19 = 2048;
      v20 = v14;
      _os_log_debug_impl(&dword_231105000, v11, OS_LOG_TYPE_DEBUG, "long %llu second %llu third %llu\n\n", (uint8_t *)&v15, 0x20u);
    }
  }
}

BOOL Event::stateHandler(uint64_t a1, int a2, uint64_t a3)
{
  void (*v6)(uint64_t, uint64_t);
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;

  Timer::checkEventTimeouts(*(Timer **)(a1 + 56));
  v6 = (void (*)(uint64_t, uint64_t))*(&_stateMap[3 * *(unsigned int *)(a1 + 64)] + a2);
  v7 = _IOHIDLogCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    sub_23110934C();
    if (v6)
    {
LABEL_3:
      v6(a1, a3);
      v8 = _IOHIDLogCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        sub_231109258();
      return v6 != 0;
    }
  }
  else if (v6)
  {
    goto LABEL_3;
  }
  v9 = _IOHIDLogCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    sub_2311092C8((int *)(a1 + 64), a2, v9);
  return v6 != 0;
}

void IOHIDEventProcessor::scheduleWithDispatchQueue(IOHIDEventProcessor *this, NSObject *a2)
{
  *((_QWORD *)this + 3) = a2;
  Timer::init(*((Timer **)this + 20), a2);
}

void IOHIDEventProcessor::unscheduleFromDispatchQueue(IOHIDEventProcessor *this, dispatch_queue_s *a2)
{
  uint64_t v3;

  if (*((dispatch_queue_s **)this + 3) == a2)
  {
    v3 = *((_QWORD *)this + 20);
    if (*(_QWORD *)v3)
      dispatch_source_cancel(*(dispatch_source_t *)v3);
    *(_QWORD *)(v3 + 8) = 0;
    *((_QWORD *)this + 3) = 0;
  }
}

void Timer::cancel(NSObject **this, dispatch_queue_s *a2)
{
  NSObject *v3;

  v3 = *this;
  if (v3)
    dispatch_source_cancel(v3);
  this[1] = 0;
}

void IOHIDEventProcessor::dispatchEvent(uint64_t a1, CFTypeRef cf, int a3)
{
  NSObject *v5;
  NSObject *v6;
  _QWORD v7[6];

  if (*(_QWORD *)(a1 + 24))
  {
    if (a3)
    {
      CFRetain(cf);
      v5 = *(NSObject **)(a1 + 24);
      v7[0] = MEMORY[0x24BDAC760];
      v7[1] = 0x40000000;
      v7[2] = sub_23110749C;
      v7[3] = &unk_24FFFF568;
      v7[4] = a1;
      v7[5] = cf;
      dispatch_async(v5, v7);
    }
    else
    {
      v6 = _IOHIDLogCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        sub_2311093D4();
      (*(void (**)(_QWORD, _QWORD, _QWORD, CFTypeRef, _QWORD))(a1 + 40))(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), cf, 0);
    }
  }
}

void sub_23110749C(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = _IOHIDLogCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    sub_231109434();
  (*(void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(v2 + 40))(*(_QWORD *)(v2 + 48), *(_QWORD *)(v2 + 56), *(_QWORD *)(v2 + 32), *(_QWORD *)(a1 + 40), 0);
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

void IOHIDEventProcessor::returnToFreePool(IOHIDEventProcessor *this, Event *a2)
{
  uint64_t v4;
  NSObject *v5;
  int v6;
  _QWORD *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;

  v4 = *((_QWORD *)this + 17);
  v5 = _IOHIDLogCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    sub_231109498();
  v6 = *((_DWORD *)a2 + 11);
  v7 = (_QWORD *)((char *)this + 144);
  v8 = (char *)this + 152;
  if (v6 != 29)
    v8 = 0;
  if (v6 != 3)
    v7 = v8;
  if (v4)
  {
    v9 = 0;
    while (1)
    {
      v10 = v9;
      v9 = v4;
      if (*((_DWORD *)a2 + 12) == *(_DWORD *)(v4 + 48)
        && *((_DWORD *)a2 + 13) == *(_DWORD *)(v4 + 52)
        && v6 == *(_DWORD *)(v4 + 44))
      {
        break;
      }
      v4 = *(_QWORD *)(v4 + 16);
      if (!v4)
        goto LABEL_13;
    }
    if (v10)
      *(_QWORD *)(v10 + 16) = *((_QWORD *)a2 + 2);
    else
      *((_QWORD *)this + 17) = *(_QWORD *)(*((_QWORD *)this + 17) + 16);
  }
LABEL_13:
  if (v7)
  {
    *((_QWORD *)a2 + 2) = *v7;
    *v7 = a2;
  }
}

_QWORD *sub_2311075EC(uint64_t a1, const void *a2, char a3)
{
  uint64_t v6;
  void *value;

  sub_231108B64(&v6, a3);
  if (a2 && value)
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 8), a2, value);
  return sub_231108BD0(&v6);
}

void sub_231107644(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  sub_231108BD0(&a9);
  _Unwind_Resume(a1);
}

_QWORD *sub_231107658(uint64_t a1, const void *a2, uint64_t a3)
{
  uint64_t v6;
  void *value;

  sub_231108C5C(&v6, a3);
  if (a2 && value)
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 8), a2, value);
  return sub_231108BD0(&v6);
}

void sub_2311076B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  sub_231108BD0(&a9);
  _Unwind_Resume(a1);
}

void Event::Event(Event *this)
{
  *(_QWORD *)this = off_24FFFF598;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *((_BYTE *)this + 40) = 1;
  *(_OWORD *)((char *)this + 44) = 0u;
  *(_OWORD *)((char *)this + 60) = 0u;
  *(_DWORD *)((char *)this + 75) = 0;
  *((_OWORD *)this + 5) = 0u;
  *((_OWORD *)this + 6) = 0u;
}

void Event::dispatchEvent(uint64_t a1, const void *a2, int a3)
{
  IOHIDEventProcessor::dispatchEvent(*(_QWORD *)(a1 + 32), a2, a3);
}

void Event::completed(Event *this)
{
  *((_BYTE *)this + 40) = 1;
  IOHIDEventProcessor::returnToFreePool(*((IOHIDEventProcessor **)this + 4), this);
}

uint64_t sub_231107720(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 40))(a1);
}

uint64_t sub_23110772C(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 48))(a1);
}

uint64_t sub_231107738(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 88))(a1);
}

uint64_t sub_231107744(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 56))(a1);
}

uint64_t sub_231107750(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 64))(a1);
}

uint64_t sub_23110775C(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 72))(a1);
}

uint64_t sub_231107768(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 80))(a1);
}

uint64_t sub_231107774(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 32))(a1);
}

void Timer::checkEventTimeouts(Timer *this)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  unint64_t v8;
  uint8_t buf[4];
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v2 = *((_QWORD *)this + 2);
  v3 = mach_absolute_time();
  if (v2)
  {
    v4 = v3;
    do
    {
      v5 = v2;
      v2 = *(_QWORD *)(v2 + 24);
      if (*(_QWORD *)(v5 + 8) && !*(_BYTE *)(v5 + 40))
      {
        if (*(_QWORD *)(v5 + 8) < (v4 - *(_QWORD *)(v5 + 96))
                                 * dword_25414D8D0
                                 / dword_25414D8D4
                                 / 0x3E8)
        {
          v6 = _IOHIDLogCategory();
          if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
          {
            v7 = *(_QWORD *)(v5 + 8);
            v8 = (v4 - *(_QWORD *)(v5 + 96)) * dword_25414D8D0 / dword_25414D8D4 / 0x3E8;
            *(_DWORD *)buf = 134218240;
            v10 = v5;
            v11 = 2048;
            v12 = v8 - v7;
            _os_log_debug_impl(&dword_231105000, v6, OS_LOG_TYPE_DEBUG, "%p past deadline %lld us\n", buf, 0x16u);
          }
          Timer::removeEvent((uint64_t)this, (Event *)v5);
          Event::stateHandler(v5, 2, 0);
        }
      }
      else
      {
        Timer::removeEvent((uint64_t)this, (Event *)v5);
      }
    }
    while (v2);
  }
  Timer::updateTimeout(this);
}

uint64_t ButtonEvent::setMultiEventCount(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v6;
  uint64_t result;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = _IOHIDLogCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v8 = 134218496;
    v9 = a1;
    v10 = 2048;
    v11 = a2;
    v12 = 1024;
    v13 = a3;
    _os_log_debug_impl(&dword_231105000, v6, OS_LOG_TYPE_DEBUG, "%p %p setting multi count = %d\n", (uint8_t *)&v8, 0x1Cu);
  }
  result = IOHIDEventSetIntegerValue();
  if (!a3)
    LODWORD(a3) = *(_DWORD *)(a1 + 72);
  *(_DWORD *)(a1 + 72) = a3;
  return result;
}

uint64_t ButtonEvent::createSyntheticEvent(ButtonEvent *this, int a2)
{
  uint64_t KeyboardEvent;
  BOOL v5;
  NSObject *v6;
  int v8;
  _DWORD v9[2];
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  mach_absolute_time();
  KeyboardEvent = IOHIDEventCreateKeyboardEvent();
  if (KeyboardEvent)
    v5 = a2 == 0;
  else
    v5 = 1;
  if (!v5)
  {
    (*(void (**)(ButtonEvent *, uint64_t, _QWORD))(*(_QWORD *)this + 24))(this, KeyboardEvent, *((int *)this + 18));
    IOHIDEventGetPhase();
    IOHIDEventSetPhase();
    if (*((_BYTE *)this + 78))
      IOHIDEventSetIntegerValue();
    *((_BYTE *)this + 76) = 1;
  }
  v6 = _IOHIDLogCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v8 = *((_DWORD *)this + 11);
    v9[0] = 67109632;
    v9[1] = a2;
    v10 = 2048;
    v11 = KeyboardEvent;
    v12 = 1024;
    v13 = v8;
    _os_log_debug_impl(&dword_231105000, v6, OS_LOG_TYPE_DEBUG, "created terminal(%d) event %p type %d\n", (uint8_t *)v9, 0x18u);
  }
  return KeyboardEvent;
}

void ButtonEvent::NoneEnter(Timer **a1, uint64_t a2)
{
  if (a2)
  {
    Timer::registerEventTimeout(a1[7], (Event *)a1, 0);
    (*((void (**)(Timer **, uint64_t, _QWORD))*a1 + 3))(a1, a2, *((int *)a1 + 18));
  }
  *((_BYTE *)a1 + 40) = 1;
  IOHIDEventProcessor::returnToFreePool(a1[4], (Event *)a1);
  *((_DWORD *)a1 + 16) = 0;
}

void Timer::registerEventTimeout(Timer *this, Event *a2, uint64_t a3)
{
  NSObject *v6;

  v6 = _IOHIDLogCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    sub_2311094F8();
  *((_QWORD *)a2 + 1) = a3;
  Timer::removeEvent((uint64_t)this, a2);
  if (a3)
  {
    *((_QWORD *)a2 + 3) = *((_QWORD *)this + 2);
    *((_QWORD *)this + 2) = a2;
  }
  Timer::updateTimeout(this);
}

void ButtonEvent::FDEnter(Event *a1, uint64_t a2)
{
  unint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;

  *((_QWORD *)a1 + 12) = IOHIDEventGetTimeStamp();
  IOHIDEventGetPhase();
  IOHIDEventSetPhase();
  (*(void (**)(Event *, uint64_t, uint64_t))(*(_QWORD *)a1 + 24))(a1, a2, 1);
  *((_BYTE *)a1 + 77) = 0;
  *((_DWORD *)a1 + 16) = 1;
  v4 = *((_QWORD *)a1 + 10);
  if (!v4)
  {
    (*(void (**)(Event *, uint64_t))(*(_QWORD *)a1 + 96))(a1, a2);
    v4 = *((_QWORD *)a1 + 10);
  }
  v5 = *((_QWORD *)a1 + 13);
  if (v5 - 1 >= v4)
    v6 = 7;
  else
    v6 = 8;
  if (v5 - 1 >= v4)
    v7 = v4;
  else
    v7 = *((_QWORD *)a1 + 13);
  *((_DWORD *)a1 + 17) = v6;
  Timer::registerEventTimeout(*((Timer **)a1 + 7), a1, v7);
}

uint64_t ButtonEvent::FUEnter(_DWORD *a1, uint64_t a2)
{
  uint64_t result;

  result = (*(uint64_t (**)(_DWORD *, uint64_t, uint64_t))(*(_QWORD *)a1 + 24))(a1, a2, 1);
  a1[16] = 2;
  return result;
}

void ButtonEvent::SDEnter(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  unint64_t v5;
  Timer *v6;
  Event *v7;

  *(_QWORD *)(a1 + 96) = IOHIDEventGetTimeStamp();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)a1 + 24))(a1, a2, 2);
  *(_DWORD *)(a1 + 64) = 3;
  *(_BYTE *)(a1 + 77) = 0;
  v4 = *(_QWORD *)(a1 + 88);
  if (v4)
  {
    v5 = *(_QWORD *)(a1 + 104);
    if (v5 - 1 >= v4)
    {
      *(_DWORD *)(a1 + 68) = 7;
      v6 = *(Timer **)(a1 + 56);
      v7 = (Event *)a1;
    }
    else
    {
      *(_DWORD *)(a1 + 68) = 8;
      v6 = *(Timer **)(a1 + 56);
      v7 = (Event *)a1;
      v4 = v5;
    }
    Timer::registerEventTimeout(v6, v7, v4);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)a1 + 96))(a1, a2);
  }
}

uint64_t ButtonEvent::SUEnter(_DWORD *a1, uint64_t a2)
{
  uint64_t result;

  result = (*(uint64_t (**)(_DWORD *, uint64_t, uint64_t))(*(_QWORD *)a1 + 24))(a1, a2, 2);
  a1[16] = 4;
  return result;
}

uint64_t ButtonEvent::TDEnter(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)(a1 + 96) = IOHIDEventGetTimeStamp();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)a1 + 24))(a1, a2, 3);
  *(_DWORD *)(a1 + 64) = 5;
  *(_BYTE *)(a1 + 77) = 0;
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)a1 + 96))(a1, a2);
}

uint64_t ButtonEvent::TUEnter(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)a1 + 24))(a1, a2, 3);
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)a1 + 32))(a1, a2);
}

uint64_t ButtonEvent::TOEnter(uint64_t result)
{
  int v1;
  uint64_t v2;

  v1 = *(_DWORD *)(result + 68);
  if (v1 == 7)
  {
    v2 = 12;
  }
  else
  {
    if (v1 != 8)
      return result;
    v2 = 13;
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)result + 8 * v2))();
}

void ButtonEvent::TEEnter(_DWORD *a1, uint64_t a2)
{
  unsigned int v4;
  unint64_t v6;
  unint64_t v7;
  int v8;
  BOOL v9;
  unint64_t v10;
  const void *v11;

  v4 = a1[16];
  if (v4 > 8 || ((1 << v4) & 0x12A) == 0)
  {
    v8 = 0;
    v6 = 0;
    goto LABEL_18;
  }
  v6 = *((_QWORD *)a1 + 13);
  if (v6)
  {
    if (v4 != 5)
    {
      if (v4 == 3)
      {
        v7 = *((_QWORD *)a1 + 11);
LABEL_12:
        v9 = v6 >= v7;
        v10 = v6 - v7;
        if (v9)
          v6 = v10;
        else
          v6 = 0;
        goto LABEL_16;
      }
      if (v4 == 1)
      {
        v7 = *((_QWORD *)a1 + 10);
        goto LABEL_12;
      }
      v6 = 0;
    }
LABEL_16:
    a1[17] = 8;
  }
  v8 = 1;
LABEL_18:
  v11 = (const void *)(*(uint64_t (**)(_DWORD *, uint64_t))(*(_QWORD *)a1 + 16))(a1, 1);
  IOHIDEventProcessor::dispatchEvent(*((_QWORD *)a1 + 4), v11, a2 != 0);
  *((_QWORD *)a1 + 12) = IOHIDEventGetTimeStamp();
  CFRelease(v11);
  Timer::registerEventTimeout(*((Timer **)a1 + 7), (Event *)a1, v6);
  if (v8)
    a1[16] = 7;
  else
    (*(void (**)(_DWORD *, _QWORD))(*(_QWORD *)a1 + 32))(a1, 0);
}

void ButtonEvent::LPEnter(uint64_t a1, uint64_t a2)
{
  unsigned int v3;
  uint64_t v4;
  unint64_t *v5;
  unint64_t v6;
  unint64_t v7;
  BOOL v8;
  uint64_t v9;
  const void *v11;
  int v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;

  v3 = *(_DWORD *)(a1 + 64);
  switch(v3)
  {
    case 2u:
      v5 = (unint64_t *)(a1 + 80);
      goto LABEL_7;
    case 4u:
      v5 = (unint64_t *)(a1 + 88);
LABEL_7:
      v6 = *v5;
      v7 = *(_QWORD *)(a1 + 104);
      v8 = v6 >= v7;
      v9 = v6 - v7;
      if (v8)
        v4 = v9;
      else
        v4 = 0;
      goto LABEL_10;
    case 6u:
      v4 = 0;
LABEL_10:
      *(_DWORD *)(a1 + 68) = 7;
      *(_QWORD *)(a1 + 96) = mach_absolute_time();
      Timer::registerEventTimeout(*(Timer **)(a1 + 56), (Event *)a1, v4);
      return;
  }
  v11 = (const void *)(*(uint64_t (**)(uint64_t, _QWORD))(*(_QWORD *)a1 + 16))(a1, 0);
  IOHIDEventSetIntegerValue();
  IOHIDEventSetIntegerValue();
  (*(void (**)(uint64_t, const void *, _QWORD))(*(_QWORD *)a1 + 24))(a1, v11, *(int *)(a1 + 72));
  IOHIDEventProcessor::dispatchEvent(*(_QWORD *)(a1 + 32), v11, a2 != 0);
  *(_BYTE *)(a1 + 77) = 1;
  if (!*(_BYTE *)(a1 + 78))
  {
    if (((v3 < 6) & v3) != 0)
    {
      *(_DWORD *)(a1 + 64) = 8;
      (*(void (**)(uint64_t, const void *))(*(_QWORD *)a1 + 96))(a1, v11);
    }
    goto LABEL_21;
  }
  v12 = *(_DWORD *)(a1 + 64);
  if (v12 == 3)
  {
    v13 = *(_QWORD *)(a1 + 88);
  }
  else
  {
    if (v12 != 1)
    {
LABEL_19:
      *(_DWORD *)(a1 + 64) = 8;
      (*(void (**)(uint64_t, const void *))(*(_QWORD *)a1 + 96))(a1, v11);
      v15 = 0;
      goto LABEL_20;
    }
    v13 = *(_QWORD *)(a1 + 80);
  }
  v14 = *(_QWORD *)(a1 + 104);
  v15 = v13 - v14;
  if (v13 <= v14)
    goto LABEL_19;
LABEL_20:
  *(_DWORD *)(a1 + 68) = 7;
  *(_QWORD *)(a1 + 96) = mach_absolute_time();
  Timer::registerEventTimeout(*(Timer **)(a1 + 56), (Event *)a1, v15);
LABEL_21:
  CFRelease(v11);
}

uint64_t TapEvent::setMultiEventCount(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v6;
  uint64_t result;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v6 = _IOHIDLogCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v8 = 134218496;
    v9 = a1;
    v10 = 2048;
    v11 = a2;
    v12 = 1024;
    v13 = a3;
    _os_log_debug_impl(&dword_231105000, v6, OS_LOG_TYPE_DEBUG, "%p %p setting multi count = %d\n", (uint8_t *)&v8, 0x1Cu);
  }
  result = IOHIDEventSetIntegerValue();
  if (!a3)
    LODWORD(a3) = *(_DWORD *)(a1 + 72);
  *(_DWORD *)(a1 + 72) = a3;
  return result;
}

uint64_t TapEvent::createSyntheticEvent(TapEvent *this, int a2)
{
  uint64_t BiometricEvent;
  NSObject *v5;
  int v7;
  _DWORD v8[2];
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  mach_absolute_time();
  BiometricEvent = IOHIDEventCreateBiometricEvent();
  if (BiometricEvent)
  {
    IOHIDEventSetIntegerValue();
    IOHIDEventSetIntegerValue();
    if (a2)
    {
      (*(void (**)(TapEvent *, uint64_t, _QWORD))(*(_QWORD *)this + 24))(this, BiometricEvent, *((int *)this + 18));
      IOHIDEventGetPhase();
      IOHIDEventSetPhase();
      if (*((_BYTE *)this + 78))
        IOHIDEventSetIntegerValue();
      *((_BYTE *)this + 76) = 1;
    }
  }
  v5 = _IOHIDLogCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v7 = *((_DWORD *)this + 11);
    v8[0] = 67109632;
    v8[1] = a2;
    v9 = 2048;
    v10 = BiometricEvent;
    v11 = 1024;
    v12 = v7;
    _os_log_debug_impl(&dword_231105000, v5, OS_LOG_TYPE_DEBUG, "created terminal(%d) event %p type %d\n", (uint8_t *)v8, 0x18u);
  }
  return BiometricEvent;
}

void TapEvent::NoneEnter(Timer **a1, uint64_t a2)
{
  if (a2)
  {
    Timer::registerEventTimeout(a1[7], (Event *)a1, 0);
    (*((void (**)(Timer **, uint64_t, _QWORD))*a1 + 3))(a1, a2, *((int *)a1 + 18));
  }
  *((_BYTE *)a1 + 40) = 1;
  IOHIDEventProcessor::returnToFreePool(a1[4], (Event *)a1);
  *((_DWORD *)a1 + 16) = 0;
}

uint64_t TapEvent::FDEnter(_DWORD *a1, uint64_t a2)
{
  uint64_t result;

  result = (*(uint64_t (**)(_DWORD *, uint64_t, _QWORD))(*(_QWORD *)a1 + 24))(a1, a2, 0);
  a1[16] = 1;
  return result;
}

void TapEvent::FUEnter(Event *a1, uint64_t a2)
{
  uint64_t v4;

  *((_QWORD *)a1 + 12) = IOHIDEventGetTimeStamp();
  IOHIDEventGetPhase();
  IOHIDEventSetPhase();
  (*(void (**)(Event *, uint64_t, uint64_t))(*(_QWORD *)a1 + 24))(a1, a2, 1);
  *((_DWORD *)a1 + 16) = 2;
  v4 = *((_QWORD *)a1 + 10);
  if (v4)
    Timer::registerEventTimeout(*((Timer **)a1 + 7), a1, v4);
  else
    (*(void (**)(Event *, uint64_t))(*(_QWORD *)a1 + 96))(a1, a2);
}

uint64_t TapEvent::SDEnter(_DWORD *a1, uint64_t a2)
{
  uint64_t result;

  result = (*(uint64_t (**)(_DWORD *, uint64_t, uint64_t))(*(_QWORD *)a1 + 24))(a1, a2, 1);
  a1[16] = 3;
  return result;
}

void TapEvent::SUEnter(Event *a1, uint64_t a2)
{
  uint64_t v4;

  *((_QWORD *)a1 + 12) = IOHIDEventGetTimeStamp();
  (*(void (**)(Event *, uint64_t, uint64_t))(*(_QWORD *)a1 + 24))(a1, a2, 2);
  *((_DWORD *)a1 + 16) = 4;
  v4 = *((_QWORD *)a1 + 11);
  if (v4)
    Timer::registerEventTimeout(*((Timer **)a1 + 7), a1, v4);
  else
    (*(void (**)(Event *, uint64_t))(*(_QWORD *)a1 + 96))(a1, a2);
}

uint64_t TapEvent::TDEnter(_DWORD *a1, uint64_t a2)
{
  uint64_t result;

  result = (*(uint64_t (**)(_DWORD *, uint64_t, uint64_t))(*(_QWORD *)a1 + 24))(a1, a2, 2);
  a1[16] = 5;
  return result;
}

uint64_t TapEvent::TUEnter(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)(a1 + 96) = IOHIDEventGetTimeStamp();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)a1 + 24))(a1, a2, 3);
  *(_DWORD *)(a1 + 64) = 6;
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)a1 + 96))(a1, a2);
}

uint64_t TapEvent::TOEnter(uint64_t a1)
{
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)a1 + 96))(a1);
}

void TapEvent::TEEnter(uint64_t a1, uint64_t a2)
{
  unsigned int v4;
  BOOL v5;
  int v6;
  const void *v8;
  const void *v9;

  v4 = *(_DWORD *)(a1 + 64);
  v5 = v4 > 5;
  v6 = (1 << v4) & 0x2A;
  if (v5 || v6 == 0)
  {
    v9 = (const void *)(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)a1 + 16))(a1, 1);
    IOHIDEventProcessor::dispatchEvent(*(_QWORD *)(a1 + 32), v9, a2 != 0);
    CFRelease(v9);
    Timer::registerEventTimeout(*(Timer **)(a1 + 56), (Event *)a1, 0);
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)a1 + 32))(a1, 0);
  }
  else
  {
    v8 = (const void *)(*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)a1 + 16))(a1, 1);
    IOHIDEventProcessor::dispatchEvent(*(_QWORD *)(a1 + 32), v8, a2 != 0);
    CFRelease(v8);
    Timer::registerEventTimeout(*(Timer **)(a1 + 56), (Event *)a1, 0);
    *(_DWORD *)(a1 + 64) = 1;
  }
}

uint64_t TapEvent::LPEnter(uint64_t result)
{
  *(_DWORD *)(result + 64) = 8;
  return result;
}

void sub_2311087DC(uint64_t a1)
{
  Timer::timeoutHandler(*(Timer **)(a1 + 32));
}

void Timer::timeoutHandler(Timer *this)
{
  NSObject *v2;

  v2 = _IOHIDLogCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    sub_231109564();
  Timer::checkEventTimeouts(this);
}

uint64_t Timer::removeEvent(uint64_t this, Event *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(_QWORD *)(this + 16);
  if (v2)
  {
    v3 = 0;
    v4 = *(_QWORD *)(this + 16);
    while (*((_DWORD *)a2 + 12) != *(_DWORD *)(v4 + 48)
         || *((_DWORD *)a2 + 13) != *(_DWORD *)(v4 + 52)
         || *((_DWORD *)a2 + 11) != *(_DWORD *)(v4 + 44))
    {
      v3 = v4;
      v4 = *(_QWORD *)(v4 + 24);
      if (!v4)
        goto LABEL_7;
    }
    if (v3)
      *(_QWORD *)(v3 + 24) = *((_QWORD *)a2 + 3);
    else
      *(_QWORD *)(this + 16) = *(_QWORD *)(v2 + 24);
  }
LABEL_7:
  *((_QWORD *)a2 + 3) = 0;
  return this;
}

uint64_t Timer::insertEvent(Timer *this, Event *a2)
{
  uint64_t result;

  result = Timer::removeEvent((uint64_t)this, a2);
  *((_QWORD *)a2 + 3) = *((_QWORD *)this + 2);
  *((_QWORD *)this + 2) = a2;
  return result;
}

void Timer::updateTimeout(Timer *this)
{
  uint64_t v2;
  _QWORD *v3;
  int64_t v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  dispatch_time_t v8;
  uint64_t v9;

  v2 = mach_absolute_time();
  v3 = (_QWORD *)*((_QWORD *)this + 2);
  if (v3)
  {
    v4 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      if (v4 >= (uint64_t)(v3[1] - (v2 - v3[12]) * dword_25414D8D0 / dword_25414D8D4 / 0x3E8))
        v4 = v3[1] - (v2 - v3[12]) * dword_25414D8D0 / dword_25414D8D4 / 0x3E8;
      v3 = (_QWORD *)v3[3];
    }
    while (v3);
  }
  else
  {
    v4 = 0x7FFFFFFFFFFFFFFFLL;
  }
  v5 = v4 & ~(v4 >> 63);
  v6 = *(NSObject **)this;
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = v6;
    v8 = -1;
    v9 = 0;
  }
  else
  {
    v8 = dispatch_time(0, 1000 * v5);
    v7 = v6;
    v9 = -1;
  }
  dispatch_source_set_timer(v7, v8, v9, 0);
}

void sub_23110899C()
{
  JUMPOUT(0x2348D1DF4);
}

void sub_2311089B4()
{
  JUMPOUT(0x2348D1DF4);
}

_QWORD *sub_2311089C8(_QWORD *a1, int a2)
{
  *a1 = &unk_24FFFF7F8;
  a1[1] = CFDictionaryCreateMutable(0, a2, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  return a1;
}

void sub_231108A18(_Unwind_Exception *a1)
{
  _QWORD *v1;

  sub_231108AA0(v1);
  _Unwind_Resume(a1);
}

void sub_231108A2C(_QWORD *a1)
{
  sub_231108AA0(a1);
  JUMPOUT(0x2348D1DF4);
}

void sub_231108A54(_QWORD *a1)
{
  sub_231108AA0(a1);
  JUMPOUT(0x2348D1DF4);
}

void sub_231108A7C(_QWORD *a1)
{
  sub_231108AA0(a1);
  JUMPOUT(0x2348D1DF4);
}

_QWORD *sub_231108AA0(_QWORD *a1)
{
  const void *v2;

  v2 = (const void *)a1[1];
  *a1 = &unk_24FFFF878;
  a1[1] = 0;
  if (v2)
    CFRelease(v2);
  return a1;
}

_QWORD *sub_231108AE0(_QWORD *a1, CFTypeRef cf, char a3)
{
  CFTypeID v6;
  CFTypeRef v7;

  if (cf)
  {
    v6 = CFGetTypeID(cf);
    if (v6 == CFDictionaryGetTypeID())
      v7 = cf;
    else
      v7 = 0;
    *a1 = &unk_24FFFF878;
    a1[1] = v7;
    if (v7 && (a3 & 1) == 0)
      CFRetain(v7);
  }
  else
  {
    a1[1] = 0;
  }
  *a1 = &unk_24FFFF858;
  return a1;
}

_QWORD *sub_231108B64(_QWORD *a1, char a2)
{
  char valuePtr;

  valuePtr = a2;
  *a1 = &unk_24FFFF898;
  a1[1] = 0;
  a1[1] = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberSInt8Type, &valuePtr);
  return a1;
}

void sub_231108BBC(_Unwind_Exception *a1)
{
  _QWORD *v1;

  sub_231108BD0(v1);
  _Unwind_Resume(a1);
}

_QWORD *sub_231108BD0(_QWORD *a1)
{
  const void *v2;

  v2 = (const void *)a1[1];
  *a1 = &unk_24FFFF8E0;
  a1[1] = 0;
  if (v2)
    CFRelease(v2);
  return a1;
}

void sub_231108C10(_QWORD *a1)
{
  sub_231108BD0(a1);
  JUMPOUT(0x2348D1DF4);
}

void sub_231108C38(_QWORD *a1)
{
  sub_231108BD0(a1);
  JUMPOUT(0x2348D1DF4);
}

_QWORD *sub_231108C5C(_QWORD *a1, uint64_t a2)
{
  uint64_t valuePtr;

  valuePtr = a2;
  *a1 = &unk_24FFFF898;
  a1[1] = 0;
  a1[1] = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberSInt64Type, &valuePtr);
  return a1;
}

void sub_231108CB4(_Unwind_Exception *a1)
{
  _QWORD *v1;

  sub_231108BD0(v1);
  _Unwind_Resume(a1);
}

void sub_231108CC8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_231108CEC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_231108CFC(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void sub_231108D10(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void sub_231108D3C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_231108D10(*MEMORY[0x24BDAC8D0]);
  sub_231108CE0();
  sub_231108CC8(&dword_231105000, v0, v1, "triple tap timeout now %llu\n", v2, v3, v4, v5, v6);
  sub_231108CD8();
}

void sub_231108D9C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_231108D10(*MEMORY[0x24BDAC8D0]);
  sub_231108CE0();
  sub_231108CC8(&dword_231105000, v0, v1, "double tap timeout now %llu\n", v2, v3, v4, v5, v6);
  sub_231108CD8();
}

void sub_231108DFC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_231108CE0();
  sub_231108CC8(&dword_231105000, v0, v1, "Tap Count %s\n", v2, v3, v4, v5, v6);
  sub_231108CD8();
}

void sub_231108E78()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_231108CE0();
  sub_231108CC8(&dword_231105000, v0, v1, "Alternate Long Press %s\n", v2, v3, v4, v5, v6);
  sub_231108CD8();
}

void sub_231108EF4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_231108D10(*MEMORY[0x24BDAC8D0]);
  sub_231108CE0();
  sub_231108CC8(&dword_231105000, v0, v1, "LongPress now %llu\n", v2, v3, v4, v5, v6);
  sub_231108CD8();
}

void sub_231108F54()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_231108D10(*MEMORY[0x24BDAC8D0]);
  sub_231108CE0();
  sub_231108CC8(&dword_231105000, v0, v1, "triplePressTimeout now %llu\n", v2, v3, v4, v5, v6);
  sub_231108CD8();
}

void sub_231108FB4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_231108D10(*MEMORY[0x24BDAC8D0]);
  sub_231108CE0();
  sub_231108CC8(&dword_231105000, v0, v1, "doublePressTimeout now %llu\n", v2, v3, v4, v5, v6);
  sub_231108CD8();
}

void sub_231109014()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_231108D10(*MEMORY[0x24BDAC8D0]);
  sub_231108CE0();
  sub_231108CC8(&dword_231105000, v0, v1, "Press Count Usage Pairs %@\n", v2, v3, v4, v5, v6);
  sub_231108CD8();
}

void sub_231109074()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_231108CE0();
  sub_231108CC8(&dword_231105000, v0, v1, "Press Count %s\n", v2, v3, v4, v5, v6);
  sub_231108CD8();
}

void sub_2311090F0(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t RegistryID;
  int v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  RegistryID = IOHIDServiceGetRegistryID();
  v6 = *(_DWORD *)(a1 + 20);
  v7 = 134218498;
  v8 = a1;
  v9 = 2112;
  v10 = RegistryID;
  v11 = 1024;
  v12 = v6;
  _os_log_debug_impl(&dword_231105000, a3, OS_LOG_TYPE_DEBUG, "(%p) for ServiceID %@ with score %d\n", (uint8_t *)&v7, 0x1Cu);
}

void sub_23110919C()
{
  os_log_t v0;
  uint8_t v1[16];

  sub_231108D30();
  _os_log_error_impl(&dword_231105000, v0, OS_LOG_TYPE_ERROR, "No more free events\n", v1, 2u);
  sub_231108D1C();
}

void sub_2311091D4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_231108D30();
  sub_231108CEC(&dword_231105000, v0, v1, "letting long press event through\n", v2, v3, v4, v5, v6);
  sub_231108D1C();
}

void sub_231109200()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_231108D30();
  sub_231108CEC(&dword_231105000, v0, v1, "terminal event detected, letting through\n", v2, v3, v4, v5, v6);
  sub_231108D1C();
}

void sub_23110922C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_231108D30();
  sub_231108CEC(&dword_231105000, v0, v1, "usage pair should not be processed, letting through\n", v2, v3, v4, v5, v6);
  sub_231108D1C();
}

void sub_231109258()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_231108CE0();
  sub_231108CC8(&dword_231105000, v0, v1, "new state = %s\n", v2, v3, v4, v5, v6);
  sub_231108CD8();
}

void sub_2311092C8(int *a1, int a2, os_log_t log)
{
  int v3;
  _DWORD v4[2];
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4[0] = 67109376;
  v4[1] = v3;
  v5 = 1024;
  v6 = a2;
  _os_log_debug_impl(&dword_231105000, log, OS_LOG_TYPE_DEBUG, "Invalid state transition: [%d][%d]\n", (uint8_t *)v4, 0xEu);
  sub_231108CD8();
}

void sub_23110934C()
{
  __int16 v0;
  uint64_t v1;
  os_log_t v2;
  const char *v3;
  const char *v4;

  sub_231108CE0();
  WORD2(v4) = 2080;
  HIWORD(v4) = v0;
  sub_231108CFC(&dword_231105000, v1, v2, "state = %s transition = %s\n", v3, v4);
  sub_231108CD8();
}

void sub_2311093D4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_231108D24();
  sub_231108CC8(&dword_231105000, v0, v1, "synchronously dispatching event = %p\n", v2, v3, v4, v5, v6);
  sub_231108CD8();
}

void sub_231109434()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_231108CE0();
  sub_231108CC8(&dword_231105000, v0, v1, "asynchronously dispatching event = %p\n", v2, v3, v4, v5, v6);
  sub_231108CD8();
}

void sub_231109498()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_231108D24();
  sub_231108CC8(&dword_231105000, v0, v1, "returning event %p to free pool\n", v2, v3, v4, v5, v6);
  sub_231108CD8();
}

void sub_2311094F8()
{
  uint64_t v0;
  os_log_t v1;
  const void *v2;
  uint64_t v3;

  sub_231108D24();
  WORD2(v3) = 2048;
  HIWORD(v3) = v0;
  sub_231108CFC(&dword_231105000, v0, v1, "registering %p for timeout in %llu uS\n", v2, v3);
  sub_231108CD8();
}

void sub_231109564()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_231108D24();
  sub_231108CC8(&dword_231105000, v0, v1, "%p timeout occurred\n", v2, v3, v4, v5, v6);
  sub_231108CD8();
}

void *__cdecl CFAllocatorAllocate(CFAllocatorRef allocator, CFIndex size, CFOptionFlags hint)
{
  return (void *)MEMORY[0x24BDBB790](allocator, size, hint);
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

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x24BDBBE18]();
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x24BDBBE68](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
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

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x24BDBC4D0](theString1, theString2, compareOptions);
}

CFUUIDRef CFUUIDCreateFromUUIDBytes(CFAllocatorRef alloc, CFUUIDBytes bytes)
{
  return (CFUUIDRef)MEMORY[0x24BDBC8E0](alloc, *(_QWORD *)&bytes.byte0, *(_QWORD *)&bytes.byte8);
}

CFUUIDRef CFUUIDGetConstantUUIDWithBytes(CFAllocatorRef alloc, UInt8 byte0, UInt8 byte1, UInt8 byte2, UInt8 byte3, UInt8 byte4, UInt8 byte5, UInt8 byte6, UInt8 byte7, UInt8 byte8, UInt8 byte9, UInt8 byte10, UInt8 byte11, UInt8 byte12, UInt8 byte13, UInt8 byte14, UInt8 byte15)
{
  return (CFUUIDRef)MEMORY[0x24BDBC8F8](alloc, byte0, byte1, byte2, byte3, byte4, byte5, byte6);
}

uint64_t IOHIDEventCreateBiometricEvent()
{
  return MEMORY[0x24BDD8168]();
}

uint64_t IOHIDEventCreateKeyboardEvent()
{
  return MEMORY[0x24BDD81D8]();
}

uint64_t IOHIDEventGetFloatValue()
{
  return MEMORY[0x24BDD8290]();
}

uint64_t IOHIDEventGetIntegerValue()
{
  return MEMORY[0x24BDD8298]();
}

uint64_t IOHIDEventGetPhase()
{
  return MEMORY[0x24BDD82A8]();
}

uint64_t IOHIDEventGetTimeStamp()
{
  return MEMORY[0x24BDD82C0]();
}

uint64_t IOHIDEventGetType()
{
  return MEMORY[0x24BDD82D0]();
}

uint64_t IOHIDEventSetIntegerValue()
{
  return MEMORY[0x24BDD8320]();
}

uint64_t IOHIDEventSetPhase()
{
  return MEMORY[0x24BDD8328]();
}

uint64_t IOHIDServiceCopyProperty()
{
  return MEMORY[0x24BDD8568]();
}

uint64_t IOHIDServiceGetRegistryID()
{
  return MEMORY[0x24BDD8578]();
}

uint64_t _IOHIDLogCategory()
{
  return MEMORY[0x24BDD8AB0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

uint64_t operator delete()
{
  return off_24FFFF450();
}

uint64_t operator new()
{
  return off_24FFFF458();
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x24BEDB910](a1);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x24BDADF10](object);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x24BDADF18](object);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x24BDADF68](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x24BDADF70](type, handle, mask, queue);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFA0](source, handler);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFB0](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x24BDADFD0](source, start, interval, leeway);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x24BDAEB30]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x24BDAEC68](info);
}

