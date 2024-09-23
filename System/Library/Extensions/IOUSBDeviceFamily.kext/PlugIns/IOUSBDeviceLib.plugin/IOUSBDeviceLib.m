uint64_t IOUSBDeviceLibFactory(uint64_t a1, const void *a2)
{
  CFUUIDRef v3;
  IOUSBDeviceInterfaceClass *v4;

  v3 = CFUUIDGetConstantUUIDWithBytes(0, 0x9Eu, 0x72u, 0x21u, 0x7Eu, 0x8Au, 0x60u, 0x11u, 0xDBu, 0xBFu, 0x57u, 0, 0xDu, 0x93u, 0x6Du, 6u, 0xD2u);
  v4 = (IOUSBDeviceInterfaceClass *)CFEqual(a2, v3);
  if ((_DWORD)v4)
    return IOUSBDeviceInterfaceClass::alloc(v4);
  else
    return 0;
}

void IOUSBDeviceIUnknown::factoryAddRef(IOUSBDeviceIUnknown *this)
{
  CFUUIDRef v2;

  if (!IOUSBDeviceIUnknown::factoryRefCount++)
  {
    v2 = CFUUIDGetConstantUUIDWithBytes(0, 0xD9u, 0x5Cu, 0xE1u, 0xD0u, 0x8Bu, 0xCCu, 0x11u, 0xDBu, 0xADu, 0, 0, 0xDu, 0x93u, 0x6Du, 6u, 0xD2u);
    CFRetain(v2);
    CFPlugInAddInstanceForFactory(v2);
  }
}

void IOUSBDeviceIUnknown::factoryRelease(IOUSBDeviceIUnknown *this)
{
  int v1;
  const __CFUUID *v2;

  v1 = IOUSBDeviceIUnknown::factoryRefCount--;
  if (IOUSBDeviceIUnknown::factoryRefCount)
  {
    if (v1 <= 0)
      IOUSBDeviceIUnknown::factoryRefCount = 0;
  }
  else
  {
    v2 = CFUUIDGetConstantUUIDWithBytes(0, 0xD9u, 0x5Cu, 0xE1u, 0xD0u, 0x8Bu, 0xCCu, 0x11u, 0xDBu, 0xADu, 0, 0, 0xDu, 0x93u, 0x6Du, 6u, 0xD2u);
    CFPlugInRemoveInstanceForFactory(v2);
    CFRelease(v2);
  }
}

void IOUSBDeviceIUnknown::IOUSBDeviceIUnknown(IOUSBDeviceIUnknown *this, void *a2)
{
  *(_QWORD *)this = off_24FFFCF50;
  *((_DWORD *)this + 2) = 1;
  *((_QWORD *)this + 2) = a2;
  *((_QWORD *)this + 3) = this;
  IOUSBDeviceIUnknown::factoryAddRef(this);
}

void IOUSBDeviceIUnknown::~IOUSBDeviceIUnknown(IOUSBDeviceIUnknown *this)
{
  *(_QWORD *)this = off_24FFFCF50;
  IOUSBDeviceIUnknown::factoryRelease(this);
}

void sub_2310E97F0(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

uint64_t IOUSBDeviceIUnknown::addRef(IOUSBDeviceIUnknown *this)
{
  uint64_t v1;

  v1 = (*((_DWORD *)this + 2) + 1);
  *((_DWORD *)this + 2) = v1;
  return v1;
}

uint64_t IOUSBDeviceIUnknown::release(IOUSBDeviceIUnknown *this)
{
  int v1;
  uint64_t v2;

  v1 = *((_DWORD *)this + 2);
  v2 = (v1 - 1);
  if (v1 == 1)
  {
    *((_DWORD *)this + 2) = 0;
    (*(void (**)(IOUSBDeviceIUnknown *))(*(_QWORD *)this + 8))(this);
  }
  else
  {
    *((_DWORD *)this + 2) = v2;
  }
  return v2;
}

uint64_t IOUSBDeviceIUnknown::genericQueryInterface(IOUSBDeviceIUnknown *this, void *a2, CFUUIDBytes a3, void **a4)
{
  return (*(uint64_t (**)(_QWORD, void *, _QWORD, _QWORD))(**((_QWORD **)this + 1) + 16))(*((_QWORD *)this + 1), a2, *(_QWORD *)&a3.byte0, *(_QWORD *)&a3.byte8);
}

uint64_t IOUSBDeviceIUnknown::genericAddRef(IOUSBDeviceIUnknown *this, void *a2)
{
  return (*(uint64_t (**)(_QWORD))(**((_QWORD **)this + 1) + 24))(*((_QWORD *)this + 1));
}

uint64_t IOUSBDeviceIUnknown::genericRelease(IOUSBDeviceIUnknown *this, void *a2)
{
  return (*(uint64_t (**)(_QWORD))(**((_QWORD **)this + 1) + 32))(*((_QWORD *)this + 1));
}

uint64_t IOUSBDeviceInterfaceClass::_probe(IOUSBDeviceInterfaceClass *this, void *a2, const __CFDictionary *a3, unsigned int a4, int *a5)
{
  return (*(uint64_t (**)(_QWORD, void *, const __CFDictionary *))(**((_QWORD **)this + 1) + 40))(*((_QWORD *)this + 1), a2, a3);
}

uint64_t IOUSBDeviceInterfaceClass::_start(IOUSBDeviceInterfaceClass *this, void *a2, const __CFDictionary *a3)
{
  return (*(uint64_t (**)(_QWORD, void *, const __CFDictionary *))(**((_QWORD **)this + 1) + 48))(*((_QWORD *)this + 1), a2, a3);
}

uint64_t IOUSBDeviceInterfaceClass::_stop(IOUSBDeviceInterfaceClass *this, void *a2)
{
  return (*(uint64_t (**)(_QWORD))(**((_QWORD **)this + 1) + 56))(*((_QWORD *)this + 1));
}

uint64_t IOUSBDeviceInterfaceClass::_open(IOUSBDeviceInterfaceClass *this, void *a2)
{
  return (*(uint64_t (**)(_QWORD, void *))(**((_QWORD **)this + 1) + 64))(*((_QWORD *)this + 1), a2);
}

uint64_t IOUSBDeviceInterfaceClass::_close(IOUSBDeviceInterfaceClass *this, void *a2)
{
  return (*(uint64_t (**)(_QWORD, void *))(**((_QWORD **)this + 1) + 72))(*((_QWORD *)this + 1), a2);
}

uint64_t IOUSBDeviceInterfaceClass::_scheduleWithRunLoop(IOUSBDeviceInterfaceClass *this, void *a2, __CFRunLoop *a3, const __CFString *a4)
{
  return (*(uint64_t (**)(_QWORD, void *, __CFRunLoop *))(**((_QWORD **)this + 1) + 80))(*((_QWORD *)this + 1), a2, a3);
}

uint64_t IOUSBDeviceInterfaceClass::_unscheduleFromRunLoop(IOUSBDeviceInterfaceClass *this, void *a2, __CFRunLoop *a3, const __CFString *a4)
{
  return (*(uint64_t (**)(_QWORD, void *, __CFRunLoop *))(**((_QWORD **)this + 1) + 88))(*((_QWORD *)this + 1), a2, a3);
}

uint64_t IOUSBDeviceInterfaceClass::_setClassCommandCallbacks(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 8) + 272))(*(_QWORD *)(a1 + 8));
}

uint64_t IOUSBDeviceInterfaceClass::_setMessageCallback(IOUSBDeviceInterfaceClass *this, void *a2, void (*a3)(void *, unsigned int, void *, void *), void *a4, void *a5)
{
  return (*(uint64_t (**)(_QWORD, void *, _QWORD, void *))(**((_QWORD **)this + 1) + 168))(*((_QWORD *)this + 1), a2, a3, a4);
}

uint64_t IOUSBDeviceInterfaceClass::_setDescription(IOUSBDeviceInterfaceClass *this, void *a2, const __CFString *a3)
{
  return (*(uint64_t (**)(_QWORD, void *))(**((_QWORD **)this + 1) + 104))(*((_QWORD *)this + 1), a2);
}

uint64_t IOUSBDeviceInterfaceClass::_setClassForAlternateSetting(IOUSBDeviceInterfaceClass *this, void *a2)
{
  return (*(uint64_t (**)(_QWORD, void *))(**((_QWORD **)this + 1) + 112))(*((_QWORD *)this + 1), a2);
}

