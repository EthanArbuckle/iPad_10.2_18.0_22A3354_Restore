CFTypeRef IOHIDT8027USBSessionFilter::getPropertyForClient(IOHIDT8027USBSessionFilter *this, CFTypeRef cf1, const void *a3)
{
  CFTypeRef v4;
  unint64_t v6;
  CFTypeRef cf;

  if (!CFEqual(cf1, CFSTR("SessionFilterDebug")))
    return 0;
  v6 = 0xAAAAAAAAAAAAAAAALL;
  cf = (CFTypeRef)0xAAAAAAAAAAAAAAAALL;
  sub_231126EE4(&v6, 0);
  IOHIDT8027USBSessionFilter::serialize(this, (__CFDictionary *)cf);
  if (cf)
    v4 = CFRetain(cf);
  else
    v4 = 0;
  sub_231126FBC(&v6);
  return v4;
}

void sub_231125AA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  sub_231126FBC(&a9);
  _Unwind_Resume(a1);
}

_QWORD *IOHIDT8027USBSessionFilter::registerService(uint64_t a1, const void *a2)
{
  BOOL v4;
  const void *v5;
  const void *v6;
  CFTypeID v7;
  const __CFString *v8;
  NSObject *v9;
  uint64_t v10;
  NSObject *v12;
  unint64_t v13;
  unint64_t v14;
  uint8_t buf[4];
  const __CFString *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v13 = 0xAAAAAAAAAAAAAAAALL;
  v14 = 0xAAAAAAAAAAAAAAAALL;
  sub_23112607C(&v13, "Transport");
  if (*(_QWORD *)(a1 + 56))
    v4 = v14 == 0;
  else
    v4 = 1;
  if (!v4
    && (IOHIDServiceConformsTo()
     || IOHIDServiceConformsTo()
     || IOHIDServiceConformsTo()))
  {
    v5 = (const void *)IOHIDServiceCopyProperty();
    v6 = v5;
    if (v5)
    {
      v7 = CFGetTypeID(v5);
      if (v7 == CFStringGetTypeID() && CFEqual(v6, CFSTR("USB")))
      {
        CFSetSetValue(*(CFMutableSetRef *)(a1 + 56), a2);
        if (*(_BYTE *)(a1 + 86))
        {
          v12 = _IOHIDLogCategory();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_231125000, v12, OS_LOG_TYPE_DEFAULT, "T8027 assertion previously timed out, not taking assertion\n", buf, 2u);
          }
        }
        else if (*(_BYTE *)(a1 + 84))
        {
          v8 = sub_2311264A0();
          v9 = _IOHIDLogCategory();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            v10 = *(_QWORD *)(a1 + 72);
            *(_DWORD *)buf = 138412546;
            v16 = v8;
            v17 = 2048;
            v18 = v10;
            _os_log_impl(&dword_231125000, v9, OS_LOG_TYPE_DEFAULT, "Creating T8027USB assertion for %@ (timeout:%llus)\n", buf, 0x16u);
          }
          IOHIDT8027USBSessionFilter::preventIdleSleepAssertion((IOHIDT8027USBSessionFilter *)a1, v8);
          if (v8)
            CFRelease(v8);
        }
      }
      CFRelease(v6);
    }
  }
  return sub_23112603C(&v13);
}

void sub_231125CB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  sub_23112603C(&a9);
  _Unwind_Resume(a1);
}

