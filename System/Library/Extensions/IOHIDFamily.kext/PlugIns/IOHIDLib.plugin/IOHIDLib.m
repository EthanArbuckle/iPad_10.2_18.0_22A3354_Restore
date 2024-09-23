uint64_t IOHIDEventServiceFastPathClass::_copyEvent(uint64_t a1, const void *a2, unsigned int a3, uint64_t *a4)
{
  return IOHIDEventServiceFastPathClass::copyEvent(*(_QWORD *)(a1 + 8), a2, a3, a4);
}

uint64_t IOHIDEventServiceFastPathClass::_start(IOHIDEventServiceFastPathClass **this, const __CFDictionary *a2, const __CFDictionary *a3)
{
  return IOHIDEventServiceFastPathClass::start(this[1], a2, (io_object_t)a3);
}

uint64_t IOHIDEventServiceFastPathClass::_open(IOHIDEventServiceFastPathClass **this, void *a2, const void *a3, const __CFDictionary *a4)
{
  return IOHIDEventServiceFastPathClass::open(this[1], a2, a3);
}

uint64_t IOHIDIUnknown::genericQueryInterface(IOHIDIUnknown *this, void *a2, CFUUIDBytes a3, void **a4)
{
  return (*(uint64_t (**)(_QWORD, void *, _QWORD, _QWORD))(**((_QWORD **)this + 1) + 16))(*((_QWORD *)this + 1), a2, *(_QWORD *)&a3.byte0, *(_QWORD *)&a3.byte8);
}

uint64_t IOHIDIUnknown::release(IOHIDIUnknown *this)
{
  unsigned int *v1;
  unsigned int v2;
  uint64_t v3;

  v1 = (unsigned int *)((char *)this + 8);
  do
  {
    v2 = __ldaxr(v1);
    v3 = v2 - 1;
  }
  while (__stlxr(v3, v1));
  if (v2)
  {
    if (this && v2 == 1)
      (*(void (**)(IOHIDIUnknown *))(*(_QWORD *)this + 8))(this);
  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT))
  {
    sub_2310E1374();
  }
  return v3;
}

uint64_t IOHIDEventServiceFastPathClass::_probe(IOHIDEventServiceFastPathClass *this, void *a2, io_object_t object, unsigned int a4, int *a5)
{
  uint64_t v5;

  v5 = 3758097090;
  if (object)
  {
    if (IOObjectConformsTo(object, "IOHIDEventService"))
      return 0;
    else
      return 3758097090;
  }
  return v5;
}

void IOHIDEventServiceFastPathClass::~IOHIDEventServiceFastPathClass(IOHIDEventServiceFastPathClass *this)
{
  _QWORD *v2;
  io_object_t v3;
  io_object_t v4;
  io_connect_t v5;

  *(_QWORD *)this = &off_24FFFA3D8;
  v2 = (_QWORD *)((char *)this + 64);
  if (*((_QWORD *)this + 8))
  {
    MEMORY[0x2348D0C10](*((unsigned int *)this + 13), 0, *MEMORY[0x24BDAEC58], *((_QWORD *)this + 9));
    *v2 = 0;
    v2[1] = 0;
  }
  v3 = *((_DWORD *)this + 12);
  if (v3)
  {
    IOObjectRelease(v3);
    *((_DWORD *)this + 12) = 0;
  }
  v4 = *((_DWORD *)this + 14);
  if (v4)
  {
    IOObjectRelease(v4);
    *((_DWORD *)this + 14) = 0;
  }
  v5 = *((_DWORD *)this + 13);
  if (v5)
  {
    IOServiceClose(v5);
    *((_DWORD *)this + 13) = 0;
  }
  IOHIDIUnknown::~IOHIDIUnknown(this);
}

{
  IOHIDEventServiceFastPathClass::~IOHIDEventServiceFastPathClass(this);
  JUMPOUT(0x2348D0E80);
}

void sub_2310D4924(_Unwind_Exception *a1)
{
  IOHIDIUnknown *v1;

  IOHIDIUnknown::~IOHIDIUnknown(v1);
  _Unwind_Resume(a1);
}

uint64_t IOHIDEventServiceFastPathClass::start(IOHIDEventServiceFastPathClass *this, const __CFDictionary *a2, io_object_t object)
{
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v10;

  v5 = IOObjectRetain(object);
  if ((_DWORD)v5)
  {
    v7 = v5;
    v10 = _IOHIDLogCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_2310E14B8();
  }
  else
  {
    *((_DWORD *)this + 12) = object;
    if (IOServiceOpen(object, *MEMORY[0x24BDAEC58], 2u, (io_connect_t *)this + 13))
    {
      v6 = _IOHIDLogCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        sub_2310E1458();
    }
    v7 = MEMORY[0x2348D0BEC](*((unsigned int *)this + 13), (char *)this + 56);
    if ((_DWORD)v7)
    {
      v8 = _IOHIDLogCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        sub_2310E13F8();
    }
  }
  return v7;
}