uint64_t IOUSBDeviceInterfaceClass::_setSubClassForAlternateSetting(IOUSBDeviceInterfaceClass *this, void *a2)
{
  return (*(uint64_t (**)(_QWORD, void *))(**((_QWORD **)this + 1) + 120))(*((_QWORD *)this + 1), a2);
}

uint64_t IOUSBDeviceInterfaceClass::_setProtocolForAlternateSetting(IOUSBDeviceInterfaceClass *this, void *a2)
{
  return (*(uint64_t (**)(_QWORD, void *))(**((_QWORD **)this + 1) + 128))(*((_QWORD *)this + 1), a2);
}

uint64_t IOUSBDeviceInterfaceClass::_appendStandardClassOrVendorDescriptor(IOUSBDeviceInterfaceClass *this, void *a2, uint64_t a3, unsigned __int8 *a4)
{
  return (*(uint64_t (**)(_QWORD, void *, uint64_t, unsigned __int8 *))(**((_QWORD **)this + 1) + 136))(*((_QWORD *)this + 1), a2, a3, a4);
}

uint64_t IOUSBDeviceInterfaceClass::_appendNonStandardClassOrVendorDescriptor(IOUSBDeviceInterfaceClass *this, void *a2, uint64_t a3, unsigned __int8 *a4)
{
  return (*(uint64_t (**)(_QWORD, void *, uint64_t, unsigned __int8 *))(**((_QWORD **)this + 1) + 144))(*((_QWORD *)this + 1), a2, a3, a4);
}

uint64_t IOUSBDeviceInterfaceClass::_createPipe(IOUSBDeviceInterfaceClass *this, void *a2, int a3, int a4, int a5, int a6, int a7, int a8, unint64_t *a9)
{
  return (*(uint64_t (**)(_QWORD, void *))(**((_QWORD **)this + 1) + 160))(*((_QWORD *)this + 1), a2);
}

uint64_t IOUSBDeviceInterfaceClass::_commitConfiguration(IOUSBDeviceInterfaceClass *this, void *a2)
{
  return (*(uint64_t (**)(_QWORD))(**((_QWORD **)this + 1) + 152))(*((_QWORD *)this + 1));
}

uint64_t IOUSBDeviceInterfaceClass::_setAlternateSetting(IOUSBDeviceInterfaceClass *this, void *a2)
{
  return (*(uint64_t (**)(_QWORD, void *))(**((_QWORD **)this + 1) + 176))(*((_QWORD *)this + 1), a2);
}

uint64_t IOUSBDeviceInterfaceClass::_readPipe(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 8) + 192))(*(_QWORD *)(a1 + 8));
}

uint64_t IOUSBDeviceInterfaceClass::_readPipeAsync(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 8) + 200))(*(_QWORD *)(a1 + 8));
}

uint64_t IOUSBDeviceInterfaceClass::_writePipe(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 8) + 216))(*(_QWORD *)(a1 + 8));
}

uint64_t IOUSBDeviceInterfaceClass::_writePipeAsync(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 8) + 224))(*(_QWORD *)(a1 + 8));
}

uint64_t IOUSBDeviceInterfaceClass::_stallPipe(IOUSBDeviceInterfaceClass *this, void *a2)
{
  return (*(uint64_t (**)(_QWORD, void *))(**((_QWORD **)this + 1) + 240))(*((_QWORD *)this + 1), a2);
}

uint64_t IOUSBDeviceInterfaceClass::_abortPipe(IOUSBDeviceInterfaceClass *this, void *a2)
{
  return (*(uint64_t (**)(_QWORD, void *))(**((_QWORD **)this + 1) + 248))(*((_QWORD *)this + 1), a2);
}

uint64_t IOUSBDeviceInterfaceClass::_getPipeCurrentMaxPacketSize(IOUSBDeviceInterfaceClass *this, void *a2, unint64_t a3, int *a4)
{
  return (*(uint64_t (**)(_QWORD, void *))(**((_QWORD **)this + 1) + 256))(*((_QWORD *)this + 1), a2);
}

uint64_t IOUSBDeviceInterfaceClass::_createData(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 8) + 264))(*(_QWORD *)(a1 + 8));
}

uint64_t IOUSBDeviceInterfaceClass::_isActivated(IOUSBDeviceInterfaceClass *this, void *a2, int *a3, int *a4)
{
  return (*(uint64_t (**)(_QWORD, void *, int *))(**((_QWORD **)this + 1) + 184))(*((_QWORD *)this + 1), a2, a3);
}

uint64_t IOUSBDeviceInterfaceClass::_registerForDemandLaunch(IOUSBDeviceInterfaceClass *this, void *a2, const __CFString *a3)
{
  return (*(uint64_t (**)(_QWORD, void *))(**((_QWORD **)this + 1) + 96))(*((_QWORD *)this + 1), a2);
}

uint64_t IOUSBDeviceInterfaceClass::_readIsochPipeAsync(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 8) + 208))(*(_QWORD *)(a1 + 8));
}

uint64_t IOUSBDeviceInterfaceClass::_writeIsochPipeAsync(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 8) + 232))(*(_QWORD *)(a1 + 8));
}

uint64_t IOUSBDeviceInterfaceClass::_unlockConfiguration(IOUSBDeviceInterfaceClass *this, void *a2)
{
  return (*(uint64_t (**)(_QWORD, void *))(**((_QWORD **)this + 1) + 280))(*((_QWORD *)this + 1), a2);
}

uint64_t IOUSBDeviceInterfaceClass::_readPipeTO(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 8) + 288))(*(_QWORD *)(a1 + 8));
}

uint64_t IOUSBDeviceInterfaceClass::_readPipeAsyncTO(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 8) + 296))(*(_QWORD *)(a1 + 8));
}

uint64_t IOUSBDeviceInterfaceClass::_writePipeTO(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 8) + 304))(*(_QWORD *)(a1 + 8));
}

uint64_t IOUSBDeviceInterfaceClass::_writePipeAsyncTO(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 8) + 312))(*(_QWORD *)(a1 + 8));
}

uint64_t IOUSBDeviceInterfaceClass::_isActive(IOUSBDeviceInterfaceClass *this, void *a2, int *a3, int *a4)
{
  return (*(uint64_t (**)(_QWORD, void *, int *))(**((_QWORD **)this + 1) + 320))(*((_QWORD *)this + 1), a2, a3);
}

uint64_t IOUSBDeviceInterfaceClass::_findPipe(IOUSBDeviceInterfaceClass *this, void *a2, int a3, int a4, int a5, unint64_t *a6)
{
  return (*(uint64_t (**)(_QWORD, void *))(**((_QWORD **)this + 1) + 328))(*((_QWORD *)this + 1), a2);
}

uint64_t IOUSBDeviceInterfaceClass::_mapIOBuffer(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 8) + 336))(*(_QWORD *)(a1 + 8));
}

uint64_t IOUSBDeviceInterfaceClass::_setPipeProperty(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)(a1 + 8) + 344))(*(_QWORD *)(a1 + 8));
}

uint64_t IOUSBDeviceInterfaceClass::_reportTimeout(IOUSBDeviceInterfaceClass *this, void *a2)
{
  return (*(uint64_t (**)(_QWORD, void *))(**((_QWORD **)this + 1) + 352))(*((_QWORD *)this + 1), a2);
}

void IOUSBDeviceInterfaceClass::IOUSBDeviceInterfaceClass(IOUSBDeviceInterfaceClass *this)
{
  uint64_t v1;

  IOUSBDeviceIUnknown::IOUSBDeviceIUnknown(this, &IOUSBDeviceInterfaceClass::sIOCFPlugInInterfaceV1);
  *(_QWORD *)v1 = &off_24FFFCF98;
  *(_QWORD *)(v1 + 32) = &IOUSBDeviceInterfaceClass::sIOUSBDeviceInterfaceInterface;
  *(_QWORD *)(v1 + 40) = v1;
  *(_QWORD *)(v1 + 48) = 0;
  *(_DWORD *)(v1 + 56) = 0;
  *(_QWORD *)(v1 + 64) = 0;
  *(_DWORD *)(v1 + 72) = 0;
  *(_QWORD *)(v1 + 80) = 0;
  *(_QWORD *)(v1 + 88) = 0;
  *(_DWORD *)(v1 + 96) = 0;
  *(_OWORD *)(v1 + 104) = 0u;
  *(_OWORD *)(v1 + 120) = 0u;
  *(_DWORD *)(v1 + 136) = 0;
  *(_OWORD *)(v1 + 144) = 0u;
  *(_OWORD *)(v1 + 160) = 0u;
  *(_OWORD *)(v1 + 176) = 0u;
  *(_OWORD *)(v1 + 192) = 0u;
  *(_OWORD *)(v1 + 208) = 0u;
  *(_OWORD *)(v1 + 224) = 0u;
  *(_QWORD *)(v1 + 240) = 0;
}