void IOHIDT8027USBSessionFilter::setPropertyForClient(IOHIDT8027USBSessionFilter *this, CFTypeRef cf1, const __CFString *a3, const void *a4)
{
  NSObject *v7;
  const __CFString *v8;
  const __CFString *v9;
  CFTypeID v10;
  NSObject *v11;
  const __CFString *v12;
  unint64_t valuePtr;
  uint8_t buf[4];
  const __CFString *v15;
  __int16 v16;
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (CFEqual(cf1, CFSTR("T8027USBAssertionTimeout")))
  {
    valuePtr = 0xAAAAAAAAAAAAAAAALL;
    v7 = _IOHIDLogCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (const __CFString *)*((_QWORD *)this + 9);
      v9 = &stru_250002A70;
      if (a3)
        v9 = a3;
      *(_DWORD *)buf = 134218242;
      v15 = v8;
      v16 = 2112;
      v17 = v9;
      _os_log_impl(&dword_231125000, v7, OS_LOG_TYPE_DEFAULT, "Setting T8027 USB assertion timeout from %llu to %@\n", buf, 0x16u);
    }
    if (a3)
    {
      v10 = CFGetTypeID(a3);
      if (v10 == CFNumberGetTypeID())
      {
        CFNumberGetValue((CFNumberRef)a3, kCFNumberSInt64Type, &valuePtr);
        *((_QWORD *)this + 9) = valuePtr;
      }
    }
  }
  else if (CFEqual(cf1, CFSTR("T8027USBSetAssertion")))
  {
    v11 = _IOHIDLogCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = &stru_250002A70;
      if (a3)
        v12 = a3;
      *(_DWORD *)buf = 138412290;
      v15 = v12;
      _os_log_impl(&dword_231125000, v11, OS_LOG_TYPE_DEFAULT, "Setting T8027 USB assertion state %@\n", buf, 0xCu);
    }
    if ((const __CFString *)*MEMORY[0x24BDBD270] == a3)
    {
      IOHIDT8027USBSessionFilter::preventIdleSleepAssertion(this, CFSTR("SetProperty"));
    }
    else if (*((_DWORD *)this + 20))
    {
      IOHIDT8027USBSessionFilter::releaseIdleSleepAssertion(this);
    }
  }
}

uint64_t IOHIDT8027USBSessionFilter::filter(uint64_t a1, const void *a2, uint64_t a3)
{
  BOOL v4;
  BOOL v5;
  const __CFString *v8;
  NSObject *v9;
  uint8_t v11[16];

  if (*(_QWORD *)(a1 + 56))
    v4 = a2 == 0;
  else
    v4 = 1;
  v5 = v4 || a3 == 0;
  if (!v5
    && IOHIDEventConformsTo()
    && IOHIDEventGetIntegerValue()
    && CFSetContainsValue(*(CFSetRef *)(a1 + 56), a2)
    && *(_BYTE *)(a1 + 84))
  {
    v8 = sub_2311264A0();
    v9 = _IOHIDLogCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_231125000, v9, OS_LOG_TYPE_INFO, "T8027USB HID activity\n", v11, 2u);
    }
    IOHIDT8027USBSessionFilter::preventIdleSleepAssertion((IOHIDT8027USBSessionFilter *)a1, v8);
    *(_BYTE *)(a1 + 86) = 0;
    if (v8)
      CFRelease(v8);
  }
  return a3;
}

void IOHIDT8027USBSessionFilter::unregisterService(uint64_t a1, const void *a2)
{
  const __CFSet *v3;
  NSObject *v5;
  uint8_t v6[16];

  v3 = *(const __CFSet **)(a1 + 56);
  if (v3)
  {
    if (CFSetContainsValue(v3, a2))
    {
      CFSetRemoveValue(*(CFMutableSetRef *)(a1 + 56), a2);
      if (*(_BYTE *)(a1 + 84))
      {
        if (!CFSetGetCount(*(CFSetRef *)(a1 + 56)))
        {
          v5 = _IOHIDLogCategory();
          if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v6 = 0;
            _os_log_impl(&dword_231125000, v5, OS_LOG_TYPE_DEFAULT, "Removing T8027USB assertion\n", v6, 2u);
          }
          IOHIDT8027USBSessionFilter::releaseIdleSleepAssertion((IOHIDT8027USBSessionFilter *)a1);
        }
      }
    }
  }
}

_QWORD *sub_23112603C(_QWORD *a1)
{
  const void *v2;

  v2 = (const void *)a1[1];
  *a1 = &unk_250002838;
  a1[1] = 0;
  if (v2)
    CFRelease(v2);
  return a1;
}

_QWORD *sub_23112607C(_QWORD *a1, const char *a2)
{
  *a1 = &unk_2500027F0;
  a1[1] = CFStringCreateWithCString(0, a2, 0);
  return a1;
}

void sub_2311260BC(_Unwind_Exception *a1)
{
  _QWORD *v1;

  sub_23112603C(v1);
  _Unwind_Resume(a1);
}

