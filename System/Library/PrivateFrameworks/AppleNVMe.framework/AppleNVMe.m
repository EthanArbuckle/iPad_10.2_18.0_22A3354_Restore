uint64_t AppleNVMeNamespaceAccessFindServiceByNSType(int a1, io_object_t *a2, CFTimeInterval a3)
{
  if ((a1 - 1) > 0xD)
    return 3758097090;
  else
    return AppleNVMeNamespaceAccessFindServiceByName((&sNVMeEmbeddedNamespaceTypeNames)[a1], a2, a3);
}

uint64_t AppleNVMeNamespaceAccessFindServiceByName(const char *a1, io_object_t *a2, CFTimeInterval a3)
{
  __CFDictionary *v6;
  CFMutableDictionaryRef Mutable;
  CFStringRef v8;
  IONotificationPort *v9;
  IONotificationPort *v10;
  uint64_t v11;
  io_object_t v12;
  __CFRunLoop *Current;
  __CFRunLoopSource *RunLoopSource;
  io_iterator_t notification;

  notification = 0;
  *a2 = 0;
  v6 = IOServiceMatching("AppleNVMeNamespaceDevice");
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  CFDictionarySetValue(v6, CFSTR("IOPropertyMatch"), Mutable);
  CFRelease(Mutable);
  v8 = CFStringCreateWithCString(0, a1, 0x8000100u);
  CFDictionarySetValue(Mutable, v8, (const void *)*MEMORY[0x24BDBD270]);
  v9 = IONotificationPortCreate(*MEMORY[0x24BDD8B18]);
  if (v9)
  {
    v10 = v9;
    v11 = 3758097088;
    if (IOServiceAddMatchingNotification(v9, "IOServiceFirstMatch", v6, (IOServiceMatchingCallback)AppleNVMeNamespaceAccessMatchingServiceCallback, a2, &notification))
    {
      fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s IOServiceAddMatchingNotification () failed\n", "AppleNVMeNamespaceAccessFindServiceByName");
    }
    else
    {
      AppleNVMeNamespaceAccessMatchingServiceCallback(a2, notification);
      v12 = *a2;
      if (!*a2)
      {
        Current = CFRunLoopGetCurrent();
        RunLoopSource = IONotificationPortGetRunLoopSource(v10);
        CFRunLoopAddSource(Current, RunLoopSource, CFSTR("WaitForNVMeNSAccessService"));
        CFRunLoopRunInMode(CFSTR("WaitForNVMeNSAccessService"), a3, 1u);
        v12 = *a2;
      }
      if (v12)
        v11 = 0;
      else
        v11 = 3758097110;
    }
    IONotificationPortDestroy(v10);
    if (notification)
      IOObjectRelease(notification);
  }
  else
  {
    v11 = 3758097088;
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s IONotificationPortCreate () failed\n", "AppleNVMeNamespaceAccessFindServiceByName");
  }
  return v11;
}

uint64_t AppleNVMeNamespaceAccessMatchingServiceCallback(io_object_t *a1, io_iterator_t iterator)
{
  uint64_t result;
  io_object_t v5;

  result = IOIteratorNext(iterator);
  if ((_DWORD)result)
  {
    v5 = result;
    do
    {
      if (!*a1)
      {
        IOObjectRetain(v5);
        *a1 = v5;
      }
      result = IOIteratorNext(iterator);
      v5 = result;
    }
    while ((_DWORD)result);
  }
  return result;
}

uint64_t AppleNVMeNamespaceAccessOpenConection(io_service_t a1, io_connect_t *connect)
{
  if (a1)
    return IOServiceOpen(a1, *MEMORY[0x24BDAEC58], 0, connect);
  else
    return 3758097090;
}

uint64_t AppleNVMeNamespaceAccessGetBlockSize(mach_port_t a1, _QWORD *a2)
{
  uint64_t v3;
  uint32_t outputCnt;
  uint64_t output[2];

  output[1] = *MEMORY[0x24BDAC8D0];
  output[0] = 0;
  outputCnt = 1;
  v3 = IOConnectCallMethod(a1, 2u, 0, 0, 0, 0, output, &outputCnt, 0, 0);
  if ((_DWORD)v3)
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s failed, kernResult = 0x%x \n", "AppleNVMeNamespaceAccessGetBlockSize", v3);
  else
    *a2 = output[0];
  return v3;
}