{
  uint64_t v1;

  IOUSBDeviceIUnknown::IOUSBDeviceIUnknown(this, &IOUSBDeviceInterfaceClass::sIOCFPlugInInterfaceV1);
  *(_QWORD *)v1 = &off_24FFFCF98;
  *(_QWORD *)(v1 + 32) = &IOUSBDeviceInterfaceClass::sIOUSBDeviceInterfaceInterface;
  *(_QWORD *)(v1 + 40) = v1;
  *(_QWORD *)(v1 + 48) = 0;
  *(_DWORD *)(v1 + 56) = 0;
  *(_QWORD *)(v1 + 64) = 0;
  *(_DWORD *)(v1 + 72) = 0;
  *(_QWORD *)(v1 + 80) = 0;
  *(_QWORD *)(v1 + 88) = 0;
  *(_DWORD *)(v1 + 96) = 0;
  *(_OWORD *)(v1 + 104) = 0u;
  *(_OWORD *)(v1 + 120) = 0u;
  *(_DWORD *)(v1 + 136) = 0;
  *(_OWORD *)(v1 + 144) = 0u;
  *(_OWORD *)(v1 + 160) = 0u;
  *(_OWORD *)(v1 + 176) = 0u;
  *(_OWORD *)(v1 + 192) = 0u;
  *(_OWORD *)(v1 + 208) = 0u;
  *(_OWORD *)(v1 + 224) = 0u;
  *(_QWORD *)(v1 + 240) = 0;
}

void IOUSBDeviceInterfaceClass::~IOUSBDeviceInterfaceClass(IOUSBDeviceInterfaceClass *this)
{
  io_connect_t v2;
  io_object_t v3;
  uint64_t v4;
  __CFMachPort *v5;
  __CFRunLoopSource *v6;
  mach_port_name_t v7;
  ipc_space_t *v8;
  __CFMachPort *v9;
  __CFRunLoopSource *v10;
  mach_port_name_t v11;
  uint64_t v12;
  __CFMachPort *v13;
  __CFRunLoopSource *v14;
  mach_port_name_t v15;
  io_object_t v16;
  IONotificationPort *v17;

  *(_QWORD *)this = &off_24FFFCF98;
  v2 = *((_DWORD *)this + 13);
  if (v2)
  {
    IOServiceClose(v2);
    *((_DWORD *)this + 13) = 0;
  }
  v3 = *((_DWORD *)this + 12);
  if (v3)
  {
    IOObjectRelease(v3);
    *((_DWORD *)this + 12) = 0;
  }
  v4 = *((_QWORD *)this + 15);
  if (v4)
    (*(void (**)(IOUSBDeviceInterfaceClass *, uint64_t, _QWORD))(*(_QWORD *)this + 88))(this, v4, *((_QWORD *)this + 16));
  v5 = (__CFMachPort *)*((_QWORD *)this + 10);
  if (v5)
  {
    CFMachPortInvalidate(v5);
    CFRelease(*((CFTypeRef *)this + 10));
    *((_QWORD *)this + 10) = 0;
  }
  v6 = (__CFRunLoopSource *)*((_QWORD *)this + 11);
  if (v6)
  {
    CFRunLoopSourceInvalidate(v6);
    CFRelease(*((CFTypeRef *)this + 11));
    *((_QWORD *)this + 11) = 0;
  }
  v7 = *((_DWORD *)this + 18);
  v8 = (ipc_space_t *)MEMORY[0x24BDAEC58];
  if (v7)
  {
    mach_port_mod_refs(*MEMORY[0x24BDAEC58], v7, 1u, -1);
    *((_DWORD *)this + 18) = 0;
  }
  v9 = (__CFMachPort *)*((_QWORD *)this + 13);
  if (v9)
  {
    CFMachPortInvalidate(v9);
    CFRelease(*((CFTypeRef *)this + 13));
    *((_QWORD *)this + 13) = 0;
  }
  v10 = (__CFRunLoopSource *)*((_QWORD *)this + 14);
  if (v10)
  {
    CFRunLoopSourceInvalidate(v10);
    CFRelease(*((CFTypeRef *)this + 14));
    *((_QWORD *)this + 14) = 0;
  }
  v11 = *((_DWORD *)this + 24);
  if (v11)
  {
    mach_port_mod_refs(*v8, v11, 1u, -1);
    *((_DWORD *)this + 24) = 0;
  }
  v12 = *((_QWORD *)this + 20);
  if (v12)
    (*(void (**)(IOUSBDeviceInterfaceClass *, uint64_t, _QWORD))(*(_QWORD *)this + 88))(this, v12, *((_QWORD *)this + 21));
  v13 = (__CFMachPort *)*((_QWORD *)this + 18);
  if (v13)
  {
    CFMachPortInvalidate(v13);
    CFRelease(*((CFTypeRef *)this + 18));
    *((_QWORD *)this + 18) = 0;
  }
  v14 = (__CFRunLoopSource *)*((_QWORD *)this + 19);
  if (v14)
  {
    CFRunLoopSourceInvalidate(v14);
    CFRelease(*((CFTypeRef *)this + 19));
    *((_QWORD *)this + 19) = 0;
  }
  v15 = *((_DWORD *)this + 34);
  if (v15)
  {
    mach_port_mod_refs(*v8, v15, 1u, -1);
    *((_DWORD *)this + 34) = 0;
  }
  v16 = *((_DWORD *)this + 14);
  if (v16)
  {
    IOObjectRelease(v16);
    *((_DWORD *)this + 14) = 0;
  }
  v17 = (IONotificationPort *)*((_QWORD *)this + 8);
  if (v17)
  {
    IONotificationPortDestroy(v17);
    *((_QWORD *)this + 8) = 0;
  }
  IOUSBDeviceIUnknown::~IOUSBDeviceIUnknown(this);
}

{
  IOUSBDeviceInterfaceClass::~IOUSBDeviceInterfaceClass(this);
  JUMPOUT(0x2348D1378);
}

void IOUSBDeviceInterfaceClass::_handleAsyncCallback(IOUSBDeviceInterfaceClass *this, __CFMachPort *a2, void *a3, uint64_t a4, void *a5)
{
  if (*((_DWORD *)a2 + 5) == 53)
    JUMPOUT(0x2348D12D0);
}

_QWORD *IOUSBDeviceInterfaceClass::_interestCallback(_QWORD *this, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t (*v5)(_QWORD, uint64_t, uint64_t, _QWORD);

  v5 = (uint64_t (*)(_QWORD, uint64_t, uint64_t, _QWORD))this[28];
  if (v5)
    return (_QWORD *)v5(this[29], a3, a4, this[30]);
  return this;
}

uint64_t IOUSBDeviceInterfaceClass::alloc(IOUSBDeviceInterfaceClass *this)
{
  uint64_t v1;
  uint64_t result;

  v1 = operator new();
  IOUSBDeviceIUnknown::IOUSBDeviceIUnknown((IOUSBDeviceIUnknown *)v1, &IOUSBDeviceInterfaceClass::sIOCFPlugInInterfaceV1);
  *(_QWORD *)v1 = &off_24FFFCF98;
  *(_QWORD *)(v1 + 32) = &IOUSBDeviceInterfaceClass::sIOUSBDeviceInterfaceInterface;
  *(_QWORD *)(v1 + 40) = v1;
  *(_QWORD *)(v1 + 48) = 0;
  *(_DWORD *)(v1 + 56) = 0;
  *(_QWORD *)(v1 + 64) = 0;
  *(_DWORD *)(v1 + 72) = 0;
  *(_QWORD *)(v1 + 80) = 0;
  *(_QWORD *)(v1 + 88) = 0;
  *(_DWORD *)(v1 + 96) = 0;
  *(_OWORD *)(v1 + 104) = 0u;
  *(_OWORD *)(v1 + 120) = 0u;
  *(_DWORD *)(v1 + 136) = 0;
  *(_OWORD *)(v1 + 144) = 0u;
  *(_OWORD *)(v1 + 160) = 0u;
  *(_OWORD *)(v1 + 176) = 0u;
  *(_OWORD *)(v1 + 192) = 0u;
  *(_OWORD *)(v1 + 208) = 0u;
  *(_OWORD *)(v1 + 224) = 0u;
  result = v1 + 16;
  *(_QWORD *)(v1 + 240) = 0;
  return result;
}