IOHIDT8027USBSessionFilter *IOHIDT8027USBSessionFilterFactory(uint64_t a1, const void *a2)
{
  const __CFAllocator *v3;
  CFUUIDRef v4;
  IOHIDT8027USBSessionFilter *v5;
  CFUUIDRef v6;

  v3 = (const __CFAllocator *)*MEMORY[0x24BDBD260];
  v4 = CFUUIDGetConstantUUIDWithBytes((CFAllocatorRef)*MEMORY[0x24BDBD260], 0x7Fu, 0x1Au, 0x3Au, 0xE6u, 0x3Eu, 0x3Du, 0x47u, 0xAu, 0xBDu, 0x15u, 0xA2u, 0xDDu, 0x7Eu, 0x1Bu, 0xB7u, 0x19u);
  if (!CFEqual(a2, v4))
    return 0;
  v5 = (IOHIDT8027USBSessionFilter *)CFAllocatorAllocate((CFAllocatorRef)*MEMORY[0x24BDBD240], 88, 0);
  v6 = CFUUIDGetConstantUUIDWithBytes(v3, 0xC8u, 0x52u, 0xD4u, 0xBFu, 0x2Cu, 0x29u, 0x4Du, 0xCBu, 0xBBu, 0x7Eu, 0x88u, 0x54u, 0x8Fu, 0x66u, 0xAAu, 0x41u);
  IOHIDT8027USBSessionFilter::IOHIDT8027USBSessionFilter(v5, v6);
  return v5;
}

uint64_t IOHIDT8027USBSessionFilter::_AddRef(IOHIDT8027USBSessionFilter *this, void *a2)
{
  uint64_t v2;

  v2 = (*((_DWORD *)this + 4) + 1);
  *((_DWORD *)this + 4) = v2;
  return v2;
}

void IOHIDT8027USBSessionFilter::IOHIDT8027USBSessionFilter(IOHIDT8027USBSessionFilter *this, CFTypeRef cf)
{
  *(_QWORD *)this = &IOHIDT8027USBSessionFilter::sIOHIDT8027USBSessionFilterFtbl;
  *((_QWORD *)this + 1) = CFRetain(cf);
  *((_DWORD *)this + 4) = 1;
  *((_QWORD *)this + 4) = 0;
  *((_QWORD *)this + 5) = 0;
  sub_231126DA8((_QWORD *)this + 6, 0);
  *((_QWORD *)this + 8) = 0;
  *((_QWORD *)this + 9) = 7200;
  *((_DWORD *)this + 20) = 0;
  *((_WORD *)this + 42) = 0;
  if (MGGetSInt32Answer() == 1)
    *((_QWORD *)this + 9) = 480;
  CFPlugInAddInstanceForFactory((CFUUIDRef)cf);
}

void sub_231126284(_Unwind_Exception *a1)
{
  _QWORD *v1;

  sub_231126E58(v1);
  _Unwind_Resume(a1);
}

void IOHIDT8027USBSessionFilter::~IOHIDT8027USBSessionFilter(CFUUIDRef *this)
{
  CFPlugInRemoveInstanceForFactory(this[1]);
  CFRelease(this[1]);
  sub_231126E58(this + 6);
}

void sub_2311262D8(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

uint64_t IOHIDT8027USBSessionFilter::QueryInterface(IOHIDT8027USBSessionFilter *this, CFUUIDBytes a2, void **a3)
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

uint64_t IOHIDT8027USBSessionFilter::AddRef(IOHIDT8027USBSessionFilter *this)
{
  uint64_t v1;

  v1 = (*((_DWORD *)this + 4) + 1);
  *((_DWORD *)this + 4) = v1;
  return v1;
}

uint64_t IOHIDT8027USBSessionFilter::Release(IOHIDT8027USBSessionFilter *this)
{
  int v1;
  uint64_t v2;

  v1 = *((_DWORD *)this + 4);
  v2 = (v1 - 1);
  *((_DWORD *)this + 4) = v2;
  if (v1 == 1)
  {
    IOHIDT8027USBSessionFilter::~IOHIDT8027USBSessionFilter((CFUUIDRef *)this);
    MEMORY[0x2348D2EA0]();
  }
  return v2;
}

CFStringRef sub_2311264A0()
{
  const __CFString *v0;
  const __CFString *v1;
  const __CFString *v2;
  CFTypeID v3;
  const __CFNumber *RegistryID;
  const __CFNumber *v5;
  CFTypeID v6;
  uint64_t v7;
  uint64_t valuePtr;

  valuePtr = 0;
  v0 = (const __CFString *)IOHIDServiceCopyProperty();
  v1 = &stru_250002A70;
  if (v0)
  {
    v2 = v0;
    v3 = CFGetTypeID(v0);
    if (v3 == CFStringGetTypeID())
      v1 = v2;
    CFRelease(v2);
  }
  RegistryID = (const __CFNumber *)IOHIDServiceGetRegistryID();
  if (RegistryID && (v5 = RegistryID, v6 = CFGetTypeID(RegistryID), v6 == CFNumberGetTypeID()))
  {
    CFNumberGetValue(v5, kCFNumberSInt64Type, &valuePtr);
    v7 = valuePtr;
  }
  else
  {
    v7 = 0;
  }
  return CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, CFSTR("RegID:0x%llx %@"), v7, v1);
}

