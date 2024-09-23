CFTypeRef IOHIDEventSystemStatistics::getPropertyForClient(IOHIDEventSystemStatistics *this, CFTypeRef cf1, const void *a3)
{
  CFMutableArrayRef Mutable;
  const void *v5;
  CFTypeRef v6;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  CFTypeRef (*v11)(uint64_t, uint64_t);
  _QWORD *(*v12)(uint64_t);
  _QWORD v13[2];
  unint64_t v14;
  CFMutableDictionaryRef v15;

  if (!CFEqual(cf1, CFSTR("SessionFilterDebug")))
    return 0;
  v14 = 0xAAAAAAAAAAAAAAAALL;
  v15 = (CFMutableDictionaryRef)0xAAAAAAAAAAAAAAAALL;
  sub_23110CDEC(&v14, 0);
  CFDictionarySetValue(v15, CFSTR("Class"), CFSTR("IOHIDEventSystemStatistics"));
  if (*((_QWORD *)this + 16))
  {
    v8 = 0;
    v9 = &v8;
    v10 = 0x3802000000;
    v11 = sub_23110C67C;
    v12 = sub_23110C6C4;
    v13[0] = 0xAAAAAAAAAAAAAAAALL;
    v13[1] = 0xAAAAAAAAAAAAAAAALL;
    Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD690]);
    sub_23110CF90(v13, Mutable, 1);
    v13[0] = &unk_24FFFFED0;
    _IOHIDCFSetApplyBlock();
    v5 = (const void *)v9[6];
    if (v5)
      CFDictionarySetValue(v15, CFSTR("KeyboardServices"), v5);
    _Block_object_dispose(&v8, 8);
    sub_23110CF50(v13);
  }
  v6 = CFRetain(v15);
  sub_23110CE9C(&v14);
  return v6;
}

void sub_23110B494(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  _QWORD *v6;
  uint64_t v7;
  va_list va;

  va_start(va, a6);
  _Block_object_dispose(va, 8);
  sub_23110CF50(v6);
  sub_23110CE9C((_QWORD *)(v7 - 32));
  _Unwind_Resume(a1);
}

void IOHIDEventSystemStatistics::unregisterService(uint64_t a1, void *value)
{
  const __CFSet *v4;
  NSObject *v5;
  const __CFDictionary *v6;
  NSObject *v7;

  v4 = *(const __CFSet **)(a1 + 128);
  if (v4)
  {
    if (CFSetGetValue(v4, value))
    {
      CFSetRemoveValue(*(CFMutableSetRef *)(a1 + 128), value);
      v5 = _IOHIDLogCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
        sub_23110D1E8();
    }
  }
  v6 = *(const __CFDictionary **)(a1 + 136);
  if (v6 && CFDictionaryContainsKey(v6, value))
  {
    CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a1 + 136), value);
    v7 = _IOHIDLogCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      sub_23110D170((uint64_t)value, v7);
  }
}