void sub_2310E9E74(_Unwind_Exception *a1)
{
  uint64_t v1;

  MEMORY[0x2348D1378](v1, 0x10E1C4056AD659BLL);
  _Unwind_Resume(a1);
}

uint64_t IOUSBDeviceInterfaceClass::queryInterface(IOUSBDeviceInterfaceClass *this, CFUUIDBytes a2, void **a3)
{
  CFUUIDRef v5;
  CFUUIDRef v6;
  CFUUIDRef v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  CFUUIDRef v12;

  v5 = CFUUIDCreateFromUUIDBytes(0, a2);
  v6 = CFUUIDGetConstantUUIDWithBytes((CFAllocatorRef)*MEMORY[0x24BDBD260], 0, 0, 0, 0, 0, 0, 0, 0, 0xC0u, 0, 0, 0, 0, 0, 0, 0x46u);
  if (CFEqual(v5, v6)
    || (v7 = CFUUIDGetConstantUUIDWithBytes(0, 0xC2u, 0x44u, 0xE8u, 0x58u, 0x10u, 0x9Cu, 0x11u, 0xD4u, 0x91u, 0xD4u, 0, 0x50u, 0xE4u, 0xC6u, 0x42u, 0x6Fu), CFEqual(v5, v7)))
  {
    v8 = (char *)this + 16;
    v9 = *(_QWORD *)this;
LABEL_4:
    *a3 = v8;
    (*(void (**)(IOUSBDeviceInterfaceClass *))(v9 + 24))(this);
    goto LABEL_5;
  }
  v12 = CFUUIDGetConstantUUIDWithBytes(0, 0xEAu, 0x33u, 0xBAu, 0x4Fu, 0x8Au, 0x60u, 0x11u, 0xDBu, 0x84u, 0xDBu, 0, 0xDu, 0x93u, 0x6Du, 6u, 0xD2u);
  if (CFEqual(v5, v12))
  {
    v8 = (char *)this + 32;
    v9 = *(_QWORD *)this;
    goto LABEL_4;
  }
  *a3 = 0;
LABEL_5:
  if (*a3)
    v10 = 0;
  else
    v10 = 2147483652;
  CFRelease(v5);
  return v10;
}

uint64_t IOUSBDeviceInterfaceClass::probe(IOUSBDeviceInterfaceClass *this, const __CFDictionary *a2, io_object_t object, int *a4)
{
  uint64_t v4;

  v4 = 3758097090;
  if (object)
  {
    if (IOObjectConformsTo(object, "IOUSBDeviceInterface"))
      return 0;
    else
      return 3758097090;
  }
  return v4;
}

uint64_t IOUSBDeviceInterfaceClass::start(IOUSBDeviceInterfaceClass *this, const __CFDictionary *a2, io_object_t object)
{
  uint64_t v4;
  io_object_t v5;
  IONotificationPortRef v6;

  *((_DWORD *)this + 12) = object;
  IOObjectRetain(object);
  v4 = IOServiceOpen(*((_DWORD *)this + 12), *MEMORY[0x24BDAEC58], 0, (io_connect_t *)this + 13);
  if (!(_DWORD)v4)
  {
    v4 = 3758097084;
    if (*((_DWORD *)this + 13))
    {
      v6 = IONotificationPortCreate(*MEMORY[0x24BDD8B18]);
      *((_QWORD *)this + 8) = v6;
      if (v6)
        return 0;
      v4 = 3758097085;
    }
  }
  v5 = *((_DWORD *)this + 12);
  if (v5)
  {
    IOObjectRelease(v5);
    *((_DWORD *)this + 12) = 0;
  }
  return v4;
}

uint64_t IOUSBDeviceInterfaceClass::stop(IOUSBDeviceInterfaceClass *this)
{
  return 0;
}

uint64_t IOUSBDeviceInterfaceClass::open(IOUSBDeviceInterfaceClass *this, unsigned int a2)
{
  uint64_t result;
  uint64_t v4;
  uint32_t outputCnt;

  outputCnt = 0;
  v4 = a2;
  result = IOConnectCallScalarMethod(*((_DWORD *)this + 13), 0, &v4, 1u, 0, &outputCnt);
  if (!(_DWORD)result)
    return IOServiceAddInterestNotification(*((IONotificationPortRef *)this + 8), *((_DWORD *)this + 12), "IOGeneralInterest", (IOServiceInterestCallback)IOUSBDeviceInterfaceClass::_interestCallback, this, (io_object_t *)this + 14);
  return result;
}

uint64_t IOUSBDeviceInterfaceClass::close(IOUSBDeviceInterfaceClass *this, unsigned int a2)
{
  io_object_t v3;
  uint64_t v5;
  uint32_t outputCnt;

  outputCnt = 0;
  v5 = a2;
  v3 = *((_DWORD *)this + 14);
  if (v3)
  {
    IOObjectRelease(v3);
    *((_DWORD *)this + 14) = 0;
  }
  return IOConnectCallScalarMethod(*((_DWORD *)this + 13), 1u, &v5, 1u, 0, &outputCnt);
}

uint64_t IOUSBDeviceInterfaceClass::scheduleWithRunLoop(mach_port_t *recvPort, CFRunLoopRef rl, CFRunLoopMode mode)
{
  __CFRunLoopSource *RunLoopSource;
  __CFRunLoopSource *v7;
  CFTypeRef v8;
  mach_port_t v9;
  mach_port_t *v10;
  uint64_t v11;
  __CFMachPort *v12;
  CFTypeRef v13;
  Boolean shouldFreeInfo;
  CFMachPortContext context;

  RunLoopSource = (__CFRunLoopSource *)*((_QWORD *)recvPort + 11);
  if (RunLoopSource)
    goto LABEL_21;
  context.version = 0;
  context.info = 0;
  shouldFreeInfo = -86;
  v10 = recvPort + 18;
  v9 = recvPort[18];
  if (!v9)
  {
    v11 = IOCreateReceivePort(0x35u, recvPort + 18);
    if ((_DWORD)v11)
      return v11;
    v9 = *v10;
    if (!*v10)
      return 3758097085;
  }
  context.version = 1;
  context.info = recvPort;
  v11 = 3758097085;
  memset(&context.retain, 0, 24);
  v12 = CFMachPortCreateWithPort(0, v9, (CFMachPortCallBack)IOUSBDeviceInterfaceClass::_handleAsyncCallback, &context, &shouldFreeInfo);
  *((_QWORD *)recvPort + 10) = v12;
  if (v12)
  {
    RunLoopSource = CFMachPortCreateRunLoopSource(0, v12, 0);
    *((_QWORD *)recvPort + 11) = RunLoopSource;
    if (RunLoopSource)
    {
LABEL_21:
      if (*((_QWORD *)recvPort + 15))
      {
        (*(void (**)(mach_port_t *, _QWORD, _QWORD))(*(_QWORD *)recvPort + 88))(recvPort, *((_QWORD *)recvPort + 15), *((_QWORD *)recvPort + 16));
        RunLoopSource = (__CFRunLoopSource *)*((_QWORD *)recvPort + 11);
      }
      CFRunLoopAddSource(rl, RunLoopSource, mode);
      v7 = IONotificationPortGetRunLoopSource(*((IONotificationPortRef *)recvPort + 8));
      CFRunLoopAddSource(rl, v7, mode);
      if (rl)
        v8 = CFRetain(rl);
      else
        v8 = 0;
      *((_QWORD *)recvPort + 15) = v8;
      if (mode)
        v13 = CFRetain(mode);
      else
        v13 = 0;
      v11 = 0;
      *((_QWORD *)recvPort + 16) = v13;
    }
  }
  return v11;
}

uint64_t IOUSBDeviceInterfaceClass::unscheduleFromRunLoop(CFRunLoopSourceRef *this, CFRunLoopRef rl, const __CFString *a3)
{
  CFRunLoopMode *v4;
  CFRunLoopSourceRef v5;
  __CFRunLoop *v6;
  __CFRunLoopSource *RunLoopSource;
  CFRunLoopSourceRef v8;

  if (this[15] == rl)
  {
    v4 = (CFRunLoopMode *)(this + 16);
    CFRunLoopRemoveSource(rl, this[11], (CFRunLoopMode)this[16]);
    v6 = this[15];
    RunLoopSource = IONotificationPortGetRunLoopSource(this[8]);
    CFRunLoopRemoveSource(v6, RunLoopSource, *v4);
    v8 = this[15];
    if (v8)
    {
      CFRelease(v8);
      this[15] = 0;
    }
  }
  else
  {
    if (this[20] != rl)
      return 0;
    v4 = (CFRunLoopMode *)(this + 21);
    CFRunLoopRemoveSource(rl, this[19], (CFRunLoopMode)this[21]);
    v5 = this[20];
    if (v5)
    {
      CFRelease(v5);
      this[20] = 0;
    }
  }
  if (*v4)
  {
    CFRelease(*v4);
    *v4 = 0;
  }
  return 0;
}