void IOHIDT8027USBSessionFilter::preventIdleSleepAssertion(IOHIDT8027USBSessionFilter *this, const __CFString *a2)
{
  IOPMAssertionID *v3;
  CFNumberRef v4;
  CFNumberRef v5;
  NSObject *v6;
  IOReturn v8;
  NSObject *v9;
  dispatch_time_t v10;
  NSObject *v11;
  int valuePtr;

  valuePtr = 255;
  v3 = (IOPMAssertionID *)((char *)this + 80);
  if (*((_DWORD *)this + 20))
  {
    v4 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberIntType, &valuePtr);
    if (!v4)
      return;
    v5 = v4;
    if (IOPMAssertionSetProperty(*v3, CFSTR("AssertLevel"), v4))
    {
      v6 = _IOHIDLogCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        sub_231127278();
LABEL_9:
      CFRelease(v5);
      return;
    }
LABEL_8:
    v9 = *((_QWORD *)this + 8);
    v10 = dispatch_time(0, 1000000000 * *((_QWORD *)this + 9));
    dispatch_source_set_timer(v9, v10, 0xFFFFFFFFFFFFFFFFLL, 0);
    *((_BYTE *)this + 85) = 1;
    if (!v5)
      return;
    goto LABEL_9;
  }
  if (!IOHIDT8027USBSessionFilter::initTimer(this))
    return;
  v8 = IOPMAssertionCreateWithDescription(CFSTR("PreventUserIdleSystemSleep"), CFSTR("IOHIDT8027USBAssertion"), a2, 0, 0, 0.0, 0, v3);
  v5 = 0;
  if (!v8)
    goto LABEL_8;
  v11 = _IOHIDLogCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    sub_23112720C();
}

void IOHIDT8027USBSessionFilter::releaseIdleSleepAssertion(IOHIDT8027USBSessionFilter *this)
{
  NSObject *v2;
  NSObject *v3;

  v2 = *((_QWORD *)this + 8);
  if (v2)
  {
    dispatch_source_cancel(v2);
    *((_QWORD *)this + 8) = 0;
  }
  if (IOPMAssertionRelease(*((_DWORD *)this + 20)))
  {
    v3 = _IOHIDLogCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      sub_2311272E4();
  }
  *((_DWORD *)this + 20) = 0;
  *((_BYTE *)this + 85) = 0;
}

void IOHIDT8027USBSessionFilter::scheduleWithDispatchQueue(IOHIDT8027USBSessionFilter *this, dispatch_queue_s *a2)
{
  IONotificationPortRef v3;
  IONotificationPort *v4;
  const __CFDictionary *v5;
  const __CFDictionary *v6;
  io_iterator_t *v7;
  NSObject *v8;
  NSObject *v9;
  __int128 v10;
  void *keys[2];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v10 = xmmword_250002710;
  *(_OWORD *)keys = xmmword_250002700;
  *((_QWORD *)this + 3) = a2;
  v3 = IONotificationPortCreate(*MEMORY[0x24BDD8B18]);
  *((_QWORD *)this + 4) = v3;
  if (v3)
  {
    v4 = v3;
    v5 = IOServiceNameMatching("usb-drd,t8027");
    if (IOServiceAddMatchingNotification(v4, "IOServiceFirstPublish", v5, (IOServiceMatchingCallback)IOHIDT8027USBSessionFilter::_serviceNotificationCallback, this, (io_iterator_t *)this + 10))
    {
      v8 = _IOHIDLogCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        sub_231127350();
    }
    else if (*((_DWORD *)this + 10))
    {
      v6 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], (const void **)keys, (const void **)&v10, 2, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
      if (v6)
      {
        v7 = (io_iterator_t *)((char *)this + 44);
        if (IOServiceAddMatchingNotification(*((IONotificationPortRef *)this + 4), "IOServiceFirstPublish", v6, (IOServiceMatchingCallback)IOHIDT8027USBSessionFilter::_serviceNotificationCallback, this, (io_iterator_t *)this + 11))
        {
          v9 = _IOHIDLogCategory();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
            sub_231127350();
        }
        else if (*v7)
        {
          IONotificationPortSetDispatchQueue(*((IONotificationPortRef *)this + 4), *((dispatch_queue_t *)this + 3));
          if (IOIteratorNext(*((_DWORD *)this + 10)))
            *((_BYTE *)this + 84) = 1;
          if (IOIteratorNext(*v7))
            *((_BYTE *)this + 84) = 1;
        }
      }
    }
  }
}