uint64_t IOHIDEventServiceFastPathClass::open(IOHIDEventServiceFastPathClass *this, unsigned int a2, CFTypeRef object)
{
  const __CFData *v5;
  const __CFData *v6;
  const UInt8 *BytePtr;
  CFIndex Length;
  kern_return_t v9;
  NSObject *v10;
  _BOOL4 v11;
  uint64_t result;
  const __CFNumber *CFProperty;
  const __CFNumber *v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  int valuePtr;
  uint64_t input;

  v5 = IOCFSerialize(object, 1uLL);
  if (v5)
  {
    v6 = v5;
    BytePtr = CFDataGetBytePtr(v5);
    Length = CFDataGetLength(v6);
    input = a2;
    v9 = IOConnectCallMethod(*((_DWORD *)this + 13), 0, &input, 1u, BytePtr, Length, 0, 0, 0, 0);
    CFRelease(v6);
    if (v9)
    {
LABEL_3:
      v10 = _IOHIDLogCategory();
      v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
      result = 0;
      if (!v11)
        return result;
      sub_2310E15A0();
      return 0;
    }
  }
  else
  {
    input = a2;
    if (IOConnectCallMethod(*((_DWORD *)this + 13), 0, &input, 1u, 0, 0, 0, 0, 0, 0))
      goto LABEL_3;
  }
  valuePtr = 0;
  CFProperty = (const __CFNumber *)IORegistryEntryCreateCFProperty(*((_DWORD *)this + 14), CFSTR("QueueSize"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  if (CFProperty)
  {
    v14 = CFProperty;
    CFNumberGetValue(CFProperty, kCFNumberSInt32Type, &valuePtr);
    CFRelease(v14);
    if (valuePtr)
    {
      v19 = 0;
      v20 = 0;
      v15 = MEMORY[0x2348D0BF8](*((unsigned int *)this + 13), 0, *MEMORY[0x24BDAEC58], &v20, &v19, 1);
      v16 = v19;
      v17 = v20;
      *((_QWORD *)this + 8) = v20;
      *((_QWORD *)this + 9) = v16;
      if (v15 || !v17 || !v16)
      {
        v18 = _IOHIDLogCategory();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          sub_2310E1518(&valuePtr, v15, v18);
        return 0;
      }
    }
  }
  return 1;
}

uint64_t IOHIDLibFactory(uint64_t a1, const void *a2)
{
  CFUUIDRef v3;
  IOHIDObsoleteDeviceClass *v4;
  const __CFUUID *v5;
  CFUUIDBytes v6;
  CFUUIDRef v7;
  const __CFUUID *v8;
  CFUUIDBytes v9;
  CFUUIDRef v10;
  const __CFUUID *v11;
  CFUUIDBytes v12;
  CFUUIDRef v14;
  IOHIDEventServiceFastPathClass *v15;
  uint64_t v16;

  v16 = 0;
  v3 = CFUUIDGetConstantUUIDWithBytes(0, 0xFAu, 0x12u, 0xFAu, 0x38u, 0x6Fu, 0x1Au, 0x11u, 0xD4u, 0xBAu, 0xCu, 0, 5u, 2u, 0x8Fu, 0x18u, 0xD5u);
  if (CFEqual(a2, v3))
  {
    v4 = objc_alloc_init(IOHIDObsoleteDeviceClass);
    v5 = CFUUIDGetConstantUUIDWithBytes(0, 0x78u, 0xBDu, 0x42u, 0xCu, 0x6Fu, 0x14u, 0x11u, 0xD4u, 0x94u, 0x74u, 0, 5u, 2u, 0x8Fu, 0x18u, 0xD5u);
    v6 = CFUUIDGetUUIDBytes(v5);
    objc_msgSend_queryInterface_outInterface_(v4, *(const char **)&v6.byte8, *(uint64_t *)&v6.byte0, *(uint64_t *)&v6.byte8, (uint64_t)&v16);
LABEL_7:

    return v16;
  }
  v7 = CFUUIDGetConstantUUIDWithBytes(0, 0x7Du, 0xDEu, 0xECu, 0xA8u, 0xA7u, 0xB4u, 0x11u, 0xDAu, 0x8Au, 0xEu, 0, 0x14u, 0x51u, 0x97u, 0x58u, 0xEFu);
  if (CFEqual(a2, v7))
  {
    v4 = objc_alloc_init(IOHIDDeviceClass);
    v8 = CFUUIDGetConstantUUIDWithBytes(0, 0x47u, 0x4Bu, 0xDCu, 0x8Eu, 0x9Fu, 0x4Au, 0x11u, 0xDAu, 0xB3u, 0x66u, 0, 0xDu, 0x93u, 0x6Du, 6u, 0xD2u);
    v9 = CFUUIDGetUUIDBytes(v8);
    objc_msgSend_queryInterface_outInterface_(v4, *(const char **)&v9.byte8, *(uint64_t *)&v9.byte0, *(uint64_t *)&v9.byte8, (uint64_t)&v16);
    goto LABEL_7;
  }
  v10 = CFUUIDGetConstantUUIDWithBytes(0, 0x40u, 0xA5u, 0x7Au, 0x4Eu, 0x26u, 0xA0u, 0x11u, 0xD8u, 0x92u, 0x95u, 0, 0xAu, 0x95u, 0x8Au, 0x2Cu, 0x78u);
  if (CFEqual(a2, v10))
  {
    v4 = objc_alloc_init(IOHIDUPSClass);
    v11 = CFUUIDGetConstantUUIDWithBytes(0, 0xC2u, 0x44u, 0xE8u, 0x58u, 0x10u, 0x9Cu, 0x11u, 0xD4u, 0x91u, 0xD4u, 0, 0x50u, 0xE4u, 0xC6u, 0x42u, 0x6Fu);
    v12 = CFUUIDGetUUIDBytes(v11);
    objc_msgSend_queryInterface_outInterface_(v4, *(const char **)&v12.byte8, *(uint64_t *)&v12.byte0, *(uint64_t *)&v12.byte8, (uint64_t)&v16);
    goto LABEL_7;
  }
  v14 = CFUUIDGetConstantUUIDWithBytes(0, 0xBu, 0x84u, 0x2Au, 0xDDu, 0xC3u, 0x95u, 0x43u, 0x52u, 0x95u, 0xF6u, 0x65u, 0x85u, 0xEBu, 0x51u, 0x56u, 0x23u);
  v15 = (IOHIDEventServiceFastPathClass *)CFEqual(a2, v14);
  if ((_DWORD)v15)
    return IOHIDEventServiceFastPathClass::alloc(v15);
  return v16;
}

void sub_2310D4EA4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t IOHIDEventServiceFastPathClass::queryInterface(IOHIDEventServiceFastPathClass *this, CFUUIDBytes a2, void **a3)
{
  CFUUIDRef v5;
  const __CFAllocator *v6;
  CFUUIDRef v7;
  CFUUIDRef v8;
  uint64_t v9;
  uint64_t v10;
  CFUUIDRef v12;

  v5 = CFUUIDCreateFromUUIDBytes(0, a2);
  v6 = (const __CFAllocator *)*MEMORY[0x24BDBD260];
  v7 = CFUUIDGetConstantUUIDWithBytes((CFAllocatorRef)*MEMORY[0x24BDBD260], 0, 0, 0, 0, 0, 0, 0, 0, 0xC0u, 0, 0, 0, 0, 0, 0, 0x46u);
  if (CFEqual(v5, v7)
    || (v8 = CFUUIDGetConstantUUIDWithBytes(0, 0xC2u, 0x44u, 0xE8u, 0x58u, 0x10u, 0x9Cu, 0x11u, 0xD4u, 0x91u, 0xD4u, 0, 0x50u, 0xE4u, 0xC6u, 0x42u, 0x6Fu), CFEqual(v5, v8)))
  {
    v9 = *(_QWORD *)this;
    *a3 = (char *)this + 16;
    (*(void (**)(IOHIDEventServiceFastPathClass *))(v9 + 24))(this);
  }
  else
  {
    v12 = CFUUIDGetConstantUUIDWithBytes(v6, 0x27u, 0xBAu, 0xAEu, 0x90u, 0x2Fu, 0xE5u, 0x40u, 0x2Au, 0xBFu, 0x7Fu, 0x4Eu, 0xFAu, 0x27u, 0x7Du, 0x37u, 8u);
    if (CFEqual(v5, v12))
    {
      *((_QWORD *)this + 4) = &IOHIDEventServiceFastPathClass::sIOHIDServiceFastPathInterface;
      *((_QWORD *)this + 5) = this;
      *a3 = (char *)this + 32;
      (*(void (**)(IOHIDEventServiceFastPathClass *))(*(_QWORD *)this + 24))(this);
    }
    else
    {
      *a3 = 0;
    }
  }
  if (*a3)
    v10 = 0;
  else
    v10 = 2147483652;
  CFRelease(v5);
  return v10;
}

uint64_t IOHIDEventServiceFastPathClass::copyEvent(uint64_t a1, CFTypeRef cf, unsigned int a3, uint64_t *a4)
{
  CFTypeID v7;
  const __CFData *v8;
  const UInt8 *BytePtr;
  CFIndex Length;
  _DWORD *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
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
  _DWORD *v31;
  uint64_t v32;
  uint64_t input;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  input = a3;
  v35 = 0;
  if (cf)
  {
    v7 = CFGetTypeID(cf);
    if (v7 == CFDataGetTypeID())
    {
      v8 = (const __CFData *)CFRetain(cf);
      v35 = 1;
      if (v8)
      {
LABEL_4:
        BytePtr = CFDataGetBytePtr(v8);
        Length = CFDataGetLength(v8);
        goto LABEL_8;
      }
    }
    else
    {
      v8 = IOCFSerialize(cf, 1uLL);
      if (v8)
        goto LABEL_4;
    }
    BytePtr = 0;
    Length = 0;
  }
  else
  {
    BytePtr = 0;
    Length = 0;
    v8 = 0;
  }
LABEL_8:
  v11 = *(_DWORD **)(a1 + 64);
  if (v11)
  {
    if (a4)
    {
      *v11 = 0;
      v12 = IOConnectCallMethod(*(_DWORD *)(a1 + 52), 2u, &input, 2u, BytePtr, Length, 0, 0, 0, 0);
      if ((_DWORD)v12)
      {
        v13 = v12;
        v14 = _IOHIDLogCategory();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          sub_2310E1720((uint64_t)cf, v13, v14);
      }
      else
      {
        v31 = *(_DWORD **)(a1 + 64);
        if (*v31)
        {
          v32 = MEMORY[0x2348D0CE8](*MEMORY[0x24BDBD240], v31 + 1);
          *a4 = v32;
        }
        else
        {
          v32 = *a4;
        }
        if (v32)
          v13 = 0;
        else
          v13 = 3758097084;
      }
    }
    else
    {
      v23 = _IOHIDLogCategory();
      v13 = 3758097090;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        sub_2310E16F0(v23, v24, v25, v26, v27, v28, v29, v30);
    }
  }
  else
  {
    v13 = 3758097084;
    v15 = _IOHIDLogCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_2310E16C0(v15, v16, v17, v18, v19, v20, v21, v22);
  }
  if (v8)
    CFRelease(v8);
  return v13;
}

uint64_t IOHIDIUnknown::addRef(IOHIDIUnknown *this)
{
  unsigned int *v1;
  unsigned int v2;
  uint64_t result;

  v1 = (unsigned int *)((char *)this + 8);
  do
  {
    v2 = __ldaxr(v1);
    result = v2 + 1;
  }
  while (__stlxr(result, v1));
  return result;
}

uint64_t IOHIDEventServiceFastPathClass::alloc(IOHIDEventServiceFastPathClass *this)
{
  uint64_t v1;
  uint64_t result;

  v1 = operator new();
  IOHIDIUnknown::IOHIDIUnknown((IOHIDIUnknown *)v1, &IOHIDEventServiceFastPathClass::sIOCFPlugInInterfaceV1);
  *(_QWORD *)v1 = &off_24FFFA3D8;
  *(_QWORD *)(v1 + 32) = 0;
  *(_QWORD *)(v1 + 40) = v1;
  *(_QWORD *)(v1 + 48) = 0;
  *(_DWORD *)(v1 + 56) = 0;
  result = v1 + 16;
  *(_QWORD *)(v1 + 64) = 0;
  *(_QWORD *)(v1 + 72) = 0;
  return result;
}

void sub_2310D52C0(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x2348D0E80](v1, 0x10A1C40F1A87D79);
  _Unwind_Resume(a1);
}

void IOHIDIUnknown::IOHIDIUnknown(IOHIDIUnknown *this, void *a2)
{
  *(_QWORD *)this = off_24FFFA390;
  *((_DWORD *)this + 2) = 1;
  *((_QWORD *)this + 2) = a2;
  *((_QWORD *)this + 3) = this;
  IOHIDIUnknown::factoryAddRef(this);
}

void IOHIDIUnknown::factoryAddRef(IOHIDIUnknown *this)
{
  const __CFUUID *v1;

  v1 = CFUUIDGetConstantUUIDWithBytes(0, 0x13u, 0xAAu, 0x9Cu, 0x44u, 0x6Fu, 0x1Bu, 0x11u, 0xD4u, 0x90u, 0x7Cu, 0, 5u, 2u, 0x8Fu, 0x18u, 0xD5u);
  CFPlugInAddInstanceForFactory(v1);
}

uint64_t IOHIDIUnknown::genericRelease(IOHIDIUnknown *this, void *a2)
{
  return (*(uint64_t (**)(_QWORD))(**((_QWORD **)this + 1) + 32))(*((_QWORD *)this + 1));
}

void sub_2310D53BC(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x2348D0E80](v1, 0x10A1C40F1A87D79);
  _Unwind_Resume(a1);
}

void IOHIDEventServiceFastPathClass::_close(IOHIDEventServiceFastPathClass **this, void *a2)
{
  IOHIDEventServiceFastPathClass::close(this[1], a2);
}

void IOHIDEventServiceFastPathClass::close(IOHIDEventServiceFastPathClass *this, unsigned int a2)
{
  NSObject *v2;
  uint64_t input;

  input = a2;
  if (IOConnectCallScalarMethod(*((_DWORD *)this + 13), 1u, &input, 1u, 0, 0))
  {
    v2 = _IOHIDLogCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      sub_2310E1600();
  }
}

uint64_t IOHIDEventServiceFastPathClass::_stop(IOHIDEventServiceFastPathClass *this, void *a2)
{
  return 1;
}

void IOHIDIUnknown::~IOHIDIUnknown(IOHIDIUnknown *this)
{
  *(_QWORD *)this = off_24FFFA390;
  IOHIDIUnknown::factoryRelease(this);
}

void IOHIDIUnknown::factoryRelease(IOHIDIUnknown *this)
{
  const __CFUUID *v1;

  v1 = CFUUIDGetConstantUUIDWithBytes(0, 0x13u, 0xAAu, 0x9Cu, 0x44u, 0x6Fu, 0x1Bu, 0x11u, 0xD4u, 0x90u, 0x7Cu, 0, 5u, 2u, 0x8Fu, 0x18u, 0xD5u);
  CFPlugInRemoveInstanceForFactory(v1);
}

uint64_t sub_2310D5584(void ***a1, const char *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend_queryInterface_outInterface_(**a1, a2, (uint64_t)a2, a3, a4);
}