uint64_t AppleNVMeNamespaceAccessGetBlockCount(mach_port_t a1, _QWORD *a2)
{
  uint64_t v3;
  uint32_t outputCnt;
  uint64_t output[2];

  output[1] = *MEMORY[0x24BDAC8D0];
  output[0] = 0;
  outputCnt = 1;
  v3 = IOConnectCallMethod(a1, 3u, 0, 0, 0, 0, output, &outputCnt, 0, 0);
  if ((_DWORD)v3)
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s failed, kernResult = 0x%x \n", "AppleNVMeNamespaceAccessGetBlockCount", v3);
  else
    *a2 = output[0];
  return v3;
}

uint64_t AppleNVMeNamespaceAccessReadData(mach_port_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t input[4];

  input[3] = *MEMORY[0x24BDAC8D0];
  input[0] = a2;
  input[1] = a4;
  input[2] = a3;
  v4 = IOConnectCallMethod(a1, 0, input, 3u, 0, 0, 0, 0, 0, 0);
  if ((_DWORD)v4)
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s failed, kernResult = 0x%x \n", "AppleNVMeNamespaceAccessReadData", v4);
  return v4;
}

uint64_t AppleNVMeNamespaceAccessWriteData(mach_port_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t input[4];

  input[3] = *MEMORY[0x24BDAC8D0];
  input[0] = a2;
  input[1] = a4;
  input[2] = a3;
  v4 = IOConnectCallMethod(a1, 1u, input, 3u, 0, 0, 0, 0, 0, 0);
  if ((_DWORD)v4)
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s failed, kernResult = 0x%x \n", "AppleNVMeNamespaceAccessWriteData", v4);
  return v4;
}

uint64_t AppleNVMeNamespaceAccessUnmapRange(mach_port_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t input[3];

  input[2] = *MEMORY[0x24BDAC8D0];
  input[0] = a2;
  input[1] = a3;
  v3 = IOConnectCallMethod(a1, 4u, input, 2u, 0, 0, 0, 0, 0, 0);
  if ((_DWORD)v3)
    fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s failed, kernResult = 0x%x \n", "AppleNVMeNamespaceAccessUnmapRange", v3);
  return v3;
}