uint64_t IOHIDT8027USBSessionFilter::_serviceNotificationCallback(IOHIDT8027USBSessionFilter *this, io_iterator_t iterator)
{
  uint64_t result;

  result = IOIteratorNext(iterator);
  if ((_DWORD)result)
    *((_BYTE *)this + 84) = 1;
  return result;
}

uint64_t IOHIDT8027USBSessionFilter::serviceNotificationCallback(IOHIDT8027USBSessionFilter *this, io_iterator_t iterator)
{
  uint64_t result;

  result = IOIteratorNext(iterator);
  if ((_DWORD)result)
    *((_BYTE *)this + 84) = 1;
  return result;
}

void IOHIDT8027USBSessionFilter::unscheduleFromDispatchQueue(IOHIDT8027USBSessionFilter *this, dispatch_queue_s *a2)
{
  io_object_t v3;
  io_object_t v4;
  IONotificationPort *v5;

  if (*((_DWORD *)this + 20))
    IOHIDT8027USBSessionFilter::releaseIdleSleepAssertion(this);
  v3 = *((_DWORD *)this + 10);
  if (v3)
  {
    IOObjectRelease(v3);
    *((_DWORD *)this + 10) = 0;
  }
  v4 = *((_DWORD *)this + 11);
  if (v4)
  {
    IOObjectRelease(v4);
    *((_DWORD *)this + 11) = 0;
  }
  v5 = (IONotificationPort *)*((_QWORD *)this + 4);
  if (v5)
  {
    IONotificationPortDestroy(v5);
    *((_QWORD *)this + 4) = 0;
  }
}

_QWORD *IOHIDT8027USBSessionFilter::serialize(IOHIDT8027USBSessionFilter *this, __CFDictionary *a2)
{
  const void *v3;
  const void *v4;
  const void *v5;
  const void *v6;
  CFIndex Count;
  IOPMAssertionID v8;
  CFDictionaryRef v9;
  uint64_t v11;
  void *value;
  void *v13;
  CFMutableDictionaryRef theDict;

  v13 = (void *)0xAAAAAAAAAAAAAAAALL;
  theDict = (CFMutableDictionaryRef)0xAAAAAAAAAAAAAAAALL;
  sub_231126FFC(&v13, a2, 0);
  v13 = &unk_250002858;
  CFDictionarySetValue(theDict, CFSTR("Class"), CFSTR("IOHIDT8027USBSessionFilter"));
  v3 = (const void *)*MEMORY[0x24BDBD270];
  v4 = (const void *)*MEMORY[0x24BDBD268];
  if (*((_BYTE *)this + 84))
    v5 = (const void *)*MEMORY[0x24BDBD270];
  else
    v5 = (const void *)*MEMORY[0x24BDBD268];
  if (v5)
    CFDictionarySetValue(theDict, CFSTR("HasT8027USB"), v5);
  sub_2311270E4(&v11, *((_QWORD *)this + 9));
  if (value)
    CFDictionarySetValue(theDict, CFSTR("AssertionTimeout"), value);
  sub_23112707C(&v11);
  if (*((_BYTE *)this + 85))
    v6 = v3;
  else
    v6 = v4;
  if (v6)
    CFDictionarySetValue(theDict, CFSTR("Asserting"), v6);
  Count = CFSetGetCount(*((CFSetRef *)this + 7));
  sub_231126B28((uint64_t)&v13, CFSTR("USBHIDServiceCount"), Count);
  v8 = *((_DWORD *)this + 20);
  if (v8)
  {
    v9 = IOPMAssertionCopyProperties(v8);
    if (v9)
    {
      CFDictionarySetValue(theDict, CFSTR("AssertionProperties"), v9);
      CFRelease(v9);
    }
  }
  return sub_231126FBC(&v13);
}