uint64_t sub_2310D559C(id **a1)
{
  id v1;
  int v2;

  v1 = **a1;
  v2 = CFGetRetainCount(v1);
  CFRetain(v1);

  return (v2 + 1);
}

uint64_t sub_2310D55DC(id **a1)
{
  id v1;
  int v2;

  v1 = **a1;
  v2 = CFGetRetainCount(v1);
  CFRelease(v1);

  return (v2 - 1);
}

uint64_t sub_2310D5780(_QWORD **a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x24BEDD108](**a1, sel_probe_service_outScore_, a2, a3, a4);
}

uint64_t sub_2310D5798(_QWORD **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x24BEDD108](**a1, sel_start_service_, a2, a3, a5);
}

uint64_t sub_2310D57AC(void ***a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend_stop(**a1, a2, a3, a4, a5);
}

void sub_2310D6590(void *a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  void (*v5)(_QWORD, uint64_t, _QWORD);
  NSObject *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int *v21;
  unint64_t v22;
  int v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  id obj;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    v5 = *(void (**)(_QWORD, uint64_t, _QWORD))a1;
    if (*(_QWORD *)a1)
    {
      v8 = 0;
      if (a3)
      {
        if (a4)
        {
          v9 = (void *)*((_QWORD *)a1 + 4);
          if (v9)
          {
            v51 = 0u;
            v52 = 0u;
            v49 = 0u;
            v50 = 0u;
            obj = v9;
            v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v10, (uint64_t)&v49, (uint64_t)v53, 16);
            if (v11)
            {
              v12 = v11;
              v8 = 0;
              v13 = 0;
              v14 = *(_QWORD *)v50;
              while (2)
              {
                v15 = 0;
                v16 = v8;
                do
                {
                  if (*(_QWORD *)v50 != v14)
                    objc_enumerationMutation(obj);
                  v8 = *(id *)(*((_QWORD *)&v49 + 1) + 8 * v15);

                  v21 = (int *)(a4 + v13);
                  v22 = *(unsigned int *)(a4 + v13 + 4);
                  v13 += v22 >> 8;
                  if (v22 >> 10 < 5 || v13 > a3)
                  {
                    _IOHIDLogCategory();
                    v34 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
                      sub_2310E11D4((uint64_t)(v21 + 1), v34, v35, v36, v37, v38, v39, v40);
                    goto LABEL_26;
                  }
                  v24 = *v21;
                  if (v24 != objc_msgSend_elementCookie(v8, v17, v18, v19, v20))
                  {
                    _IOHIDLogCategory();
                    v34 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
                      sub_2310E1244((uint64_t)v21, v8, v34, v41, v42);
                    goto LABEL_26;
                  }
                  objc_msgSend_elementRef(v8, v25, v26, v27, v28);
                  v29 = (const void *)_IOHIDValueCreateWithElementValuePtr();
                  objc_msgSend_setValueRef_(v8, v30, (uint64_t)v29, v31, v32);
                  if (v29)
                    CFRelease(v29);
                  ++v15;
                  v16 = v8;
                }
                while (v12 != v15);
                v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v33, (uint64_t)&v49, (uint64_t)v53, 16);
                if (v12)
                  continue;
                break;
              }
              v34 = v8;
              v8 = 0;
LABEL_26:
              a2 = a2;

            }
            else
            {
              v8 = 0;
            }

            objc_msgSend_releaseReport_(*((void **)a1 + 2), v43, a4, v44, v45);
            v5 = *(void (**)(_QWORD, uint64_t, _QWORD))a1;
          }
        }
      }
      v5(*((_QWORD *)a1 + 1), a2, *((_QWORD *)a1 + 3));
      v46 = (void *)*((_QWORD *)a1 + 4);
      *((_QWORD *)a1 + 4) = 0;

      free(a1);
    }
  }
}

uint64_t sub_2310D6964(_QWORD **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x24BEDD108](**a1, sel_getAsyncEventSource_, a2, a4, a5);
}

uint64_t sub_2310D6974(_QWORD **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x24BEDD108](**a1, sel_setDirection_, a2, a4, a5);
}

uint64_t sub_2310D6984(_QWORD **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x24BEDD108](**a1, sel_getDirection_, a2, a4, a5);
}

uint64_t sub_2310D6994(void ***a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend_addElement_(**a1, a2, (uint64_t)a2, a4, a5);
}

uint64_t sub_2310D69A4(void ***a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend_removeElement_(**a1, a2, (uint64_t)a2, a4, a5);
}

uint64_t sub_2310D69B4(void ***a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend_containsElement_value_(**a1, a2, (uint64_t)a2, a3, a5);
}

uint64_t sub_2310D69C8(void ***a1, const char *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend_setValue_value_options_(**a1, a2, (uint64_t)a2, a3, a4);
}

uint64_t sub_2310D69E0(void ***a1, const char *a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend_getValue_value_options_(**a1, a2, (uint64_t)a2, a3, a4);
}

uint64_t sub_2310D69F8(_QWORD **a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x24BEDD108](**a1, sel_commit_timeout_callback_options_, a4, a2, a3);
}

uint64_t sub_2310D6A14(_QWORD **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x24BEDD108](**a1, sel_clear, a3, a4, a5);
}

uint64_t sub_2310D6F04(void ***a1, CFTypeRef *a2)
{
  id *v3;
  id *v4;
  id *v5;
  id WeakRetained;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (!a2)
    return 3758097090;
  v3 = (id *)**a1;
  v4 = v3 + 5;
  v5 = v3;
  WeakRetained = objc_loadWeakRetained(v4);
  *a2 = (CFTypeRef)objc_msgSend_runLoopSource(WeakRetained, v7, v8, v9, v10);

  CFRetain(*a2);
  return 0;
}

uint64_t sub_2310D6F7C(uint64_t a1)
{
  id WeakRetained;
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  WeakRetained = objc_loadWeakRetained((id *)(**(_QWORD **)a1 + 40));
  v6 = objc_msgSend_runLoopSource(WeakRetained, v2, v3, v4, v5);

  return v6;
}

uint64_t sub_2310D6FC0(uint64_t a1, _DWORD *a2)
{
  id WeakRetained;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  WeakRetained = objc_loadWeakRetained((id *)(**(_QWORD **)a1 + 40));
  *a2 = objc_msgSend_port(WeakRetained, v4, v5, v6, v7);

  return 0;
}

uint64_t sub_2310D7008(uint64_t a1)
{
  id WeakRetained;
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  WeakRetained = objc_loadWeakRetained((id *)(**(_QWORD **)a1 + 40));
  v6 = objc_msgSend_port(WeakRetained, v2, v3, v4, v5);

  return v6;
}

uint64_t sub_2310D704C()
{
  return 0;
}

uint64_t sub_2310D7054()
{
  return 0;
}

uint64_t sub_2310D705C(void ***a1, uint64_t a2)
{
  id *v3;
  id *v4;
  id *v5;
  id WeakRetained;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t Element;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v3 = (id *)**a1;
  v4 = v3 + 5;
  v5 = v3;
  WeakRetained = objc_loadWeakRetained(v4);
  Element = objc_msgSend_getElement_(WeakRetained, v7, a2, v8, v9);
  v14 = objc_msgSend_addElement_(v5, v11, Element, v12, v13);

  return v14;
}

uint64_t sub_2310D70CC(void ***a1, uint64_t a2)
{
  id *v3;
  id *v4;
  id *v5;
  id WeakRetained;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t Element;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v3 = (id *)**a1;
  v4 = v3 + 5;
  v5 = v3;
  WeakRetained = objc_loadWeakRetained(v4);
  Element = objc_msgSend_getElement_(WeakRetained, v7, a2, v8, v9);
  v14 = objc_msgSend_removeElement_(v5, v11, Element, v12, v13);

  return v14;
}

uint64_t sub_2310D713C(void ***a1, uint64_t a2)
{
  id *v3;
  id *v4;
  id *v5;
  id WeakRetained;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t Element;
  const char *v11;
  uint64_t v12;
  unsigned __int8 v14;

  v3 = (id *)**a1;
  v14 = 0;
  v4 = v3 + 5;
  v5 = v3;
  WeakRetained = objc_loadWeakRetained(v4);
  Element = objc_msgSend_getElement_(WeakRetained, v7, a2, v8, v9);
  objc_msgSend_containsElement_value_(v5, v11, Element, (uint64_t)&v14, v12);

  return v14;
}

uint64_t sub_2310D71B8(_QWORD **a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x24BEDD108](**a1, sel_setElementValue_value_options_, a2, a3, 1);
}

uint64_t sub_2310D71D0(_QWORD **a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x24BEDD108](**a1, sel_getElementValue_value_options_, a2, a3, 1);
}

uint64_t sub_2310D71E8(_QWORD **a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x24BEDD108](**a1, sel_setElementValue_value_options_, a2, a3, 0);
}

uint64_t sub_2310D7200(_QWORD **a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x24BEDD108](**a1, sel_getElementValue_value_options_, a2, a3, 0);
}

uint64_t sub_2310D7218(_QWORD **a1)
{
  return MEMORY[0x24BEDD108](**a1, sel_commit_timeout_callback_options_, 0, 0, 0);
}

uint64_t sub_2310D7234(_QWORD **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x24BEDD108](**a1, sel_clear, a3, a4, a5);
}

void sub_2310D7290(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x12u);
}

void sub_2310D72BC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x12u);
}

void sub_2310D72D0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void sub_2310D72E0(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

uint64_t sub_2310D72EC(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend_elementCookie(a2, (const char *)a2, a3, a4, a5);
}

uint64_t IOHIDIUnknown::genericAddRef(IOHIDIUnknown *this, void *a2)
{
  return (*(uint64_t (**)(_QWORD))(**((_QWORD **)this + 1) + 24))(*((_QWORD *)this + 1));
}

void sub_2310D7CD4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2310D7DDC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2310D7ED0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2310D7F9C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2310D800C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2310D81B8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2310D8318(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2310D83D4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2310D8760(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t sub_2310D87A0(_QWORD **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x24BEDD108](**a1, sel_getAsyncEventSource_, a2, a4, a5);
}

uint64_t sub_2310D87B0(_QWORD **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x24BEDD108](**a1, sel_setDepth_, a2, a4, a5);
}

uint64_t sub_2310D87C0(_QWORD **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x24BEDD108](**a1, sel_getDepth_, a2, a4, a5);
}