uint64_t IOHIDEventSystemStatistics::filter(uint64_t a1, const void *a2, uint64_t a3)
{
  uint64_t v6;
  int IntegerValue;
  const __CFDictionary *v8;
  void *Value;
  CFTypeID v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char Phase;
  const void *v18;
  const void *v19;
  CFNumberRef v20;
  CFTypeID v21;
  _BOOL4 v22;
  const __CFNumber *v23;
  const __CFNumber *v24;
  CFTypeID v25;
  const __CFNumber *v26;
  const __CFNumber *v27;
  CFTypeID v28;
  uint64_t v29;
  unint64_t v30;
  BOOL v31;
  int v32;
  NSObject *v33;
  NSObject *v34;
  const __CFAllocator *v35;
  CFNumberRef v36;
  CFNumberRef v37;
  _QWORD valuePtr[4];
  unint64_t v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  CFRange v44;

  if (!a3 || !*(_QWORD *)(a1 + 48))
    return a3;
  if ((IOHIDEventSystemStatistics::collectKeyStats(a1, a2) & 1) != 0)
    goto LABEL_4;
  if (IOHIDEventGetType() != 3 || IOHIDEventGetIntegerValue() != 12)
  {
    if (*(const void **)(a1 + 144) != a2 || IOHIDEventGetType() != 6)
      goto LABEL_18;
    IntegerValue = IOHIDEventGetIntegerValue();
    if (IntegerValue < 1)
    {
      if ((IntegerValue & 0x80000000) == 0)
        goto LABEL_18;
      *(_DWORD *)(a1 + 116) += IntegerValue;
    }
    else
    {
      *(_DWORD *)(a1 + 112) += IntegerValue;
    }
LABEL_16:
    *(_BYTE *)(a1 + 120) = 1;
LABEL_4:
    dispatch_source_merge_data(*(dispatch_source_t *)(a1 + 48), 1uLL);
    goto LABEL_18;
  }
  if (IOHIDEventGetIntegerValue())
  {
    v6 = IOHIDEventGetIntegerValue();
    if (v6 == 48)
    {
      if (*(_QWORD *)(a1 + 24))
        ++*(_DWORD *)(a1 + 76);
      else
        ++*(_DWORD *)(a1 + 72);
      goto LABEL_4;
    }
    if (v6 == 64)
    {
      if (*(_QWORD *)(a1 + 24))
        ++*(_DWORD *)(a1 + 68);
      else
        ++*(_DWORD *)(a1 + 64);
      if (*(const void **)(a1 + 152) != a2 || !*(_QWORD *)(a1 + 144))
        goto LABEL_4;
      ++*(_DWORD *)(a1 + 108);
      goto LABEL_16;
    }
  }
LABEL_18:
  if (a2)
  {
    v8 = *(const __CFDictionary **)(a1 + 136);
    if (v8)
    {
      if (CFDictionaryContainsKey(v8, a2))
      {
        Value = (void *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 136), a2);
        v10 = CFGetTypeID(Value);
        if (v10 == CFDictionaryGetTypeID())
        {
          v11 = IOHIDEventGetTimeStampOfType()
              * (unint64_t)*(unsigned int *)(a1 + 56)
              / *(unsigned int *)(a1 + 60);
          v43 = v11;
          v12 = IOHIDEventGetIntegerValue();
          v42 = v12;
          v13 = IOHIDEventGetIntegerValue();
          v14 = IOHIDEventGetIntegerValue();
          v15 = IOHIDEventGetIntegerValue();
          v16 = IOHIDEventGetIntegerValue();
          Phase = IOHIDEventGetPhase();
          v18 = CFDictionaryGetValue((CFDictionaryRef)Value, CFSTR("MultiPressUsages"));
          if (v18)
          {
            v19 = v18;
            valuePtr[0] = v15 | (v14 << 16);
            v20 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberSInt32Type, valuePtr);
            v21 = CFGetTypeID(v19);
            if (v21 == CFArrayGetTypeID())
            {
              v44.length = CFArrayGetCount((CFArrayRef)v19);
              v44.location = 0;
              v22 = CFArrayContainsValue((CFArrayRef)v19, v44, v20) != 0;
            }
            else
            {
              v22 = 1;
            }
            CFRelease(v20);
          }
          else
          {
            v22 = 1;
          }
          if (v13 && v22 && (Phase & 4) == 0 && !v16)
          {
            v41 = 0;
            v40 = 0;
            v23 = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)Value, CFSTR("PressCount"));
            if (v23)
            {
              v24 = v23;
              v25 = CFGetTypeID(v23);
              if (v25 == CFNumberGetTypeID())
                CFNumberGetValue(v24, kCFNumberLongLongType, &v40);
            }
            v26 = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)Value, CFSTR("MultiPressTime"));
            if (v26 && (v27 = v26, v28 = CFGetTypeID(v26), v28 == CFNumberGetTypeID()))
            {
              CFNumberGetValue(v27, kCFNumberLongLongType, &v41);
              v29 = v41;
            }
            else
            {
              v29 = 0;
            }
            v30 = v11 - v29;
            if (v40)
              v31 = v29 == 0;
            else
              v31 = 1;
            v32 = !v31;
            if (v31 || v40 != v12)
            {
              if (v40 >= v12)
                v32 = 0;
              if (v32 != 1)
                goto LABEL_59;
              v34 = _IOHIDLogCategory();
              if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
                sub_23110D4BC();
            }
            else
            {
              if (v30 > 0x773593FF)
              {
LABEL_59:
                v35 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
                v36 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberLongLongType, &v42);
                v37 = CFNumberCreate(v35, kCFNumberLongLongType, &v43);
                CFDictionarySetValue((CFMutableDictionaryRef)Value, CFSTR("PressCount"), v36);
                CFDictionarySetValue((CFMutableDictionaryRef)Value, CFSTR("MultiPressTime"), v37);
                CFRelease(v36);
                CFRelease(v37);
                return a3;
              }
              v33 = _IOHIDLogCategory();
              if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
                sub_23110D458();
            }
            valuePtr[0] = 0;
            valuePtr[1] = valuePtr;
            valuePtr[2] = 0x2000000000;
            valuePtr[3] = v30;
            analytics_send_event_lazy();
            _Block_object_dispose(valuePtr, 8);
            goto LABEL_59;
          }
        }
      }
    }
  }
  return a3;
}