void sub_231126AF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  sub_23112707C(&a9);
  sub_231126FBC(&a11);
  _Unwind_Resume(a1);
}

_QWORD *sub_231126B28(uint64_t a1, const void *a2, uint64_t a3)
{
  uint64_t v6;
  void *value;

  sub_231127174(&v6, a3);
  if (a2 && value)
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 8), a2, value);
  return sub_23112707C(&v6);
}

void sub_231126B80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  sub_23112707C(&a9);
  _Unwind_Resume(a1);
}

uint64_t IOHIDT8027USBSessionFilter::initTimer(IOHIDT8027USBSessionFilter *this)
{
  NSObject *v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t result;
  NSObject *v7;
  _BOOL4 v8;
  _QWORD v9[5];
  _QWORD handler[5];

  if (*((_QWORD *)this + 8))
    return 1;
  v2 = *((_QWORD *)this + 3);
  if (v2)
  {
    v3 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 1uLL, v2);
    if (v3)
    {
      v4 = v3;
      v5 = MEMORY[0x24BDAC760];
      handler[0] = MEMORY[0x24BDAC760];
      handler[1] = 0x40000000;
      handler[2] = sub_231126CAC;
      handler[3] = &unk_250002720;
      handler[4] = this;
      dispatch_source_set_event_handler(v3, handler);
      v9[0] = v5;
      v9[1] = 0x40000000;
      v9[2] = sub_231126DA0;
      v9[3] = &unk_250002740;
      v9[4] = v4;
      dispatch_source_set_cancel_handler(v4, v9);
      dispatch_source_set_timer(v4, 0xFFFFFFFFFFFFFFFFLL, 0, 0);
      dispatch_activate(v4);
      *((_QWORD *)this + 8) = v4;
      return 1;
    }
  }
  v7 = _IOHIDLogCategory();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
  result = 0;
  if (v8)
  {
    sub_2311273BC(v7);
    return 0;
  }
  return result;
}

void sub_231126CAC(uint64_t a1)
{
  IOHIDT8027USBSessionFilter::timerHandler(*(IOHIDT8027USBSessionFilter **)(a1 + 32));
}

void IOHIDT8027USBSessionFilter::timerHandler(IOHIDT8027USBSessionFilter *this)
{
  NSObject *v2;
  CFNumberRef v3;
  CFNumberRef v4;
  NSObject *v5;
  uint8_t v6[12];
  int valuePtr;

  valuePtr = 0;
  if (*((_DWORD *)this + 20))
  {
    v2 = _IOHIDLogCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_231125000, v2, OS_LOG_TYPE_DEFAULT, "T8027USB HID assertion timeout\n", v6, 2u);
    }
    v3 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberIntType, &valuePtr);
    if (v3)
    {
      v4 = v3;
      if (IOPMAssertionSetProperty(*((_DWORD *)this + 20), CFSTR("AssertLevel"), v3))
      {
        v5 = _IOHIDLogCategory();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
          sub_231127438();
      }
      else
      {
        *(_WORD *)((char *)this + 85) = 256;
      }
      CFRelease(v4);
    }
  }
}

void sub_231126DA0(uint64_t a1)
{
  dispatch_release(*(dispatch_object_t *)(a1 + 32));
}

_QWORD *sub_231126DA8(_QWORD *a1, int a2)
{
  *a1 = &unk_250002770;
  a1[1] = 0;
  a1[1] = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], a2, MEMORY[0x24BDBD6B8]);
  return a1;
}

void sub_231126DF8(_Unwind_Exception *a1)
{
  _QWORD *v1;

  sub_231126E58(v1);
  _Unwind_Resume(a1);
}

void sub_231126E0C(_QWORD *a1)
{
  sub_231126E58(a1);
  JUMPOUT(0x2348D2EA0);
}