BOOL AppleNVMeDeviceSupportsPanicLogAccess()
{
  mach_port_t v0;
  io_registry_entry_t v1;
  io_object_t v2;
  const __CFAllocator *v3;
  const __CFData *CFProperty;
  const __CFData *v5;
  const __CFString *v6;
  int v7;
  io_registry_entry_t v8;
  _QWORD v10[2];
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v10[0] = 0;
  v10[1] = 0;
  v11 = 0;
  v0 = *MEMORY[0x24BDD8B18];
  v1 = IORegistryEntryFromPath(*MEMORY[0x24BDD8B18], "IODeviceTree:/arm-io/ans");
  if (v1)
  {
    v2 = v1;
    v3 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(v1, CFSTR("role"), (CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
    if (CFProperty)
    {
      v5 = CFProperty;
      v6 = CFStringCreateFromExternalRepresentation(v3, CFProperty, 0x600u);
      if (v6)
      {
        CFStringGetCString(v6, (char *)v10, 20, 0x600u);
        v7 = LODWORD(v10[0]) ^ 0x32534E41 | BYTE4(v10[0]);
        CFRelease(v5);
        IOObjectRelease(v2);
        if (!v7)
          return 1;
        goto LABEL_5;
      }
      CFRelease(v5);
    }
    IOObjectRelease(v2);
  }
LABEL_5:
  v8 = IORegistryEntryFromPath(v0, "IODeviceTree:/arm-io/apcie/pci-bridge0/s3e");
  if (!v8)
    return AppleNVMeDeviceHasAVP();
  IOObjectRelease(v8);
  return 1;
}

uint64_t AppleNVMePanicLogGetSize(_QWORD *a1)
{
  int ServiceByNSType;
  BOOL v3;
  int v4;
  io_connect_t v5;
  BOOL v6;
  uint64_t v8;
  io_connect_t connect[2];
  uint64_t v10;
  uint64_t v11;

  v10 = 0;
  v11 = 0;
  *(_QWORD *)connect = 0;
  *a1 = 0;
  ServiceByNSType = AppleNVMeNamespaceAccessFindServiceByNSType(8, &connect[1], 120.0);
  if (connect[1])
    v3 = ServiceByNSType == 0;
  else
    v3 = 0;
  if (!v3)
  {
    v8 = 1;
    goto LABEL_16;
  }
  v4 = AppleNVMeNamespaceAccessOpenConection(connect[1], connect);
  v5 = connect[0];
  if (connect[0])
    v6 = v4 == 0;
  else
    v6 = 0;
  if (v6)
  {
    v8 = 3;
    if (!AppleNVMeNamespaceAccessGetBlockSize(connect[0], &v11)
      && v11
      && !AppleNVMeNamespaceAccessGetBlockCount(connect[0], &v10)
      && v10)
    {
      v8 = 0;
      *a1 = v11 * v10;
    }
LABEL_16:
    v5 = connect[0];
    if (!connect[0])
      goto LABEL_18;
    goto LABEL_17;
  }
  v8 = 2;
  if (connect[0])
LABEL_17:
    IOServiceClose(v5);
LABEL_18:
  if (connect[1])
    IOObjectRelease(connect[1]);
  return v8;
}

uint64_t AppleNVMeReadPanicLogData(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v4;
  int ServiceByNSType;
  int v10;
  io_connect_t v11;
  uint64_t v12;
  uint64_t v13;
  io_connect_t connect[2];
  uint64_t v16;
  uint64_t v17;

  v16 = 0;
  v17 = 0;
  *(_QWORD *)connect = 0;
  v4 = 6;
  if (!a2 || !a4)
    goto LABEL_24;
  ServiceByNSType = AppleNVMeNamespaceAccessFindServiceByNSType(8, &connect[1], 120.0);
  v4 = 1;
  if (!connect[1] || ServiceByNSType)
    goto LABEL_21;
  v10 = AppleNVMeNamespaceAccessOpenConection(connect[1], connect);
  v11 = connect[0];
  v4 = 2;
  if (connect[0] && !v10)
  {
    v4 = 3;
    if (!AppleNVMeNamespaceAccessGetBlockSize(connect[0], &v17)
      && v17
      && !AppleNVMeNamespaceAccessGetBlockCount(connect[0], &v16)
      && v16)
    {
      v12 = v17 * v16;
      if (v17 * v16 < a3)
        a3 = v17 * v16;
      if (AppleNVMeNamespaceAccessReadData(connect[0], a2, 0, a3))
      {
        v4 = 4;
      }
      else
      {
        if (AppleNVMeDeviceHasAVP())
          v13 = v12;
        else
          v13 = v17;
        if (AppleNVMeNamespaceAccessUnmapRange(connect[0], 0, v13))
        {
          v4 = 5;
        }
        else
        {
          if (a1)
            *a1 = AppleNVMePanicLogSourcePath;
          v4 = 0;
          *a4 = a3;
        }
      }
    }
LABEL_21:
    v11 = connect[0];
  }
  if (v11)
    IOServiceClose(v11);
LABEL_24:
  if (connect[1])
    IOObjectRelease(connect[1]);
  return v4;
}

BOOL AppleNVMeDeviceHasAVP()
{
  io_registry_entry_t v0;
  io_registry_entry_t v1;

  v0 = IORegistryEntryFromPath(*MEMORY[0x24BDD8B18], "IODeviceTree:/product/util");
  v1 = v0;
  if (v0)
    IOObjectRelease(v0);
  return v1 != 0;
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x24BDBC2C8](rl, source, mode);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x24BDBC2F8]();
}

CFRunLoopRunResult CFRunLoopRunInMode(CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return MEMORY[0x24BDBC360](mode, returnAfterSourceHandled, seconds);
}

CFStringRef CFStringCreateFromExternalRepresentation(CFAllocatorRef alloc, CFDataRef data, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x24BDBC530](alloc, data, *(_QWORD *)&encoding);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x24BDBC568](alloc, cStr, *(_QWORD *)&encoding);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x24BDBC600](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x24BDD7EF8](*(_QWORD *)&connection, *(_QWORD *)&selector, input, *(_QWORD *)&inputCnt, inputStruct, inputStructCnt, output, outputCnt);
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

CFRunLoopSourceRef IONotificationPortGetRunLoopSource(IONotificationPortRef notify)
{
  return (CFRunLoopSourceRef)MEMORY[0x24BDD86A8](notify);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x24BDD86F8](*(_QWORD *)&object);
}

kern_return_t IOObjectRetain(io_object_t object)
{
  return MEMORY[0x24BDD8700](*(_QWORD *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x24BDD88B0](*(_QWORD *)&entry, key, allocator, *(_QWORD *)&options);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return MEMORY[0x24BDD88C0](*(_QWORD *)&mainPort, path);
}

kern_return_t IOServiceAddMatchingNotification(IONotificationPortRef notifyPort, const io_name_t notificationType, CFDictionaryRef matching, IOServiceMatchingCallback callback, void *refCon, io_iterator_t *notification)
{
  return MEMORY[0x24BDD8960](notifyPort, notificationType, matching, callback, refCon, notification);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x24BDD8970](*(_QWORD *)&connect);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDD89A8](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x24BDD89B8](*(_QWORD *)&service, *(_QWORD *)&owningTask, *(_QWORD *)&type, connect);
}