void sub_23110BAD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t IOHIDEventSystemStatistics::collectKeyStats(uint64_t a1, const void *a2)
{
  uint64_t result;
  int IntegerValue;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;

  if (!a2)
    return 0;
  if (!*(_QWORD *)(a1 + 128) || IOHIDEventGetType() != 3)
    return 0;
  result = IOHIDEventGetIntegerValue();
  if (result)
  {
    result = (uint64_t)CFSetGetValue(*(CFSetRef *)(a1 + 128), a2);
    if (result)
    {
      IntegerValue = (unsigned __int16)IOHIDEventGetIntegerValue();
      v6 = (unsigned __int16)IOHIDEventGetIntegerValue();
      if (IntegerValue == 7 && (v6 - 4) <= 0x19)
      {
        v7 = _IOHIDLogCategory();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
          sub_23110D350();
        ++*(_DWORD *)(a1 + 84);
        return 1;
      }
      if (IntegerValue == 7)
      {
        if ((v6 - 30) < 0xA)
        {
LABEL_18:
          v8 = _IOHIDLogCategory();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
            sub_23110D37C();
          ++*(_DWORD *)(a1 + 88);
          return 1;
        }
        if (v6 <= 0x38)
        {
          if (((1 << v6) & 0x1FBE00000000000) != 0)
            goto LABEL_18;
          if (v6 == 44)
          {
            v10 = _IOHIDLogCategory();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
              sub_23110D42C();
            ++*(_DWORD *)(a1 + 92);
            return 1;
          }
        }
        if ((v6 - 79) <= 3)
        {
          v11 = _IOHIDLogCategory();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
            sub_23110D3A8();
          ++*(_DWORD *)(a1 + 96);
          return 1;
        }
        if ((v6 - 224) > 7 || (_DWORD)v6 == 228)
        {
          result = 1;
          if (v6 <= 0x39 && ((1 << v6) & 0x2000D0000000000) != 0)
          {
            v12 = _IOHIDLogCategory();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
              sub_23110D3D4();
            ++*(_DWORD *)(a1 + 100);
            return 1;
          }
          return result;
        }
      }
      else
      {
        result = 1;
        if (IntegerValue != 12 || (_DWORD)v6 != 669)
          return result;
      }
      v9 = _IOHIDLogCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        sub_23110D400();
      ++*(_DWORD *)(a1 + 104);
      return 1;
    }
  }
  return result;
}

void IOHIDEventSystemStatistics::registerKeyboardService(uint64_t a1, const void *a2)
{
  const __CFNumber *Property;
  const __CFNumber *v5;
  CFTypeID v6;
  const void *v7;
  const void *v8;
  CFTypeID v9;
  __CFSet *v10;
  NSObject *v11;
  int valuePtr;

  if (IOHIDServiceConformsTo())
  {
    valuePtr = 0;
    Property = (const __CFNumber *)IOHIDServiceGetProperty();
    if (Property)
    {
      v5 = Property;
      v6 = CFGetTypeID(Property);
      if (v6 == CFNumberGetTypeID())
      {
        CFNumberGetValue(v5, kCFNumberIntType, &valuePtr);
        if (valuePtr == 1452)
        {
          v7 = (const void *)IOHIDServiceGetProperty();
          if (v7)
          {
            v8 = v7;
            v9 = CFGetTypeID(v7);
            if (v9 == CFStringGetTypeID())
            {
              if (CFEqual(v8, CFSTR("AID")))
              {
                ++*(_DWORD *)(a1 + 80);
                v10 = *(__CFSet **)(a1 + 128);
                if (v10)
                  CFSetAddValue(v10, a2);
                v11 = _IOHIDLogCategory();
                if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
                  sub_23110D05C();
              }
            }
          }
        }
      }
    }
  }
}

void IOHIDEventSystemStatistics::registerMultiPressService(uint64_t a1, const void *a2)
{
  const void *Property;
  const void *v5;
  CFTypeID v6;
  CFTypeID v7;
  CFMutableDictionaryRef Mutable;
  __CFDictionary *v9;
  const void *v10;
  NSObject *v11;
  uint64_t valuePtr;

  Property = (const void *)IOHIDServiceGetProperty();
  if (Property)
  {
    v5 = Property;
    v6 = CFGetTypeID(Property);
    if (v6 == CFBooleanGetTypeID())
    {
      if (v5 != (const void *)*MEMORY[0x24BDBD270])
        return;
    }
    else
    {
      v7 = CFGetTypeID(v5);
      if (v7 != CFNumberGetTypeID())
        return;
      valuePtr = 0;
      CFNumberGetValue((CFNumberRef)v5, kCFNumberLongLongType, &valuePtr);
      if (!valuePtr)
        return;
    }
    if (*(_QWORD *)(a1 + 136))
    {
      Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
      if (Mutable)
      {
        v9 = Mutable;
        v10 = (const void *)IOHIDServiceGetProperty();
        if (v10)
          CFDictionarySetValue(v9, CFSTR("MultiPressUsages"), v10);
        CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 136), a2, v9);
        v11 = _IOHIDLogCategory();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          sub_23110D088((uint64_t)a2, (uint64_t)v10, v11);
        CFRelease(v9);
      }
    }
  }
}

IOHIDEventSystemStatistics *IOHIDEventSystemStatisticsFactory(uint64_t a1, const void *a2)
{
  const __CFAllocator *v3;
  CFUUIDRef v4;
  IOHIDEventSystemStatistics *v5;
  CFUUIDRef v6;

  v3 = (const __CFAllocator *)*MEMORY[0x24BDBD260];
  v4 = CFUUIDGetConstantUUIDWithBytes((CFAllocatorRef)*MEMORY[0x24BDBD260], 0x7Fu, 0x1Au, 0x3Au, 0xE6u, 0x3Eu, 0x3Du, 0x47u, 0xAu, 0xBDu, 0x15u, 0xA2u, 0xDDu, 0x7Eu, 0x1Bu, 0xB7u, 0x19u);
  if (!CFEqual(a2, v4))
    return 0;
  v5 = (IOHIDEventSystemStatistics *)CFAllocatorAllocate((CFAllocatorRef)*MEMORY[0x24BDBD240], 168, 0);
  v6 = CFUUIDGetConstantUUIDWithBytes(v3, 7u, 0x2Bu, 0xC0u, 0x77u, 0xE9u, 0x84u, 0x4Cu, 0x2Au, 0xBBu, 0x72u, 0xD4u, 0x76u, 0x9Cu, 0xE4u, 0x4Fu, 0xAFu);
  IOHIDEventSystemStatistics::IOHIDEventSystemStatistics(v5, v6);
  return v5;
}