uint64_t sub_2310D87D0(void ***a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend_addElement_(**a1, a2, (uint64_t)a2, a4, a5);
}

uint64_t sub_2310D87E0(void ***a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend_removeElement_(**a1, a2, (uint64_t)a2, a4, a5);
}

uint64_t sub_2310D87F0(void ***a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend_containsElement_pValue_(**a1, a2, (uint64_t)a2, a3, a5);
}

uint64_t sub_2310D8804(void ***a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend_start(**a1, a2, a3, a4, a5);
}

uint64_t sub_2310D8810(void ***a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend_stop(**a1, a2, a3, a4, a5);
}

uint64_t sub_2310D881C(void ***a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend_setValueAvailableCallback_context_(**a1, a2, (uint64_t)a2, a3, a5);
}

uint64_t sub_2310D8830(void ***a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend_copyNextValue_(**a1, a2, (uint64_t)a2, a4, a5);
}

uint64_t sub_2310D8840(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x24BEDD108](a4, sel_queueCallback_msg_size_info_, a1, a2, a3);
}

void sub_2310D8950(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, objc_super a9)
{
  void *v9;

  a9.super_class = (Class)IOHIDQueueClass;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_2310D8988(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

void sub_2310D8B9C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_2310D8D94(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_2310D8FBC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_2310D9000(void *a1, uint64_t a2)
{
  void (*v3)(_QWORD, uint64_t, _QWORD, _QWORD *);
  _QWORD *v4;

  v4 = a1;
  v3 = (void (*)(_QWORD, uint64_t, _QWORD, _QWORD *))v4[17];
  if (v3)
    v3(v4[18], a2, v4[19], v4 + 16);

}

void sub_2310D9070(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_2310D91CC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t sub_2310D91E0(id **a1, _QWORD *a2)
{
  id v3;
  _QWORD *v4;
  uint64_t v5;

  v3 = **a1;
  v4 = v3;
  if (a2)
  {
    CFRetain(*((CFTypeRef *)v3 + 6));
    v5 = 0;
    *a2 = v4[6];
  }
  else
  {
    v5 = 3758097090;
  }

  return v5;
}

void sub_2310D924C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t sub_2310D925C(uint64_t a1)
{
  return *(_QWORD *)(**(_QWORD **)a1 + 48);
}

uint64_t sub_2310D9274(uint64_t a1, _DWORD *a2)
{
  *a2 = *(_DWORD *)(**(_QWORD **)a1 + 36);
  return 0;
}

uint64_t sub_2310D9294(uint64_t a1)
{
  return *(unsigned int *)(**(_QWORD **)a1 + 36);
}

uint64_t sub_2310D92AC()
{
  return 0;
}

uint64_t sub_2310D92B4()
{
  return 0;
}

uint64_t sub_2310D92BC(id **a1, uint64_t a2)
{
  id *v3;
  id WeakRetained;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t Element;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = (id *)**a1;
  WeakRetained = objc_loadWeakRetained(v3 + 3);
  Element = objc_msgSend_getElement_(WeakRetained, v5, a2, v6, v7);
  v12 = objc_msgSend_addElement_(v3, v9, Element, v10, v11);

  return v12;
}

void sub_2310D9328(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t sub_2310D933C(id **a1, uint64_t a2)
{
  id *v3;
  id WeakRetained;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t Element;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = (id *)**a1;
  WeakRetained = objc_loadWeakRetained(v3 + 3);
  Element = objc_msgSend_getElement_(WeakRetained, v5, a2, v6, v7);
  v12 = objc_msgSend_removeElement_(v3, v9, Element, v10, v11);

  return v12;
}

void sub_2310D93A8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t sub_2310D93BC(id **a1, uint64_t a2)
{
  id *v3;
  id WeakRetained;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t Element;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  unsigned __int8 v13;

  v3 = (id *)**a1;
  v13 = 0;
  WeakRetained = objc_loadWeakRetained(v3 + 3);
  Element = objc_msgSend_getElement_(WeakRetained, v5, a2, v6, v7);
  objc_msgSend_containsElement_pValue_(v3, v9, Element, (uint64_t)&v13, v10);

  v11 = v13;
  return v11;
}

void sub_2310D9438(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

uint64_t sub_2310D944C(void ***a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend_start(**a1, a2, a3, a4, a5);
}

uint64_t sub_2310D9458(void ***a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend_stop(**a1, a2, a3, a4, a5);
}

uint64_t sub_2310D9464(_QWORD **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x24BEDD108](**a1, sel_getNextEvent_, a2, a4, a5);
}

uint64_t sub_2310D9474(_QWORD **a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x24BEDD108](**a1, sel_setEventCallout_callbackTarget_callbackRefcon_, a2, a3, a4);
}

uint64_t sub_2310D948C()
{
  return 3758097095;
}

CFTypeRef IOHIDEventServiceFastPathClass::_copyProperty(IOHIDEventServiceFastPathClass *this, const __CFString *a2, const __CFString *a3)
{
  return IORegistryEntryCreateCFProperty(*(_DWORD *)(*((_QWORD *)this + 1) + 56), a2, (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
}

BOOL IOHIDEventServiceFastPathClass::_setProperty(IOHIDEventServiceFastPathClass **this, const __CFString *a2, const __CFString *a3, const void *a4)
{
  return IOHIDEventServiceFastPathClass::setProperty(this[1], a2, a3);
}

void IOHIDEventServiceFastPathClass::IOHIDEventServiceFastPathClass(IOHIDEventServiceFastPathClass *this)
{
  uint64_t v1;

  IOHIDIUnknown::IOHIDIUnknown(this, &IOHIDEventServiceFastPathClass::sIOCFPlugInInterfaceV1);
  *(_QWORD *)v1 = &off_24FFFA3D8;
  *(_QWORD *)(v1 + 32) = 0;
  *(_QWORD *)(v1 + 40) = v1;
  *(_QWORD *)(v1 + 48) = 0;
  *(_DWORD *)(v1 + 56) = 0;
  *(_QWORD *)(v1 + 64) = 0;
  *(_QWORD *)(v1 + 72) = 0;
}

{
  uint64_t v1;

  IOHIDIUnknown::IOHIDIUnknown(this, &IOHIDEventServiceFastPathClass::sIOCFPlugInInterfaceV1);
  *(_QWORD *)v1 = &off_24FFFA3D8;
  *(_QWORD *)(v1 + 32) = 0;
  *(_QWORD *)(v1 + 40) = v1;
  *(_QWORD *)(v1 + 48) = 0;
  *(_DWORD *)(v1 + 56) = 0;
  *(_QWORD *)(v1 + 64) = 0;
  *(_QWORD *)(v1 + 72) = 0;
}

uint64_t IOHIDEventServiceFastPathClass::probe(IOHIDEventServiceFastPathClass *this, const __CFDictionary *a2, io_object_t object, int *a4)
{
  uint64_t v4;

  v4 = 3758097090;
  if (object)
  {
    if (IOObjectConformsTo(object, "IOHIDEventService"))
      return 0;
    else
      return 3758097090;
  }
  return v4;
}

uint64_t IOHIDEventServiceFastPathClass::stop(IOHIDEventServiceFastPathClass *this)
{
  return 1;
}

CFTypeRef IOHIDEventServiceFastPathClass::copyProperty(IOHIDEventServiceFastPathClass *this, const __CFString *a2)
{
  return IORegistryEntryCreateCFProperty(*((_DWORD *)this + 14), a2, (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
}

BOOL IOHIDEventServiceFastPathClass::setProperty(IOHIDEventServiceFastPathClass *this, const __CFString *a2, const void *a3)
{
  kern_return_t v3;
  NSObject *v4;

  v3 = IOConnectSetCFProperty(*((_DWORD *)this + 13), a2, a3);
  if (v3)
  {
    v4 = _IOHIDLogCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_2310E1660();
  }
  return v3 == 0;
}

void sub_2310D964C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

uint64_t IOHIDAnalyticsGetConsoleModeStatus(void *a1)
{
  id v1;
  uint64_t v2;
  Class v3;
  Class v4;
  SEL Uid;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v15[4];
  id v16;

  v1 = a1;
  if (qword_255EB4AB0 != -1)
    dispatch_once(&qword_255EB4AB0, &unk_24FFFA460);
  v2 = 3758097084;
  if (qword_255EB4AA8)
  {
    v3 = NSClassFromString(CFSTR("GPProcessMonitor"));
    if (v3)
    {
      v4 = v3;
      Uid = sel_getUid("monitorForCurrentProcess");
      objc_msgSend_performSelector_(v4, v6, (uint64_t)Uid, v7, v8);
      v9 = objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v10 = (void *)v9;
        v15[0] = MEMORY[0x24BDAC760];
        v15[1] = 3221225472;
        v15[2] = sub_2310D9758;
        v15[3] = &unk_24FFFA420;
        v16 = v1;
        objc_msgSend_setUpdateHandler_(v10, v11, (uint64_t)v15, v12, v13);

        v2 = 0;
      }
    }
  }

  return v2;
}

uint64_t sub_2310D9758(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  SEL Uid;
  const char *v6;
  uint64_t v7;
  uint64_t v8;

  v4 = a3;
  Uid = sel_getUid("isIdentifiedGame");
  objc_msgSend_performSelector_(v4, v6, (uint64_t)Uid, v7, v8);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void *sub_2310D97B4()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/GamePolicy.framework/GamePolicy", 1);
  qword_255EB4AA8 = (uint64_t)result;
  return result;
}

void sub_2310DA7B0(uint64_t a1)
{
  id v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int isUpdated;
  const char *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 112);
  v4 = objc_msgSend_countByEnumeratingWithState_objects_count_(v2, v3, (uint64_t)&v30, (uint64_t)v34, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v31;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v31 != v6)
          objc_enumerationMutation(v2);
        v8 = *(id *)(*((_QWORD *)&v30 + 1) + 8 * v7);
        if ((objc_msgSend_isConstant(v8, v9, v10, v11, v12, (_QWORD)v30) & 1) == 0)
        {

LABEL_12:
          if (objc_msgSend_pollEventUpdate(*(void **)(a1 + 32), v25, v26, v27, v28))
          {
            v29 = *(_QWORD *)(a1 + 32);
            if (*(_QWORD *)(v29 + 136))
            {
              sub_2310DA974(*(void **)(v29 + 80), CFSTR("timer dispatchEvent"));
              (*(void (**)(_QWORD, _QWORD, _QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 32) + 136))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 144), 0, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 152), *(_QWORD *)(a1 + 32) + 24, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80));
            }
          }
          return;
        }
        isUpdated = objc_msgSend_isUpdated(v8, v13, v14, v15, v16);

        if (!isUpdated)
          goto LABEL_12;
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v2, v18, (uint64_t)&v30, (uint64_t)v34, 16);
      if (v5)
        continue;
      break;
    }
  }

  objc_msgSend_invalidate(*(void **)(*(_QWORD *)(a1 + 32) + 160), v19, v20, v21, v22);
  v23 = *(_QWORD *)(a1 + 32);
  v24 = *(void **)(v23 + 160);
  *(_QWORD *)(v23 + 160) = 0;

}