void sub_231126E34(_QWORD *a1)
{
  sub_231126E58(a1);
  JUMPOUT(0x2348D2EA0);
}

_QWORD *sub_231126E58(_QWORD *a1)
{
  const void *v2;

  v2 = (const void *)a1[1];
  *a1 = &unk_2500027D0;
  a1[1] = 0;
  if (v2)
    CFRelease(v2);
  return a1;
}

void sub_231126E98(_QWORD *a1)
{
  sub_23112603C(a1);
  JUMPOUT(0x2348D2EA0);
}

void sub_231126EC0(_QWORD *a1)
{
  sub_23112603C(a1);
  JUMPOUT(0x2348D2EA0);
}

_QWORD *sub_231126EE4(_QWORD *a1, int a2)
{
  *a1 = &unk_250002858;
  a1[1] = CFDictionaryCreateMutable(0, a2, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  return a1;
}

void sub_231126F34(_Unwind_Exception *a1)
{
  _QWORD *v1;

  sub_231126FBC(v1);
  _Unwind_Resume(a1);
}

void sub_231126F48(_QWORD *a1)
{
  sub_231126FBC(a1);
  JUMPOUT(0x2348D2EA0);
}

void sub_231126F70(_QWORD *a1)
{
  sub_231126FBC(a1);
  JUMPOUT(0x2348D2EA0);
}

void sub_231126F98(_QWORD *a1)
{
  sub_231126FBC(a1);
  JUMPOUT(0x2348D2EA0);
}

_QWORD *sub_231126FBC(_QWORD *a1)
{
  const void *v2;

  v2 = (const void *)a1[1];
  *a1 = &unk_2500028D8;
  a1[1] = 0;
  if (v2)
    CFRelease(v2);
  return a1;
}

_QWORD *sub_231126FFC(_QWORD *a1, CFTypeRef cf, char a3)
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
    *a1 = &unk_2500028D8;
    a1[1] = v7;
    if (v7 && (a3 & 1) == 0)
      CFRetain(v7);
  }
  else
  {
    a1[1] = 0;
  }
  *a1 = &unk_2500028B8;
  return a1;
}

_QWORD *sub_23112707C(_QWORD *a1)
{
  const void *v2;

  v2 = (const void *)a1[1];
  *a1 = &unk_2500028F8;
  a1[1] = 0;
  if (v2)
    CFRelease(v2);
  return a1;
}

void sub_2311270C0(_QWORD *a1)
{
  sub_23112707C(a1);
  JUMPOUT(0x2348D2EA0);
}

_QWORD *sub_2311270E4(_QWORD *a1, uint64_t a2)
{
  uint64_t valuePtr;

  valuePtr = a2;
  *a1 = &unk_250002928;
  a1[1] = 0;
  a1[1] = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberSInt64Type, &valuePtr);
  return a1;
}

void sub_23112713C(_Unwind_Exception *a1)
{
  _QWORD *v1;

  sub_23112707C(v1);
  _Unwind_Resume(a1);
}

void sub_231127150(_QWORD *a1)
{
  sub_23112707C(a1);
  JUMPOUT(0x2348D2EA0);
}

_QWORD *sub_231127174(_QWORD *a1, uint64_t a2)
{
  uint64_t valuePtr;

  valuePtr = a2;
  *a1 = &unk_250002928;
  a1[1] = 0;
  a1[1] = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberSInt64Type, &valuePtr);
  return a1;
}

void sub_2311271CC(_Unwind_Exception *a1)
{
  _QWORD *v1;

  sub_23112707C(v1);
  _Unwind_Resume(a1);
}

void sub_2311271E0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void sub_23112720C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_2311271F0();
  sub_2311271E0(&dword_231125000, v0, v1, "%s error creating assertion 0x%x\n", v2, v3, v4, v5, 2u);
  sub_231127204();
}

void sub_231127278()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_2311271F0();
  sub_2311271E0(&dword_231125000, v0, v1, "%s error turning on assertion 0x%x\n", v2, v3, v4, v5, 2u);
  sub_231127204();
}

void sub_2311272E4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_2311271F0();
  sub_2311271E0(&dword_231125000, v0, v1, "%s error releasing assertion 0x%x\n", v2, v3, v4, v5, 2u);
  sub_231127204();
}