uint64_t IOHIDEventSystemStatistics::AddRef(IOHIDEventSystemStatistics *this, void *a2)
{
  uint64_t v2;

  v2 = (*((_DWORD *)this + 4) + 1);
  *((_DWORD *)this + 4) = v2;
  return v2;
}

void IOHIDEventSystemStatistics::IOHIDEventSystemStatistics(IOHIDEventSystemStatistics *this, CFTypeRef cf)
{
  *(_QWORD *)this = &IOHIDEventSystemStatistics::sIOHIDEventSystemStatisticsFtbl;
  *((_QWORD *)this + 1) = CFRetain(cf);
  *((_DWORD *)this + 4) = 1;
  *((_QWORD *)this + 3) = 1;
  *((_DWORD *)this + 8) = 0;
  *((_QWORD *)this + 16) = 0;
  *((_QWORD *)this + 5) = 0;
  *((_QWORD *)this + 6) = 0;
  bzero((char *)this + 64, 0x10uLL);
  bzero((char *)this + 80, 0x1CuLL);
  bzero((char *)this + 108, 0x10uLL);
  CFPlugInAddInstanceForFactory((CFUUIDRef)cf);
}

void IOHIDEventSystemStatistics::~IOHIDEventSystemStatistics(CFUUIDRef *this)
{
  CFPlugInRemoveInstanceForFactory(this[1]);
  CFRelease(this[1]);
}

void sub_23110C1B0(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

uint64_t IOHIDEventSystemStatistics::QueryInterface(IOHIDEventSystemStatistics *this, CFUUIDBytes a2, void **a3)
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

uint64_t IOHIDEventSystemStatistics::AddRef(IOHIDEventSystemStatistics *this)
{
  uint64_t v1;

  v1 = (*((_DWORD *)this + 4) + 1);
  *((_DWORD *)this + 4) = v1;
  return v1;
}

uint64_t IOHIDEventSystemStatistics::Release(IOHIDEventSystemStatistics *this)
{
  int v1;
  uint64_t v2;

  v1 = *((_DWORD *)this + 4);
  v2 = (v1 - 1);
  *((_DWORD *)this + 4) = v2;
  if (v1 == 1)
  {
    IOHIDEventSystemStatistics::~IOHIDEventSystemStatistics((CFUUIDRef *)this);
    MEMORY[0x2348D20C8]();
  }
  return v2;
}

BOOL IOHIDEventSystemStatistics::open(uint64_t a1)
{
  const __CFAllocator *v2;

  v2 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  *(_QWORD *)(a1 + 128) = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6B8]);
  *(_QWORD *)(a1 + 160) = IOHIDEventCreateKeyboardEvent();
  *(_QWORD *)(a1 + 136) = CFDictionaryCreateMutable(v2, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  mach_timebase_info((mach_timebase_info_t)(a1 + 56));
  return *(_QWORD *)(a1 + 128) && *(_QWORD *)(a1 + 160) && *(_QWORD *)(a1 + 136) != 0;
}

void IOHIDEventSystemStatistics::close(_QWORD *a1)
{
  const void *v2;
  const void *v3;
  const void *v4;

  v2 = (const void *)a1[16];
  if (v2)
  {
    CFRelease(v2);
    a1[16] = 0;
  }
  v3 = (const void *)a1[20];
  if (v3)
  {
    CFRelease(v3);
    a1[20] = 0;
  }
  v4 = (const void *)a1[17];
  if (v4)
  {
    CFRelease(v4);
    a1[17] = 0;
  }
}

void IOHIDEventSystemStatistics::registerService(uint64_t a1, const void *a2)
{
  IOHIDEventSystemStatistics::registerKeyboardService(a1, a2);
  IOHIDEventSystemStatistics::registerMultiPressService(a1, a2);
  IOHIDEventSystemStatistics::registerCrownService(a1, (uint64_t)a2);
  IOHIDEventSystemStatistics::registerButtonService(a1, (uint64_t)a2);
}

void IOHIDEventSystemStatistics::registerCrownService(uint64_t a1, uint64_t a2)
{
  NSObject *v4;

  if (IOHIDServiceConformsTo())
  {
    *(_QWORD *)(a1 + 144) = a2;
    v4 = _IOHIDLogCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      sub_23110D118();
  }
}

void IOHIDEventSystemStatistics::registerButtonService(uint64_t a1, uint64_t a2)
{
  NSObject *v4;

  if (IOHIDServiceConformsTo())
  {
    *(_QWORD *)(a1 + 152) = a2;
    v4 = _IOHIDLogCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      sub_23110D144();
  }
}