void sub_2310DA974(void *a1, void *a2)
{
  id v3;
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  int v19;
  id v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = a1;
  objc_msgSend_objectForKeyedSubscript_(v4, v5, (uint64_t)CFSTR("Debug Information"), v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend_mutableCopy(v4, v9, v10, v11, v12);

  objc_msgSend_removeObjectForKey_(v13, v14, (uint64_t)CFSTR("Debug Information"), v15, v16);
  _IOHIDLogCategory();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 138412546;
    v20 = v3;
    v21 = 2112;
    v22 = v13;
    _os_log_impl(&dword_2310D3000, v17, OS_LOG_TYPE_DEFAULT, "%@: %@", (uint8_t *)&v19, 0x16u);
  }

  if (v8)
  {
    _IOHIDLogCategory();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      sub_2310E17A4((uint64_t)v3, (uint64_t)v8, v18);

  }
}

uint64_t sub_2310DC7F4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x24BEDD108](a1, sel_valueAvailableCallback_, a2, a4, a5);
}

void sub_2310DCAC0(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  int isEqualToString;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void (*v40)(uint64_t, uint64_t, _QWORD);
  uint64_t v41;
  uint64_t v42;
  void (*v43)(uint64_t, uint64_t, uint64_t, _QWORD);
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  id obj;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v9 = (void *)objc_msgSend_copyElements_psKey_(*(void **)(a1 + 32), v7, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 120), (uint64_t)v5, v8);
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  obj = v9;
  v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v10, (uint64_t)&v55, (uint64_t)v59, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v56;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v56 != v13)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * v14);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v20 = objc_msgSend_integerValue(v6, v16, v17, v18, v19);
          if ((objc_msgSend_isEqualToString_(v5, v21, (uint64_t)CFSTR("Delayed Remove Power"), v22, v23) & 1) != 0
            || objc_msgSend_isEqualToString_(v5, v24, (uint64_t)CFSTR("Startup Delay"), v25, v26))
          {
            objc_msgSend_setIntegerValue_(v15, v24, 60 * v20, v25, v26);
          }
          else
          {
            isEqualToString = objc_msgSend_isEqualToString_(v5, v24, (uint64_t)CFSTR("Enable Audible Alarm"), v25, v26);
            v38 = 1;
            if (v20)
              v38 = 2;
            if (isEqualToString)
              objc_msgSend_setIntegerValue_(v15, v35, v38, v36, v37);
            else
              objc_msgSend_setIntegerValue_(v15, v35, v20, v36, v37);
          }
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            goto LABEL_18;
          objc_msgSend_setDataValue_(v15, v31, (uint64_t)v6, v32, v33);
        }
        v39 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48);
        v40 = *(void (**)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)v39 + 56);
        v41 = objc_msgSend_elementRef(v15, v27, v28, v29, v30);
        v40(v39, v41, 0);
        v42 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48);
        v43 = *(void (**)(uint64_t, uint64_t, uint64_t, _QWORD))(*(_QWORD *)v42 + 80);
        v48 = objc_msgSend_elementRef(v15, v44, v45, v46, v47);
        v53 = objc_msgSend_valueRef(v15, v49, v50, v51, v52);
        v43(v42, v48, v53, 0);
LABEL_18:
        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v31, (uint64_t)&v55, (uint64_t)v59, 16);
    }
    while (v12);
  }

}

uint64_t sub_2310DCF80(_QWORD **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x24BEDD108](**a1, sel_getProperties_, a2, a4, a5);
}

uint64_t sub_2310DCF90(_QWORD **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x24BEDD108](**a1, sel_getCapabilities_, a2, a4, a5);
}

uint64_t sub_2310DCFA0(_QWORD **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x24BEDD108](**a1, sel_getEvent_, a2, a4, a5);
}

uint64_t sub_2310DCFB0(_QWORD **a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x24BEDD108](**a1, sel_setEventCallback_target_refcon_, a2, a3, a4);
}

uint64_t sub_2310DCFC8(_QWORD **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x24BEDD108](**a1, sel_sendCommand_, a2, a4, a5);
}

uint64_t sub_2310DCFD8(_QWORD **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x24BEDD108](**a1, sel_createAsyncEventSource_, a2, a4, a5);
}

void sub_2310DD154(id *a1)
{

}

uint64_t sub_2310DDCFC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (*(_DWORD *)(a2 + 20) == 53)
    JUMPOUT(0x2348D0C4CLL);
  return MEMORY[0x24BEDD108](*(_QWORD *)(a4 + 80), sel_queueCallback_msg_size_info_, a1, a2, a3);
}

uint64_t sub_2310DDF2C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x24BEDD108](a1, sel_valueAvailableCallback_, a2, a4, a5);
}

void sub_2310DEEFC(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  int isEqualToString;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;

  v5 = a2;
  v6 = a3;
  v7 = (void *)MEMORY[0x2348D0F7C]();
  if (!objc_msgSend_isEqualToString_(v5, v8, (uint64_t)CFSTR("UsageMin"), v9, v10))
  {
    if (objc_msgSend_isEqualToString_(v5, v11, (uint64_t)CFSTR("UsageMax"), v12, v13))
    {
      objc_msgSend_propertyForElementKey_(*(void **)(a1 + 32), v19, (uint64_t)CFSTR("Usage"), v20, v21);
    }
    else
    {
      if (objc_msgSend_isEqualToString_(v5, v19, (uint64_t)CFSTR("ElementCookieMin"), v20, v21))
      {
        objc_msgSend_propertyForElementKey_(*(void **)(a1 + 32), v35, (uint64_t)CFSTR("ElementCookie"), v36, v37);
        goto LABEL_3;
      }
      isEqualToString = objc_msgSend_isEqualToString_(v5, v35, (uint64_t)CFSTR("ElementCookieMax"), v36, v37);
      v42 = *(void **)(a1 + 32);
      if (!isEqualToString)
      {
        objc_msgSend_propertyForElementKey_(v42, v38, (uint64_t)v5, v39, v40);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 4;
        objc_msgSend_expressionForKeyPath_(MEMORY[0x24BDD1548], v43, (uint64_t)v14, v44, v45);
        goto LABEL_7;
      }
      objc_msgSend_propertyForElementKey_(v42, v38, (uint64_t)CFSTR("ElementCookie"), v39, v40);
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 1;
    objc_msgSend_expressionForKeyPath_(MEMORY[0x24BDD1548], v22, (uint64_t)v14, v23, v24);
    goto LABEL_7;
  }
  objc_msgSend_propertyForElementKey_(*(void **)(a1 + 32), v11, (uint64_t)CFSTR("Usage"), v12, v13);
LABEL_3:
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 3;
  objc_msgSend_expressionForKeyPath_(MEMORY[0x24BDD1548], v16, (uint64_t)v14, v17, v18);
LABEL_7:
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_expressionForConstantValue_(MEMORY[0x24BDD1548], v26, (uint64_t)v6, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_predicateWithLeftExpression_rightExpression_modifier_type_options_(MEMORY[0x24BDD14B8], v30, (uint64_t)v25, (uint64_t)v29, 0, v15, 0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_filterUsingPredicate_(*(void **)(a1 + 40), v32, (uint64_t)v31, v33, v34);

  objc_autoreleasePoolPop(v7);
}

void sub_2310DFB38(unsigned int *a1, uint64_t a2, size_t __len, void *__src)
{
  void (*v5)(_QWORD, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  unsigned int v7;
  const char *v9;
  uint64_t v10;
  uint64_t v11;

  if (a1)
  {
    v5 = (void (*)(_QWORD, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))*((_QWORD *)a1 + 3);
    if (v5)
    {
      v7 = __len;
      if (__src)
      {
        if (*((_QWORD *)a1 + 5))
        {
          memmove(*((void **)a1 + 1), __src, __len);
          objc_msgSend_releaseReport_(*((void **)a1 + 5), v9, (uint64_t)__src, v10, v11);
          v5 = (void (*)(_QWORD, uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))*((_QWORD *)a1 + 3);
        }
      }
      v5(*((_QWORD *)a1 + 4), a2, *((_QWORD *)a1 + 6), *a1, a1[4], *((_QWORD *)a1 + 1), v7);
      free(a1);
    }
  }
}

uint64_t sub_2310E0054(_QWORD **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x24BEDD108](**a1, sel_open_, a2, a4, a5);
}

uint64_t sub_2310E0064(_QWORD **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x24BEDD108](**a1, sel_close_, a2, a4, a5);
}

uint64_t sub_2310E0074(_QWORD **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x24BEDD108](**a1, sel_getProperty_property_, a2, a3, a5);
}

uint64_t sub_2310E0088(_QWORD **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x24BEDD108](**a1, sel_setProperty_property_, a2, a3, a5);
}

uint64_t sub_2310E009C(_QWORD **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x24BEDD108](**a1, sel_getAsyncEventSource_, a2, a4, a5);
}

uint64_t sub_2310E00AC(_QWORD **a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x24BEDD108](**a1, sel_copyMatchingElements_elements_options_, a2, a3, a4);
}