uint64_t IOUSBDeviceInterfaceClass::setDescription(IOUSBDeviceInterfaceClass *this, CFStringRef theString)
{
  __int128 v3;
  size_t v4;
  _OWORD v6[16];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  *(_QWORD *)&v3 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v6[14] = v3;
  v6[15] = v3;
  v6[12] = v3;
  v6[13] = v3;
  v6[10] = v3;
  v6[11] = v3;
  v6[8] = v3;
  v6[9] = v3;
  v6[6] = v3;
  v6[7] = v3;
  v6[4] = v3;
  v6[5] = v3;
  v6[2] = v3;
  v6[3] = v3;
  v6[0] = v3;
  v6[1] = v3;
  if (!theString)
  {
    v4 = 0;
    return IOConnectCallStructMethod(*((_DWORD *)this + 13), 2u, v6, v4, 0, 0);
  }
  if (CFStringGetCString(theString, (char *)v6, 256, 0x8000100u))
  {
    v4 = strlen((const char *)v6);
    return IOConnectCallStructMethod(*((_DWORD *)this + 13), 2u, v6, v4, 0, 0);
  }
  return 3758096385;
}

uint64_t IOUSBDeviceInterfaceClass::setClassForAlternateSetting(IOUSBDeviceInterfaceClass *this, unsigned int a2, unsigned int a3)
{
  uint64_t input[3];

  input[2] = *MEMORY[0x24BDAC8D0];
  input[0] = a2;
  input[1] = a3;
  return IOConnectCallScalarMethod(*((_DWORD *)this + 13), 3u, input, 2u, 0, 0);
}

uint64_t IOUSBDeviceInterfaceClass::setSubClassForAlternateSetting(IOUSBDeviceInterfaceClass *this, unsigned int a2, unsigned int a3)
{
  uint64_t input[3];

  input[2] = *MEMORY[0x24BDAC8D0];
  input[0] = a2;
  input[1] = a3;
  return IOConnectCallScalarMethod(*((_DWORD *)this + 13), 4u, input, 2u, 0, 0);
}

uint64_t IOUSBDeviceInterfaceClass::setProtocolForAlternateSetting(IOUSBDeviceInterfaceClass *this, unsigned int a2, unsigned int a3)
{
  uint64_t input[3];

  input[2] = *MEMORY[0x24BDAC8D0];
  input[0] = a2;
  input[1] = a3;
  return IOConnectCallScalarMethod(*((_DWORD *)this + 13), 5u, input, 2u, 0, 0);
}

uint64_t IOUSBDeviceInterfaceClass::appendStandardClassOrVendorDescriptor(IOUSBDeviceInterfaceClass *this, unsigned int a2, unsigned __int8 *inputStruct, size_t inputStructCnt, unsigned int a5)
{
  uint64_t input[3];

  input[2] = *MEMORY[0x24BDAC8D0];
  input[0] = a2;
  input[1] = a5;
  return IOConnectCallMethod(*((_DWORD *)this + 13), 6u, input, 2u, inputStruct, inputStructCnt, 0, 0, 0, 0);
}

uint64_t IOUSBDeviceInterfaceClass::appendNonStandardClassOrVendorDescriptor(IOUSBDeviceInterfaceClass *this, unsigned int a2, unsigned __int8 *inputStruct, size_t inputStructCnt, unsigned int a5)
{
  uint64_t input[3];

  input[2] = *MEMORY[0x24BDAC8D0];
  input[0] = a2;
  input[1] = a5;
  return IOConnectCallMethod(*((_DWORD *)this + 13), 7u, input, 2u, inputStruct, inputStructCnt, 0, 0, 0, 0);
}

uint64_t IOUSBDeviceInterfaceClass::commitConfiguration(IOUSBDeviceInterfaceClass *this)
{
  return IOConnectCallScalarMethod(*((_DWORD *)this + 13), 0xBu, 0, 0, 0, 0);
}

uint64_t IOUSBDeviceInterfaceClass::unlockConfiguration(IOUSBDeviceInterfaceClass *this, unsigned int a2)
{
  uint64_t v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = a2;
  return IOConnectCallScalarMethod(*((_DWORD *)this + 13), 0x17u, v3, 1u, 0, 0);
}

uint64_t IOUSBDeviceInterfaceClass::createPipe(IOUSBDeviceInterfaceClass *this, int a2, int a3, int a4, int a5, int a6, int a7, unint64_t *a8)
{
  uint64_t result;
  uint32_t outputCnt;
  uint64_t output;
  uint64_t input[7];

  input[6] = *MEMORY[0x24BDAC8D0];
  input[0] = a2;
  input[1] = a3;
  input[2] = a4;
  input[3] = a5;
  input[4] = a6;
  input[5] = a7;
  output = 0;
  outputCnt = 1;
  if (!a8)
    return 3758097090;
  result = IOConnectCallScalarMethod(*((_DWORD *)this + 13), 0xAu, input, 6u, &output, &outputCnt);
  if (!(_DWORD)result)
    *a8 = output;
  return result;
}

uint64_t IOUSBDeviceInterfaceClass::findPipe(IOUSBDeviceInterfaceClass *this, int a2, int a3, int a4, unint64_t *a5)
{
  uint64_t result;
  uint32_t outputCnt;
  uint64_t output;
  uint64_t input[4];

  input[3] = *MEMORY[0x24BDAC8D0];
  input[0] = a2;
  input[1] = a3;
  input[2] = a4;
  output = 0;
  outputCnt = 1;
  if (!a5)
    return 3758097090;
  result = IOConnectCallScalarMethod(*((_DWORD *)this + 13), 0x19u, input, 3u, &output, &outputCnt);
  if (!(_DWORD)result)
    *a5 = output;
  return result;
}

uint64_t IOUSBDeviceInterfaceClass::setClassCommandCallbacks(mach_port_t *recvPort, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, CFRunLoopRef rl, CFRunLoopMode mode)
{
  mach_port_t v16;
  uint64_t v17;
  __CFRunLoopSource *RunLoopSource;
  CFTypeRef v19;
  mach_port_t v20;
  mach_port_t *v21;
  uint64_t v22;
  __CFMachPort *v23;
  Boolean shouldFreeInfo[8];
  _BOOL8 v26;
  _BOOL8 v27;
  _BYTE context[48];
  __int128 v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v16 = recvPort[18];
  v17 = *((_QWORD *)recvPort + 20);
  if (v17)
    (*(void (**)(mach_port_t *, uint64_t, _QWORD))(*(_QWORD *)recvPort + 88))(recvPort, v17, *((_QWORD *)recvPort + 21));
  if (!rl)
    goto LABEL_13;
  RunLoopSource = (__CFRunLoopSource *)*((_QWORD *)recvPort + 19);
  if (RunLoopSource)
    goto LABEL_5;
  *(_QWORD *)context = 0;
  *(_QWORD *)&context[8] = 0;
  shouldFreeInfo[0] = -86;
  v21 = recvPort + 34;
  v20 = recvPort[34];
  if (!v20)
  {
    v22 = IOCreateReceivePort(0x35u, recvPort + 34);
    if ((_DWORD)v22)
      return v22;
    v20 = *v21;
    if (!*v21)
      return 3758097085;
  }
  *(_QWORD *)context = 1;
  *(_QWORD *)&context[8] = recvPort;
  v22 = 3758097085;
  memset(&context[16], 0, 24);
  v23 = CFMachPortCreateWithPort(0, v20, (CFMachPortCallBack)IOUSBDeviceInterfaceClass::_handleAsyncCallback, (CFMachPortContext *)context, shouldFreeInfo);
  *((_QWORD *)recvPort + 18) = v23;
  if (v23)
  {
    RunLoopSource = CFMachPortCreateRunLoopSource(0, v23, 0);
    *((_QWORD *)recvPort + 19) = RunLoopSource;
    if (RunLoopSource)
    {
LABEL_5:
      CFRunLoopAddSource(rl, RunLoopSource, mode);
      *((_QWORD *)recvPort + 20) = CFRetain(rl);
      if (mode)
        v19 = CFRetain(mode);
      else
        v19 = 0;
      *((_QWORD *)recvPort + 21) = v19;
      v16 = recvPort[34];
LABEL_13:
      *((_QWORD *)recvPort + 25) = a4;
      *((_QWORD *)recvPort + 26) = a6;
      *((_QWORD *)recvPort + 22) = a5;
      *((_QWORD *)recvPort + 23) = a2;
      *((_QWORD *)recvPort + 24) = a3;
      *(_QWORD *)context = 0;
      memset(&context[24], 0, 24);
      v29 = 0u;
      *(_QWORD *)&context[8] = IOUSBDeviceInterfaceClass::_classCommandCallbacksHandler;
      *(_QWORD *)&context[16] = recvPort;
      *(_QWORD *)shouldFreeInfo = a2 != 0;
      v26 = a3 != 0;
      v27 = a4 != 0;
      return IOConnectCallAsyncMethod(recvPort[13], 8u, v16, (uint64_t *)context, 3u, (const uint64_t *)shouldFreeInfo, 3u, 0, 0, 0, 0, 0, 0);
    }
  }
  return v22;
}