uint64_t IOHIDEventSystemStatistics::scheduleWithDispatchQueue(uint64_t this, dispatch_queue_s *a2)
{
  uint64_t v2;
  NSObject *global_queue;
  NSObject *v4;
  NSObject *v5;
  _QWORD handler[5];

  *(_QWORD *)(this + 40) = a2;
  if (a2)
  {
    v2 = this;
    global_queue = dispatch_get_global_queue(-2, 0);
    v4 = dispatch_source_create(MEMORY[0x24BDAC9C8], 0, 0, global_queue);
    *(_QWORD *)(v2 + 48) = v4;
    dispatch_set_context(v4, (void *)v2);
    dispatch_source_set_event_handler_f(*(dispatch_source_t *)(v2 + 48), (dispatch_function_t)IOHIDEventSystemStatistics::handlePendingStats);
    dispatch_resume(*(dispatch_object_t *)(v2 + 48));
    v5 = *(NSObject **)(v2 + 40);
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 0x40000000;
    handler[2] = sub_23110C62C;
    handler[3] = &unk_24FFFFD08;
    handler[4] = v2;
    return notify_register_dispatch("com.apple.iokit.hid.displayStatus", (int *)(v2 + 32), v5, handler);
  }
  return this;
}

uint64_t sub_23110C62C(uint64_t a1)
{
  return notify_get_state(*(_DWORD *)(*(_QWORD *)(a1 + 32) + 32), (uint64_t *)(*(_QWORD *)(a1 + 32) + 24));
}

void IOHIDEventSystemStatistics::unscheduleFromDispatchQueue(IOHIDEventSystemStatistics *this, dispatch_queue_s *a2)
{
  NSObject *v3;

  if (*((dispatch_queue_s **)this + 5) == a2)
  {
    v3 = *((_QWORD *)this + 6);
    if (v3)
    {
      dispatch_source_cancel(v3);
      dispatch_release(*((dispatch_object_t *)this + 6));
      *((_QWORD *)this + 6) = 0;
    }
  }
}

CFTypeRef sub_23110C67C(uint64_t a1, uint64_t a2)
{
  CFTypeRef result;

  result = *(CFTypeRef *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = &unk_24FFFFF50;
  *(_QWORD *)(a1 + 48) = result;
  if (result)
    result = CFRetain(result);
  *(_QWORD *)(a1 + 40) = &unk_24FFFFED0;
  return result;
}

_QWORD *sub_23110C6C4(uint64_t a1)
{
  return sub_23110CF50((_QWORD *)(a1 + 40));
}

void sub_23110C6D0(uint64_t a1)
{
  uint64_t v1;
  const void *RegistryID;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  RegistryID = (const void *)IOHIDServiceGetRegistryID();
  CFArrayAppendValue(*(CFMutableArrayRef *)(v1 + 48), RegistryID);
}

void IOHIDEventSystemStatistics::handlePendingStats(IOHIDEventSystemStatistics *this)
{
  NSObject *v2;
  NSObject *v3;
  NSObject *v4;
  _QWORD block[8];
  _QWORD v6[2];
  uint64_t v7;
  _QWORD v8[6];
  uint64_t v9;
  _QWORD v10[7];
  int v11;
  _QWORD v12[7];

  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3802000000;
  v12[3] = sub_23110C980;
  v12[4] = nullsub_1;
  v12[5] = 0;
  v12[6] = 0;
  v9 = 0;
  v10[0] = &v9;
  v10[1] = 0x4802000000;
  v10[2] = sub_23110C990;
  v10[3] = nullsub_2;
  memset(&v10[4], 0, 24);
  v11 = 0;
  v7 = 0;
  v8[0] = &v7;
  v8[1] = 0x3802000000;
  v8[2] = sub_23110C9A8;
  v8[3] = nullsub_3;
  v8[4] = 0;
  v8[5] = 0;
  v6[0] = 0xAAAAAAAAAAAAAAAALL;
  v6[1] = 0xAAAAAAAAAAAAAAAALL;
  sub_23110CDEC(v6, 0);
  v2 = *((_QWORD *)this + 5);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = sub_23110C9B8;
  block[3] = &unk_24FFFFD58;
  block[4] = v12;
  block[5] = &v9;
  block[6] = &v7;
  block[7] = this;
  dispatch_sync(v2, block);
  analytics_send_event_lazy();
  v3 = _IOHIDLogCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    sub_23110D2A4((uint64_t)v10, v3);
  analytics_send_event_lazy();
  if (*(_BYTE *)(v8[0] + 52))
  {
    v4 = _IOHIDLogCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      sub_23110D214((uint64_t)v8, v4);
    analytics_send_event_lazy();
  }
  sub_23110CE9C(v6);
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(v12, 8);
}

void sub_23110C938(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
  uint64_t v34;

  sub_23110CE9C(&a32);
  _Block_object_dispose(&a34, 8);
  _Block_object_dispose((const void *)(v34 - 192), 8);
  _Block_object_dispose((const void *)(v34 - 120), 8);
  _Unwind_Resume(a1);
}

__n128 sub_23110C980(uint64_t a1, uint64_t a2)
{
  __n128 result;

  result = *(__n128 *)(a2 + 40);
  *(__n128 *)(a1 + 40) = result;
  return result;
}

__n128 sub_23110C990(uint64_t a1, uint64_t a2)
{
  __n128 result;

  result = *(__n128 *)(a2 + 40);
  *(_OWORD *)(a1 + 52) = *(_OWORD *)(a2 + 52);
  *(__n128 *)(a1 + 40) = result;
  return result;
}

__n128 sub_23110C9A8(uint64_t a1, uint64_t a2)
{
  __n128 result;

  result = *(__n128 *)(a2 + 40);
  *(__n128 *)(a1 + 40) = result;
  return result;
}

void sub_23110C9B8(_QWORD *a1)
{
  _OWORD *v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;

  v2 = (_OWORD *)a1[7];
  *(_OWORD *)(*(_QWORD *)(a1[4] + 8) + 40) = v2[4];
  bzero(v2 + 4, 0x10uLL);
  v3 = *(_QWORD *)(a1[5] + 8);
  v4 = v2[5];
  v5 = *((_QWORD *)v2 + 12);
  *(_DWORD *)(v3 + 64) = *((_DWORD *)v2 + 26);
  *(_QWORD *)(v3 + 56) = v5;
  *(_OWORD *)(v3 + 40) = v4;
  bzero(v2 + 5, 0x1CuLL);
  *(_OWORD *)(*(_QWORD *)(a1[6] + 8) + 40) = *(_OWORD *)((char *)v2 + 108);
  bzero((char *)v2 + 108, 0x10uLL);
}

xpc_object_t sub_23110CA38(uint64_t a1)
{
  xpc_object_t v2;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "homeButtonWakeCount", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
  xpc_dictionary_set_uint64(v2, "homeButtonActionCount", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 44));
  xpc_dictionary_set_uint64(v2, "powerButtonWakeCount", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48));
  xpc_dictionary_set_uint64(v2, "powerButtonSleepCount", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 52));
  return v2;
}