uint64_t sub_2310E00C4(void ***a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return objc_msgSend_setValue_value_timeout_callback_context_options_(**a1, a2, (uint64_t)a2, a3, a4, a5, a6, a7);
}

uint64_t sub_2310E00E8(void ***a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return objc_msgSend_getValue_value_timeout_callback_context_options_(**a1, a2, (uint64_t)a2, a3, a4, a5, a6, a7);
}

uint64_t sub_2310E010C(_QWORD **a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x24BEDD108](**a1, sel_setInputReportCallback_reportLength_callback_context_options_, a2, a3, a4);
}

uint64_t sub_2310E012C(void ***a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  return objc_msgSend_setReport_reportID_report_reportLength_timeout_callback_context_options_(**a1, a2, (uint64_t)a2, a3, a4, a5, a6, a7, a8, a9);
}

uint64_t sub_2310E0178(void ***a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int a9)
{
  return objc_msgSend_getReport_reportID_report_reportLength_timeout_callback_context_options_(**a1, a2, (uint64_t)a2, a3, a4, a5, a6, a7, a8, a9);
}

uint64_t sub_2310E01C4(_QWORD **a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x24BEDD108](**a1, sel_setInputReportWithTimeStampCallback_reportLength_callback_context_options_, a2, a3, a4);
}

uint64_t (*sub_2310E0384())()
{
  void *v0;
  uint64_t (*result)();

  v0 = (void *)qword_255EB4AB8;
  if (!qword_255EB4AB8)
  {
    v0 = dlopen("/usr/lib/libRosetta.dylib", 2);
    qword_255EB4AB8 = (uint64_t)v0;
  }
  result = (uint64_t (*)())dlsym(v0, "rosetta_is_current_process_translated");
  off_255EB4A90 = result;
  if (result)
    return (uint64_t (*)())result();
  return result;
}

uint64_t sub_2310E03E0(uint64_t a1)
{
  void *v2;
  uint64_t (*v3)();

  v2 = (void *)qword_255EB4AB8;
  if (!qword_255EB4AB8)
  {
    v2 = dlopen("/usr/lib/libRosetta.dylib", 2);
    qword_255EB4AB8 = (uint64_t)v2;
  }
  v3 = (uint64_t (*)())dlsym(v2, "rosetta_convert_to_rosetta_absolute_time");
  off_255EB4A98 = v3;
  if (v3)
    return ((uint64_t (*)(uint64_t))v3)(a1);
  else
    return a1;
}

void sub_2310E077C(void *a1, uint64_t a2, int a3)
{
  _QWORD *v4;
  void *v5;
  void (*v6)(_QWORD, _QWORD, _QWORD, _QWORD *);
  _QWORD *v7;

  v4 = a1;
  v5 = v4;
  if (v4)
  {
    if (a3 == -536870896)
    {
      v6 = (void (*)(_QWORD, _QWORD, _QWORD, _QWORD *))v4[25];
      if (v6)
      {
        v7 = v4;
        v6(v4[26], 0, v4[27], v4 + 22);
        v5 = v7;
      }
    }
  }

}

_QWORD *sub_2310E0BC4(_QWORD *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t (*v7)(_QWORD, uint64_t, _QWORD, uint64_t, uint64_t);

  v7 = (uint64_t (*)(_QWORD, uint64_t, _QWORD, uint64_t, uint64_t))result[28];
  if (v7)
    return (_QWORD *)v7(result[29], a2, result[30], a3, a7);
  return result;
}

uint64_t sub_2310E0DC0(_QWORD ***a1, _QWORD *a2)
{
  _QWORD *v3;
  const void *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t result;

  if (!a2)
    return 3758097090;
  v3 = **a1;
  v4 = (const void *)v3[8];
  v5 = v3;
  CFRetain(v4);
  v6 = v5[8];

  result = 0;
  *a2 = v6;
  return result;
}

uint64_t sub_2310E0E30(uint64_t a1)
{
  return *(_QWORD *)(**(_QWORD **)a1 + 64);
}

uint64_t sub_2310E0E4C(uint64_t a1, _DWORD *a2)
{
  *a2 = *(_DWORD *)(**(_QWORD **)a1 + 48);
  return 0;
}

uint64_t sub_2310E0E70(uint64_t a1)
{
  return *(unsigned int *)(**(_QWORD **)a1 + 48);
}

uint64_t sub_2310E0E8C(_QWORD **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x24BEDD108](**a1, sel_open_, a2, a4, a5);
}

uint64_t sub_2310E0E9C(_QWORD **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x24BEDD108](**a1, sel_close_, 0, a4, a5);
}

uint64_t sub_2310E0EAC(_QWORD **a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x24BEDD108](**a1, sel_setRemovalCallback_removalTarget_removalRefcon_, a2, a3, a4);
}

uint64_t sub_2310E0EC4(_QWORD **a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x24BEDD108](**a1, sel_getElementValue_value_options_, a2, a3, 0);
}

uint64_t sub_2310E0EDC(_QWORD **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x24BEDD108](**a1, sel_setElementValue_value_, a2, a3, a5);
}

uint64_t sub_2310E0EF0(_QWORD **a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x24BEDD108](**a1, sel_getElementValue_value_options_, a2, a3, 0x20000);
}

uint64_t sub_2310E0F08(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend_start(*(void **)(**(_QWORD **)a1 + 80), a2, a3, a4, a5);
}

uint64_t sub_2310E0F24(uint64_t a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return objc_msgSend_stop(*(void **)(**(_QWORD **)a1 + 80), a2, a3, a4, a5);
}

uint64_t sub_2310E0F40(_QWORD **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x24BEDD108](**a1, sel_allocQueue, a3, a4, a5);
}

uint64_t sub_2310E0F4C(_QWORD **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x24BEDD108](**a1, sel_allocOutputTransaction, a3, a4, a5);
}

uint64_t sub_2310E0F58(void ***a1, const char *a2, uint64_t a3, uint64_t a4, unsigned int a5, uint64_t a6)
{
  int v7;

  v7 = 0;
  return objc_msgSend_setReport_reportID_report_reportLength_timeout_callback_context_options_(**a1, a2, (uint64_t)a2, a3, a4, a5, a6, 0, 0, v7);
}

uint64_t sub_2310E0FA0(void ***a1, uint64_t a2, uint64_t a3, uint64_t a4, _DWORD *a5, uint64_t a6)
{
  void *v10;
  id v12;
  const char *v13;
  uint64_t Report_reportID_report_reportLength_timeout_callback_context_options;
  id v15;
  const char *v16;
  int v18;
  int v19;
  uint64_t v20;

  v10 = **a1;
  if (a5)
  {
    v20 = *a5;
    v12 = v10;
    v18 = 0;
    Report_reportID_report_reportLength_timeout_callback_context_options = objc_msgSend_getReport_reportID_report_reportLength_timeout_callback_context_options_(v12, v13, a2, a3, a4, &v20, a6, 0, 0, v18);
    *a5 = v20;
  }
  else
  {
    v20 = 0;
    v15 = v10;
    v19 = 0;
    Report_reportID_report_reportLength_timeout_callback_context_options = objc_msgSend_getReport_reportID_report_reportLength_timeout_callback_context_options_(v15, v16, a2, a3, a4, &v20, a6, 0, 0, v19);
  }

  return Report_reportID_report_reportLength_timeout_callback_context_options;
}

uint64_t sub_2310E1068(_QWORD **a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return MEMORY[0x24BEDD108](**a1, sel_copyMatchingElements_element_, a2, a3, a5);
}

uint64_t sub_2310E107C(_QWORD **a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return MEMORY[0x24BEDD108](**a1, sel_setInterruptReportHandlerCallback_reportBufferSize_callback_callbackTarget_callbackRefcon_, a2, a3, a4);
}

void sub_2310E1114()
{
  uint64_t v0;
  os_log_t v1;
  uint64_t v2;
  int v3;

  sub_2310D72E0(*MEMORY[0x24BDAC8D0]);
  sub_2310D72A4();
  sub_2310D7290(&dword_2310D3000, v0, v1, "kIOHIDLibUserClientPostElementValues(%#llx):%#x\n", v2, v3);
  sub_2310D72C8();
}

void sub_2310E1174()
{
  uint64_t v0;
  os_log_t v1;
  uint64_t v2;
  int v3;

  sub_2310D72E0(*MEMORY[0x24BDAC8D0]);
  sub_2310D72A4();
  sub_2310D7290(&dword_2310D3000, v0, v1, "setValue(%#llx):%#x\n", v2, v3);
  sub_2310D72C8();
}

void sub_2310E11D4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_2310D72D0(&dword_2310D3000, a2, a3, "Unable to copy back value for element, unexpected size(%d)\n", a5, a6, a7, a8, 0);
}

void sub_2310E1244(uint64_t a1, void *a2, NSObject *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6;
  uint8_t v7[24];

  sub_2310D72EC(a1, a2, (uint64_t)a3, a4, a5);
  sub_2310D72FC();
  sub_2310D72BC(&dword_2310D3000, a3, v6, "Unable to copy back value for element, unexpected cookie(%ld) expected:%d\n", v7);
  sub_2310D7314();
}

void sub_2310E12B4()
{
  uint64_t v0;
  os_log_t v1;
  uint64_t v2;
  int v3;

  sub_2310D72E0(*MEMORY[0x24BDAC8D0]);
  sub_2310D72A4();
  sub_2310D7290(&dword_2310D3000, v0, v1, "kIOHIDLibUserClientUpdateElementValues(%#llx):%#x\n", v2, v3);
  sub_2310D72C8();
}

void sub_2310E1314()
{
  uint64_t v0;
  os_log_t v1;
  uint64_t v2;
  int v3;

  sub_2310D72E0(*MEMORY[0x24BDAC8D0]);
  sub_2310D72A4();
  sub_2310D7290(&dword_2310D3000, v0, v1, "getValue(%#llx):%#x\n", v2, v3);
  sub_2310D72C8();
}

void sub_2310E1374()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_fault_impl(&dword_2310D3000, MEMORY[0x24BDACB70], OS_LOG_TYPE_FAULT, "Over Release IOHIDIUnknown Reference", v0, 2u);
}