void IOUSBDeviceInterfaceClass::_classCommandCallbacksHandler(IOUSBDeviceInterfaceClass *this, void *a2, uint64_t *a3, unint64_t *a4)
{
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  unint64_t v10;
  uint64_t v11;
  const void *v12;
  uint64_t *v13;
  uint64_t (*v14)(_QWORD, _QWORD, _BYTE *, uint64_t *, char *, int *);
  _BOOL4 v15;
  int v16;
  uint64_t v17;
  void (*v18)(_QWORD, _QWORD, _BYTE *, _QWORD, uint64_t, _QWORD);
  const void *v19;
  uint64_t *v20;
  const void *v21;
  uint64_t MapToken;
  uint64_t v23;
  uint64_t v24;
  int v26;
  uint64_t v27;
  _BYTE v28[2];
  __int16 v29;
  int v30;
  uint64_t input[2];
  __int128 v32;
  unint64_t v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v5 = *((unsigned int *)a3 + 6);
  v27 = v5;
  v26 = 0;
  v33 = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)input = v6;
  v32 = v6;
  v7 = *a3;
  v8 = a3[1];
  v28[0] = BYTE3(v8);
  v28[1] = BYTE2(v8);
  v9 = *((_DWORD *)a3 + 4);
  HIDWORD(v10) = v9;
  LODWORD(v10) = v9;
  v30 = v10 >> 16;
  v11 = a3[4];
  v29 = v8;
  switch(v7)
  {
    case 2:
      if ((v8 & 0x80000000) != 0)
        sub_2310EBB88();
      v17 = *((_QWORD *)this + 25);
      if (v17)
        v17 = ((int (*)(_QWORD, _QWORD, _BYTE *, _QWORD, uint64_t, _QWORD))v17)(*((_QWORD *)this + 22), *((_QWORD *)this + 26), v28, *((unsigned int *)a3 + 10), v5, *((_QWORD *)this + 27));
      input[0] = v17;
      input[1] = v11;
      IOConnectCallScalarMethod(*((_DWORD *)this + 13), 9u, input, 2u, 0, 0);
      goto LABEL_15;
    case 1:
      if ((v8 & 0x80000000) == 0)
        sub_2310EBB60();
      v18 = (void (*)(_QWORD, _QWORD, _BYTE *, _QWORD, uint64_t, _QWORD))*((_QWORD *)this + 24);
      if (v18)
        v18(*((_QWORD *)this + 22), *((_QWORD *)this + 26), v28, *((unsigned int *)a3 + 10), v5, *((_QWORD *)this + 27));
LABEL_15:
      v21 = (const void *)*((_QWORD *)this + 27);
      v20 = (uint64_t *)((char *)this + 216);
      v19 = v21;
      if (!v21)
        return;
      v13 = v20;
      goto LABEL_34;
    case 0:
      v13 = (uint64_t *)((char *)this + 216);
      v12 = (const void *)*((_QWORD *)this + 27);
      if (v12)
      {
        CFRelease(v12);
        *v13 = 0;
      }
      v14 = (uint64_t (*)(_QWORD, _QWORD, _BYTE *, uint64_t *, char *, int *))*((_QWORD *)this + 23);
      if (v14)
      {
        v15 = v14(*((_QWORD *)this + 22), *((_QWORD *)this + 26), v28, &v27, (char *)this + 216, &v26) != 0;
        v16 = HIWORD(v30);
        v5 = v27;
      }
      else
      {
        v15 = 0;
        v16 = (unsigned __int16)v9;
      }
      MapToken = 0;
      if (v15 && v16 != 0)
        v23 = v5;
      else
        v23 = 0;
      input[0] = v15;
      input[1] = v23;
      if (v15)
      {
        if (v5)
        {
          MapToken = *v13;
          if (*v13)
            MapToken = IOUSBDeviceDataGetMapToken();
        }
      }
      v24 = v26;
      if (!v15)
        v24 = 0;
      *(_QWORD *)&v32 = MapToken;
      *((_QWORD *)&v32 + 1) = v24;
      v33 = v11;
      IOConnectCallScalarMethod(*((_DWORD *)this + 13), 9u, input, 5u, 0, 0);
      v19 = (const void *)*((_QWORD *)this + 27);
      if (v19)
      {
        if (!v27 || !v15)
          goto LABEL_34;
        if ((v8 & 0x80000000) == 0)
        {
          if (*((_QWORD *)this + 25))
            return;
          goto LABEL_34;
        }
        if (!*((_QWORD *)this + 24))
        {
LABEL_34:
          CFRelease(v19);
          *v13 = 0;
        }
      }
      break;
  }
}

uint64_t IOUSBDeviceInterfaceClass::setMessageCallback(IOUSBDeviceInterfaceClass *this, void (*a2)(void *, unsigned int, void *, void *), void *a3, void *a4)
{
  *((_QWORD *)this + 28) = a2;
  *((_QWORD *)this + 29) = a3;
  *((_QWORD *)this + 30) = a4;
  return 0;
}

uint64_t IOUSBDeviceInterfaceClass::setAlternateSetting(IOUSBDeviceInterfaceClass *this, unsigned int a2)
{
  uint64_t input;

  input = a2;
  return IOConnectCallScalarMethod(*((_DWORD *)this + 13), 0xCu, &input, 1u, 0, 0);
}

uint64_t IOUSBDeviceInterfaceClass::readPipe(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t MapToken;
  uint64_t v7;
  uint64_t result;
  uint32_t outputCnt;
  uint64_t output;
  uint64_t input[5];

  input[4] = *MEMORY[0x24BDAC8D0];
  output = 0;
  input[0] = a2;
  outputCnt = 1;
  MapToken = IOUSBDeviceDataGetMapToken();
  v7 = *a4;
  input[1] = MapToken;
  input[2] = v7;
  input[3] = 0;
  result = IOConnectCallMethod(*(_DWORD *)(a1 + 52), 0xDu, input, 4u, 0, 0, &output, &outputCnt, 0, 0);
  *a4 = output;
  return result;
}

uint64_t IOUSBDeviceInterfaceClass::readPipeAsync(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint32_t outputCnt;
  uint64_t v12;
  uint64_t reference[2];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t input[5];

  input[4] = *MEMORY[0x24BDAC8D0];
  v15 = 0u;
  v16 = 0u;
  reference[0] = 0;
  v14 = 0u;
  v12 = 0;
  outputCnt = 1;
  input[0] = a2;
  input[1] = IOUSBDeviceDataGetMapToken();
  input[2] = a4;
  input[3] = 0;
  reference[1] = a5;
  *(_QWORD *)&v14 = a6;
  return IOConnectCallAsyncMethod(*(_DWORD *)(a1 + 52), 0xDu, *(_DWORD *)(a1 + 72), reference, 3u, input, 4u, 0, 0, &v12, &outputCnt, 0, 0);
}

uint64_t IOUSBDeviceInterfaceClass::readIsochPipeAsync(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint32_t outputCnt;
  uint64_t v16;
  uint64_t input[2];
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t reference[2];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v23 = 0u;
  v24 = 0u;
  *(_OWORD *)reference = 0u;
  v22 = 0u;
  v16 = 0;
  outputCnt = 1;
  if (!*(_DWORD *)(a1 + 72))
    return 3758096385;
  input[0] = a2;
  input[1] = IOUSBDeviceDataGetMapToken();
  v18 = a4;
  v19 = a5;
  v20 = a6;
  reference[1] = a7;
  *(_QWORD *)&v22 = a8;
  return IOConnectCallAsyncMethod(*(_DWORD *)(a1 + 52), 0x15u, *(_DWORD *)(a1 + 72), reference, 3u, input, 5u, 0, 0, &v16, &outputCnt, 0, 0);
}