xpc_object_t sub_23110CAD8(uint64_t a1)
{
  xpc_object_t v2;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "enumerationCount", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
  xpc_dictionary_set_uint64(v2, "characterKeyCount", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 44));
  xpc_dictionary_set_uint64(v2, "symbolKeyCount", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48));
  xpc_dictionary_set_uint64(v2, "spacebarKeyCount", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 52));
  xpc_dictionary_set_uint64(v2, "arrowKeyCount", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 56));
  xpc_dictionary_set_uint64(v2, "cursorKeyCount", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 60));
  xpc_dictionary_set_uint64(v2, "modifierKeyCount", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 64));
  return v2;
}

xpc_object_t sub_23110CBCC(uint64_t a1)
{
  xpc_object_t v2;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "clockwiseRotation", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 44));
  xpc_dictionary_set_int64(v2, "counterclockwiseRotation", *(int *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 48));
  xpc_dictionary_set_uint64(v2, "pressCount", *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));
  return v2;
}

BOOL IOHIDEventSystemStatistics::isCharacterKey(IOHIDEventSystemStatistics *this, int a2)
{
  return (_DWORD)this == 7 && (a2 - 4) < 0x1A;
}

uint64_t IOHIDEventSystemStatistics::isSymbolKey(IOHIDEventSystemStatistics *this, unsigned int a2)
{
  unint64_t v2;
  unsigned int v3;

  v2 = (0x1FBE00000000000uLL >> a2) & 1;
  if (a2 > 0x38)
    LODWORD(v2) = 0;
  if (a2 - 30 >= 0xA)
    v3 = v2;
  else
    v3 = 1;
  if ((_DWORD)this == 7)
    return v3;
  else
    return 0;
}

BOOL IOHIDEventSystemStatistics::isSpacebarKey(IOHIDEventSystemStatistics *this, int a2)
{
  return (_DWORD)this == 7 && a2 == 44;
}

BOOL IOHIDEventSystemStatistics::isArrowKey(IOHIDEventSystemStatistics *this, int a2)
{
  return (_DWORD)this == 7 && (a2 - 79) < 4;
}

uint64_t IOHIDEventSystemStatistics::isCursorKey(IOHIDEventSystemStatistics *this, unsigned int a2)
{
  unint64_t v2;

  v2 = (0x2000D0000000000uLL >> a2) & 1;
  if (a2 > 0x39)
    LODWORD(v2) = 0;
  if ((_DWORD)this == 7)
    return v2;
  else
    return 0;
}

uint64_t IOHIDEventSystemStatistics::isModifierKey(IOHIDEventSystemStatistics *this, int a2)
{
  unsigned int v3;

  if ((_DWORD)this == 12 && a2 == 669)
    return 1;
  v3 = (0xEFu >> (a2 + 32)) & 1;
  if ((unsigned __int16)(a2 - 224) > 7u)
    v3 = 0;
  if ((_DWORD)this == 7)
    return v3;
  else
    return 0;
}

xpc_object_t sub_23110CD24(uint64_t a1)
{
  xpc_object_t v2;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "PressFailureTime", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) / 0xF4240uLL);
  return v2;
}

xpc_object_t sub_23110CD88(uint64_t a1)
{
  xpc_object_t v2;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "PressSuccessTime", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) / 0xF4240uLL);
  return v2;
}