void sub_2310E13B8(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2310D3000, log, OS_LOG_TYPE_ERROR, "Unable to create queue analytics\n", v1, 2u);
}

void sub_2310E13F8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2310D9640();
  sub_2310D72D0(&dword_2310D3000, v0, v1, "IOConnectGetService(kIOHIDEventServiceFastPathUserClientType): 0x%x\n", v2, v3, v4, v5, v6);
  sub_2310D9638();
}

void sub_2310E1458()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2310D9640();
  sub_2310D72D0(&dword_2310D3000, v0, v1, "IOServiceOpen(kIOHIDEventServiceFastPathUserClientType): 0x%x\n", v2, v3, v4, v5, v6);
  sub_2310D9638();
}

void sub_2310E14B8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2310D9640();
  sub_2310D72D0(&dword_2310D3000, v0, v1, "IOHIDEventServiceFastPathClass failed to retain service object with err %x\n", v2, v3, v4, v5, v6);
  sub_2310D9638();
}

void sub_2310E1518(int *a1, int a2, os_log_t log)
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
  _os_log_error_impl(&dword_2310D3000, log, OS_LOG_TYPE_ERROR, "IOConnectMapMemory (sharedMemorySize:%d): 0x%x\n", (uint8_t *)v4, 0xEu);
}

void sub_2310E15A0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2310D9640();
  sub_2310D72D0(&dword_2310D3000, v0, v1, "IOConnectCallMethod (kIOHIDEventServiceFastPathUserClientOpen): 0x%x\n", v2, v3, v4, v5, v6);
  sub_2310D9638();
}

void sub_2310E1600()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2310D9640();
  sub_2310D72D0(&dword_2310D3000, v0, v1, "IOConnectCallMethod (kIOHIDEventServiceFastPathUserClientClose): 0x%x\n", v2, v3, v4, v5, v6);
  sub_2310D9638();
}

void sub_2310E1660()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2310D9640();
  sub_2310D72D0(&dword_2310D3000, v0, v1, "IOConnectSetCFProperty: 0x%x\n", v2, v3, v4, v5, v6);
  sub_2310D9638();
}

void sub_2310E16C0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_2310D964C(&dword_2310D3000, a1, a3, "No shared memory\n", a5, a6, a7, a8, 0);
  sub_2310D9638();
}

void sub_2310E16F0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_2310D964C(&dword_2310D3000, a1, a3, "Invalid argument (pEvent = null)\n", a5, a6, a7, a8, 0);
  sub_2310D9638();
}

void sub_2310E1720(uint64_t a1, int a2, os_log_t log)
{
  _DWORD v3[2];
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3[0] = 67109378;
  v3[1] = a2;
  v4 = 2112;
  v5 = a1;
  _os_log_error_impl(&dword_2310D3000, log, OS_LOG_TYPE_ERROR, "IOConnectCallMethod (kIOHIDEventServiceFastPathUserClientCopyEvent): 0x%x (copySpec = %@)\n", (uint8_t *)v3, 0x12u);
}

void sub_2310E17A4(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_debug_impl(&dword_2310D3000, log, OS_LOG_TYPE_DEBUG, "%@: %@", (uint8_t *)&v3, 0x16u);
}

void sub_2310E1828()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2310DD184();
  sub_2310D964C(&dword_2310D3000, v0, v1, "Invalid transaction", v2, v3, v4, v5, v6);
  sub_2310D9638();
}

void sub_2310E1854()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2310D9640();
  sub_2310D72D0(&dword_2310D3000, v0, v1, "Failed to commit input element transaction with error %x", v2, v3, v4, v5, v6);
  sub_2310D9638();
}

void sub_2310E18B4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2310D9640();
  sub_2310D72D0(&dword_2310D3000, v0, v1, "Failed to set transaction direction %x", v2, v3, v4, v5, v6);
  sub_2310D9638();
}

void sub_2310E1914()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2310DD184();
  sub_2310D964C(&dword_2310D3000, v0, v1, "deviceProperties not valid", v2, v3, v4, v5, v6);
  sub_2310D9638();
}

void sub_2310E1940()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2310DD184();
  sub_2310D964C(&dword_2310D3000, v0, v1, "Plugin not valid", v2, v3, v4, v5, v6);
  sub_2310D9638();
}

void sub_2310E196C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2310DD184();
  sub_2310D964C(&dword_2310D3000, v0, v1, "Device not valid", v2, v3, v4, v5, v6);
  sub_2310D9638();
}

void sub_2310E1998()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2310DD184();
  sub_2310D964C(&dword_2310D3000, v0, v1, "Elements not valid", v2, v3, v4, v5, v6);
  sub_2310D9638();
}

void sub_2310E19C4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2310DD184();
  sub_2310D964C(&dword_2310D3000, v0, v1, "Queue not valid", v2, v3, v4, v5, v6);
  sub_2310D9638();
}

void sub_2310E19F0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2310DD184();
  sub_2310D964C(&dword_2310D3000, v0, v1, "Transaction not valid", v2, v3, v4, v5, v6);
  sub_2310D9638();
}

void sub_2310E1A1C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2310D9640();
  sub_2310D72D0(&dword_2310D3000, v0, v1, "Failed to get transaction interface with error %d", v2, v3, v4, v5, v6);
  sub_2310D9638();
}

void sub_2310E1A7C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2310D9640();
  sub_2310D72D0(&dword_2310D3000, v0, v1, "Failed to get queue interface with error %d", v2, v3, v4, v5, v6);
  sub_2310D9638();
}

void sub_2310E1ADC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2310D9640();
  sub_2310D72D0(&dword_2310D3000, v0, v1, "Failed to copy matching elements with error %x", v2, v3, v4, v5, v6);
  sub_2310D9638();
}

void sub_2310E1B3C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2310D9640();
  sub_2310D72D0(&dword_2310D3000, v0, v1, "Failed to open device with error %x", v2, v3, v4, v5, v6);
  sub_2310D9638();
}

void sub_2310E1B9C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2310D9640();
  sub_2310D72D0(&dword_2310D3000, v0, v1, "Failed to get device interface with error %d", v2, v3, v4, v5, v6);
  sub_2310D9638();
}

void sub_2310E1BFC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2310D9640();
  sub_2310D72D0(&dword_2310D3000, v0, v1, "Failed to create plugin interface with error %x", v2, v3, v4, v5, v6);
  sub_2310D9638();
}

void sub_2310E1C5C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2310D9640();
  sub_2310D72D0(&dword_2310D3000, v0, v1, "Failed to query properties with error %x", v2, v3, v4, v5, v6);
  sub_2310D9638();
}

void sub_2310E1CBC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2310D9640();
  sub_2310D72D0(&dword_2310D3000, v0, v1, "IOConnectCallMethod(kIOHIDLibUserClientGetElements):%x\n", v2, v3, v4, v5, v6);
  sub_2310D9638();
}

void sub_2310E1D1C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2310D9640();
  sub_2310D72D0(&dword_2310D3000, v0, v1, "IOConnectCallScalarMethod(kIOHIDLibUserClientGetElementCount):%x\n", v2, v3, v4, v5, v6);
  sub_2310D9638();
}

void sub_2310E1D7C(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2310D3000, log, OS_LOG_TYPE_ERROR, "Failed to create queue\n", v1, 2u);
  sub_2310D9638();
}

void sub_2310E1DB8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2310D9640();
  sub_2310D72D0(&dword_2310D3000, v0, v1, "IOServiceOpen failed: 0x%x\n", v2, v3, v4, v5, v6);
  sub_2310D9638();
}

void sub_2310E1E18()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2310D9640();
  sub_2310D72D0(&dword_2310D3000, v0, v1, "IOHIDDeviceClass failed to retain service object with err %x\n", v2, v3, v4, v5, v6);
  sub_2310D9638();
}

void sub_2310E1E78()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_2310D9640();
  sub_2310D72D0(&dword_2310D3000, v0, v1, "IOConnectCallMethod(kIOHIDLibUserClientOpen):%x\n", v2, v3, v4, v5, v6);
  sub_2310D9638();
}

void sub_2310E1ED8(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_2310D3000, log, OS_LOG_TYPE_ERROR, "Unsupported matching criteria: %@ %@\n", (uint8_t *)&v3, 0x16u);
}

void sub_2310E1F5C(uint64_t *a1, int a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4 = 134218240;
  v5 = v3;
  v6 = 1024;
  v7 = a2;
  _os_log_error_impl(&dword_2310D3000, log, OS_LOG_TYPE_ERROR, "kIOHIDLibUserClientPostElementValues(%llx):%x\n", (uint8_t *)&v4, 0x12u);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x24BDBBCB0](allocator, capacity);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x24BDBBCE0](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x24BDBBCF8](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x24BDBBD08]();
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x24BDBBE68](cf1, cf2);
}

CFIndex CFGetRetainCount(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEE8](cf);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

CFRunLoopSourceRef CFMachPortCreateRunLoopSource(CFAllocatorRef allocator, CFMachPortRef port, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x24BDBBFB0](allocator, port, order);
}

CFMachPortRef CFMachPortCreateWithPort(CFAllocatorRef allocator, mach_port_t portNum, CFMachPortCallBack callout, CFMachPortContext *context, Boolean *shouldFreeInfo)
{
  return (CFMachPortRef)MEMORY[0x24BDBBFB8](allocator, *(_QWORD *)&portNum, callout, context, shouldFreeInfo);
}

void CFMachPortInvalidate(CFMachPortRef port)
{
  MEMORY[0x24BDBBFD0](port);
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

CFPropertyListRef CFPropertyListCreateDeepCopy(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFOptionFlags mutabilityOption)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC1C8](allocator, propertyList, mutabilityOption);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
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

CFDataRef IOCFSerialize(CFTypeRef object, CFOptionFlags options)
{
  return (CFDataRef)MEMORY[0x24BDD7EB8](object, options);
}

kern_return_t IOConnectCallAsyncMethod(mach_port_t connection, uint32_t selector, mach_port_t wake_port, uint64_t *reference, uint32_t referenceCnt, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x24BDD7EE0](*(_QWORD *)&connection, *(_QWORD *)&selector, *(_QWORD *)&wake_port, reference, *(_QWORD *)&referenceCnt, input, *(_QWORD *)&inputCnt, inputStruct);
}