uint64_t IOUSBDeviceInterfaceClass::writePipe(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t MapToken;
  uint64_t v7;
  uint64_t result;
  uint32_t outputCnt;
  uint64_t output;
  uint64_t input[5];

  input[4] = *MEMORY[0x24BDAC8D0];
  output = 0;
  input[0] = a2;
  outputCnt = 1;
  MapToken = IOUSBDeviceDataGetMapToken();
  v7 = *a4;
  input[1] = MapToken;
  input[2] = v7;
  input[3] = 0;
  result = IOConnectCallMethod(*(_DWORD *)(a1 + 52), 0xEu, input, 4u, 0, 0, &output, &outputCnt, 0, 0);
  *a4 = output;
  return result;
}

uint64_t IOUSBDeviceInterfaceClass::writePipeAsync(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint32_t outputCnt;
  uint64_t v12;
  uint64_t input[4];
  uint64_t reference[2];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v16 = 0u;
  v17 = 0u;
  reference[0] = 0;
  v15 = 0u;
  v12 = 0;
  input[0] = a2;
  outputCnt = 1;
  input[1] = IOUSBDeviceDataGetMapToken();
  input[2] = a4;
  input[3] = 0;
  reference[1] = a5;
  *(_QWORD *)&v15 = a6;
  return IOConnectCallAsyncMethod(*(_DWORD *)(a1 + 52), 0xEu, *(_DWORD *)(a1 + 72), reference, 3u, input, 4u, 0, 0, &v12, &outputCnt, 0, 0);
}

uint64_t IOUSBDeviceInterfaceClass::writeIsochPipeAsync(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint32_t outputCnt;
  uint64_t v16;
  uint64_t input[2];
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t reference[2];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v23 = 0u;
  v24 = 0u;
  *(_OWORD *)reference = 0u;
  v22 = 0u;
  v16 = 0;
  outputCnt = 1;
  if (!*(_DWORD *)(a1 + 72))
    return 3758096385;
  input[0] = a2;
  input[1] = IOUSBDeviceDataGetMapToken();
  v18 = a4;
  v19 = a5;
  v20 = a6;
  reference[1] = a7;
  *(_QWORD *)&v22 = a8;
  return IOConnectCallAsyncMethod(*(_DWORD *)(a1 + 52), 0x16u, *(_DWORD *)(a1 + 72), reference, 3u, input, 5u, 0, 0, &v16, &outputCnt, 0, 0);
}

uint64_t IOUSBDeviceInterfaceClass::stallPipe(IOUSBDeviceInterfaceClass *this, uint64_t a2)
{
  uint64_t input;

  input = a2;
  return IOConnectCallScalarMethod(*((_DWORD *)this + 13), 0xFu, &input, 1u, 0, 0);
}

uint64_t IOUSBDeviceInterfaceClass::abortPipe(IOUSBDeviceInterfaceClass *this, uint64_t a2)
{
  uint64_t input;

  input = a2;
  return IOConnectCallScalarMethod(*((_DWORD *)this + 13), 0x10u, &input, 1u, 0, 0);
}

uint64_t IOUSBDeviceInterfaceClass::getPipeCurrentMaxPacketSize(IOUSBDeviceInterfaceClass *this, uint64_t a2, int *a3)
{
  uint64_t result;
  uint32_t outputCnt;
  uint64_t output;
  uint64_t input;

  output = 0;
  input = a2;
  outputCnt = 1;
  result = IOConnectCallScalarMethod(*((_DWORD *)this + 13), 0x11u, &input, 1u, &output, &outputCnt);
  *a3 = output;
  return result;
}

uint64_t IOUSBDeviceInterfaceClass::createData(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v4;
  uint32_t outputCnt;
  uint64_t input;
  uint64_t output[4];

  output[3] = *MEMORY[0x24BDAC8D0];
  if (!a3)
    return 3758097090;
  input = a2;
  memset(output, 0, 24);
  outputCnt = 3;
  v4 = IOConnectCallScalarMethod(*(_DWORD *)(a1 + 52), 0x12u, &input, 1u, output, &outputCnt);
  if (!(_DWORD)v4)
    *a3 = IOUSBDeviceDataCreate();
  return v4;
}

uint64_t IOUSBDeviceInterfaceClass::_releaseDataCallback(uint64_t this, uint64_t a2, void *a3)
{
  uint64_t input;

  input = this;
  if (a2)
    return IOConnectCallScalarMethod(*(_DWORD *)(a2 + 52), 0x13u, &input, 1u, 0, 0);
  return this;
}

uint64_t IOUSBDeviceInterfaceClass::mapIOBuffer(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v5;
  uint32_t outputCnt;
  uint64_t output[3];
  uint64_t input[3];

  input[2] = *MEMORY[0x24BDAC8D0];
  if (!a4)
    return 3758097090;
  input[0] = a3;
  input[1] = a2;
  memset(output, 170, sizeof(output));
  outputCnt = 3;
  v5 = IOConnectCallScalarMethod(*(_DWORD *)(a1 + 52), 0x1Au, input, 2u, output, &outputCnt);
  if (!(_DWORD)v5)
    *a4 = IOUSBDeviceDataCreate();
  return v5;
}

uint64_t IOUSBDeviceInterfaceClass::setPipeProperty(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t input[3];

  input[2] = *MEMORY[0x24BDAC8D0];
  input[0] = a2;
  input[1] = a3;
  return IOConnectCallScalarMethod(*(_DWORD *)(a1 + 52), 0x1Bu, input, 2u, 0, 0);
}

uint64_t IOUSBDeviceInterfaceClass::reportTimeout(IOUSBDeviceInterfaceClass *this, uint64_t a2)
{
  uint64_t v3[2];

  v3[1] = *MEMORY[0x24BDAC8D0];
  v3[0] = a2;
  return IOConnectCallScalarMethod(*((_DWORD *)this + 13), 0x1Cu, v3, 1u, 0, 0);
}

uint64_t IOUSBDeviceInterfaceClass::isActivated(IOUSBDeviceInterfaceClass *this, int *a2, int *a3)
{
  uint64_t result;
  uint32_t outputCnt;
  uint64_t output;
  unint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (!a2)
    return 3758097090;
  output = 0xAAAAAAAAAAAAAAAALL;
  v8 = 0xAAAAAAAAAAAAAAAALL;
  outputCnt = 2;
  result = IOConnectCallScalarMethod(*((_DWORD *)this + 13), 0x14u, 0, 0, &output, &outputCnt);
  if (!(_DWORD)result)
  {
    *a2 = output;
    if (*a3)
      *a3 = v8;
  }
  return result;
}

uint64_t IOUSBDeviceInterfaceClass::registerForDemandLaunch(IOUSBDeviceInterfaceClass *this, CFStringRef theString)
{
  mach_port_t *v2;
  uint64_t v3;
  __int128 v6;
  __CFMachPort *v7;
  __CFRunLoopSource *RunLoopSource;
  CFMachPortContext context;
  char buffer[16];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v2 = (mach_port_t *)((char *)this + 96);
  if (*((_DWORD *)this + 24))
    return 0;
  context.version = 0;
  context.info = 0;
  *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)buffer = v6;
  v11 = v6;
  v12 = v6;
  v13 = v6;
  v14 = v6;
  v15 = v6;
  v16 = v6;
  v17 = v6;
  if (!CFStringGetCString(theString, buffer, 128, 0x600u))
    return 3758096385;
  v3 = bootstrap_check_in(*MEMORY[0x24BDAD2F0], buffer, v2);
  if (!(_DWORD)v3)
  {
    v3 = 3758097085;
    context.version = 1;
    context.info = this;
    memset(&context.retain, 0, 24);
    v7 = CFMachPortCreateWithPort(0, *((_DWORD *)this + 24), (CFMachPortCallBack)IOUSBDeviceInterfaceClass::_handleLodCallback, &context, 0);
    *((_QWORD *)this + 13) = v7;
    if (v7)
    {
      RunLoopSource = CFMachPortCreateRunLoopSource(0, v7, 0);
      *((_QWORD *)this + 14) = RunLoopSource;
      if (RunLoopSource)
      {
        CFRunLoopAddSource(*((CFRunLoopRef *)this + 15), RunLoopSource, *((CFRunLoopMode *)this + 16));
        return MEMORY[0x2348D12B8](*((unsigned int *)this + 13), 74565, *((unsigned int *)this + 24), 3735932941);
      }
    }
  }
  return v3;
}