_QWORD *sub_23110CDEC(_QWORD *a1, int a2)
{
  *a1 = &unk_24FFFFE50;
  a1[1] = CFDictionaryCreateMutable(0, a2, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  return a1;
}

void sub_23110CE3C(_Unwind_Exception *a1)
{
  _QWORD *v1;

  sub_23110CE9C(v1);
  _Unwind_Resume(a1);
}

void sub_23110CE50(_QWORD *a1)
{
  sub_23110CE9C(a1);
  JUMPOUT(0x2348D20C8);
}

void sub_23110CE78(_QWORD *a1)
{
  sub_23110CE9C(a1);
  JUMPOUT(0x2348D20C8);
}

_QWORD *sub_23110CE9C(_QWORD *a1)
{
  const void *v2;

  v2 = (const void *)a1[1];
  *a1 = &unk_24FFFFEB0;
  a1[1] = 0;
  if (v2)
    CFRelease(v2);
  return a1;
}

void sub_23110CEDC(_QWORD *a1)
{
  sub_23110CF50(a1);
  JUMPOUT(0x2348D20C8);
}

void sub_23110CF04(_QWORD *a1)
{
  sub_23110CF50(a1);
  JUMPOUT(0x2348D20C8);
}

void sub_23110CF2C(_QWORD *a1)
{
  sub_23110CF50(a1);
  JUMPOUT(0x2348D20C8);
}

_QWORD *sub_23110CF50(_QWORD *a1)
{
  const void *v2;

  v2 = (const void *)a1[1];
  *a1 = &unk_24FFFFF50;
  a1[1] = 0;
  if (v2)
    CFRelease(v2);
  return a1;
}

_QWORD *sub_23110CF90(_QWORD *a1, CFTypeRef cf, char a3)
{
  CFTypeID v6;
  CFTypeRef v7;

  if (cf)
  {
    v6 = CFGetTypeID(cf);
    if (v6 == CFArrayGetTypeID())
      v7 = cf;
    else
      v7 = 0;
    *a1 = &unk_24FFFFF50;
    a1[1] = v7;
    if (v7 && (a3 & 1) == 0)
      CFRetain(v7);
  }
  else
  {
    a1[1] = 0;
  }
  *a1 = &unk_24FFFFF30;
  return a1;
}

void sub_23110D010(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_23110D034(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void sub_23110D05C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_23110D028();
  sub_23110D010(&dword_23110A000, v0, v1, "Apple Keyboard registered\n", v2, v3, v4, v5, v6);
  sub_23110D020();
}

void sub_23110D088(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint8_t v5[12];
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  IOHIDServiceGetRegistryID();
  sub_23110D050();
  v6 = 2112;
  v7 = a2;
  _os_log_debug_impl(&dword_23110A000, a3, OS_LOG_TYPE_DEBUG, "Added MultiPress Analytics for service:%@ %@\n", v5, 0x16u);
  sub_23110D040();
}

void sub_23110D118()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_23110D028();
  sub_23110D010(&dword_23110A000, v0, v1, "Crown service registered\n", v2, v3, v4, v5, v6);
  sub_23110D020();
}

void sub_23110D144()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_23110D028();
  sub_23110D010(&dword_23110A000, v0, v1, "Button service registered\n", v2, v3, v4, v5, v6);
  sub_23110D020();
}

void sub_23110D170(uint64_t a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  IOHIDServiceGetRegistryID();
  sub_23110D050();
  sub_23110D034(&dword_23110A000, a2, v3, "MultiPress service removed: %@\n", v4);
  sub_23110D040();
}

void sub_23110D1E8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_23110D028();
  sub_23110D010(&dword_23110A000, v0, v1, "Apple Keyboard unregistered\n", v2, v3, v4, v5, v6);
  sub_23110D020();
}

void sub_23110D214(uint64_t a1, NSObject *a2)
{
  int v2;
  int v3;
  int v4;
  _DWORD v5[2];
  __int16 v6;
  int v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = *(_DWORD *)(*(_QWORD *)a1 + 44);
  v2 = *(_DWORD *)(*(_QWORD *)a1 + 48);
  v4 = *(_DWORD *)(*(_QWORD *)a1 + 40);
  v5[0] = 67109632;
  v5[1] = v3;
  v6 = 1024;
  v7 = v2;
  v8 = 1024;
  v9 = v4;
  _os_log_debug_impl(&dword_23110A000, a2, OS_LOG_TYPE_DEBUG, "Crown stats clockwise rotation: %d counterclockwise rotation: %d press count: %d\n", (uint8_t *)v5, 0x14u);
  sub_23110D048();
}

void sub_23110D2A4(uint64_t a1, NSObject *a2)
{
  int v2;
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  _DWORD v8[2];
  __int16 v9;
  int v10;
  __int16 v11;
  int v12;
  __int16 v13;
  int v14;
  __int16 v15;
  int v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v2 = *(_DWORD *)(*(_QWORD *)a1 + 44);
  v3 = *(_DWORD *)(*(_QWORD *)a1 + 48);
  v4 = *(_DWORD *)(*(_QWORD *)a1 + 52);
  v5 = *(_DWORD *)(*(_QWORD *)a1 + 56);
  v7 = *(_DWORD *)(*(_QWORD *)a1 + 60);
  v6 = *(_DWORD *)(*(_QWORD *)a1 + 64);
  v8[0] = 67110400;
  v8[1] = v2;
  v9 = 1024;
  v10 = v3;
  v11 = 1024;
  v12 = v4;
  v13 = 1024;
  v14 = v5;
  v15 = 1024;
  v16 = v7;
  v17 = 1024;
  v18 = v6;
  _os_log_debug_impl(&dword_23110A000, a2, OS_LOG_TYPE_DEBUG, "Apple Keyboard char: %d symbol: %d spacebar: %d arrow: %d cursor: %d modifier: %d \n", (uint8_t *)v8, 0x26u);
  sub_23110D040();
}