void sub_231127350()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_2311271F0();
  sub_2311271E0(&dword_231125000, v0, v1, "%s adding matching notification 0x%x\n", v2, v3, v4, v5, 2u);
  sub_231127204();
}

void sub_2311273BC(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136315138;
  v2 = "BOOL IOHIDT8027USBSessionFilter::initTimer()";
  _os_log_error_impl(&dword_231125000, log, OS_LOG_TYPE_ERROR, "%s error\n", (uint8_t *)&v1, 0xCu);
  sub_231127204();
}

void sub_231127438()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  sub_2311271F0();
  sub_2311271E0(&dword_231125000, v0, v1, "%s error turning off assertion 0x%x\n", v2, v3, v4, v5, 2u);
  sub_231127204();
}

void *__cdecl CFAllocatorAllocate(CFAllocatorRef allocator, CFIndex size, CFOptionFlags hint)
{
  return (void *)MEMORY[0x24BDBB790](allocator, size, hint);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x24BDBBDD8](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
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

Boolean CFSetContainsValue(CFSetRef theSet, const void *value)
{
  return MEMORY[0x24BDBC3D0](theSet, value);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x24BDBC3E8](allocator, capacity, callBacks);
}

CFIndex CFSetGetCount(CFSetRef theSet)
{
  return MEMORY[0x24BDBC3F8](theSet);
}

void CFSetRemoveValue(CFMutableSetRef theSet, const void *value)
{
  MEMORY[0x24BDBC428](theSet, value);
}

void CFSetSetValue(CFMutableSetRef theSet, const void *value)
{
  MEMORY[0x24BDBC430](theSet, value);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x24BDBC568](alloc, cStr, *(_QWORD *)&encoding);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x24BDBC598](alloc, formatOptions, format);
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

uint64_t IOHIDEventConformsTo()
{
  return MEMORY[0x24BDD8150]();
}

uint64_t IOHIDEventGetIntegerValue()
{
  return MEMORY[0x24BDD8298]();
}

uint64_t IOHIDServiceConformsTo()
{
  return MEMORY[0x24BDD8560]();
}

uint64_t IOHIDServiceCopyProperty()
{
  return MEMORY[0x24BDD8568]();
}

uint64_t IOHIDServiceGetRegistryID()
{
  return MEMORY[0x24BDD8578]();
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x24BDD8668](*(_QWORD *)&iterator);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return (IONotificationPortRef)MEMORY[0x24BDD8690](*(_QWORD *)&mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
  MEMORY[0x24BDD8698](notify);
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
  MEMORY[0x24BDD86B0](notify, queue);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x24BDD86F8](*(_QWORD *)&object);
}

CFDictionaryRef IOPMAssertionCopyProperties(IOPMAssertionID theAssertion)
{
  return (CFDictionaryRef)MEMORY[0x24BDD8708](*(_QWORD *)&theAssertion);
}

IOReturn IOPMAssertionCreateWithDescription(CFStringRef AssertionType, CFStringRef Name, CFStringRef Details, CFStringRef HumanReadableReason, CFStringRef LocalizationBundlePath, CFTimeInterval Timeout, CFStringRef TimeoutAction, IOPMAssertionID *AssertionID)
{
  return MEMORY[0x24BDD8710](AssertionType, Name, Details, HumanReadableReason, LocalizationBundlePath, TimeoutAction, AssertionID, Timeout);
}

IOReturn IOPMAssertionRelease(IOPMAssertionID AssertionID)
{
  return MEMORY[0x24BDD8740](*(_QWORD *)&AssertionID);
}

IOReturn IOPMAssertionSetProperty(IOPMAssertionID theAssertion, CFStringRef theProperty, CFTypeRef theValue)
{
  return MEMORY[0x24BDD8750](*(_QWORD *)&theAssertion, theProperty, theValue);
}

kern_return_t IOServiceAddMatchingNotification(IONotificationPortRef notifyPort, const io_name_t notificationType, CFDictionaryRef matching, IOServiceMatchingCallback callback, void *refCon, io_iterator_t *notification)
{
  return MEMORY[0x24BDD8960](notifyPort, notificationType, matching, callback, refCon, notification);
}

CFMutableDictionaryRef IOServiceNameMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDD89B0](name);
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x24BED8490]();
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
  return off_250002630();
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

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x24BDADC58](object);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x24BDADF10](object);
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