kern_return_t IOConnectCallAsyncScalarMethod(mach_port_t connection, uint32_t selector, mach_port_t wake_port, uint64_t *reference, uint32_t referenceCnt, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return MEMORY[0x24BDD7EE8](*(_QWORD *)&connection, *(_QWORD *)&selector, *(_QWORD *)&wake_port, reference, *(_QWORD *)&referenceCnt, input, *(_QWORD *)&inputCnt, output);
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x24BDD7EF8](*(_QWORD *)&connection, *(_QWORD *)&selector, input, *(_QWORD *)&inputCnt, inputStruct, inputStructCnt, output, outputCnt);
}

kern_return_t IOConnectCallScalarMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return MEMORY[0x24BDD7F00](*(_QWORD *)&connection, *(_QWORD *)&selector, input, *(_QWORD *)&inputCnt, output, outputCnt);
}

kern_return_t IOConnectGetService(io_connect_t connect, io_service_t *service)
{
  return MEMORY[0x24BDD7F10](*(_QWORD *)&connect, service);
}

kern_return_t IOConnectMapMemory(io_connect_t connect, uint32_t memoryType, task_port_t intoTask, mach_vm_address_t *atAddress, mach_vm_size_t *ofSize, IOOptionBits options)
{
  return MEMORY[0x24BDD7F18](*(_QWORD *)&connect, *(_QWORD *)&memoryType, *(_QWORD *)&intoTask, atAddress, ofSize, *(_QWORD *)&options);
}

kern_return_t IOConnectSetCFProperty(io_connect_t connect, CFStringRef propertyName, CFTypeRef property)
{
  return MEMORY[0x24BDD7F38](*(_QWORD *)&connect, propertyName, property);
}

kern_return_t IOConnectUnmapMemory(io_connect_t connect, uint32_t memoryType, task_port_t fromTask, mach_vm_address_t atAddress)
{
  return MEMORY[0x24BDD7F80](*(_QWORD *)&connect, *(_QWORD *)&memoryType, *(_QWORD *)&fromTask, atAddress);
}

kern_return_t IOCreatePlugInInterfaceForService(io_service_t service, CFUUIDRef pluginType, CFUUIDRef interfaceType, IOCFPlugInInterface ***theInterface, SInt32 *theScore)
{
  return MEMORY[0x24BDD7F90](*(_QWORD *)&service, pluginType, interfaceType, theInterface, theScore);
}

mach_port_t IODataQueueAllocateNotificationPort(void)
{
  return MEMORY[0x24BDD7FA0]();
}

IOReturn IODataQueueDequeue(IODataQueueMemory *dataQueue, void *data, uint32_t *dataSize)
{
  return MEMORY[0x24BDD7FB0](dataQueue, data, dataSize);
}

IODataQueueEntry *__cdecl IODataQueuePeek(IODataQueueMemory *dataQueue)
{
  return (IODataQueueEntry *)MEMORY[0x24BDD7FB8](dataQueue);
}

void IODispatchCalloutFromMessage(void *unused, mach_msg_header_t *msg, void *reference)
{
  MEMORY[0x24BDD7FD8](unused, msg, reference);
}

uint64_t IOHIDAnalyticsEventActivate()
{
  return MEMORY[0x24BDD7FE8]();
}

uint64_t IOHIDAnalyticsEventCancel()
{
  return MEMORY[0x24BDD7FF0]();
}

uint64_t IOHIDAnalyticsHistogramEventCreate()
{
  return MEMORY[0x24BDD7FF8]();
}

uint64_t IOHIDAnalyticsHistogramEventSetIntegerValue()
{
  return MEMORY[0x24BDD8000]();
}

IOHIDElementCollectionType IOHIDElementGetCollectionType(IOHIDElementRef element)
{
  return MEMORY[0x24BDD80C8](element);
}

IOHIDElementCookie IOHIDElementGetCookie(IOHIDElementRef element)
{
  return MEMORY[0x24BDD80D0](element);
}

uint32_t IOHIDElementGetReportID(IOHIDElementRef element)
{
  return MEMORY[0x24BDD8108](element);
}

IOHIDElementType IOHIDElementGetType(IOHIDElementRef element)
{
  return MEMORY[0x24BDD8118](element);
}

uint32_t IOHIDElementGetUnit(IOHIDElementRef element)
{
  return MEMORY[0x24BDD8120](element);
}

uint32_t IOHIDElementGetUnitExponent(IOHIDElementRef element)
{
  return MEMORY[0x24BDD8128](element);
}

uint32_t IOHIDElementGetUsage(IOHIDElementRef element)
{
  return MEMORY[0x24BDD8130](element);
}

uint32_t IOHIDElementGetUsagePage(IOHIDElementRef element)
{
  return MEMORY[0x24BDD8138](element);
}

uint64_t IOHIDEventCreateWithBytesInternal()
{
  return MEMORY[0x24BDD8250]();
}

IOHIDValueRef IOHIDValueCreateWithBytes(CFAllocatorRef allocator, IOHIDElementRef element, uint64_t timeStamp, const uint8_t *bytes, CFIndex length)
{
  return (IOHIDValueRef)MEMORY[0x24BDD8620](allocator, element, timeStamp, bytes, length);
}

IOHIDValueRef IOHIDValueCreateWithIntegerValue(CFAllocatorRef allocator, IOHIDElementRef element, uint64_t timeStamp, CFIndex value)
{
  return (IOHIDValueRef)MEMORY[0x24BDD8628](allocator, element, timeStamp, value);
}

const uint8_t *__cdecl IOHIDValueGetBytePtr(IOHIDValueRef value)
{
  return (const uint8_t *)MEMORY[0x24BDD8630](value);
}

IOHIDElementRef IOHIDValueGetElement(IOHIDValueRef value)
{
  return (IOHIDElementRef)MEMORY[0x24BDD8638](value);
}

CFIndex IOHIDValueGetIntegerValue(IOHIDValueRef value)
{
  return MEMORY[0x24BDD8640](value);
}

CFIndex IOHIDValueGetLength(IOHIDValueRef value)
{
  return MEMORY[0x24BDD8648](value);
}

uint64_t IOHIDValueGetTimeStamp(IOHIDValueRef value)
{
  return MEMORY[0x24BDD8658](value);
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

BOOLean_t IOObjectConformsTo(io_object_t object, const io_name_t className)
{
  return MEMORY[0x24BDD86B8](*(_QWORD *)&object, className);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x24BDD86F8](*(_QWORD *)&object);
}

kern_return_t IOObjectRetain(io_object_t object)
{
  return MEMORY[0x24BDD8700](*(_QWORD *)&object);
}

kern_return_t IORegistryEntryCreateCFProperties(io_registry_entry_t entry, CFMutableDictionaryRef *properties, CFAllocatorRef allocator, IOOptionBits options)
{
  return MEMORY[0x24BDD88A8](*(_QWORD *)&entry, properties, allocator, *(_QWORD *)&options);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x24BDD88B0](*(_QWORD *)&entry, key, allocator, *(_QWORD *)&options);
}

kern_return_t IORegistryEntryGetRegistryEntryID(io_registry_entry_t entry, uint64_t *entryID)
{
  return MEMORY[0x24BDD8910](*(_QWORD *)&entry, entryID);
}

CFTypeRef IORegistryEntrySearchCFProperty(io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x24BDD8928](*(_QWORD *)&entry, plane, key, allocator, *(_QWORD *)&options);
}

kern_return_t IOServiceAddInterestNotification(IONotificationPortRef notifyPort, io_service_t service, const io_name_t interestType, IOServiceInterestCallback callback, void *refCon, io_object_t *notification)
{
  return MEMORY[0x24BDD8958](notifyPort, *(_QWORD *)&service, interestType, callback, refCon, notification);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x24BDD8970](*(_QWORD *)&connect);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x24BDD89B8](*(_QWORD *)&service, *(_QWORD *)&owningTask, *(_QWORD *)&type, connect);
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

uint64_t _IOHIDElementCreateWithParentAndData()
{
  return MEMORY[0x24BDD8A58]();
}

uint64_t _IOHIDElementGetLength()
{
  return MEMORY[0x24BDD8A60]();
}

uint64_t _IOHIDElementGetValue()
{
  return MEMORY[0x24BDD8A68]();
}

uint64_t _IOHIDElementSetDeviceInterface()
{
  return MEMORY[0x24BDD8A70]();
}

uint64_t _IOHIDElementSetValue()
{
  return MEMORY[0x24BDD8A78]();
}

uint64_t _IOHIDLogCategory()
{
  return MEMORY[0x24BDD8AB0]();
}

uint64_t _IOHIDValueCopyToElementValueHeader()
{
  return MEMORY[0x24BDD8AB8]();
}

uint64_t _IOHIDValueCreateWithElementValuePtr()
{
  return MEMORY[0x24BDD8AC0]();
}

uint64_t _IOHIDValueCreateWithStruct()
{
  return MEMORY[0x24BDD8AC8]();
}

uint64_t _IOHIDValueGetFlags()
{
  return MEMORY[0x24BDD8AD0]();
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
  return off_24FFFA0E8();
}

uint64_t operator new()
{
  return off_24FFFA0F0();
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x24BEDB910](a1);
}

double __exp10(double a1)
{
  double result;

  MEMORY[0x24BDAC7D8](a1);
  return result;
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

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x24BDAE070](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x24BDAEB30]();
}

kern_return_t mach_port_mod_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return MEMORY[0x24BDAEBF8](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&right, *(_QWORD *)&delta);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
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

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x24BEDCFD8](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
  MEMORY[0x24BEDD020](dest, src, size, atomic, hasStrong);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_end_catch(void)
{
  MEMORY[0x24BEDD050]();
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

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3E0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

uint64_t os_unfair_recursive_lock_lock_with_options()
{
  return MEMORY[0x24BDAF490]();
}

uint64_t os_unfair_recursive_lock_unlock()
{
  return MEMORY[0x24BDAF4A8]();
}

SEL sel_getUid(const char *str)
{
  return (SEL)MEMORY[0x24BEDD508](str);
}