uint64_t IOUSBDeviceInterfaceClass::readPipeTO(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, unsigned int a5)
{
  uint64_t MapToken;
  uint64_t v9;
  uint64_t result;
  uint32_t outputCnt;
  uint64_t output;
  uint64_t input[5];

  input[4] = *MEMORY[0x24BDAC8D0];
  output = 0;
  input[0] = a2;
  outputCnt = 1;
  MapToken = IOUSBDeviceDataGetMapToken();
  v9 = *a4;
  input[1] = MapToken;
  input[2] = v9;
  input[3] = a5;
  result = IOConnectCallMethod(*(_DWORD *)(a1 + 52), 0xDu, input, 4u, 0, 0, &output, &outputCnt, 0, 0);
  *a4 = output;
  return result;
}

uint64_t IOUSBDeviceInterfaceClass::readPipeAsyncTO(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5, uint64_t a6, uint64_t a7)
{
  uint32_t outputCnt;
  uint64_t v14;
  uint64_t reference[2];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t input[5];

  input[4] = *MEMORY[0x24BDAC8D0];
  v17 = 0u;
  v18 = 0u;
  reference[0] = 0;
  v16 = 0u;
  v14 = 0;
  outputCnt = 1;
  input[0] = a2;
  input[1] = IOUSBDeviceDataGetMapToken();
  input[2] = a4;
  input[3] = a5;
  reference[1] = a6;
  *(_QWORD *)&v16 = a7;
  return IOConnectCallAsyncMethod(*(_DWORD *)(a1 + 52), 0xDu, *(_DWORD *)(a1 + 72), reference, 3u, input, 4u, 0, 0, &v14, &outputCnt, 0, 0);
}

uint64_t IOUSBDeviceInterfaceClass::writePipeTO(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, unsigned int a5)
{
  uint64_t MapToken;
  uint64_t v9;
  uint64_t result;
  uint32_t outputCnt;
  uint64_t output;
  uint64_t input[5];

  input[4] = *MEMORY[0x24BDAC8D0];
  output = 0;
  input[0] = a2;
  outputCnt = 1;
  MapToken = IOUSBDeviceDataGetMapToken();
  v9 = *a4;
  input[1] = MapToken;
  input[2] = v9;
  input[3] = a5;
  result = IOConnectCallMethod(*(_DWORD *)(a1 + 52), 0xEu, input, 4u, 0, 0, &output, &outputCnt, 0, 0);
  *a4 = output;
  return result;
}

uint64_t IOUSBDeviceInterfaceClass::writePipeAsyncTO(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5, uint64_t a6, uint64_t a7)
{
  uint32_t outputCnt;
  uint64_t v14;
  uint64_t input[4];
  uint64_t reference[2];
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v18 = 0u;
  v19 = 0u;
  reference[0] = 0;
  v17 = 0u;
  v14 = 0;
  input[0] = a2;
  outputCnt = 1;
  input[1] = IOUSBDeviceDataGetMapToken();
  input[2] = a4;
  input[3] = a5;
  reference[1] = a6;
  *(_QWORD *)&v17 = a7;
  return IOConnectCallAsyncMethod(*(_DWORD *)(a1 + 52), 0xEu, *(_DWORD *)(a1 + 72), reference, 3u, input, 4u, 0, 0, &v14, &outputCnt, 0, 0);
}

uint64_t IOUSBDeviceInterfaceClass::isActive(IOUSBDeviceInterfaceClass *this, int *a2, int *a3)
{
  uint64_t result;
  uint32_t outputCnt;
  uint64_t output;
  unint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (!a2)
    return 3758097090;
  output = 0xAAAAAAAAAAAAAAAALL;
  v8 = 0xAAAAAAAAAAAAAAAALL;
  outputCnt = 2;
  result = IOConnectCallScalarMethod(*((_DWORD *)this + 13), 0x18u, 0, 0, &output, &outputCnt);
  if (!(_DWORD)result)
  {
    *a2 = output;
    if (a3)
      *a3 = v8;
  }
  return result;
}

void sub_2310EBB60()
{
  __assert_rtn("_classCommandCallbacksHandler", "IOUSBDeviceInterfaceClass.cpp", 1286, "direction == kRequestDirectionIn");
}

void sub_2310EBB88()
{
  __assert_rtn("_classCommandCallbacksHandler", "IOUSBDeviceInterfaceClass.cpp", 1302, "direction == kRequestDirectionOut");
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x24BDBBE68](cf1, cf2);
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

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x24BDBC2C8](rl, source, mode);
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x24BDBC348](rl, source, mode);
}

void CFRunLoopSourceInvalidate(CFRunLoopSourceRef source)
{
  MEMORY[0x24BDBC378](source);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x24BDBC600](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

CFUUIDRef CFUUIDCreateFromUUIDBytes(CFAllocatorRef alloc, CFUUIDBytes bytes)
{
  return (CFUUIDRef)MEMORY[0x24BDBC8E0](alloc, *(_QWORD *)&bytes.byte0, *(_QWORD *)&bytes.byte8);
}

CFUUIDRef CFUUIDGetConstantUUIDWithBytes(CFAllocatorRef alloc, UInt8 byte0, UInt8 byte1, UInt8 byte2, UInt8 byte3, UInt8 byte4, UInt8 byte5, UInt8 byte6, UInt8 byte7, UInt8 byte8, UInt8 byte9, UInt8 byte10, UInt8 byte11, UInt8 byte12, UInt8 byte13, UInt8 byte14, UInt8 byte15)
{
  return (CFUUIDRef)MEMORY[0x24BDBC8F8](alloc, byte0, byte1, byte2, byte3, byte4, byte5, byte6);
}

kern_return_t IOConnectCallAsyncMethod(mach_port_t connection, uint32_t selector, mach_port_t wake_port, uint64_t *reference, uint32_t referenceCnt, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x24BDD7EE0](*(_QWORD *)&connection, *(_QWORD *)&selector, *(_QWORD *)&wake_port, reference, *(_QWORD *)&referenceCnt, input, *(_QWORD *)&inputCnt, inputStruct);
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x24BDD7EF8](*(_QWORD *)&connection, *(_QWORD *)&selector, input, *(_QWORD *)&inputCnt, inputStruct, inputStructCnt, output, outputCnt);
}

kern_return_t IOConnectCallScalarMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return MEMORY[0x24BDD7F00](*(_QWORD *)&connection, *(_QWORD *)&selector, input, *(_QWORD *)&inputCnt, output, outputCnt);
}

kern_return_t IOConnectCallStructMethod(mach_port_t connection, uint32_t selector, const void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x24BDD7F08](*(_QWORD *)&connection, *(_QWORD *)&selector, inputStruct, inputStructCnt, outputStruct, outputStructCnt);
}

kern_return_t IOConnectSetNotificationPort(io_connect_t connect, uint32_t type, mach_port_t port, uintptr_t reference)
{
  return MEMORY[0x24BDD7F40](*(_QWORD *)&connect, *(_QWORD *)&type, *(_QWORD *)&port, reference);
}

kern_return_t IOCreateReceivePort(uint32_t msgType, mach_port_t *recvPort)
{
  return MEMORY[0x24BDD7F98](*(_QWORD *)&msgType, recvPort);
}

void IODispatchCalloutFromMessage(void *unused, mach_msg_header_t *msg, void *reference)
{
  MEMORY[0x24BDD7FD8](unused, msg, reference);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return (IONotificationPortRef)MEMORY[0x24BDD8690](*(_QWORD *)&mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
  MEMORY[0x24BDD8698](notify);
}

CFRunLoopSourceRef IONotificationPortGetRunLoopSource(IONotificationPortRef notify)
{
  return (CFRunLoopSourceRef)MEMORY[0x24BDD86A8](notify);
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

uint64_t IOUSBDeviceDataCreate()
{
  return MEMORY[0x24BDD89E8]();
}

uint64_t IOUSBDeviceDataGetMapToken()
{
  return MEMORY[0x24BDD89F8]();
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
  return off_24FFFCEC8();
}

uint64_t operator new()
{
  return off_24FFFCED0();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x24BEDB910](a1);
}

kern_return_t bootstrap_check_in(mach_port_t bp, const name_t service_name, mach_port_t *sp)
{
  return MEMORY[0x24BDAD2D8](*(_QWORD *)&bp, service_name, sp);
}

kern_return_t mach_port_mod_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return MEMORY[0x24BDAEBF8](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&right, *(_QWORD *)&delta);
}