void sub_23110D350()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_23110D028();
  sub_23110D010(&dword_23110A000, v0, v1, "Apple Keyboard character key\n", v2, v3, v4, v5, v6);
  sub_23110D020();
}

void sub_23110D37C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_23110D028();
  sub_23110D010(&dword_23110A000, v0, v1, "Apple Keyboard symbol key\n", v2, v3, v4, v5, v6);
  sub_23110D020();
}

void sub_23110D3A8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_23110D028();
  sub_23110D010(&dword_23110A000, v0, v1, "Apple Keyboard arrow key\n", v2, v3, v4, v5, v6);
  sub_23110D020();
}

void sub_23110D3D4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_23110D028();
  sub_23110D010(&dword_23110A000, v0, v1, "Apple Keyboard cursor key\n", v2, v3, v4, v5, v6);
  sub_23110D020();
}

void sub_23110D400()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_23110D028();
  sub_23110D010(&dword_23110A000, v0, v1, "Apple Keyboard modifier key\n", v2, v3, v4, v5, v6);
  sub_23110D020();
}

void sub_23110D42C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_23110D028();
  sub_23110D010(&dword_23110A000, v0, v1, "Apple Keyboard spacebar key\n", v2, v3, v4, v5, v6);
  sub_23110D020();
}

void sub_23110D458()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  sub_23110D050();
  sub_23110D034(&dword_23110A000, v0, v1, "PressInterval Failed: %llu\n", v2);
  sub_23110D048();
}

void sub_23110D4BC()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  sub_23110D050();
  sub_23110D034(&dword_23110A000, v0, v1, "PressInterval Success: %llu\n", v2);
  sub_23110D048();
}

void *__cdecl CFAllocatorAllocate(CFAllocatorRef allocator, CFIndex size, CFOptionFlags hint)
{
  return (void *)MEMORY[0x24BDBB790](allocator, size, hint);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x24BDBB7C8](theArray, value);
}

Boolean CFArrayContainsValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x24BDBB7E8](theArray, range.location, range.length, value);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x24BDBB808](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB820](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x24BDBB850]();
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x24BDBBA18]();
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x24BDBBDC0](theDict, key);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x24BDBBE18]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
  MEMORY[0x24BDBBE48](theDict, key);
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

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x24BDBC118]();
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

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
  MEMORY[0x24BDBC3C0](theSet, value);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x24BDBC3E8](allocator, capacity, callBacks);
}

const void *__cdecl CFSetGetValue(CFSetRef theSet, const void *value)
{
  return (const void *)MEMORY[0x24BDBC408](theSet, value);
}

void CFSetRemoveValue(CFMutableSetRef theSet, const void *value)
{
  MEMORY[0x24BDBC428](theSet, value);
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

uint64_t IOHIDEventCreateKeyboardEvent()
{
  return MEMORY[0x24BDD81D8]();
}

uint64_t IOHIDEventGetIntegerValue()
{
  return MEMORY[0x24BDD8298]();
}

uint64_t IOHIDEventGetPhase()
{
  return MEMORY[0x24BDD82A8]();
}

uint64_t IOHIDEventGetTimeStampOfType()
{
  return MEMORY[0x24BDD82C8]();
}

uint64_t IOHIDEventGetType()
{
  return MEMORY[0x24BDD82D0]();
}

uint64_t IOHIDServiceConformsTo()
{
  return MEMORY[0x24BDD8560]();
}

uint64_t IOHIDServiceGetProperty()
{
  return MEMORY[0x24BDD8570]();
}

uint64_t IOHIDServiceGetRegistryID()
{
  return MEMORY[0x24BDD8578]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _IOHIDCFSetApplyBlock()
{
  return MEMORY[0x24BDD8A50]();
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
  return off_24FFFFC08();
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x24BEDB910](a1);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t analytics_send_event_lazy()
{
  return MEMORY[0x24BE1A1F8]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x24BDADF10](object);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x24BDADF18](object);
}

void dispatch_set_context(dispatch_object_t object, void *context)
{
  MEMORY[0x24BDADF40](object, context);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x24BDADF68](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x24BDADF70](type, handle, mask, queue);
}

void dispatch_source_merge_data(dispatch_source_t source, uintptr_t value)
{
  MEMORY[0x24BDADF98](source, value);
}

void dispatch_source_set_event_handler_f(dispatch_source_t source, dispatch_function_t handler)
{
  MEMORY[0x24BDADFB8](source, handler);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x24BDAEC68](info);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x24BDAF148](*(_QWORD *)&token, state64);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x24BDAF170](name, out_token, queue, handler);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x24BDB08C0](keys, values, count);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x24BDB09A8](xdict, key, value);
}

