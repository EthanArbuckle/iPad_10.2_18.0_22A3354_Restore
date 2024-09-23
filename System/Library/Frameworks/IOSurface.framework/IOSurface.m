void *__cdecl IOSurfaceGetBaseAddressOfPlane(void *buffer, size_t planeIndex)
{
  if (buffer)
    return (void *)IOSurfaceClientGetBaseAddressOfPlane(*((_QWORD *)buffer + 1), planeIndex);
  return buffer;
}

uint64_t IOSurfaceClientGetSliceCount(uint64_t a1)
{
  unsigned int v1;

  v1 = *(_DWORD *)(a1 + 228);
  if (v1 <= 1)
    return 1;
  else
    return v1;
}

uint64_t IOSurfaceGetSliceCount(uint64_t result)
{
  if (result)
    return IOSurfaceClientGetSliceCount(*(_QWORD *)(result + 8));
  return result;
}

uint64_t IOSurfaceClientGetBaseAddressOfPlane(uint64_t a1, unsigned int a2)
{
  _QWORD *v2;

  if (*(_DWORD *)(a1 + 200) <= a2)
  {
    if (!a2)
    {
      v2 = (_QWORD *)(a1 + 176);
      return *v2 + *(_QWORD *)(a1 + 112);
    }
    return 0;
  }
  if (*(_BYTE *)(a1 + 152 * a2 + 356) == 1)
    return 0;
  v2 = (_QWORD *)(a1 + 152 * a2 + 272);
  return *v2 + *(_QWORD *)(a1 + 112);
}

uint64_t IOSurfaceClientGetProtectionOptions(uint64_t a1)
{
  return *(_QWORD *)(a1 + 240);
}

uint64_t IOSurfaceGetWidthInCompressedTilesOfPlane(uint64_t result, unsigned int a2)
{
  if (result)
    return IOSurfaceClientGetWidthInCompressedTilesOfPlane(*(_QWORD *)(result + 8), a2);
  return result;
}

uint64_t IOSurfaceClientGetWidthInCompressedTilesOfPlane(uint64_t a1, unsigned int a2)
{
  if (a2 && *(_DWORD *)(a1 + 200) <= a2)
    return 0;
  else
    return *(unsigned int *)(a1 + 152 * a2 + 344);
}

uint64_t IOSurfaceGetProtectionOptions(uint64_t result)
{
  if (result)
    return IOSurfaceClientGetProtectionOptions(*(_QWORD *)(result + 8));
  return result;
}

uint64_t IOSurfaceBindAccel(uint64_t a1, unsigned int a2, unsigned int a3)
{
  if (a1)
    return IOSurfaceClientBindAccel(*(_QWORD *)(a1 + 8), a2, a3);
  else
    return 3758097090;
}

uint64_t IOSurfaceGetBytesPerTileDataOfPlane(uint64_t result, unsigned int a2)
{
  if (result)
    return IOSurfaceClientGetBytesPerTileDataOfPlane(*(_QWORD *)(result + 8), a2);
  return result;
}

uint64_t IOSurfaceGetHeightInCompressedTilesOfPlane(uint64_t result, unsigned int a2)
{
  if (result)
    return IOSurfaceClientGetHeightInCompressedTilesOfPlane(*(_QWORD *)(result + 8), a2);
  return result;
}

IOSurfaceID IOSurfaceGetID(IOSurfaceRef buffer)
{
  if (buffer)
    LODWORD(buffer) = IOSurfaceClientGetID(*((_QWORD *)buffer + 1));
  return buffer;
}

uint64_t IOSurfaceClientGetBytesPerTileDataOfPlane(uint64_t a1, unsigned int a2)
{
  if (a2 && *(_DWORD *)(a1 + 200) <= a2)
    return 0;
  else
    return *(unsigned int *)(a1 + 152 * a2 + 368);
}

uint64_t IOSurfaceClientGetHeightInCompressedTilesOfPlane(uint64_t a1, unsigned int a2)
{
  if (a2 && *(_DWORD *)(a1 + 200) <= a2)
    return 0;
  else
    return *(unsigned int *)(a1 + 152 * a2 + 348);
}

uint64_t IOSurfaceClientGetPixelFormat(uint64_t a1)
{
  return *(unsigned int *)(a1 + 184);
}

Boolean IOSurfaceIsInUse(IOSurfaceRef buffer)
{
  if (buffer)
    LOBYTE(buffer) = IOSurfaceClientIsInUse(*((_QWORD *)buffer + 1));
  return buffer;
}

uint64_t IOSurfaceClientGetHeight(uint64_t a1)
{
  return *(_QWORD *)(a1 + 160);
}

uint64_t IOSurfaceClientGetWidth(uint64_t a1)
{
  return *(_QWORD *)(a1 + 152);
}

uint64_t IOSurfaceClientGetAllocSize(uint64_t a1)
{
  return *(_QWORD *)(a1 + 144);
}

uint64_t IOSurfaceClientBindAccel(uint64_t a1, unsigned int a2, unsigned int a3)
{
  uint64_t v3;
  mach_port_t v5;
  uint64_t input[4];

  input[3] = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 120);
  if (!*(_WORD *)(v3 + 8) || *(unsigned __int16 *)(v3 + 8) == a2 && *(unsigned __int16 *)(v3 + 10) == a3)
    return 0;
  input[0] = *(unsigned int *)(a1 + 136);
  input[1] = a2;
  input[2] = a3;
  v5 = _ioSurfaceConnectInternal(0);
  return IOConnectCallMethod(v5, 0xCu, input, 3u, 0, 0, 0, 0, 0, 0);
}

uint64_t IOSurfaceClientGetID(uint64_t result)
{
  if (result)
    return *(unsigned int *)(result + 136);
  return result;
}

size_t IOSurfaceGetPlaneCount(size_t buffer)
{
  if (buffer)
    return IOSurfaceClientGetPlaneCount(*(_QWORD *)(buffer + 8));
  return buffer;
}

uint64_t IOSurfaceClientGetPlaneCount(uint64_t a1)
{
  return *(unsigned int *)(a1 + 200);
}

size_t IOSurfaceGetBytesPerRowOfPlane(size_t buffer, size_t planeIndex)
{
  if (buffer)
    return IOSurfaceClientGetBytesPerRowOfPlane(*(_QWORD *)(buffer + 8), planeIndex);
  return buffer;
}

uint64_t IOSurfaceClientIncrementUseCount(uint64_t a1)
{
  return IOSurfaceClientIncrementUseCountForCategory(a1, 0);
}

uint64_t IOSurfaceClientDecrementUseCount(uint64_t a1)
{
  return IOSurfaceClientDecrementUseCountForCategory(a1, 0);
}

CFTypeRef IOSurfaceCopyValue(CFTypeRef buffer, CFStringRef key)
{
  if (buffer)
    return IOSurfaceClientCopyValue(*((_QWORD *)buffer + 1), (void *)key);
  return buffer;
}

uint64_t IOSurfaceClientIsTiled(uint64_t a1)
{
  return *(unsigned __int8 *)(*(_QWORD *)(a1 + 120) + 20);
}

uint64_t IOSurfaceGetCompressedTileWidthOfPlane(uint64_t result, unsigned int a2)
{
  if (result)
    return IOSurfaceClientGetCompressedTileWidthOfPlane(*(_QWORD *)(result + 8), a2);
  return result;
}

uint64_t IOSurfaceGetCompressedTileHeightOfPlane(uint64_t result, unsigned int a2)
{
  if (result)
    return IOSurfaceClientGetCompressedTileHeightOfPlane(*(_QWORD *)(result + 8), a2);
  return result;
}

OSType IOSurfaceGetPixelFormat(IOSurfaceRef buffer)
{
  if (buffer)
    LODWORD(buffer) = IOSurfaceClientGetPixelFormat(*((_QWORD *)buffer + 1));
  return buffer;
}

size_t IOSurfaceGetHeight(size_t buffer)
{
  if (buffer)
    return IOSurfaceClientGetHeight(*(_QWORD *)(buffer + 8));
  return buffer;
}

size_t IOSurfaceGetWidth(size_t buffer)
{
  if (buffer)
    return IOSurfaceClientGetWidth(*(_QWORD *)(buffer + 8));
  return buffer;
}

uint64_t IOSurfaceGetCompressionTypeOfPlane(uint64_t result, unsigned int a2)
{
  if (result)
    return IOSurfaceClientGetCompressionTypeOfPlane(*(_QWORD *)(result + 8), a2);
  return result;
}

uint64_t IOSurfaceClientGetBytesPerRowOfPlane(uint64_t a1, unsigned int a2)
{
  uint64_t v2;

  if (*(_DWORD *)(a1 + 200) <= a2)
  {
    if (!a2)
    {
      v2 = a1 + 168;
      return *(_QWORD *)v2;
    }
    return 0;
  }
  if (*(_BYTE *)(a1 + 152 * a2 + 356) == 1)
    return 0;
  v2 = a1 + 152 * a2 + 280;
  return *(_QWORD *)v2;
}

size_t IOSurfaceGetAllocSize(size_t buffer)
{
  if (buffer)
    return IOSurfaceClientGetAllocSize(*(_QWORD *)(buffer + 8));
  return buffer;
}

uint64_t IOSurfaceClientGetCompressedTileWidthOfPlane(uint64_t a1, unsigned int a2)
{
  if (a2 && *(_DWORD *)(a1 + 200) <= a2)
    return 0;
  else
    return *(unsigned int *)(a1 + 152 * a2 + 324);
}

uint64_t IOSurfaceClientGetCompressedTileHeightOfPlane(uint64_t a1, unsigned int a2)
{
  if (a2 && *(_DWORD *)(a1 + 200) <= a2)
    return 0;
  else
    return *(unsigned int *)(a1 + 152 * a2 + 328);
}

size_t IOSurfaceGetHeightOfPlane(size_t buffer, size_t planeIndex)
{
  if (buffer)
    return IOSurfaceClientGetHeightOfPlane(*(_QWORD *)(buffer + 8), planeIndex);
  return buffer;
}

uint64_t IOSurfaceGetAddressFormatOfPlane(uint64_t result, unsigned int a2)
{
  if (result)
    return IOSurfaceClientGetAddressFormatOfPlane(*(_QWORD *)(result + 8), a2);
  return result;
}

uint64_t IOSurfaceGetBulkAttachments(uint64_t a1, void *a2, size_t *a3)
{
  if (a1)
    return IOSurfaceClientGetBulkAttachments(*(_QWORD *)(a1 + 8), a2, a3);
  else
    return 3758097090;
}

void *__cdecl IOSurfaceGetBaseAddress(void *buffer)
{
  if (buffer)
    return (void *)IOSurfaceClientGetBaseAddress(*((_QWORD *)buffer + 1));
  return buffer;
}

void IOSurfaceIncrementUseCount(IOSurfaceRef buffer)
{
  if (buffer)
    IOSurfaceClientIncrementUseCount(*((_QWORD *)buffer + 1));
}

uint64_t IOSurfaceClientGetCompressionTypeOfPlane(uint64_t a1, unsigned int a2)
{
  if (a2 && *(_DWORD *)(a1 + 200) <= a2)
    return 0;
  else
    return *(unsigned __int8 *)(a1 + 152 * a2 + 356);
}

void IOSurfaceSetValue(IOSurfaceRef buffer, CFStringRef key, CFTypeRef value)
{
  if (buffer)
  {
    if (key)
      IOSurfaceClientSetValue(*((_QWORD *)buffer + 1), (void *)key, (CFDictionaryRef)value);
  }
}

uint64_t IOSurfaceGetCompressionFootprintOfPlane(uint64_t result, unsigned int a2)
{
  if (result)
    return IOSurfaceClientGetCompressionFootprintOfPlane(*(_QWORD *)(result + 8), a2);
  return result;
}

void IOSurfaceRemoveValue(IOSurfaceRef buffer, CFStringRef key)
{
  if (buffer)
  {
    if (key)
      IOSurfaceClientRemoveValue(*((_QWORD *)buffer + 1), (__CFString *)key);
  }
}

size_t IOSurfaceGetBytesPerRow(size_t buffer)
{
  if (buffer)
    return IOSurfaceClientGetBytesPerRow(*(_QWORD *)(buffer + 8));
  return buffer;
}

uint64_t IOSurfaceSetBulkAttachments2(uint64_t a1, uint64_t a2, unint64_t a3, int a4)
{
  if (a1)
    return IOSurfaceClientSetBulkAttachments(*(_QWORD *)(a1 + 8), a2, a3, a4);
  else
    return 3758097090;
}

uint64_t IOSurfaceClientGetAddressFormatOfPlane(uint64_t a1, unsigned int a2)
{
  if (a2 && *(_DWORD *)(a1 + 200) <= a2)
    return 0;
  else
    return *(unsigned __int8 *)(a1 + 152 * a2 + 301);
}

uint64_t IOSurfaceIsTiled(uint64_t result)
{
  if (result)
    return IOSurfaceClientIsTiled(*(_QWORD *)(result + 8));
  return result;
}

uint64_t IOSurfaceClientGetCompressionFootprintOfPlane(uint64_t a1, unint64_t a2)
{
  if (a2 && *(unsigned int *)(a1 + 200) <= a2)
    return 0;
  else
    return *(unsigned __int8 *)(a1 + 152 * a2 + 364);
}

uint64_t IOSurfaceClientGetElementHeight(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 211);
}

uint64_t IOSurfaceSetDetachModeCode(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (result)
    return IOSurfaceClientSetDetachModeCode(*(_QWORD *)(result + 8), a2, a3);
  return result;
}

uint64_t IOSurfaceGetBaseAddressOfCompressedTileHeaderRegionOfPlane(uint64_t result, unsigned int a2)
{
  if (result)
    return IOSurfaceClientGetBaseAddressOfCompressedTileHeaderRegionOfPlane(*(_QWORD *)(result + 8), a2);
  return result;
}

void IOSurfaceDecrementUseCount(IOSurfaceRef buffer)
{
  if (buffer)
    IOSurfaceClientDecrementUseCount(*((_QWORD *)buffer + 1));
}

uint64_t IOSurfaceClientGetHeightOfPlane(uint64_t a1, unsigned int a2)
{
  uint64_t v2;

  if (*(_DWORD *)(a1 + 200) <= a2)
  {
    if (a2)
      return 0;
    v2 = a1 + 160;
  }
  else
  {
    v2 = a1 + 152 * a2 + 256;
  }
  return *(_QWORD *)v2;
}

uint64_t IOSurfaceClientGetYCbCrMatrix(uint64_t a1, _DWORD *a2)
{
  *a2 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 120) + 106);
  return 0;
}

uint64_t IOSurfaceClientCreateMachPort(uint64_t a1)
{
  return IOSurfaceClientCreateMachPortWithOptions(a1, 0);
}

size_t IOSurfaceGetWidthOfPlane(size_t buffer, size_t planeIndex)
{
  if (buffer)
    return IOSurfaceClientGetWidthOfPlane(*(_QWORD *)(buffer + 8), planeIndex);
  return buffer;
}

uint64_t IOSurfaceClientGetParentID(uint64_t result)
{
  if (result)
    return *(unsigned int *)(result + 224);
  return result;
}

uint64_t IOSurfaceClientGetDetachModeCode(uint64_t a1)
{
  return *(_QWORD *)(*(_QWORD *)(a1 + 128) + 40);
}

uint64_t IOSurfaceClientGetBaseAddress(uint64_t a1)
{
  uint64_t v1;
  char v2;
  unsigned __int8 *v3;
  int v4;

  v1 = *(unsigned int *)(a1 + 200);
  if (!(_DWORD)v1)
    return *(_QWORD *)(a1 + 176) + *(_QWORD *)(a1 + 112);
  v2 = 0;
  v3 = (unsigned __int8 *)(a1 + 356);
  do
  {
    v4 = *v3;
    v3 += 152;
    v2 |= v4 == 1;
    --v1;
  }
  while (v1);
  if ((v2 & 1) != 0)
    return 0;
  else
    return *(_QWORD *)(a1 + 176) + *(_QWORD *)(a1 + 112);
}

CFDictionaryRef IOSurfaceCopyAllValues(CFDictionaryRef buffer)
{
  if (buffer)
    return IOSurfaceClientCopyAllValues(*((_QWORD *)buffer + 1));
  return buffer;
}

uint64_t IOSurfaceClientGetBytesPerRow(uint64_t a1)
{
  uint64_t v1;
  char v2;
  unsigned __int8 *v3;
  int v4;

  v1 = *(unsigned int *)(a1 + 200);
  if (!(_DWORD)v1)
    return *(_QWORD *)(a1 + 168);
  v2 = 0;
  v3 = (unsigned __int8 *)(a1 + 356);
  do
  {
    v4 = *v3;
    v3 += 152;
    v2 |= v4 == 1;
    --v1;
  }
  while (v1);
  if ((v2 & 1) != 0)
    return 0;
  else
    return *(_QWORD *)(a1 + 168);
}

uint64_t IOSurfaceSetCompressedTileDataRegionMemoryUsedOfPlane(uint64_t result, unsigned int a2, uint64_t a3)
{
  if (result)
    return IOSurfaceClientSetCompressedTileDataRegionMemoryUsedOfPlane(*(_QWORD *)(result + 8), a2, a3);
  return result;
}

uint64_t IOSurfaceGetIndexedTimestamp(uint64_t result, unint64_t a2)
{
  if (result)
    return IOSurfaceClientGetIndexedTimestamp(*(_QWORD *)(result + 8), a2);
  return result;
}

uint64_t IOSurfaceClientGetIndexedTimestamp(uint64_t a1, unint64_t a2)
{
  if (a2 > 4)
    return 0;
  else
    return *(_QWORD *)(*(_QWORD *)(a1 + 128) + 8 * a2);
}

size_t IOSurfaceGetElementWidthOfPlane(size_t buffer, size_t planeIndex)
{
  if (buffer)
    return IOSurfaceClientGetElementWidthOfPlane(*(_QWORD *)(buffer + 8), planeIndex);
  return buffer;
}

size_t IOSurfaceGetBytesPerElementOfPlane(size_t buffer, size_t planeIndex)
{
  if (buffer)
    return IOSurfaceClientGetBytesPerElementOfPlane(*(_QWORD *)(buffer + 8), planeIndex);
  return buffer;
}

uint64_t IOSurfaceClientAllowsPixelSizeCasting(uint64_t a1)
{
  return *(unsigned __int8 *)(*(_QWORD *)(a1 + 120) + 44);
}

uint64_t IOSurfaceClientGetBaseAddressOfCompressedTileHeaderRegionOfPlane(uint64_t a1, unsigned int a2)
{
  if (a2 && *(_DWORD *)(a1 + 200) <= a2 || *(_DWORD *)(a1 + 228) > 1u)
    return 0;
  else
    return *(_QWORD *)(a1 + 112) + *(unsigned int *)(a1 + 112 + 152 * a2 + 220);
}

uint64_t IOSurfaceClientGetElementWidth(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 210);
}

uint64_t IOSurfaceGetYCbCrMatrix(uint64_t a1, _DWORD *a2)
{
  if (a1)
    return IOSurfaceClientGetYCbCrMatrix(*(_QWORD *)(a1 + 8), a2);
  else
    return 3758097090;
}

void setEachValueInDictionary(CFTypeRef cf2, const void *a2, __CFDictionary *a3)
{
  if (!CFEqual(CFSTR("CreationProperties"), cf2))
    CFDictionarySetValue(a3, cf2, a2);
}

uint64_t IOSurfaceGetGraphicsCommPageAddress()
{
  mach_port_t v0;
  uint64_t output;
  uint32_t outputCnt;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  output = 0;
  outputCnt = 1;
  v0 = _ioSurfaceConnectInternal(0);
  if (IOConnectCallMethod(v0, 0x20u, 0, 0, 0, 0, &output, &outputCnt, 0, 0))
    return 0;
  else
    return output;
}

uint64_t IOSurfaceClientInitDetachModeCode(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;
  mach_port_t v3;
  uint64_t input;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (byte_1ECDA8150)
  {
    v1 = *(_QWORD *)(a1 + 128);
    *(_QWORD *)(v1 + 40) = 0xFFFFFFFFFFFFLL;
    result = mach_absolute_time();
    *(_QWORD *)(v1 + 16) = result;
  }
  else
  {
    input = *(unsigned int *)(a1 + 136);
    v5 = xmmword_1A4CF2450;
    v6 = mach_absolute_time();
    v3 = _ioSurfaceConnectInternal(0);
    return IOConnectCallMethod(v3, 0x2Bu, &input, 4u, 0, 0, 0, 0, 0, 0);
  }
  return result;
}

IOSurfaceRef IOSurfaceLookupFromMachPort(mach_port_t port)
{
  return (IOSurfaceRef)-[IOSurface initWithMachPort:]([IOSurface alloc], "initWithMachPort:", *(_QWORD *)&port);
}

uint64_t compareKeys(void *key, const void *a2, uint64_t a3)
{
  uint64_t result;

  result = (uint64_t)CFDictionaryGetValue(*(CFDictionaryRef *)a3, key);
  if (!result || (result = CFEqual((CFTypeRef)result, a2), !(_DWORD)result))
    *(_BYTE *)(a3 + 8) = 0;
  return result;
}

uint64_t IOSurfaceClientAlignProperty(const void *a1, uint64_t a2)
{
  int v4;

  _ioSurfaceConnectInternal(0);
  if (CFEqual(a1, CFSTR("IOSurfaceBytesPerRow")) || CFEqual(a1, CFSTR("IOSurfacePlaneBytesPerRow")))
  {
    v4 = HIDWORD(ioSurfaceLimits);
    return (v4 + (_DWORD)a2) & ~v4;
  }
  if (CFEqual(a1, CFSTR("IOSurfaceOffset"))
    || CFEqual(a1, CFSTR("IOSurfacePlaneOffset"))
    || CFEqual(a1, CFSTR("IOSurfacePlaneBase")))
  {
    v4 = ioSurfaceLimits;
    return (v4 + (_DWORD)a2) & ~v4;
  }
  return a2;
}

uint64_t IOSurfaceCreateChildSurface(void *a1, void *a2)
{
  id DictionaryAddingMissingProperties;
  uint64_t v4;

  DictionaryAddingMissingProperties = _iosCreateDictionaryAddingMissingProperties(a2);
  v4 = objc_msgSend(a1, "newChildSurfaceWithProperties:", DictionaryAddingMissingProperties);

  return v4;
}

uint64_t IOSurfaceClientSetYCbCrMatrix(uint64_t a1, unsigned int a2)
{
  mach_port_t v2;
  uint64_t input[3];

  input[2] = *MEMORY[0x1E0C80C00];
  input[0] = *(unsigned int *)(a1 + 136);
  input[1] = a2;
  v2 = _ioSurfaceConnectInternal(0);
  return IOConnectCallMethod(v2, 5u, input, 2u, 0, 0, 0, 0, 0, 0);
}

void IOSurfaceSetValues(IOSurfaceRef buffer, CFDictionaryRef keysAndValues)
{
  CFTypeID v4;

  if (buffer && keysAndValues)
  {
    v4 = CFGetTypeID(keysAndValues);
    if (v4 == CFDictionaryGetTypeID())
      IOSurfaceClientSetValue(*((_QWORD *)buffer + 1), 0, keysAndValues);
  }
}

BOOL IOSurfaceClientIsInUse(uint64_t a1)
{
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (*(_BYTE *)(a1 + 221))
  {
    snprintf(crashMessage, 0x100uLL, "IOSurfaceIsInUse: error: Attempt to query use count on an IOSurface (%p) created with kIOSurfaceProhibitUseCount.", (const void *)a1);
    qword_1EE788F88 = (uint64_t)crashMessage;
    v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
    if (v2)
      IOSurfaceClientIncrementUseCountForCategory_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    abort();
  }
  return *(_QWORD *)(*(_QWORD *)(a1 + 120) + 24) != 0;
}

uint64_t IOSurfaceClientSetPurgeable(uint64_t a1, unsigned int a2, _DWORD *a3)
{
  uint64_t v4;
  mach_port_t v5;
  uint64_t result;
  uint32_t outputCnt;
  uint64_t output;
  uint64_t input[3];

  input[2] = *MEMORY[0x1E0C80C00];
  outputCnt = 1;
  v4 = *(unsigned int *)(a1 + 136);
  output = 0;
  input[0] = v4;
  input[1] = a2;
  v5 = _ioSurfaceConnectInternal(0);
  result = IOConnectCallMethod(v5, 0x14u, input, 2u, 0, 0, &output, &outputCnt, 0, 0);
  if (a3)
    *a3 = output;
  return result;
}

IOSurfaceRef IOSurfaceLookup(IOSurfaceID csid)
{
  return (IOSurfaceRef)-[IOSurface initWithSurfaceID:]([IOSurface alloc], "initWithSurfaceID:", *(_QWORD *)&csid);
}

uint64_t IOSurfaceClientSetOwnership(uint64_t a1, unsigned int a2, int a3, unsigned int a4)
{
  mach_port_t v4;
  uint64_t input[5];

  input[4] = *MEMORY[0x1E0C80C00];
  input[0] = *(unsigned int *)(a1 + 136);
  input[1] = a2;
  input[2] = a3;
  input[3] = a4;
  v4 = _ioSurfaceConnectInternal(0);
  return IOConnectCallMethod(v4, 0x15u, input, 4u, 0, 0, 0, 0, 0, 0);
}

void serializeReplacementDictionaryKeysAndValues(const void *a1, uint64_t a2, __CFDictionary *a3)
{
  const void *v5;

  v5 = (const void *)serializeReplacementIOKitTypeRef(a2);
  CFDictionarySetValue(a3, a1, v5);
  CFRelease(v5);
}

uint64_t IOSurfaceClientUnlock(uint64_t a1, unsigned int a2, _DWORD *a3)
{
  io_connect_t v6;
  uint64_t result;
  int v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v9 = 0;
  v6 = _ioSurfaceConnectInternal(0);
  result = IOConnectTrap3(v6, 3u, *(unsigned int *)(a1 + 136), a2, (uintptr_t)&v9);
  if (!(_DWORD)result)
  {
    v8 = v9;
    *(_DWORD *)(a1 + 216) = v9;
    if (a3)
      *a3 = v8;
  }
  return result;
}

uint64_t IOSurfaceClientLock(uint64_t a1, unsigned int a2, _DWORD *a3)
{
  io_connect_t v6;
  uint64_t result;
  int v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v9 = 0;
  v6 = _ioSurfaceConnectInternal(0);
  result = IOConnectTrap3(v6, 2u, *(unsigned int *)(a1 + 136), a2, (uintptr_t)&v9);
  if (!(_DWORD)result)
  {
    v8 = v9;
    *(_DWORD *)(a1 + 216) = v9;
    if (a3)
      *a3 = v8;
  }
  return result;
}

uint64_t IOSurfaceClientSetCompressedTileDataRegionMemoryUsedOfPlane(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t result;
  mach_port_t v5;
  uint64_t input[4];

  input[3] = *MEMORY[0x1E0C80C00];
  result = 3758097090;
  if (a2 <= 4 && *(_DWORD *)(a1 + 200) > a2)
  {
    input[0] = *(unsigned int *)(a1 + 136);
    input[1] = a2;
    input[2] = a3;
    v5 = _ioSurfaceConnectInternal(0);
    return IOConnectCallMethod(v5, 0x1Fu, input, 3u, 0, 0, 0, 0, 0, 0);
  }
  return result;
}

uint64_t IOSurfaceClientDecrementUseCountForCategory(uint64_t result, unsigned int a2)
{
  uint64_t v3;
  unint64_t *v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  io_connect_t v9;
  _BOOL8 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v3 = result;
  if (a2 >= 2)
    result = objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("category out of range"));
  if (*(_BYTE *)(v3 + 221))
  {
    snprintf(crashMessage, 0x100uLL, "IOSurfaceDecrementUseCountForCategory: error: Attempt to change use count on an IOSurface (%p) created with kIOSurfaceProhibitUseCount.", (const void *)v3);
    qword_1EE788F88 = (uint64_t)crashMessage;
    v10 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
    if (v10)
      IOSurfaceClientIncrementUseCountForCategory_cold_1(v10, v11, v12, v13, v14, v15, v16, v17);
    abort();
  }
  v4 = (unint64_t *)(v3 + 8);
  do
  {
    while (1)
    {
      v5 = *v4;
      v6 = HIDWORD(*v4);
      v7 = (v5 - (*v4 != 0)) | v5 & 0xFFFFFFFF00000000;
      if (a2)
        v7 = *v4 | ((unint64_t)(v6 - ((_DWORD)v6 != 0)) << 32);
      else
        LODWORD(v6) = *v4;
      v8 = __ldxr(v4);
      if (v8 == v5)
        break;
      __clrex();
    }
  }
  while (__stxr(v7, v4));
  if ((_DWORD)v6 == 1)
  {
    v9 = _ioSurfaceConnectInternal(0);
    result = IOConnectTrap2(v9, 1u, *(unsigned int *)(v3 + 136), a2);
    if ((_DWORD)result)
      return fprintf((FILE *)*MEMORY[0x1E0C80C10], "kIOSurfaceMethodDecrementUseCountForCategory failed: %08x\n", result);
  }
  return result;
}

uint64_t IOSurfaceClientIncrementUseCountForCategory(uint64_t result, unsigned int a2)
{
  uint64_t v3;
  unint64_t *v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  io_connect_t v13;
  _BOOL8 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v3 = result;
  if (a2 >= 2)
    result = objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("category out of range"));
  if (*(_BYTE *)(v3 + 221))
  {
    snprintf(crashMessage, 0x100uLL, "IOSurfaceIncrementUseCountForCategory: error: Attempt to change use count on an IOSurface (%p) created with kIOSurfaceProhibitUseCount.", (const void *)v3);
    qword_1EE788F88 = (uint64_t)crashMessage;
    v14 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
    if (v14)
      IOSurfaceClientIncrementUseCountForCategory_cold_1(v14, v15, v16, v17, v18, v19, v20, v21);
    abort();
  }
  v4 = (unint64_t *)(v3 + 8);
  do
  {
    while (1)
    {
      v5 = *v4;
      v6 = HIDWORD(*v4);
      v7 = *v4 & 0xFFFFFFFF00000000;
      v8 = v7 + 0x100000000;
      if ((_DWORD)v6 == -1)
        v8 = 0xFFFFFFFF00000000;
      v9 = v8 & 0xFFFFFFFF00000000 | *v4;
      v10 = (v5 + 1);
      if ((_DWORD)v5 == -1)
        v10 = 0xFFFFFFFFLL;
      v11 = v10 | v7;
      if (a2)
        v11 = v9;
      else
        LODWORD(v6) = *v4;
      v12 = __ldxr(v4);
      if (v12 == v5)
        break;
      __clrex();
    }
  }
  while (__stxr(v11, v4));
  if (!(_DWORD)v6)
  {
    v13 = _ioSurfaceConnectInternal(0);
    result = IOConnectTrap2(v13, 0, *(unsigned int *)(v3 + 136), a2);
    if ((_DWORD)result)
      return fprintf((FILE *)*MEMORY[0x1E0C80C10], "kIOSurfaceMethodIncrementUseCountForCategory failed: %08x\n", result);
  }
  return result;
}

uint64_t IOSurfaceClientGetBulkAttachments(uint64_t a1, void *__dst, size_t *a3)
{
  uint64_t v3;
  size_t v4;

  v3 = 3758097090;
  if (__dst)
  {
    if (a3)
    {
      v4 = *a3;
      v3 = 3758097084;
      if (v4 <= 0x74)
      {
        memcpy(__dst, (const void *)(*(_QWORD *)(a1 + 120) + 48), v4);
        return 0;
      }
    }
  }
  return v3;
}

unsigned int *IOSurfaceClientLookup(unsigned int a1)
{
  unsigned int *Value;
  unsigned int *v3;
  mach_port_t v4;
  unsigned int *v5;
  uintptr_t v6;
  io_connect_t v7;
  size_t v9;
  uint64_t input;
  __int128 outputStruct;
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
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  pthread_mutex_lock(&_iosCacheMutex);
  if (_iosCacheDict
    && (Value = (unsigned int *)CFDictionaryGetValue((CFDictionaryRef)_iosCacheDict, (const void *)a1)) != 0)
  {
    v3 = Value;
    ++*Value;
  }
  else
  {
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    outputStruct = 0u;
    v12 = 0u;
    v9 = 3176;
    input = a1;
    v4 = _ioSurfaceConnectInternal(0);
    v3 = 0;
    if (!IOConnectCallMethod(v4, 4u, &input, 1u, 0, 0, 0, 0, &outputStruct, &v9))
    {
      v5 = (unsigned int *)_ioSurfaceClientCreateWithLockResult((unsigned int *)&outputStruct);
      v3 = v5;
      if (v5)
      {
        _ioSurfaceAddClientRef(v5);
      }
      else
      {
        v6 = DWORD2(v12);
        v7 = _ioSurfaceConnectInternal(0);
        IOConnectTrap1(v7, 5u, v6);
      }
      if (*MEMORY[0x1E0C80C60])
        ((void (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))*MEMORY[0x1E0C80C60])(1476395024, *MEMORY[0x1E0C83DA0], v13, 0, outputStruct, 0);
    }
  }
  pthread_mutex_unlock(&_iosCacheMutex);
  return v3;
}

void unserializeReplacementArrayValues(uint64_t a1, __CFArray *a2)
{
  const void *v3;

  v3 = (const void *)unserializeReplacementIOKitTypeRef(a1, 0);
  CFArrayAppendValue(a2, v3);
  CFRelease(v3);
}

void IOSurfaceClientRelease(_DWORD *a1)
{
  uintptr_t v3;
  io_connect_t v4;
  kern_return_t v5;
  int v6;
  uintptr_t v7;
  io_connect_t v8;
  const void *v9;
  const void *v10;
  const void *v11;

  if (a1)
  {
    pthread_mutex_lock(&_iosCacheMutex);
    if ((*a1)-- == 1)
    {
      CFDictionaryRemoveValue((CFMutableDictionaryRef)_iosCacheDict, (const void *)a1[34]);
      v3 = a1[34];
      v4 = _ioSurfaceConnectInternal(0);
      v5 = IOConnectTrap1(v4, 4u, v3);
      if (v5)
      {
        v6 = v5;
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          IOSurfaceClientRelease_cold_1(v6);
      }
      pthread_mutex_unlock(&_iosCacheMutex);

      *((_QWORD *)a1 + 13) = 0;
      v7 = a1[34];
      v8 = _ioSurfaceConnectInternal(0);
      if (!IOConnectTrap1(v8, 5u, v7) && _iosClientAddressesSet)
      {
        v9 = (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *((_QWORD *)a1 + 14));
        if (CFSetGetValue((CFSetRef)_iosClientAddressesSet, v9))
        {
          CFSetRemoveValue((CFMutableSetRef)_iosClientAddressesSet, v9);
        }
        else if (*MEMORY[0x1E0C80C60] && !a1[56])
        {
          ((void (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))*MEMORY[0x1E0C80C60])(32, *MEMORY[0x1E0C83DA0], *((_QWORD *)a1 + 14), *((_QWORD *)a1 + 18), 0, 0);
        }
      }
      v10 = (const void *)*((_QWORD *)a1 + 2);
      if (v10)
        CFRelease(v10);
      v11 = (const void *)*((_QWORD *)a1 + 3);
      if (v11)
        CFRelease(v11);
      pthread_mutex_destroy((pthread_mutex_t *)(a1 + 10));
      free(a1);
    }
    else
    {
      pthread_mutex_unlock(&_iosCacheMutex);
    }
  }
}

void IOSurfaceClientRemoveValue(uint64_t a1, __CFString *key)
{
  pthread_mutex_t *v4;
  const __CFDictionary *v5;
  const __CFData *ExternalRepresentation;
  const __CFData *v7;
  size_t Length;
  size_t v9;
  char *v10;
  const UInt8 *BytePtr;
  const __CFDictionary *v12;
  mach_port_t v13;
  kern_return_t v14;
  int v15;
  int v16;
  const __CFDictionary *v17;
  const __CFAllocator *v18;
  CFMutableDictionaryRef MutableCopy;
  const __CFDictionary *v20;
  const __CFAllocator *v21;
  __CFDictionary *v22;
  const void *v23;
  const __CFAllocator *v24;
  const void *v25;
  size_t v26;
  _OWORD v27[7];
  __int128 v28;
  CFTypeRef cf[2];
  int outputStruct;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  outputStruct = 0;
  v28 = 0u;
  *(_OWORD *)cf = 0u;
  memset(v27, 0, sizeof(v27));
  v26 = 4;
  if (!key)
  {
    IOSurfaceClientSetBulkAttachments(a1, (uint64_t)v27, 0x74uLL, 0x1FFFF);
    v4 = (pthread_mutex_t *)(a1 + 40);
    pthread_mutex_lock((pthread_mutex_t *)(a1 + 40));
    v12 = *(const __CFDictionary **)(a1 + 16);
    if ((!v12 || !CFDictionaryGetCount(v12)) && *(_DWORD *)(a1 + 32) == *(_DWORD *)(*(_QWORD *)(a1 + 120) + 32))
    {
      pthread_mutex_unlock((pthread_mutex_t *)(a1 + 40));
      return;
    }
    v9 = 13;
    v10 = (char *)malloc_type_malloc(0xDuLL, 0x32FC14FFuLL);
    *(_DWORD *)v10 = *(_DWORD *)(a1 + 136);
    v10[12] = 0;
    goto LABEL_17;
  }
  _sniffKeysToStruct(key, 0, (uint64_t)v27);
  if (*((_QWORD *)&v28 + 1))
    IOSurfaceClientSetBulkAttachments(a1, (uint64_t)v27, 0x74uLL, SDWORD2(v28));
  if (cf[1])
    CFRelease(cf[1]);
  if (LOBYTE(cf[0]))
  {
    v4 = (pthread_mutex_t *)(a1 + 40);
    pthread_mutex_lock((pthread_mutex_t *)(a1 + 40));
    v5 = *(const __CFDictionary **)(a1 + 16);
    if ((!v5 || !CFDictionaryGetValue(v5, key)) && *(_DWORD *)(a1 + 32) == *(_DWORD *)(*(_QWORD *)(a1 + 120) + 32))
      goto LABEL_39;
    ExternalRepresentation = CFStringCreateExternalRepresentation(0, key, 0x8000100u, 0);
    if (!ExternalRepresentation)
    {
      v10 = 0;
      goto LABEL_38;
    }
    v7 = ExternalRepresentation;
    Length = CFDataGetLength(ExternalRepresentation);
    v9 = (Length + 13);
    v10 = (char *)malloc_type_malloc(v9, 0xA6A4DDCFuLL);
    *(_DWORD *)v10 = *(_DWORD *)(a1 + 136);
    BytePtr = CFDataGetBytePtr(v7);
    memcpy(v10 + 12, BytePtr, Length);
    v10[Length + 12] = 0;
    CFRelease(v7);
LABEL_17:
    v13 = _ioSurfaceConnectInternal(0);
    v14 = IOConnectCallMethod(v13, 0xBu, 0, 0, v10, v9, 0, 0, &outputStruct, &v26);
    if (v14)
      fprintf((FILE *)*MEMORY[0x1E0C80C10], "kIOSurfaceMethodRemoveValue failed: %08x\n", v14);
    v15 = *(_DWORD *)(a1 + 32);
    if (!v15)
      goto LABEL_38;
    v16 = (v15 | 1) + 2;
    if (outputStruct != v16)
      goto LABEL_38;
    *(_DWORD *)(a1 + 32) = v16;
    if (key)
    {
      if (!CFEqual(CFSTR("CreationProperties"), key))
      {
        v17 = *(const __CFDictionary **)(a1 + 16);
        v18 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
        if (v17)
          MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, v17);
        else
          MutableCopy = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
        v22 = MutableCopy;
        if (!CFEqual(key, CFSTR("IOSurfaceName")) && !CFEqual(key, CFSTR("CreationProperties")))
          CFDictionaryRemoveValue(v22, key);
        v25 = *(const void **)(a1 + 16);
        if (v25)
          CFRelease(v25);
        v24 = v18;
LABEL_37:
        *(_QWORD *)(a1 + 16) = CFDictionaryCreateCopy(v24, v22);
        CFRelease(v22);
      }
    }
    else
    {
      v20 = *(const __CFDictionary **)(a1 + 16);
      if (v20)
      {
        v21 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
        v22 = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, v20);
        CFDictionaryApplyFunction(*(CFDictionaryRef *)(a1 + 16), (CFDictionaryApplierFunction)removeAllButNameAndCreation, v22);
        v23 = *(const void **)(a1 + 16);
        if (v23)
          CFRelease(v23);
        v24 = v21;
        goto LABEL_37;
      }
    }
LABEL_38:
    free(v10);
LABEL_39:
    pthread_mutex_unlock(v4);
  }
}

uint64_t IOSurfaceClientSetBulkAttachments(uint64_t a1, uint64_t a2, unint64_t a3, int a4)
{
  uint64_t v6;
  uint64_t v7;
  mach_port_t v11;
  _OWORD inputStruct[7];
  __int128 v13;
  __int128 v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (a3 > 0x74)
    return 3758097084;
  v6 = *(_QWORD *)(a1 + 120);
  if ((a4 & 1) != 0)
  {
    v7 = *(_QWORD *)a2 != *(_QWORD *)(v6 + 48)
      || *(_QWORD *)(a2 + 8) != *(_QWORD *)(v6 + 56)
      || *(_QWORD *)(a2 + 16) != *(_QWORD *)(v6 + 64)
      || *(_QWORD *)(a2 + 24) != *(_QWORD *)(v6 + 72);
    if ((a4 & 2) == 0)
      goto LABEL_21;
  }
  else
  {
    v7 = 0;
    if ((a4 & 2) == 0)
      goto LABEL_21;
  }
  if (*(_OWORD *)(a2 + 32) != *(_OWORD *)(v6 + 80))
    v7 |= 2uLL;
LABEL_21:
  if ((a4 & 4) != 0)
  {
    if (*(_QWORD *)(a2 + 48) != *(_QWORD *)(v6 + 96))
      v7 |= 4uLL;
    if ((a4 & 8) == 0)
    {
LABEL_23:
      if ((a4 & 0x10) == 0)
        goto LABEL_24;
      goto LABEL_43;
    }
  }
  else if ((a4 & 8) == 0)
  {
    goto LABEL_23;
  }
  if (*(unsigned __int8 *)(a2 + 56) != *(unsigned __int8 *)(v6 + 104))
    v7 |= 8uLL;
  if ((a4 & 0x10) == 0)
  {
LABEL_24:
    if ((a4 & 0x20) == 0)
      goto LABEL_25;
    goto LABEL_46;
  }
LABEL_43:
  if (*(unsigned __int8 *)(a2 + 57) != *(unsigned __int8 *)(v6 + 105))
    v7 |= 0x10uLL;
  if ((a4 & 0x20) == 0)
  {
LABEL_25:
    if ((a4 & 0x40) == 0)
      goto LABEL_26;
    goto LABEL_49;
  }
LABEL_46:
  if (*(unsigned __int8 *)(a2 + 58) != *(unsigned __int8 *)(v6 + 106))
    v7 |= 0x20uLL;
  if ((a4 & 0x40) == 0)
  {
LABEL_26:
    if ((a4 & 0x80) == 0)
      goto LABEL_27;
    goto LABEL_52;
  }
LABEL_49:
  if (*(unsigned __int8 *)(a2 + 59) != *(unsigned __int8 *)(v6 + 107))
    v7 |= 0x40uLL;
  if ((a4 & 0x80) == 0)
  {
LABEL_27:
    if ((a4 & 0x100) == 0)
      goto LABEL_28;
    goto LABEL_55;
  }
LABEL_52:
  if (*(unsigned __int8 *)(a2 + 60) != *(unsigned __int8 *)(v6 + 108))
    v7 |= 0x80uLL;
  if ((a4 & 0x100) == 0)
  {
LABEL_28:
    if ((a4 & 0x200) == 0)
      goto LABEL_29;
    goto LABEL_58;
  }
LABEL_55:
  if (*(unsigned __int8 *)(a2 + 61) != *(unsigned __int8 *)(v6 + 109))
    v7 |= 0x100uLL;
  if ((a4 & 0x200) == 0)
  {
LABEL_29:
    if ((a4 & 0x400) == 0)
      goto LABEL_30;
    goto LABEL_61;
  }
LABEL_58:
  if (*(unsigned __int8 *)(a2 + 62) != *(unsigned __int8 *)(v6 + 110))
    v7 |= 0x200uLL;
  if ((a4 & 0x400) == 0)
  {
LABEL_30:
    if ((a4 & 0x800) == 0)
      goto LABEL_31;
    goto LABEL_64;
  }
LABEL_61:
  if (*(unsigned __int8 *)(a2 + 63) != *(unsigned __int8 *)(v6 + 111))
    v7 |= 0x400uLL;
  if ((a4 & 0x800) == 0)
  {
LABEL_31:
    if ((a4 & 0x1000) == 0)
      goto LABEL_32;
    goto LABEL_67;
  }
LABEL_64:
  if (*(_QWORD *)(a2 + 64) ^ *(_QWORD *)(v6 + 112) | *(_QWORD *)(a2 + 72) ^ *(_QWORD *)(v6 + 120) | *(_QWORD *)(a2 + 80) ^ *(_QWORD *)(v6 + 128))
    v7 |= 0x800uLL;
  if ((a4 & 0x1000) == 0)
  {
LABEL_32:
    if ((a4 & 0x2000) == 0)
      goto LABEL_33;
    goto LABEL_70;
  }
LABEL_67:
  if (*(_DWORD *)(a2 + 88) != *(_DWORD *)(v6 + 136))
    v7 |= 0x1000uLL;
  if ((a4 & 0x2000) == 0)
  {
LABEL_33:
    if ((a4 & 0x4000) == 0)
      goto LABEL_34;
    goto LABEL_73;
  }
LABEL_70:
  if (*(_QWORD *)(a2 + 92) != *(_QWORD *)(v6 + 140))
    v7 |= 0x2000uLL;
  if ((a4 & 0x4000) == 0)
  {
LABEL_34:
    if ((a4 & 0x8000) == 0)
      goto LABEL_35;
LABEL_76:
    if (*(_QWORD *)(a2 + 104) != *(_QWORD *)(v6 + 152))
      v7 |= 0x8000uLL;
    if ((a4 & 0x10000) == 0)
      goto LABEL_81;
    goto LABEL_79;
  }
LABEL_73:
  if (*(unsigned __int8 *)(a2 + 100) != *(unsigned __int8 *)(v6 + 148))
    v7 |= 0x4000uLL;
  if ((a4 & 0x8000) != 0)
    goto LABEL_76;
LABEL_35:
  if ((a4 & 0x10000) == 0)
    goto LABEL_81;
LABEL_79:
  if (*(_DWORD *)(a2 + 112) != *(_DWORD *)(v6 + 160))
  {
    v7 |= 0x10000uLL;
LABEL_82:
    v13 = 0u;
    v14 = 0u;
    memset(inputStruct, 0, sizeof(inputStruct));
    DWORD2(v14) = *(_DWORD *)(a1 + 136);
    __memcpy_chk();
    *((_QWORD *)&v13 + 1) = a3;
    *(_QWORD *)&v14 = v7;
    v11 = _ioSurfaceConnectInternal(0);
    return IOConnectCallMethod(v11, 0x1Bu, 0, 0, inputStruct, 0x90uLL, 0, 0, 0, 0);
  }
LABEL_81:
  if (v7)
    goto LABEL_82;
  return 0;
}

unsigned int *IOSurfaceClientLookupFromMachPort(unsigned int a1)
{
  mach_port_t v2;
  unsigned int *v3;
  unsigned int *v5;
  unsigned int *Value;
  uintptr_t v7;
  io_connect_t v8;
  size_t v9;
  uint64_t input;
  __int128 outputStruct;
  void *key[2];
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
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  outputStruct = 0u;
  *(_OWORD *)key = 0u;
  _ioSurfaceConnectInternal(0);
  pthread_mutex_lock(&_iosCacheMutex);
  v9 = 3176;
  input = a1;
  v2 = _ioSurfaceConnectInternal(0);
  v3 = 0;
  if (!IOConnectCallMethod(v2, 0x22u, &input, 1u, 0, 0, 0, 0, &outputStruct, &v9))
  {
    if ((_QWORD)outputStruct == -1)
    {
      if (_iosCacheDict)
      {
        Value = (unsigned int *)CFDictionaryGetValue((CFDictionaryRef)_iosCacheDict, (const void *)LODWORD(key[1]));
        v3 = Value;
        if (Value)
          ++*Value;
      }
      else
      {
        v3 = 0;
      }
    }
    else
    {
      v5 = (unsigned int *)_ioSurfaceClientCreateWithLockResult((unsigned int *)&outputStruct);
      v3 = v5;
      if (v5)
      {
        _ioSurfaceAddClientRef(v5);
      }
      else
      {
        v7 = LODWORD(key[1]);
        v8 = _ioSurfaceConnectInternal(0);
        IOConnectTrap1(v8, 5u, v7);
      }
      if (*MEMORY[0x1E0C80C60])
        ((void (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))*MEMORY[0x1E0C80C60])(1476395024, *MEMORY[0x1E0C83DA0], v13, 0, outputStruct, 0);
    }
  }
  pthread_mutex_unlock(&_iosCacheMutex);
  return v3;
}

IOSurfaceRef IOSurfaceCreate(CFDictionaryRef properties)
{
  id DictionaryAddingMissingProperties;
  IOSurface *v2;

  DictionaryAddingMissingProperties = _iosCreateDictionaryAddingMissingProperties(properties);
  v2 = -[IOSurface initWithProperties:]([IOSurface alloc], "initWithProperties:", DictionaryAddingMissingProperties);

  return (IOSurfaceRef)v2;
}

id _iosCreateDictionaryAddingMissingProperties(void *a1)
{
  uint64_t v2;
  const __CFDictionary *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  BOOL v9;
  id v10;
  const char *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  CFTypeRef cf[2];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(a1, "objectForKey:", CFSTR("IOSurfaceName"));
  v3 = (const __CFDictionary *)objc_msgSend(a1, "objectForKey:", CFSTR("IOSurfaceDefaultAttachments"));
  v4 = objc_msgSend(a1, "objectForKey:", CFSTR("IOSurfaceDefaultBulkAttachments"));
  v5 = (void *)MEMORY[0x1A85A6B48]();
  if (!((unint64_t)v3 | v4))
    goto LABEL_12;
  v20 = 0u;
  *(_OWORD *)cf = 0u;
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v13 = 0u;
  if (v4)
    objc_msgSend((id)v4, "getBytes:length:", &v13, 116);
  if (v3)
  {
    CFDictionaryApplyFunction(v3, (CFDictionaryApplierFunction)_sniffKeysToStruct, &v13);
    if (cf[1])
      CFRelease(cf[1]);
  }
  if (*((_QWORD *)&v20 + 1))
  {
    v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v7 = v6;
    if (v6)
    {
      if (v3)
        objc_msgSend(v6, "addEntriesFromDictionary:", v3, v13, v14, v15, v16, v17, v18, v19, (_QWORD)v20);
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", &v13, 116);
      objc_msgSend(v7, "removeObjectForKey:", CFSTR("IOSurfaceCleanAperture"));
      objc_msgSend(v7, "removeObjectForKey:", CFSTR("IOSurfacePixelAspectRatio"));
      objc_msgSend(v7, "removeObjectForKey:", CFSTR("IOSurfaceGammaLevel"));
      objc_msgSend(v7, "removeObjectForKey:", CFSTR("IOSurfaceFieldCount"));
      objc_msgSend(v7, "removeObjectForKey:", CFSTR("IOSurfaceFieldDetail"));
      objc_msgSend(v7, "removeObjectForKey:", CFSTR("IOSurfaceYCbCrMatrix"));
      objc_msgSend(v7, "removeObjectForKey:", CFSTR("IOSurfaceColorPrimaries"));
      objc_msgSend(v7, "removeObjectForKey:", CFSTR("IOSurfaceTransferFunction"));
      objc_msgSend(v7, "removeObjectForKey:", CFSTR("IOSurfaceChromaLocationTopField"));
      objc_msgSend(v7, "removeObjectForKey:", CFSTR("IOSurfaceChromaLocationBottomField"));
      objc_msgSend(v7, "removeObjectForKey:", CFSTR("IOSurfaceChromaSubsampling"));
      objc_msgSend(v7, "removeObjectForKey:", CFSTR("IOSurfaceEDRFactor"));
    }
    else
    {
      v8 = 0;
    }
  }
  else
  {
LABEL_12:
    v8 = 0;
    v7 = 0;
  }
  if (v2)
    v9 = v7 == 0;
  else
    v9 = 0;
  if (v9)
  {
    v10 = a1;
  }
  else
  {
    v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v10, "addEntriesFromDictionary:", a1);
    if (!v2)
    {
      v11 = (const char *)dyld_image_path_containing_address();
      if (v11)
        objc_msgSend(v10, "setObject:forKey:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "stringWithFileSystemRepresentation:length:", v11, strlen(v11)), "lastPathComponent"), CFSTR("IOSurfaceName"));
    }
    if (v7)
    {
      objc_msgSend(v10, "setValue:forKey:", v7, CFSTR("IOSurfaceDefaultAttachments"));

    }
    if (v8)
    {
      objc_msgSend(v10, "setValue:forKey:", v8, CFSTR("IOSurfaceDefaultBulkAttachments"));

    }
  }
  objc_autoreleasePoolPop(v5);
  return v10;
}

unsigned int *IOSurfaceClientCreateChild(uint64_t a1, CFTypeRef object)
{
  uint64_t v3;
  CFDataRef v4;
  const __CFData *v5;
  mach_port_t v6;
  const UInt8 *BytePtr;
  size_t Length;
  kern_return_t v9;
  unsigned int *v10;
  const void *Value;
  void (*v12)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD);
  const void *v13;
  int v14;
  _BOOL8 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uintptr_t v24;
  io_connect_t v25;
  size_t v26;
  uint64_t input;
  __int128 outputStruct;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
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
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  if (a1)
    v3 = *(unsigned int *)(a1 + 136);
  else
    v3 = 0;
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
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  outputStruct = 0u;
  v29 = 0u;
  v26 = 3176;
  input = v3;
  v4 = IOCFSerialize(object, 1uLL);
  if (v4)
  {
    v5 = v4;
    v6 = _ioSurfaceConnectInternal(0);
    BytePtr = CFDataGetBytePtr(v5);
    Length = CFDataGetLength(v5);
    v9 = IOConnectCallMethod(v6, 0, &input, 1u, BytePtr, Length, 0, 0, &outputStruct, &v26);
    CFRelease(v5);
    if (!v9)
    {
      v10 = (unsigned int *)_ioSurfaceClientCreateWithLockResult((unsigned int *)&outputStruct);
      if (v10)
      {
        Value = CFDictionaryGetValue((CFDictionaryRef)object, CFSTR("IOSurfacePrefetchPages"));
        if (Value && CFEqual(Value, (CFTypeRef)*MEMORY[0x1E0C9AE50]))
          IOSurfaceClientPrefetchPages((uint64_t)v10);
        pthread_mutex_lock(&_iosCacheMutex);
        _ioSurfaceAddClientRef(v10);
        v12 = (void (*)(uint64_t, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))*MEMORY[0x1E0C80C60];
        if (*MEMORY[0x1E0C80C60])
        {
          if (!_iosClientAddressesSet)
            _iosClientAddressesSet = (uint64_t)CFSetCreateMutable(0, 0, MEMORY[0x1E0C9B3B0]);
          v13 = CFDictionaryGetValue((CFDictionaryRef)object, CFSTR("IOSurfaceAddress"));
          if (v13)
          {
            CFSetAddValue((CFMutableSetRef)_iosClientAddressesSet, v13);
          }
          else if (!v3)
          {
            v12(1476395024, *MEMORY[0x1E0C83DA0], v30, 0, outputStruct, 0);
          }
        }
        pthread_mutex_unlock(&_iosCacheMutex);
      }
      else
      {
        v24 = DWORD2(v29);
        v25 = _ioSurfaceConnectInternal(0);
        IOConnectTrap1(v25, 5u, v24);
      }
      return v10;
    }
  }
  else
  {
    v9 = -1;
  }
  if (_ioSurfaceConnectInternal(0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      IOSurfaceClientCreateChild_cold_3(v9, v3, (uint64_t)object);
  }
  else
  {
    v14 = _iosService;
    v15 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v14)
    {
      if (v15)
        IOSurfaceClientCreateChild_cold_2();
    }
    else if (v15)
    {
      IOSurfaceClientCreateChild_cold_1(v15, v16, v17, v18, v19, v20, v21, v22);
    }
  }
  return 0;
}

char *_ioSurfaceClientCreateWithLockResult(unsigned int *a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  char *v5;

  v2 = a1[22];
  if ((_DWORD)v2)
    v3 = 152 * (20 - v2);
  else
    v3 = 2888;
  v4 = (char *)malloc_type_malloc(3288 - v3, 0x6661FA4EuLL);
  v5 = v4;
  if (v4)
  {
    *(_DWORD *)v4 = 1;
    *((_QWORD *)v4 + 13) = 0;
    *((_QWORD *)v4 + 2) = 0;
    *((_QWORD *)v4 + 3) = 0;
    *((_QWORD *)v4 + 1) = 0;
    *((_DWORD *)v4 + 8) = 0;
    pthread_mutex_init((pthread_mutex_t *)(v4 + 40), 0);
    memcpy(v5 + 112, a1, 3176 - v3);
  }
  return v5;
}

void _ioSurfaceAddClientRef(unsigned int *value)
{
  __CFDictionary *Mutable;

  Mutable = (__CFDictionary *)_iosCacheDict;
  if (!_iosCacheDict)
  {
    Mutable = CFDictionaryCreateMutable(0, 0, 0, 0);
    _iosCacheDict = (uint64_t)Mutable;
  }
  CFDictionaryAddValue(Mutable, (const void *)value[34], value);
}

unsigned int *IOSurfaceClientCreate(CFTypeRef object)
{
  return IOSurfaceClientCreateChild(0, object);
}

const __CFDictionary *IOSurfaceClientCopyAllValues(uint64_t a1)
{
  uint64_t v1;
  pthread_mutex_t *v3;
  const __CFDictionary *v5[2];

  v5[1] = *(const __CFDictionary **)MEMORY[0x1E0C80C00];
  v5[0] = 0;
  v1 = *(_QWORD *)(a1 + 120);
  if (!*(_DWORD *)(v1 + 40))
    return 0;
  v3 = (pthread_mutex_t *)(a1 + 40);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 40));
  IOSurfaceClientUpdateNonBulkValueCache(a1);
  _insertAllKeysFromStruct(*(const __CFDictionary **)(a1 + 16), v1 + 48, v5);
  pthread_mutex_unlock(v3);
  return v5[0];
}

const void *IOSurfaceClientCopyValue(uint64_t a1, void *key)
{
  const void *v2;
  const __CFDictionary *v4;
  const void *Value;
  _QWORD v7[2];

  v2 = key;
  v7[1] = *MEMORY[0x1E0C80C00];
  v7[0] = 0;
  if (key)
  {
    if (_copySniffKeyFromStruct(key, *(_QWORD *)(a1 + 120) + 48, v7))
    {
      return (const void *)v7[0];
    }
    else
    {
      pthread_mutex_lock((pthread_mutex_t *)(a1 + 40));
      IOSurfaceClientUpdateNonBulkValueCache(a1);
      v4 = *(const __CFDictionary **)(a1 + 16);
      if (v4)
      {
        Value = CFDictionaryGetValue(v4, v2);
        v2 = Value;
        if (Value)
          CFRetain(Value);
        pthread_mutex_unlock((pthread_mutex_t *)(a1 + 40));
      }
      else
      {
        pthread_mutex_unlock((pthread_mutex_t *)(a1 + 40));
        return 0;
      }
    }
  }
  return v2;
}

void IOSurfaceClientUpdateNonBulkValueCache(uint64_t a1)
{
  uint64_t v1;
  unsigned int v2;
  const void *v4;
  unint64_t v5;
  size_t v6;
  uint64_t v7;
  char *v8;
  mach_port_t v9;
  size_t v10;
  BOOL v11;
  CFTypeRef v12;
  const char *CStringPtr;
  const __CFDictionary *v14;
  const __CFDictionary *Value;
  const __CFDictionary *v16;
  CFTypeID v17;
  _DWORD v18[6];
  CFStringRef errorString;
  size_t v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 120);
  v2 = *(_DWORD *)(v1 + 40);
  if (!v2 || *(_DWORD *)(a1 + 32) == *(_DWORD *)(v1 + 32))
    return;
  v4 = *(const void **)(a1 + 16);
  if (v4)
  {
    CFRelease(v4);
    *(_QWORD *)(a1 + 16) = 0;
    v2 = *(_DWORD *)(v1 + 40);
  }
  v5 = (*MEMORY[0x1E0C85AD8] + v2 + 11) & -*MEMORY[0x1E0C85AD8];
  if (v5 <= 0x4000)
    v6 = 0x4000;
  else
    v6 = v5;
  v20[0] = v6;
  v7 = ((uint64_t (*)(void))MEMORY[0x1E0C80A78])();
  memset(v18, 0, 13);
  while (1)
  {
    if (v6 > 0x4000)
    {
      v8 = (char *)malloc_type_valloc(v6, 0x79E7C357uLL);
    }
    else
    {
      MEMORY[0x1E0C80A78](v7);
      v8 = (char *)v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
      bzero(v8, v6);
    }
    v8[12] = 0;
    v18[0] = *(_DWORD *)(a1 + 136);
    v18[2] = *(_QWORD *)(a1 + 24) != 0;
    LOBYTE(v18[3]) = 0;
    v9 = _ioSurfaceConnectInternal(0);
    v7 = IOConnectCallMethod(v9, 0xAu, 0, 0, v18, 0xDuLL, 0, 0, v8, v20);
    if ((_DWORD)v7 != -536870181)
      break;
    v10 = 16 * v20[0];
    v20[0] = v10;
    if (v10 > 0x1000000)
      goto LABEL_30;
    v11 = v6 > 0x4000;
    v6 = v10;
    if (v11)
    {
      free(v8);
      v6 = v20[0];
    }
  }
  if (!(_DWORD)v7)
  {
    errorString = 0;
    if (v20[0])
    {
      v12 = IOCFUnserializeWithSize(v8 + 12, v20[0] - 12, 0, 0, &errorString);
      if (v12 || !errorString)
      {
        if (v12)
        {
          v14 = unserializeReplacementIOKitTypeRef(v12, *(const void **)(a1 + 24));
          CFRelease(v12);
          goto LABEL_28;
        }
      }
      else
      {
        CStringPtr = CFStringGetCStringPtr(errorString, 0);
        if (CStringPtr)
          fprintf((FILE *)*MEMORY[0x1E0C80C10], "%s\n", CStringPtr);
        CFRelease(errorString);
      }
    }
    v14 = 0;
LABEL_28:
    *(_QWORD *)(a1 + 16) = v14;
    if (!*(_QWORD *)(a1 + 24))
    {
      Value = (const __CFDictionary *)CFDictionaryGetValue(v14, CFSTR("CreationProperties"));
      if (Value)
      {
        v16 = Value;
        v17 = CFGetTypeID(Value);
        if (v17 == CFDictionaryGetTypeID())
          *(_QWORD *)(a1 + 24) = CFDictionaryCreateCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v16);
      }
    }
    *(_DWORD *)(a1 + 32) = *((_DWORD *)v8 + 1);
    goto LABEL_30;
  }
  fprintf((FILE *)*MEMORY[0x1E0C80C10], "IOSurfaceClientCopyValue getValueMethod kernel call failed %08x\n", v7);
LABEL_30:
  if (v6 > 0x4000)
    free(v8);
}

uint64_t _copySniffKeyFromStruct(void *key, uint64_t a2, _QWORD *a3)
{
  uint64_t result;

  if (_ensureKeySniffDictionaries_onceToken != -1)
    dispatch_once(&_ensureKeySniffDictionaries_onceToken, &__block_literal_global_0);
  result = (uint64_t)CFDictionaryGetValue((CFDictionaryRef)_sniffStructToKeysDict, key);
  if (result)
  {
    *a3 = ((uint64_t (*)(uint64_t))result)(a2);
    return 1;
  }
  return result;
}

void IOSurfaceClientSetValue(uint64_t a1, void *key, CFDictionaryRef theDict)
{
  const __CFDictionary *v6;
  const void *Value;
  CFMutableDictionaryRef v8;
  CFIndex v9;
  CFArrayRef v10;
  CFArrayRef v11;
  const __CFData *v12;
  unint64_t Length;
  size_t v14;
  size_t v15;
  _DWORD *v16;
  const UInt8 *BytePtr;
  mach_port_t v18;
  int v19;
  int v20;
  const __CFDictionary *v21;
  const __CFAllocator *v22;
  CFMutableDictionaryRef MutableCopy;
  __CFDictionary *v24;
  const void *v25;
  uint64_t v26;
  uint64_t v27;
  _OWORD context[7];
  __int128 v29;
  CFDictionaryRef theDicta[2];
  size_t v31;
  int outputStruct;
  void *values;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  outputStruct = 0;
  v31 = 4;
  if (theDict)
  {
    values = 0;
    v34 = 0;
    v29 = 0u;
    *(_OWORD *)theDicta = 0u;
    memset(context, 0, sizeof(context));
    if (key)
      _sniffKeysToStruct(key, theDict, (uint64_t)context);
    else
      CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)_sniffKeysToStruct, context);
    if (*((_QWORD *)&v29 + 1))
      IOSurfaceClientSetBulkAttachments(a1, (uint64_t)context, 0x74uLL, SDWORD2(v29));
    if (LOBYTE(theDicta[0]))
    {
      pthread_mutex_lock((pthread_mutex_t *)(a1 + 40));
      v6 = *(const __CFDictionary **)(a1 + 16);
      if (key)
      {
        if (!v6
          || (Value = CFDictionaryGetValue(v6, key)) == 0
          || !CFEqual(Value, theDict)
          || *(_DWORD *)(a1 + 32) != *(_DWORD *)(*(_QWORD *)(a1 + 120) + 32))
        {
          v8 = serializeReplacementIOKitTypeRef(theDict);
          values = v8;
          v34 = key;
          v9 = 2;
LABEL_18:
          v10 = CFArrayCreate(0, (const void **)&values, v9, MEMORY[0x1E0C9B378]);
          if (v10)
          {
            v11 = v10;
            CFRelease(v8);
            v12 = IOCFSerialize(v11, 1uLL);
            CFRelease(v11);
            if (v12)
            {
              Length = CFDataGetLength(v12);
              if (Length >= 0xFFFFFFFFFFFFFFF4)
                abort();
              v14 = Length;
              v15 = (Length + 12);
              v16 = malloc_type_malloc(v15, 0xB65768F1uLL);
              *v16 = *(_DWORD *)(a1 + 136);
              BytePtr = CFDataGetBytePtr(v12);
              memcpy(v16 + 3, BytePtr, v14);
              v18 = _ioSurfaceConnectInternal(0);
              IOConnectCallMethod(v18, 9u, 0, 0, v16, v15, 0, 0, &outputStruct, &v31);
              v19 = *(_DWORD *)(a1 + 32);
              if (v19)
              {
                v20 = (v19 | 1) + 2;
                if (outputStruct == v20)
                {
                  *(_DWORD *)(a1 + 32) = v20;
                  v21 = *(const __CFDictionary **)(a1 + 16);
                  v22 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
                  if (v21)
                    MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, v21);
                  else
                    MutableCopy = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
                  v24 = MutableCopy;
                  if (key)
                  {
                    if (!CFEqual(CFSTR("CreationProperties"), key))
                      CFDictionarySetValue(v24, key, theDict);
                  }
                  else
                  {
                    CFDictionaryApplyFunction(theDicta[1], (CFDictionaryApplierFunction)setEachValueInDictionary, MutableCopy);
                  }
                  v25 = *(const void **)(a1 + 16);
                  if (v25)
                    CFRelease(v25);
                  *(_QWORD *)(a1 + 16) = CFDictionaryCreateCopy(v22, v24);
                  CFRelease(v24);
                }
              }
              free(v16);
              CFRelease(v12);
            }
          }
        }
      }
      else if (!v6
             || (v26 = *(_QWORD *)(a1 + 16),
                 v27 = 1,
                 CFDictionaryApplyFunction(theDict, (CFDictionaryApplierFunction)compareKeys, &v26),
                 !(_BYTE)v27)
             || *(_DWORD *)(a1 + 32) != *(_DWORD *)(*(_QWORD *)(a1 + 120) + 32))
      {
        v8 = serializeReplacementIOKitTypeRef(theDicta[1]);
        values = v8;
        v9 = 1;
        goto LABEL_18;
      }
      pthread_mutex_unlock((pthread_mutex_t *)(a1 + 40));
      if (theDicta[1])
        CFRelease(theDicta[1]);
    }
  }
}

void unserializeReplacementDictionaryKeysAndValues(const void *a1, uint64_t a2, __CFDictionary *a3)
{
  const void *v5;
  const void *Value;
  const void *v7;

  v5 = (const void *)unserializeReplacementIOKitTypeRef(a2, 0);
  Value = CFDictionaryGetValue((CFDictionaryRef)_creationPropertiesDict, a1);
  if (Value)
    v7 = Value;
  else
    v7 = a1;
  CFDictionarySetValue(a3, v7, v5);
  CFRelease(v5);
}

CFNumberRef unserializeReplacementIOKitTypeRef(const void *a1, const void *a2)
{
  CFTypeID v4;
  const __CFData *Value;
  const __CFData *v6;
  CFIndex Length;
  CFTypeID v8;
  CFAllocatorRef v9;
  const UInt8 *BytePtr;
  const __CFAllocator *v11;
  CFNumberType v12;
  CFTypeID v13;
  const __CFAllocator *v14;
  CFIndex Count;
  CFMutableArrayRef Mutable;
  const __CFAllocator *v17;
  CFArrayRef Copy;
  const __CFAllocator *v19;
  CFIndex v20;
  CFMutableDictionaryRef v21;
  const __CFAllocator *v22;
  CFDictionaryRef v23;
  CFMutableArrayRef v24;
  CFTypeID v25;
  const __CFAllocator *v26;
  CFIndex v27;
  const __CFAllocator *v28;
  CFAllocatorRef v30;
  CFRange v31;

  v4 = CFGetTypeID(a1);
  if (v4 != CFDictionaryGetTypeID())
  {
    v13 = CFGetTypeID(a1);
    if (v13 == CFArrayGetTypeID())
    {
      v14 = CFGetAllocator(a1);
      Count = CFArrayGetCount((CFArrayRef)a1);
      Mutable = CFArrayCreateMutable(v14, Count, MEMORY[0x1E0C9B378]);
      v31.length = CFArrayGetCount((CFArrayRef)a1);
      v31.location = 0;
      CFArrayApplyFunction((CFArrayRef)a1, v31, (CFArrayApplierFunction)unserializeReplacementArrayValues, Mutable);
      v17 = CFGetAllocator(a1);
      Copy = CFArrayCreateCopy(v17, Mutable);
    }
    else
    {
      v25 = CFGetTypeID(a1);
      if (v25 != CFSetGetTypeID())
        return (CFNumberRef)CFRetain(a1);
      v26 = CFGetAllocator(a1);
      v27 = CFSetGetCount((CFSetRef)a1);
      Mutable = CFSetCreateMutable(v26, v27, MEMORY[0x1E0C9B3B0]);
      CFSetApplyFunction((CFSetRef)a1, (CFSetApplierFunction)unserializeReplacementSetValues, Mutable);
      v28 = CFGetAllocator(a1);
      Copy = CFSetCreateCopy(v28, Mutable);
    }
    v23 = Copy;
    v24 = Mutable;
LABEL_15:
    CFRelease(v24);
    return v23;
  }
  Value = (const __CFData *)CFDictionaryGetValue((CFDictionaryRef)a1, CFSTR("iokit-float"));
  if (!Value)
    goto LABEL_9;
  v6 = Value;
  Length = CFDataGetLength(Value);
  v8 = CFGetTypeID(v6);
  if (v8 != CFDataGetTypeID())
    goto LABEL_9;
  if (Length == 8)
  {
    v30 = CFGetAllocator(a1);
    BytePtr = CFDataGetBytePtr(v6);
    v11 = v30;
    v12 = kCFNumberDoubleType;
    return CFNumberCreate(v11, v12, BytePtr);
  }
  if (Length != 4)
  {
LABEL_9:
    v19 = CFGetAllocator(a1);
    v20 = CFDictionaryGetCount((CFDictionaryRef)a1);
    v21 = CFDictionaryCreateMutable(v19, v20, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    CFDictionaryApplyFunction((CFDictionaryRef)a1, (CFDictionaryApplierFunction)unserializeReplacementDictionaryKeysAndValues, v21);
    if (a2)
      CFDictionarySetValue(v21, CFSTR("CreationProperties"), a2);
    v22 = CFGetAllocator(a1);
    v23 = CFDictionaryCreateCopy(v22, v21);
    v24 = v21;
    goto LABEL_15;
  }
  v9 = CFGetAllocator(a1);
  BytePtr = CFDataGetBytePtr(v6);
  v11 = v9;
  v12 = kCFNumberFloatType;
  return CFNumberCreate(v11, v12, BytePtr);
}

uint64_t _ioSurfaceConnectInternal(char a1)
{
  _QWORD v2[4];
  char v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = ___ioSurfaceConnectInternal_block_invoke;
  v2[3] = &__block_descriptor_33_e5_v8__0l;
  v3 = a1;
  if (_ioSurfaceConnectInternal_once != -1)
    dispatch_once(&_ioSurfaceConnectInternal_once, v2);
  return _iosConnect;
}

void _sniffKeysToStruct(void *key, const void *a2, uint64_t a3)
{
  void (*Value)(const void *, uint64_t);
  __CFDictionary *Mutable;

  if (_ensureKeySniffDictionaries_onceToken != -1)
    dispatch_once(&_ensureKeySniffDictionaries_onceToken, &__block_literal_global_0);
  Value = (void (*)(const void *, uint64_t))CFDictionaryGetValue((CFDictionaryRef)_sniffKeysToStructDict, key);
  if (Value)
  {
    Value(a2, a3);
  }
  else
  {
    *(_BYTE *)(a3 + 128) = 1;
    if (a2)
    {
      Mutable = *(__CFDictionary **)(a3 + 136);
      if (!Mutable)
      {
        Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
        *(_QWORD *)(a3 + 136) = Mutable;
      }
      CFDictionarySetValue(Mutable, key, a2);
    }
  }
}

CFMutableDictionaryRef serializeReplacementIOKitTypeRef(const void *a1)
{
  CFTypeID v2;
  CFNumberType Type;
  const __CFAllocator *v4;
  CFIndex v5;
  CFTypeID v6;
  const __CFAllocator *v7;
  CFIndex Count;
  CFMutableDictionaryRef Mutable;
  CFTypeID v10;
  const __CFAllocator *v11;
  CFIndex v12;
  const __CFAllocator *v13;
  CFTypeID v14;
  const __CFAllocator *v15;
  CFIndex v16;
  uint64_t v18;
  void *keys;
  void *values[2];
  CFRange v21;

  values[1] = *(void **)MEMORY[0x1E0C80C00];
  v2 = CFGetTypeID(a1);
  if (v2 != CFNumberGetTypeID())
  {
    v6 = CFGetTypeID(a1);
    if (v6 == CFDictionaryGetTypeID())
    {
      v7 = CFGetAllocator(a1);
      Count = CFDictionaryGetCount((CFDictionaryRef)a1);
      Mutable = CFDictionaryCreateMutable(v7, Count, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      CFDictionaryApplyFunction((CFDictionaryRef)a1, (CFDictionaryApplierFunction)serializeReplacementDictionaryKeysAndValues, Mutable);
    }
    else
    {
      v10 = CFGetTypeID(a1);
      if (v10 == CFArrayGetTypeID())
      {
        v11 = CFGetAllocator(a1);
        v12 = CFArrayGetCount((CFArrayRef)a1);
        Mutable = CFArrayCreateMutable(v11, v12, MEMORY[0x1E0C9B378]);
        v21.length = CFArrayGetCount((CFArrayRef)a1);
        v21.location = 0;
        CFArrayApplyFunction((CFArrayRef)a1, v21, (CFArrayApplierFunction)serializeReplacementArrayValues, Mutable);
      }
      else
      {
        v14 = CFGetTypeID(a1);
        if (v14 != CFSetGetTypeID())
          return (CFMutableDictionaryRef)CFRetain(a1);
        v15 = CFGetAllocator(a1);
        v16 = CFSetGetCount((CFSetRef)a1);
        Mutable = CFSetCreateMutable(v15, v16, MEMORY[0x1E0C9B3B0]);
        CFSetApplyFunction((CFSetRef)a1, (CFSetApplierFunction)serializeReplacementSetValues, Mutable);
      }
    }
    return Mutable;
  }
  if (CFNumberIsFloatType((CFNumberRef)a1))
  {
    Type = CFNumberGetType((CFNumberRef)a1);
    keys = CFSTR("iokit-float");
    values[0] = 0;
    if ((unint64_t)Type > kCFNumberCGFloatType)
      goto LABEL_13;
    if (((1 << Type) & 0x12040) != 0)
    {
      v18 = 0;
      CFNumberGetValue((CFNumberRef)a1, kCFNumberDoubleType, &v18);
      v4 = CFGetAllocator(a1);
      v5 = 8;
    }
    else
    {
      if (((1 << Type) & 0x1020) == 0)
        goto LABEL_13;
      LODWORD(v18) = 0;
      CFNumberGetValue((CFNumberRef)a1, kCFNumberFloatType, &v18);
      v4 = CFGetAllocator(a1);
      v5 = 4;
    }
    values[0] = CFDataCreate(v4, (const UInt8 *)&v18, v5);
LABEL_13:
    v13 = CFGetAllocator(a1);
    Mutable = CFDictionaryCreate(v13, (const void **)&keys, (const void **)values, 1, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    if (values[0])
      CFRelease(values[0]);
    return Mutable;
  }
  return (CFMutableDictionaryRef)CFRetain(a1);
}

void _insertAllKeysFromStruct(const __CFDictionary *a1, uint64_t a2, const __CFDictionary **a3)
{
  CFDictionaryRef CleanApertureFromStruct;
  CFDictionaryRef PixelAspectRatioFromStruct;
  uint64_t v7;
  _BOOL8 v8;
  _BOOL8 v9;
  CFNumberRef v10;
  __CFString *v11;
  _BOOL8 v12;
  unsigned int v13;
  __CFString **v14;
  CFIndex v15;
  __CFString *YCbCrMatrixFromStruct;
  __CFString *ColorPrimariesFromStruct;
  __CFString *TransferFunctionFromStruct;
  __CFString *ChromaLocationBottomFieldFromStruct;
  CFIndex v20;
  int v21;
  __CFString **v22;
  __CFString *v23;
  CFIndex v24;
  CFNumberRef EDRFactorFromStruct;
  CFDataRef ContentLightLevelInfoFromStruct;
  CFIndex v27;
  int v28;
  __CFString **v29;
  __CFString *v30;
  CFIndex v31;
  CFIndex v32;
  const __CFAllocator *v33;
  CFIndex Count;
  __CFDictionary *MutableCopy;
  CFNumberRef v36;
  __CFString *ChromaLocationTopFieldFromStruct;
  CFDictionaryRef value;
  __CFString *v39;
  CFNumberRef GammaLevelFromStruct;
  CFDataRef MasteringDisplayColorVolumeFromStruct;
  __CFString *v42;
  CFNumberRef SceneIlluminationFromStruct;
  __CFString *v44;

  CleanApertureFromStruct = createCleanApertureFromStruct((int *)a2);
  PixelAspectRatioFromStruct = createPixelAspectRatioFromStruct((int *)a2);
  v7 = 1;
  if (CleanApertureFromStruct)
    v7 = 2;
  value = PixelAspectRatioFromStruct;
  if (PixelAspectRatioFromStruct)
    v8 = v7;
  else
    v8 = CleanApertureFromStruct != 0;
  GammaLevelFromStruct = createGammaLevelFromStruct(a2);
  if (GammaLevelFromStruct)
    v9 = v8 + 1;
  else
    v9 = v8;
  if (*(_BYTE *)(a2 + 56))
    v10 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberSInt8Type, (const void *)(a2 + 56));
  else
    v10 = 0;
  v11 = 0;
  if (v10)
    v12 = v9 + 1;
  else
    v12 = v9;
  v13 = *(unsigned __int8 *)(a2 + 57);
  v36 = v10;
  if (v13 > 8)
  {
    if (v13 == 9)
    {
      v14 = kIOSurfaceFieldDetail_SpatialFirstLineEarly;
    }
    else
    {
      if (v13 != 14)
        goto LABEL_25;
      v14 = kIOSurfaceFieldDetail_SpatialFirstLineLate;
    }
  }
  else if (v13 == 1)
  {
    v14 = kIOSurfaceFieldDetail_TemporalTopFirst;
  }
  else
  {
    if (v13 != 6)
      goto LABEL_25;
    v14 = kIOSurfaceFieldDetail_TemporalBottomFirst;
  }
  v11 = *v14;
LABEL_25:
  if (v11)
    v15 = v12 + 1;
  else
    v15 = v12;
  YCbCrMatrixFromStruct = createYCbCrMatrixFromStruct(a2);
  if (YCbCrMatrixFromStruct)
    ++v15;
  ColorPrimariesFromStruct = createColorPrimariesFromStruct(a2);
  if (ColorPrimariesFromStruct)
    ++v15;
  TransferFunctionFromStruct = createTransferFunctionFromStruct(a2);
  if (TransferFunctionFromStruct)
    ++v15;
  ChromaLocationTopFieldFromStruct = createChromaLocationTopFieldFromStruct(a2);
  if (ChromaLocationTopFieldFromStruct)
    ++v15;
  ChromaLocationBottomFieldFromStruct = createChromaLocationBottomFieldFromStruct(a2);
  if (ChromaLocationBottomFieldFromStruct)
    v20 = v15 + 1;
  else
    v20 = v15;
  v21 = *(unsigned __int8 *)(a2 + 63);
  v42 = ChromaLocationBottomFieldFromStruct;
  switch(v21)
  {
    case 3:
      v22 = kIOSurfaceChromaSubsampling_411;
      goto LABEL_45;
    case 2:
      v22 = kIOSurfaceChromaSubsampling_422;
      goto LABEL_45;
    case 1:
      v22 = kIOSurfaceChromaSubsampling_420;
LABEL_45:
      v23 = *v22;
      goto LABEL_47;
  }
  v23 = 0;
LABEL_47:
  v39 = v23;
  if (v23)
    v24 = v20 + 1;
  else
    v24 = v20;
  EDRFactorFromStruct = createEDRFactorFromStruct(a2);
  if (EDRFactorFromStruct)
    ++v24;
  MasteringDisplayColorVolumeFromStruct = createMasteringDisplayColorVolumeFromStruct(a2);
  if (MasteringDisplayColorVolumeFromStruct)
    ++v24;
  ContentLightLevelInfoFromStruct = createContentLightLevelInfoFromStruct(a2);
  if (ContentLightLevelInfoFromStruct)
    v27 = v24 + 1;
  else
    v27 = v24;
  v28 = *(unsigned __int8 *)(a2 + 100);
  if (v28 == 1)
  {
    v29 = kIOSurfaceAlphaChannelMode_StraightAlpha;
    goto LABEL_61;
  }
  if (v28 == 2)
  {
    v29 = kIOSurfaceAlphaChannelMode_PremultipliedAlpha;
LABEL_61:
    v30 = *v29;
    goto LABEL_63;
  }
  v30 = 0;
LABEL_63:
  v44 = v30;
  if (v30)
    v31 = v27 + 1;
  else
    v31 = v27;
  SceneIlluminationFromStruct = createSceneIlluminationFromStruct(a2);
  if (SceneIlluminationFromStruct)
    v32 = v31 + 1;
  else
    v32 = v31;
  if (v32)
  {
    v33 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    if (a1)
    {
      Count = CFDictionaryGetCount(a1);
      MutableCopy = CFDictionaryCreateMutableCopy(v33, Count + v32, a1);
    }
    else
    {
      MutableCopy = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v32, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    }
    a1 = MutableCopy;
    if (CleanApertureFromStruct)
    {
      CFDictionarySetValue(MutableCopy, CFSTR("IOSurfaceCleanAperture"), CleanApertureFromStruct);
      CFRelease(CleanApertureFromStruct);
    }
    if (value)
    {
      CFDictionarySetValue(a1, CFSTR("IOSurfacePixelAspectRatio"), value);
      CFRelease(value);
    }
    if (GammaLevelFromStruct)
    {
      CFDictionarySetValue(a1, CFSTR("IOSurfaceGammaLevel"), GammaLevelFromStruct);
      CFRelease(GammaLevelFromStruct);
    }
    if (v36)
    {
      CFDictionarySetValue(a1, CFSTR("IOSurfaceFieldCount"), v36);
      CFRelease(v36);
    }
    if (v11)
    {
      CFDictionarySetValue(a1, CFSTR("IOSurfaceFieldDetail"), v11);
      CFRelease(v11);
    }
    if (YCbCrMatrixFromStruct)
    {
      CFDictionarySetValue(a1, CFSTR("IOSurfaceYCbCrMatrix"), YCbCrMatrixFromStruct);
      CFRelease(YCbCrMatrixFromStruct);
    }
    if (ColorPrimariesFromStruct)
    {
      CFDictionarySetValue(a1, CFSTR("IOSurfaceColorPrimaries"), ColorPrimariesFromStruct);
      CFRelease(ColorPrimariesFromStruct);
    }
    if (TransferFunctionFromStruct)
    {
      CFDictionarySetValue(a1, CFSTR("IOSurfaceTransferFunction"), TransferFunctionFromStruct);
      CFRelease(TransferFunctionFromStruct);
    }
    if (ChromaLocationTopFieldFromStruct)
    {
      CFDictionarySetValue(a1, CFSTR("IOSurfaceChromaLocationTopField"), ChromaLocationTopFieldFromStruct);
      CFRelease(ChromaLocationTopFieldFromStruct);
    }
    if (v42)
    {
      CFDictionarySetValue(a1, CFSTR("IOSurfaceChromaLocationBottomField"), v42);
      CFRelease(v42);
    }
    if (v39)
    {
      CFDictionarySetValue(a1, CFSTR("IOSurfaceChromaSubsampling"), v39);
      CFRelease(v39);
    }
    if (EDRFactorFromStruct)
    {
      CFDictionarySetValue(a1, CFSTR("IOSurfaceEDRFactor"), EDRFactorFromStruct);
      CFRelease(EDRFactorFromStruct);
    }
    if (MasteringDisplayColorVolumeFromStruct)
    {
      CFDictionarySetValue(a1, CFSTR("MasteringDisplayColorVolume"), MasteringDisplayColorVolumeFromStruct);
      CFRelease(MasteringDisplayColorVolumeFromStruct);
    }
    if (ContentLightLevelInfoFromStruct)
    {
      CFDictionarySetValue(a1, CFSTR("ContentLightLevelInfo"), ContentLightLevelInfoFromStruct);
      CFRelease(ContentLightLevelInfoFromStruct);
    }
    if (v44)
    {
      CFDictionarySetValue(a1, CFSTR("AlphaChannelMode"), v44);
      CFRelease(v44);
    }
    if (SceneIlluminationFromStruct)
    {
      CFDictionarySetValue(a1, CFSTR("SceneIllumination"), SceneIlluminationFromStruct);
      CFRelease(SceneIlluminationFromStruct);
    }
  }
  else if (a1)
  {
    a1 = (const __CFDictionary *)CFRetain(a1);
  }
  *a3 = a1;
}

__CFString *createChromaLocationTopFieldFromStruct(uint64_t a1)
{
  __CFString **v1;
  __CFString *result;

  switch(*(_BYTE *)(a1 + 61))
  {
    case 1:
      v1 = kIOSurfaceChromaLocation_Left;
      goto LABEL_10;
    case 2:
      v1 = kIOSurfaceChromaLocation_Center;
      goto LABEL_10;
    case 3:
      v1 = kIOSurfaceChromaLocation_TopLeft;
      goto LABEL_10;
    case 4:
      v1 = kIOSurfaceChromaLocation_Top;
      goto LABEL_10;
    case 5:
      v1 = kIOSurfaceChromaLocation_BottomLeft;
      goto LABEL_10;
    case 6:
      v1 = kIOSurfaceChromaLocation_Bottom;
      goto LABEL_10;
    case 7:
      v1 = kIOSurfaceChromaLocation_DV420;
LABEL_10:
      result = *v1;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

__CFString *createYCbCrMatrixFromStruct(uint64_t a1)
{
  unsigned int v1;
  CFTypeRef v2;
  __CFString **v3;
  _QWORD context[3];
  CFTypeRef cf;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v1 = *(unsigned __int8 *)(a1 + 58);
  v2 = 0;
  switch(*(_BYTE *)(a1 + 58))
  {
    case 0:
    case 2:
      return (__CFString *)v2;
    case 1:
      v3 = kIOSurfaceYCbCrMatrix_ITU_R_709_2_String;
      return *v3;
    case 3:
    case 4:
    case 5:
    case 8:
    case 0xA:
    case 0xD:
      goto LABEL_6;
    case 6:
      v3 = kIOSurfaceYCbCrMatrix_ITU_R_601_4_String;
      return *v3;
    case 7:
      v3 = kIOSurfaceYCbCrMatrix_SMPTE_240M_1995_String;
      return *v3;
    case 9:
      v3 = kIOSurfaceYCbCrMatrix_ITU_R_2020_String;
      return *v3;
    case 0xB:
      v3 = kIOSurfaceYCbCrMatrix_DCI_P3_String;
      return *v3;
    case 0xC:
      v3 = kIOSurfaceYCbCrMatrix_P3_D65_String;
      return *v3;
    case 0xE:
      v3 = kIOSurfaceYCbCrMatrix_ITU_R_2100_ICtCp_String;
      return *v3;
    default:
      if (v1 == 200)
      {
        v3 = kIOSurfaceYCbCrMatrix_Identity_String;
        return *v3;
      }
      if (v1 == 248)
      {
        v3 = kIOSurfaceYCbCrMatrix_IPT_String;
        return *v3;
      }
LABEL_6:
      context[0] = CFSTR("YCbCrMatrix#");
      context[1] = v1;
      context[2] = _stringsForUnrecognizedYCbCrMatrixCodePointsDict;
      cf = 0;
      dispatch_sync_f((dispatch_queue_t)_unrecognizedCodePointDispatchQueue, context, (dispatch_function_t)_dispatchUnrecognizedCodePointString);
      v2 = cf;
      if (cf)
        CFRetain(cf);
      return (__CFString *)v2;
  }
}

__CFString *createTransferFunctionFromStruct(uint64_t a1)
{
  unsigned int v1;
  CFTypeRef v2;
  __CFString **v3;
  _QWORD context[3];
  CFTypeRef cf;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v1 = *(unsigned __int8 *)(a1 + 60);
  v2 = 0;
  switch(*(_BYTE *)(a1 + 60))
  {
    case 0:
      return (__CFString *)v2;
    case 1:
    case 6:
    case 0xE:
    case 0xF:
      v3 = kIOSurfaceTransferFunction_ITU_R_709_2;
      return *v3;
    case 2:
      v3 = kIOSurfaceTransferFunction_UseGamma;
      return *v3;
    case 3:
    case 4:
    case 5:
    case 9:
    case 0xA:
    case 0xB:
    case 0xC:
      goto LABEL_5;
    case 7:
      v3 = kIOSurfaceTransferFunction_SMPTE_240M_1995;
      return *v3;
    case 8:
      v3 = kIOSurfaceTransferFunction_Linear;
      return *v3;
    case 0xD:
      v3 = kIOSurfaceTransferFunction_sRGB;
      return *v3;
    case 0x10:
      v3 = kIOSurfaceTransferFunction_SMPTE_ST_2084_PQ;
      return *v3;
    case 0x11:
      v3 = kIOSurfaceTransferFunction_SMPTE_ST_428_1;
      return *v3;
    case 0x12:
      v3 = kIOSurfaceTransferFunction_ITU_R_2100_HLG;
      return *v3;
    default:
      if (v1 == 255)
      {
        v3 = kIOSurfaceTransferFunction_aYCC;
        return *v3;
      }
      else
      {
LABEL_5:
        context[0] = CFSTR("TransferFunction#");
        context[1] = v1;
        context[2] = _stringsForUnrecognizedTransferFunctionCodePointsDict;
        cf = 0;
        dispatch_sync_f((dispatch_queue_t)_unrecognizedCodePointDispatchQueue, context, (dispatch_function_t)_dispatchUnrecognizedCodePointString);
        v2 = cf;
        if (cf)
          CFRetain(cf);
      }
      return (__CFString *)v2;
  }
}

CFDictionaryRef createPixelAspectRatioFromStruct(int *a1)
{
  int v1;
  int v2;
  double v3;
  int v4;
  const __CFAllocator *v5;
  CFDictionaryRef v6;
  double v8;
  double valuePtr;
  void *keys[2];
  void *values;
  CFTypeRef cf;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v1 = a1[9];
  if (!v1)
    return 0;
  v2 = a1[11];
  if (!v2)
    return 0;
  v3 = (double)a1[8] / (double)v1;
  v4 = a1[10];
  keys[0] = CFSTR("HorizontalSpacing");
  keys[1] = CFSTR("VerticalSpacing");
  v8 = (double)v4 / (double)v2;
  valuePtr = v3;
  v5 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  values = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberDoubleType, &valuePtr);
  cf = CFNumberCreate(v5, kCFNumberDoubleType, &v8);
  v6 = CFDictionaryCreate(v5, (const void **)keys, (const void **)&values, 2, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  CFRelease(values);
  CFRelease(cf);
  return v6;
}

CFNumberRef createGammaLevelFromStruct(uint64_t a1)
{
  int v1;
  double v3[2];

  v3[1] = *(double *)MEMORY[0x1E0C80C00];
  v1 = *(_DWORD *)(a1 + 52);
  if (!v1)
    return 0;
  v3[0] = (double)*(int *)(a1 + 48) / (double)v1;
  return CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberDoubleType, v3);
}

CFNumberRef createEDRFactorFromStruct(uint64_t a1)
{
  int v1;
  double v3[2];

  v3[1] = *(double *)MEMORY[0x1E0C80C00];
  v1 = *(_DWORD *)(a1 + 96);
  if (!v1)
    return 0;
  v3[0] = (double)*(int *)(a1 + 92) / (double)v1;
  return CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberDoubleType, v3);
}

__CFString *createColorPrimariesFromStruct(uint64_t a1)
{
  unsigned int v1;
  CFTypeRef v2;
  __CFString **v3;
  _QWORD context[3];
  CFTypeRef cf;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v1 = *(unsigned __int8 *)(a1 + 59);
  v2 = 0;
  switch(*(_BYTE *)(a1 + 59))
  {
    case 0:
      return (__CFString *)v2;
    case 1:
      v3 = kIOSurfaceColorPrimaries_ITU_R_709_2;
      return *v3;
    case 2:
    case 3:
    case 4:
    case 7:
    case 8:
    case 0xA:
      goto LABEL_5;
    case 5:
      v3 = kIOSurfaceColorPrimaries_EBU_3213;
      return *v3;
    case 6:
      v3 = kIOSurfaceColorPrimaries_SMPTE_C;
      return *v3;
    case 9:
      v3 = kIOSurfaceColorPrimaries_ITU_R_2020;
      return *v3;
    case 0xB:
      v3 = kIOSurfaceColorPrimaries_DCI_P3;
      return *v3;
    case 0xC:
      v3 = kIOSurfaceColorPrimaries_P3_D65;
      return *v3;
    default:
      if (v1 == 22)
      {
        v3 = kIOSurfaceColorPrimaries_JEDEC_P22;
        return *v3;
      }
      else
      {
LABEL_5:
        context[0] = CFSTR("ColorPrimaries#");
        context[1] = v1;
        context[2] = _stringsForUnrecognizedColorPrimariesCodePointsDict;
        cf = 0;
        dispatch_sync_f((dispatch_queue_t)_unrecognizedCodePointDispatchQueue, context, (dispatch_function_t)_dispatchUnrecognizedCodePointString);
        v2 = cf;
        if (cf)
          CFRetain(cf);
      }
      return (__CFString *)v2;
  }
}

CFDictionaryRef createCleanApertureFromStruct(int *a1)
{
  int v1;
  int v2;
  int v3;
  int v4;
  double v5;
  double v6;
  int v7;
  const __CFAllocator *v8;
  CFDictionaryRef v9;
  uint64_t i;
  double v12;
  double v13;
  double v14;
  double valuePtr;
  void *keys[4];
  void *values[5];

  values[4] = *(void **)MEMORY[0x1E0C80C00];
  v1 = a1[1];
  if (!v1)
    return 0;
  v2 = a1[3];
  if (!v2)
    return 0;
  v3 = a1[5];
  if (!v3)
    return 0;
  v4 = a1[7];
  if (!v4)
    return 0;
  keys[0] = CFSTR("Width");
  keys[1] = CFSTR("Height");
  v5 = (double)*a1 / (double)v1;
  v14 = (double)a1[2] / (double)v2;
  valuePtr = v5;
  v6 = (double)a1[4] / (double)v3;
  v7 = a1[6];
  keys[2] = CFSTR("HorizontalOffset");
  keys[3] = CFSTR("VerticalOffset");
  v12 = (double)v7 / (double)v4;
  v13 = v6;
  v8 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  values[0] = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberDoubleType, &valuePtr);
  values[1] = CFNumberCreate(v8, kCFNumberDoubleType, &v14);
  values[2] = CFNumberCreate(v8, kCFNumberDoubleType, &v13);
  values[3] = CFNumberCreate(v8, kCFNumberDoubleType, &v12);
  v9 = CFDictionaryCreate(v8, (const void **)keys, (const void **)values, 4, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  for (i = 0; i != 4; ++i)
    CFRelease(values[i]);
  return v9;
}

__CFString *createChromaLocationBottomFieldFromStruct(uint64_t a1)
{
  __CFString **v1;
  __CFString *result;

  switch(*(_BYTE *)(a1 + 62))
  {
    case 1:
      v1 = kIOSurfaceChromaLocation_Left;
      goto LABEL_10;
    case 2:
      v1 = kIOSurfaceChromaLocation_Center;
      goto LABEL_10;
    case 3:
      v1 = kIOSurfaceChromaLocation_TopLeft;
      goto LABEL_10;
    case 4:
      v1 = kIOSurfaceChromaLocation_Top;
      goto LABEL_10;
    case 5:
      v1 = kIOSurfaceChromaLocation_BottomLeft;
      goto LABEL_10;
    case 6:
      v1 = kIOSurfaceChromaLocation_Bottom;
      goto LABEL_10;
    case 7:
      v1 = kIOSurfaceChromaLocation_DV420;
LABEL_10:
      result = *v1;
      break;
    default:
      result = 0;
      break;
  }
  return result;
}

uint64_t IOSurfaceClientPrefetchPages(uint64_t a1)
{
  pthread_mutex_t *v2;
  IOSurfaceWiringAssertion *v3;
  uint64_t v4;

  v2 = (pthread_mutex_t *)(a1 + 40);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 40));
  v3 = *(IOSurfaceWiringAssertion **)(a1 + 104);
  if (!v3)
  {
    v3 = -[IOSurfaceWiringAssertion initWithIOSurfaceClient:]([IOSurfaceWiringAssertion alloc], "initWithIOSurfaceClient:", a1);
    *(_QWORD *)(a1 + 104) = v3;
  }
  if (v3)
    v4 = 0;
  else
    v4 = 3758097084;
  pthread_mutex_unlock(v2);
  return v4;
}

uint64_t IOSurfaceClientCreateMachPortWithOptions(uint64_t a1, uint64_t a2)
{
  mach_port_t v2;
  uint32_t outputCnt;
  uint64_t output;
  uint64_t input[3];

  input[2] = *MEMORY[0x1E0C80C00];
  input[0] = *(unsigned int *)(a1 + 136);
  input[1] = a2;
  output = 0;
  outputCnt = 1;
  v2 = _ioSurfaceConnectInternal(0);
  if (IOConnectCallMethod(v2, 0x23u, input, 2u, 0, 0, &output, &outputCnt, 0, 0))
    return 0;
  else
    return output;
}

void sniffColorPrimariesKeyToStruct(const __CFString *a1, uint64_t a2)
{
  CFTypeID v4;
  CFIndex Length;
  const __CFString *v6;
  const __CFString *v7;
  const void *v8[2];
  CFRange v9;

  v8[1] = *(const void **)MEMORY[0x1E0C80C00];
  if (!a1)
  {
    *(_BYTE *)(a2 + 59) = 0;
    goto LABEL_9;
  }
  v8[0] = 0;
  v4 = CFGetTypeID(a1);
  if (v4 == CFStringGetTypeID()
    && CFDictionaryGetValueIfPresent((CFDictionaryRef)_colorPrimariesKeysToStructDict, a1, v8))
  {
    *(_BYTE *)(a2 + 59) = v8[0];
LABEL_9:
    *(_QWORD *)(a2 + 120) |= 0x40uLL;
    return;
  }
  if (CFStringHasPrefix(a1, CFSTR("ColorPrimaries#")))
  {
    Length = CFStringGetLength(a1);
    v9.location = CFStringGetLength(CFSTR("ColorPrimaries#"));
    v9.length = Length - v9.location;
    v6 = CFStringCreateWithSubstring((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a1, v9);
    if (v6)
    {
      v7 = v6;
      *(_BYTE *)(a2 + 59) = CFStringGetIntValue(v6);
      *(_QWORD *)(a2 + 120) |= 0x40uLL;
      CFRelease(v7);
    }
  }
}

uint64_t IOSurfaceClientGetWidthOfPlane(uint64_t a1, unsigned int a2)
{
  uint64_t v2;

  if (*(_DWORD *)(a1 + 200) <= a2)
  {
    if (a2)
      return 0;
    v2 = a1 + 152;
  }
  else
  {
    v2 = a1 + 152 * a2 + 248;
  }
  return *(_QWORD *)v2;
}

kern_return_t IOSurfaceLock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  if (buffer)
    return IOSurfaceClientLock(*((_QWORD *)buffer + 1), options, seed);
  else
    return -536870206;
}

kern_return_t IOSurfaceUnlock(IOSurfaceRef buffer, IOSurfaceLockOptions options, uint32_t *seed)
{
  if (buffer)
    return IOSurfaceClientUnlock(*((_QWORD *)buffer + 1), options, seed);
  else
    return -536870206;
}

CFTypeID IOSurfaceGetTypeID(void)
{
  return objc_opt_self();
}

uint64_t IOSurfaceClientGetBytesPerElement(uint64_t a1)
{
  return *(unsigned __int16 *)(a1 + 208);
}

size_t IOSurfaceGetElementHeight(size_t buffer)
{
  if (buffer)
    return IOSurfaceClientGetElementHeight(*(_QWORD *)(buffer + 8));
  return buffer;
}

uint64_t IOSurfaceGetParentID(uint64_t result)
{
  if (result)
    return IOSurfaceClientGetParentID(*(_QWORD *)(result + 8));
  return result;
}

uint64_t IOSurfaceClientGetElementWidthOfPlane(uint64_t a1, unsigned int a2)
{
  unsigned __int8 *v2;

  if (*(_DWORD *)(a1 + 200) <= a2)
  {
    if (a2)
      return 0;
    v2 = (unsigned __int8 *)(a1 + 210);
  }
  else
  {
    v2 = (unsigned __int8 *)(a1 + 152 * a2 + 298);
  }
  return *v2;
}

uint64_t IOSurfaceClientGetBytesPerElementOfPlane(uint64_t a1, unsigned int a2)
{
  unsigned __int16 *v2;

  if (*(_DWORD *)(a1 + 200) <= a2)
  {
    if (a2)
      return 0;
    v2 = (unsigned __int16 *)(a1 + 208);
  }
  else
  {
    v2 = (unsigned __int16 *)(a1 + 152 * a2 + 296);
  }
  return *v2;
}

uint64_t IOSurfaceGetDataProperty(uint64_t a1, unsigned int a2, size_t a3, _QWORD *a4, void *a5)
{
  if (a1)
    return IOSurfaceClientGetDataProperty(*(_QWORD *)(a1 + 8), a2, a3, a4, a5);
  else
    return 3758097090;
}

uint64_t IOSurfaceGetDetachModeCode(uint64_t a1)
{
  if (a1)
    return IOSurfaceClientGetDetachModeCode(*(_QWORD *)(a1 + 8));
  else
    return 0xFFFFFFFFFFFFLL;
}

mach_port_t IOSurfaceCreateMachPort(IOSurfaceRef buffer)
{
  if (buffer)
    LODWORD(buffer) = IOSurfaceClientCreateMachPort(*((_QWORD *)buffer + 1));
  return buffer;
}

Boolean IOSurfaceAllowsPixelSizeCasting(IOSurfaceRef buffer)
{
  if (buffer)
    LOBYTE(buffer) = IOSurfaceClientAllowsPixelSizeCasting(*((_QWORD *)buffer + 1));
  return buffer;
}

uint64_t IOSurfaceClientGetCacheMode(uint64_t a1)
{
  return *(unsigned int *)(a1 + 212);
}

uint64_t IOSurfaceGetSizeOfPlane(uint64_t result, unsigned int a2)
{
  if (result)
    return IOSurfaceClientGetSizeOfPlane(*(_QWORD *)(result + 8), a2);
  return result;
}

uint64_t IOSurfaceInitDetachModeCode(uint64_t result)
{
  if (result)
    return IOSurfaceClientInitDetachModeCode(*(_QWORD *)(result + 8));
  return result;
}

uint64_t IOSurfaceGetBaseAddressOfCompressedTileDataRegionOfPlane(uint64_t result, unsigned int a2)
{
  if (result)
    return IOSurfaceClientGetBaseAddressOfCompressedTileDataRegionOfPlane(*(_QWORD *)(result + 8), a2);
  return result;
}

uint64_t IOSurfaceClientSetDetachModeCode(uint64_t result, uint64_t a2, uint64_t a3)
{
  mach_port_t v3;
  uint64_t input[5];

  input[4] = *MEMORY[0x1E0C80C00];
  if (byte_1ECDA8150)
  {
    *(_QWORD *)(*(_QWORD *)(result + 128) + 40) = *(_QWORD *)(*(_QWORD *)(result + 128) + 40) & ~a2 | a3 & a2;
  }
  else
  {
    input[0] = *(unsigned int *)(result + 136);
    input[1] = a2;
    input[2] = a3;
    input[3] = 0;
    v3 = _ioSurfaceConnectInternal(0);
    return IOConnectCallMethod(v3, 0x2Bu, input, 4u, 0, 0, 0, 0, 0, 0);
  }
  return result;
}

IOSurfaceWiringAssertion *IOSurfaceCreateWiringAssertion(uint64_t a1)
{
  return -[IOSurfaceWiringAssertion initWithIOSurface:]([IOSurfaceWiringAssertion alloc], "initWithIOSurface:", a1);
}

uint64_t IOSurfaceSetOwnership(uint64_t a1, unsigned int a2, int a3, unsigned int a4)
{
  if (a1)
    return IOSurfaceClientSetOwnership(*(_QWORD *)(a1 + 8), a2, a3, a4);
  else
    return 3758097090;
}

size_t IOSurfaceGetElementWidth(size_t buffer)
{
  if (buffer)
    return IOSurfaceClientGetElementWidth(*(_QWORD *)(buffer + 8));
  return buffer;
}

uint64_t IOSurfaceClearDataProperties(uint64_t a1)
{
  if (a1)
    return IOSurfaceClientClearDataProperties(*(_QWORD *)(a1 + 8));
  else
    return 3758097090;
}

kern_return_t IOSurfaceSetPurgeable(IOSurfaceRef buffer, uint32_t newState, uint32_t *oldState)
{
  if (buffer)
    return IOSurfaceClientSetPurgeable(*((_QWORD *)buffer + 1), newState, oldState);
  else
    return -536870206;
}

uint64_t IOSurfaceClientGetSizeOfPlane(uint64_t a1, unsigned int a2)
{
  uint64_t v2;

  if (*(_DWORD *)(a1 + 200) <= a2)
  {
    if (a2)
      return 0;
    v2 = a1 + 144;
  }
  else
  {
    v2 = a1 + 152 * a2 + 288;
  }
  return *(_QWORD *)v2;
}

size_t IOSurfaceGetBytesPerElement(size_t buffer)
{
  if (buffer)
    return IOSurfaceClientGetBytesPerElement(*(_QWORD *)(buffer + 8));
  return buffer;
}

uint64_t IOSurfaceGetBytesPerRowOfCompressedTileHeaderGroupsOfPlane(uint64_t result, unsigned int a2)
{
  if (result)
    return IOSurfaceClientGetBytesPerRowOfCompressedTileHeaderGroupsOfPlane(*(_QWORD *)(result + 8), a2);
  return result;
}

uint64_t IOSurfaceClientGetBaseAddressOfCompressedTileDataRegionOfPlane(uint64_t a1, unsigned int a2)
{
  if (a2 && *(_DWORD *)(a1 + 200) <= a2 || *(_DWORD *)(a1 + 228) > 1u)
    return 0;
  else
    return *(_QWORD *)(a1 + 112) + *(unsigned int *)(a1 + 112 + 152 * a2 + 224);
}

uint64_t IOSurfaceGetCacheMode(uint64_t result)
{
  if (result)
    return IOSurfaceClientGetCacheMode(*(_QWORD *)(result + 8));
  return result;
}

uint64_t IOSurfaceClientGetBytesPerRowOfCompressedTileHeaderGroupsOfPlane(uint64_t a1, unsigned int a2)
{
  if (a2 && *(_DWORD *)(a1 + 200) <= a2)
    return 0;
  else
    return *(unsigned int *)(a1 + 152 * a2 + 352);
}

uint64_t IOSurfaceSetYCbCrMatrix(uint64_t a1, unsigned int a2)
{
  if (a1)
    return IOSurfaceClientSetYCbCrMatrix(*(_QWORD *)(a1 + 8), a2);
  else
    return 3758097090;
}

void IOSurfaceRemoveAllValues(IOSurfaceRef buffer)
{
  if (buffer)
    IOSurfaceClientRemoveValue(*((_QWORD *)buffer + 1), 0);
}

uint64_t IOSurfaceClientGetDataProperty(uint64_t a1, unsigned int a2, size_t a3, _QWORD *a4, void *a5)
{
  uint64_t v5;
  BOOL v6;
  char v7;
  uint64_t result;
  mach_port_t v11;
  uint64_t v12;
  uint32_t outputCnt;
  size_t v14;
  uint64_t output;
  uint64_t v16;
  uint64_t input[3];

  input[2] = *MEMORY[0x1E0C80C00];
  v5 = *(_QWORD *)(a1 + 120);
  input[0] = *(unsigned int *)(a1 + 136);
  input[1] = a2;
  v14 = a3;
  output = 0;
  v16 = 0;
  outputCnt = 2;
  if (a3)
    v6 = a5 == 0;
  else
    v6 = 0;
  v7 = v6;
  result = 3758097090;
  if (a2 <= 3 && (v7 & 1) == 0)
  {
    if (((*(unsigned __int8 *)(v5 + 47) >> a2) & 1) == 0)
    {
      v12 = 0;
      result = 0;
      goto LABEL_14;
    }
    v11 = _ioSurfaceConnectInternal(0);
    result = IOConnectCallMethod(v11, 0x33u, input, 2u, 0, 0, &output, &outputCnt, a5, &v14);
    if (!(_DWORD)result)
    {
      result = output;
      if (a4)
      {
        v12 = v16;
LABEL_14:
        *a4 = v12;
      }
    }
  }
  return result;
}

uint64_t IOSurfaceClientClearDataProperties(uint64_t a1)
{
  mach_port_t v1;
  uint64_t input[2];

  input[1] = *MEMORY[0x1E0C80C00];
  if (!*(_BYTE *)(*(_QWORD *)(a1 + 120) + 47))
    return 0;
  input[0] = *(unsigned int *)(a1 + 136);
  v1 = _ioSurfaceConnectInternal(0);
  return IOConnectCallMethod(v1, 0x34u, input, 1u, 0, 0, 0, 0, 0, 0);
}

uint64_t IOSurfaceClientGetProhibitUseCount(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 221);
}

uint64_t IOSurfaceGetOffsetOfPlane(uint64_t result, unsigned int a2)
{
  if (result)
    return IOSurfaceClientGetOffsetOfPlane(*(_QWORD *)(result + 8), a2);
  return result;
}

uint64_t IOSurfaceSetOwnershipIdentity(uint64_t a1, unsigned int a2, int a3, unsigned int a4)
{
  if (a1)
    return IOSurfaceClientSetOwnershipIdentity(*(_QWORD *)(a1 + 8), a2, a3, a4);
  else
    return 3758097090;
}

uint64_t IOSurfaceClientGetOffsetOfPlane(uint64_t a1, unsigned int a2)
{
  uint64_t v2;

  if (*(_DWORD *)(a1 + 200) <= a2)
  {
    if (a2)
      return 0;
    v2 = a1 + 176;
  }
  else
  {
    v2 = a1 + 152 * a2 + 272;
  }
  return *(_QWORD *)v2;
}

uint64_t IOSurfaceGetProhibitUseCount(uint64_t result)
{
  if (result)
    return IOSurfaceClientGetProhibitUseCount(*(_QWORD *)(result + 8));
  return result;
}

uint64_t IOSurfaceSharedEventAddEventListener(unint64_t a1, IONotificationPortRef notify)
{
  mach_port_t MachPort;
  mach_port_t v3;
  mach_port_t v4;
  uint64_t reference[2];
  __int128 v7;
  __int128 v8;
  __int128 v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  reference[0] = 0;
  v8 = 0u;
  v9 = 0u;
  reference[1] = (uint64_t)_ioSurfaceEventNotificationCallback2;
  v7 = a1;
  MachPort = IONotificationPortGetMachPort(notify);
  if (!MachPort)
    IOSurfaceSharedEventAddEventListener_cold_1();
  v3 = MachPort;
  v4 = _ioSurfaceConnect();
  return IOConnectCallAsyncMethod(v4, 0x28u, v3, reference, 3u, 0, 0, 0, 0, 0, 0, 0, 0);
}

uint64_t _ioSurfaceConnect()
{
  return _ioSurfaceConnectInternal(0);
}

uint64_t IOSurfaceClientSetOwnershipIdentity(uint64_t a1, unsigned int a2, int a3, unsigned int a4)
{
  mach_port_t v4;
  uint64_t input[5];

  input[4] = *MEMORY[0x1E0C80C00];
  input[0] = *(unsigned int *)(a1 + 136);
  input[1] = a2;
  input[2] = a3;
  input[3] = a4;
  v4 = _ioSurfaceConnectInternal(0);
  return IOConnectCallMethod(v4, 0x2Cu, input, 4u, 0, 0, 0, 0, 0, 0);
}

uint64_t IOSurfaceClientGetPropertyMaximum(const void *a1)
{
  _ioSurfaceConnectInternal(0);
  if (CFEqual(a1, CFSTR("IOSurfaceBytesPerRow")) || CFEqual(a1, CFSTR("IOSurfacePlaneBytesPerRow")))
    return qword_1ECDA8138;
  if (CFEqual(a1, CFSTR("IOSurfaceWidth")) || CFEqual(a1, CFSTR("IOSurfacePlaneWidth")))
    return qword_1ECDA8140;
  if (CFEqual(a1, CFSTR("IOSurfaceHeight")) || CFEqual(a1, CFSTR("IOSurfacePlaneHeight")))
    return qword_1ECDA8148;
  return 0;
}

uint64_t IOSurfaceClientGetPropertyAlignment(const void *a1)
{
  int v2;

  _ioSurfaceConnectInternal(0);
  if (CFEqual(a1, CFSTR("IOSurfaceBytesPerRow")) || CFEqual(a1, CFSTR("IOSurfacePlaneBytesPerRow")))
  {
    v2 = HIDWORD(ioSurfaceLimits);
  }
  else
  {
    if (!CFEqual(a1, CFSTR("IOSurfaceOffset"))
      && !CFEqual(a1, CFSTR("IOSurfacePlaneOffset"))
      && !CFEqual(a1, CFSTR("IOSurfacePlaneBase")))
    {
      return 1;
    }
    v2 = ioSurfaceLimits;
  }
  return (v2 + 1);
}

void ___ioSurfaceConnectInternal_block_invoke(uint64_t a1)
{
  mach_port_t v1;
  int v2;
  const __CFDictionary *v3;
  kern_return_t MatchingServices;
  io_service_t v5;
  kern_return_t v7;
  kern_return_t v8;
  void *v9;
  id v10;
  int v11;
  io_object_t v12;
  io_registry_entry_t v13;
  const __CFString *v14;
  void *v15;
  void *CFProperty;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  const __CFString *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  const char *v29;
  _BOOL8 v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  io_iterator_t iterator;
  io_iterator_t existing;
  uint8_t buf[8];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 32))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4CDD000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "IOSurface.framework API explicitly disallowed.", buf, 2u);
    }
  }
  else
  {
    _creationPropertiesDict = (uint64_t)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, CFSTR("IOSurfaceClass"), CFSTR("IOSurfaceClass"));
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, CFSTR("IOSurfaceIsGlobal"), CFSTR("IOSurfaceIsGlobal"));
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, CFSTR("IOSurfaceBytesPerRow"), CFSTR("IOSurfaceBytesPerRow"));
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, CFSTR("IOSurfaceBytesPerElement"), CFSTR("IOSurfaceBytesPerElement"));
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, CFSTR("IOSurfaceElementWidth"), CFSTR("IOSurfaceElementWidth"));
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, CFSTR("IOSurfaceElementHeight"), CFSTR("IOSurfaceElementHeight"));
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, CFSTR("IOSurfaceWidth"), CFSTR("IOSurfaceWidth"));
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, CFSTR("IOSurfaceHeight"), CFSTR("IOSurfaceHeight"));
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, CFSTR("IOSurfaceOffset"), CFSTR("IOSurfaceOffset"));
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, CFSTR("IOSurfacePixelFormat"), CFSTR("IOSurfacePixelFormat"));
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, CFSTR("IOSurfaceMemoryRegion"), CFSTR("IOSurfaceMemoryRegion"));
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, CFSTR("IOSurfaceAllocSize"), CFSTR("IOSurfaceAllocSize"));
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, CFSTR("IOSurfacePlaneInfo"), CFSTR("IOSurfacePlaneInfo"));
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, CFSTR("IOSurfacePlaneBase"), CFSTR("IOSurfacePlaneBase"));
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, CFSTR("IOSurfacePlaneOffset"), CFSTR("IOSurfacePlaneOffset"));
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, CFSTR("IOSurfacePlaneWidth"), CFSTR("IOSurfacePlaneWidth"));
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, CFSTR("IOSurfacePlaneHeight"), CFSTR("IOSurfacePlaneHeight"));
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, CFSTR("IOSurfacePlaneBytesPerRow"), CFSTR("IOSurfacePlaneBytesPerRow"));
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, CFSTR("IOSurfacePlaneBitsPerElement"), CFSTR("IOSurfacePlaneBitsPerElement"));
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, CFSTR("IOSurfacePlaneBytesPerElement"), CFSTR("IOSurfacePlaneBytesPerElement"));
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, CFSTR("IOSurfacePlaneElementWidth"), CFSTR("IOSurfacePlaneElementWidth"));
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, CFSTR("IOSurfacePlaneElementHeight"), CFSTR("IOSurfacePlaneElementHeight"));
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, CFSTR("IOSurfacePlaneSize"), CFSTR("IOSurfacePlaneSize"));
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, CFSTR("IOSurfaceAddress"), CFSTR("IOSurfaceAddress"));
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, CFSTR("IOSurfaceAddressRanges"), CFSTR("IOSurfaceAddressRanges"));
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, CFSTR("IOSurfaceAddressOffset"), CFSTR("IOSurfaceAddressOffset"));
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, CFSTR("IOSurfaceDirection"), CFSTR("IOSurfaceDirection"));
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, CFSTR("IOSurfaceType"), CFSTR("IOSurfaceType"));
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, CFSTR("IOSurfaceCacheMode"), CFSTR("IOSurfaceCacheMode"));
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, CFSTR("IOFenceAllowTearing"), CFSTR("IOFenceAllowTearing"));
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, CFSTR("IOSurfacePrefetchPages"), CFSTR("IOSurfacePrefetchPages"));
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, CFSTR("IOSurfacePurgeWhenNotInUse"), CFSTR("IOSurfacePurgeWhenNotInUse"));
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, CFSTR("IOSurfaceResetDefaultAttachmentsWhenNotInUse"), CFSTR("IOSurfaceResetDefaultAttachmentsWhenNotInUse"));
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, CFSTR("IOSurfaceDefaultAttachments"), CFSTR("IOSurfaceDefaultAttachments"));
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, CFSTR("IOSurfaceDefaultBulkAttachments"), CFSTR("IOSurfaceDefaultBulkAttachments"));
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, CFSTR("CreationProperties"), CFSTR("CreationProperties"));
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, CFSTR("IsDisplayable"), CFSTR("IsDisplayable"));
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, CFSTR("IOSurfaceNonPurgeable"), CFSTR("IOSurfaceNonPurgeable"));
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, CFSTR("IOSurfaceEDRFactor"), CFSTR("IOSurfaceEDRFactor"));
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, CFSTR("IOSurfacePixelSizeCastingAllowed"), CFSTR("IOSurfacePixelSizeCastingAllowed"));
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, CFSTR("IOSurfacePixelSizeCastingAllowed"), CFSTR("IOSurfacePixelSizeCastingAllowed"));
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, CFSTR("IOSurfaceUseReserve"), CFSTR("IOSurfaceUseReserve"));
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, CFSTR("IOSurfacePlaneComponentBitDepths"), CFSTR("IOSurfacePlaneComponentBitDepths"));
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, CFSTR("IOSurfacePlaneComponentBitOffsets"), CFSTR("IOSurfacePlaneComponentBitOffsets"));
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, CFSTR("IOSurfacePlaneComponentNames"), CFSTR("IOSurfacePlaneComponentNames"));
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, CFSTR("IOSurfacePlaneComponentTypes"), CFSTR("IOSurfacePlaneComponentTypes"));
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, CFSTR("IOSurfacePlaneComponentRanges"), CFSTR("IOSurfacePlaneComponentRanges"));
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, CFSTR("IOSurfaceSubsampling"), CFSTR("IOSurfaceSubsampling"));
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, CFSTR("IOSurfaceAllocateFromSuperbuffer"), CFSTR("IOSurfaceAllocateFromSuperbuffer"));
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, CFSTR("IOSurfaceSuperbuffer"), CFSTR("IOSurfaceSuperbuffer"));
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, CFSTR("IOSurfaceMemoryPoolSize"), CFSTR("IOSurfaceMemoryPoolSize"));
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, CFSTR("IOSurfaceMemoryPoolZerofillEnabled"), CFSTR("IOSurfaceMemoryPoolZerofillEnabled"));
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, CFSTR("IOSurfaceMemoryPoolCacheModeSwitchEnabled"), CFSTR("IOSurfaceMemoryPoolCacheModeSwitchEnabled"));
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, CFSTR("IOSurfacePlaneCompressedTileWidth"), CFSTR("IOSurfacePlaneCompressedTileWidth"));
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, CFSTR("IOSurfacePlaneCompressedTileHeight"), CFSTR("IOSurfacePlaneCompressedTileHeight"));
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, CFSTR("IOSurfacePlaneCompressedTileHeaderRegionOffset"), CFSTR("IOSurfacePlaneCompressedTileHeaderRegionOffset"));
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, CFSTR("IOSurfacePlaneCompressedTileDataRegionOffset"), CFSTR("IOSurfacePlaneCompressedTileDataRegionOffset"));
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, CFSTR("IOSurfacePlaneCompressionType"), CFSTR("IOSurfacePlaneCompressionType"));
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, CFSTR("IOSurfacePlaneCompressionFootprint"), CFSTR("IOSurfacePlaneCompressionFootprint"));
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, CFSTR("IOSurfacePlaneBytesPerCompressedTileHeader"), CFSTR("IOSurfacePlaneBytesPerCompressedTileHeader"));
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, CFSTR("IOSurfacePlaneWidthInCompressedTiles"), CFSTR("IOSurfacePlaneWidthInCompressedTiles"));
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, CFSTR("IOSurfacePlaneHeightInCompressedTiles"), CFSTR("IOSurfacePlaneHeightInCompressedTiles"));
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, CFSTR("IOSurfacePlaneBytesPerRowOfCompressedTileHeaderGroups"), CFSTR("IOSurfacePlaneBytesPerRowOfCompressedTileHeaderGroups"));
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, CFSTR("IOSurfacePlaneHTPCPredictionSelector"), CFSTR("IOSurfacePlaneHTPCPredictionSelector"));
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, CFSTR("IOSurfacePlaneHTPCVerticalHeaderGroupingMode"), CFSTR("IOSurfacePlaneHTPCVerticalHeaderGroupingMode"));
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, CFSTR("IOSurfacePlaneHorizontalPixelOffsetWithinCompressedTileArray"), CFSTR("IOSurfacePlaneHorizontalPixelOffsetWithinCompressedTileArray"));
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, CFSTR("IOSurfacePlaneVerticalPixelOffsetWithinCompressedTileArray"), CFSTR("IOSurfacePlaneVerticalPixelOffsetWithinCompressedTileArray"));
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, CFSTR("IOSurfaceAddressFormat"), CFSTR("IOSurfaceAddressFormat"));
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, CFSTR("IOSurfacePlaneBytesPerTileData"), CFSTR("IOSurfacePlaneBytesPerTileData"));
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, CFSTR("IOSurfacePlaneBytesPerRowOfTileData"), CFSTR("IOSurfacePlaneBytesPerRowOfTileData"));
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, CFSTR("IOSurfaceSliceCount"), CFSTR("IOSurfaceSliceCount"));
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, CFSTR("IOSurfacePlaneDataRegionBytesPerSlice"), CFSTR("IOSurfacePlaneDataRegionBytesPerSlice"));
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, CFSTR("IOSurfacePlaneHeaderRegionBytesPerSlice"), CFSTR("IOSurfacePlaneHeaderRegionBytesPerSlice"));
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, CFSTR("IOSurfacePlaneExtendedPixelsOnLeft"), CFSTR("IOSurfacePlaneExtendedPixelsOnLeft"));
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, CFSTR("IOSurfacePlaneExtendedPixelsOnRight"), CFSTR("IOSurfacePlaneExtendedPixelsOnRight"));
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, CFSTR("IOSurfacePlaneExtendedPixelsOnTop"), CFSTR("IOSurfacePlaneExtendedPixelsOnTop"));
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, CFSTR("IOSurfacePlaneExtendedPixelsOnBottom"), CFSTR("IOSurfacePlaneExtendedPixelsOnBottom"));
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, CFSTR("IOSurfaceProhibitUseCount"), CFSTR("IOSurfaceProhibitUseCount"));
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, CFSTR("IOSurfaceMemoryPoolInfo"), CFSTR("IOSurfaceMemoryPoolInfo"));
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, CFSTR("IOSurfaceEnableStatistics"), CFSTR("IOSurfaceEnableStatistics"));
    CFDictionarySetValue((CFMutableDictionaryRef)_creationPropertiesDict, CFSTR("DolbyVisionRPUData"), CFSTR("DolbyVisionRPUData"));
    v1 = *MEMORY[0x1E0CBBAA8];
    v2 = -241;
    while (1)
    {
      existing = 0;
      v3 = IOServiceNameMatching("IOCoreSurfaceRoot");
      MatchingServices = IOServiceGetMatchingServices(v1, v3, &existing);
      _iosServiceReturn = MatchingServices;
      if (MatchingServices)
        break;
      v5 = IOIteratorNext(existing);
      _iosService = v5;
      if (v5)
      {
        v8 = IOServiceOpen(v5, *MEMORY[0x1E0C83DA0], 0, (io_connect_t *)&_iosConnect);
        _iosConnectReturn = v8;
        if (v8)
        {
          if (v8 != -536870174)
          {
            if (v8 == -536870201)
            {
              v9 = (void *)MEMORY[0x1A85A6B48]();
              v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
              iterator = 0;
              v11 = 0;
              if (!MEMORY[0x1A85A68CC](_iosService, "IOService", 0, &iterator))
              {
                v38 = v9;
                v12 = IOIteratorNext(iterator);
                if (v12)
                {
                  v13 = v12;
                  v11 = 0;
                  v14 = CFSTR("IOUserClientCreator");
                  do
                  {
                    v15 = (void *)MEMORY[0x1A85A6B48]();
                    CFProperty = (void *)IORegistryEntryCreateCFProperty(v13, v14, 0, 0);
                    if (CFProperty)
                    {
                      v17 = CFProperty;
                      v18 = objc_msgSend(CFProperty, "rangeOfString:", CFSTR(", "));
                      if (v19)
                      {
                        v20 = objc_msgSend(v17, "substringFromIndex:", v18 + 2);
                        v21 = (void *)objc_msgSend(v10, "objectForKeyedSubscript:", v20);
                        if (v21)
                        {
                          v22 = v10;
                          v23 = v14;
                          v24 = (void *)MEMORY[0x1E0CB37E8];
                          v25 = objc_msgSend(v21, "intValue") + 1;
                          v26 = v24;
                          v14 = v23;
                          v10 = v22;
                          v27 = (void *)objc_msgSend(v26, "numberWithInt:", v25);
                          v28 = v22;
                        }
                        else
                        {
                          v28 = v10;
                          v27 = &unk_1E4DEACD0;
                        }
                        objc_msgSend(v28, "setObject:forKeyedSubscript:", v27, v20);
                      }

                    }
                    objc_autoreleasePoolPop(v15);
                    ++v11;
                    IOObjectRelease(v13);
                    v13 = IOIteratorNext(iterator);
                  }
                  while (v13);
                }
                else
                {
                  v11 = 0;
                }
                IOObjectRelease(iterator);
                v9 = v38;
              }
              v29 = (const char *)objc_msgSend((id)objc_msgSend(v10, "description"), "cStringUsingEncoding:", 4);
              *(_QWORD *)buf = 0;
              asprintf((char **)buf, "_iosConnectInitalize() unable to open IOSurface kernel service: %08x\n%d existing clients:\n%s\n", -536870201, v11, v29);
              if (*(_QWORD *)buf)
                ___ioSurfaceConnectInternal_block_invoke_cold_4(*(char **)buf);

              objc_autoreleasePoolPop(v9);
            }
            else
            {
              *(_QWORD *)buf = 0;
              asprintf((char **)buf, "_iosConnectInitalize() unable to open IOSurface kernel service: %08x", v8);
              if (*(_QWORD *)buf)
                ___ioSurfaceConnectInternal_block_invoke_cold_3(*(char **)buf);
            }
          }
        }
        else
        {
          *(_QWORD *)buf = 40;
          if (IOConnectCallMethod(_iosConnect, 0xDu, 0, 0, 0, 0, 0, 0, &ioSurfaceLimits, (size_t *)buf)
            || word_1ECDA8152 != 1)
          {
            v30 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
            if (v30)
              ___ioSurfaceConnectInternal_block_invoke_cold_2(v30, v31, v32, v33, v34, v35, v36, v37);
            IOServiceClose(_iosConnect);
            _iosConnect = 0;
          }
        }
        goto LABEL_39;
      }
      IOObjectRelease(existing);
      sleep(1u);
      if (__CFADD__(v2++, 1))
        goto LABEL_39;
    }
    v7 = MatchingServices;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v7;
      _os_log_impl(&dword_1A4CDD000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "IOSurface.framework not allowed to iterate kernel services (%08x).  API disallowed.", buf, 8u);
    }
LABEL_39:
    if (!(_iosService | _iosServiceReturn))
      ___ioSurfaceConnectInternal_block_invoke_cold_1();
  }
  _ensureKeySniffDictionaries();
}

void _ensureKeySniffDictionaries()
{
  if (_ensureKeySniffDictionaries_onceToken != -1)
    dispatch_once(&_ensureKeySniffDictionaries_onceToken, &__block_literal_global_0);
}

CFMutableDictionaryRef ___ensureKeySniffDictionaries_block_invoke()
{
  const CFDictionaryKeyCallBacks *v0;
  const CFDictionaryKeyCallBacks *v1;
  const __CFAllocator *v2;
  const CFDictionaryValueCallBacks *v3;
  CFMutableDictionaryRef result;

  v0 = (const CFDictionaryKeyCallBacks *)MEMORY[0x1E0C9B390];
  _sniffKeysToStructDict = (uint64_t)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], 0);
  CFDictionarySetValue((CFMutableDictionaryRef)_sniffKeysToStructDict, CFSTR("IOSurfaceCleanAperture"), sniffCleanApertureKeyToStruct);
  CFDictionarySetValue((CFMutableDictionaryRef)_sniffKeysToStructDict, CFSTR("IOSurfacePixelAspectRatio"), sniffPixelAspectRatioKeyToStruct);
  CFDictionarySetValue((CFMutableDictionaryRef)_sniffKeysToStructDict, CFSTR("IOSurfaceGammaLevel"), sniffGammaLevelKeyToStruct);
  CFDictionarySetValue((CFMutableDictionaryRef)_sniffKeysToStructDict, CFSTR("IOSurfaceFieldCount"), sniffFieldCountKeyToStruct);
  CFDictionarySetValue((CFMutableDictionaryRef)_sniffKeysToStructDict, CFSTR("IOSurfaceFieldDetail"), sniffFieldDetailKeyToStruct);
  CFDictionarySetValue((CFMutableDictionaryRef)_sniffKeysToStructDict, CFSTR("IOSurfaceYCbCrMatrix"), sniffYCbCrMatrixKeyToStruct);
  CFDictionarySetValue((CFMutableDictionaryRef)_sniffKeysToStructDict, CFSTR("IOSurfaceColorPrimaries"), sniffColorPrimariesKeyToStruct);
  CFDictionarySetValue((CFMutableDictionaryRef)_sniffKeysToStructDict, CFSTR("IOSurfaceTransferFunction"), sniffTransferFunctionKeyToStruct);
  CFDictionarySetValue((CFMutableDictionaryRef)_sniffKeysToStructDict, CFSTR("IOSurfaceChromaLocationTopField"), sniffChromaLocationTopKeyToStruct);
  CFDictionarySetValue((CFMutableDictionaryRef)_sniffKeysToStructDict, CFSTR("IOSurfaceChromaLocationBottomField"), sniffChromaLocationBottomKeyToStruct);
  CFDictionarySetValue((CFMutableDictionaryRef)_sniffKeysToStructDict, CFSTR("IOSurfaceChromaSubsampling"), sniffChromaSubsamplingKeyToStruct);
  CFDictionarySetValue((CFMutableDictionaryRef)_sniffKeysToStructDict, CFSTR("IOSurfaceEDRFactor"), sniffEDRFactorKeyToStruct);
  CFDictionarySetValue((CFMutableDictionaryRef)_sniffKeysToStructDict, CFSTR("MasteringDisplayColorVolume"), sniffMasteringDisplayColorVolumeKeyToStruct);
  CFDictionarySetValue((CFMutableDictionaryRef)_sniffKeysToStructDict, CFSTR("ContentLightLevelInfo"), sniffContentLightLevelInfoKeyToStruct);
  CFDictionarySetValue((CFMutableDictionaryRef)_sniffKeysToStructDict, CFSTR("AlphaChannelMode"), sniffAlphaChannelModeKeyToStruct);
  CFDictionarySetValue((CFMutableDictionaryRef)_sniffKeysToStructDict, CFSTR("SceneIllumination"), sniffSceneIlluminationKeyToStruct);
  _sniffStructToKeysDict = (uint64_t)CFDictionaryCreateMutable(0, 0, v0, 0);
  CFDictionarySetValue((CFMutableDictionaryRef)_sniffStructToKeysDict, CFSTR("IOSurfaceCleanAperture"), createCleanApertureFromStruct);
  CFDictionarySetValue((CFMutableDictionaryRef)_sniffStructToKeysDict, CFSTR("IOSurfacePixelAspectRatio"), createPixelAspectRatioFromStruct);
  CFDictionarySetValue((CFMutableDictionaryRef)_sniffStructToKeysDict, CFSTR("IOSurfaceGammaLevel"), createGammaLevelFromStruct);
  CFDictionarySetValue((CFMutableDictionaryRef)_sniffStructToKeysDict, CFSTR("IOSurfaceFieldCount"), createFieldCountFromStruct);
  CFDictionarySetValue((CFMutableDictionaryRef)_sniffStructToKeysDict, CFSTR("IOSurfaceFieldDetail"), createFieldDetailFromStruct);
  CFDictionarySetValue((CFMutableDictionaryRef)_sniffStructToKeysDict, CFSTR("IOSurfaceYCbCrMatrix"), createYCbCrMatrixFromStruct);
  CFDictionarySetValue((CFMutableDictionaryRef)_sniffStructToKeysDict, CFSTR("IOSurfaceColorPrimaries"), createColorPrimariesFromStruct);
  CFDictionarySetValue((CFMutableDictionaryRef)_sniffStructToKeysDict, CFSTR("IOSurfaceTransferFunction"), createTransferFunctionFromStruct);
  CFDictionarySetValue((CFMutableDictionaryRef)_sniffStructToKeysDict, CFSTR("IOSurfaceChromaLocationTopField"), createChromaLocationTopFieldFromStruct);
  CFDictionarySetValue((CFMutableDictionaryRef)_sniffStructToKeysDict, CFSTR("IOSurfaceChromaLocationBottomField"), createChromaLocationBottomFieldFromStruct);
  CFDictionarySetValue((CFMutableDictionaryRef)_sniffStructToKeysDict, CFSTR("IOSurfaceChromaSubsampling"), createChromaSubsamplingFromStruct);
  CFDictionarySetValue((CFMutableDictionaryRef)_sniffStructToKeysDict, CFSTR("IOSurfaceEDRFactor"), createEDRFactorFromStruct);
  CFDictionarySetValue((CFMutableDictionaryRef)_sniffStructToKeysDict, CFSTR("MasteringDisplayColorVolume"), createMasteringDisplayColorVolumeFromStruct);
  CFDictionarySetValue((CFMutableDictionaryRef)_sniffStructToKeysDict, CFSTR("ContentLightLevelInfo"), createContentLightLevelInfoFromStruct);
  CFDictionarySetValue((CFMutableDictionaryRef)_sniffStructToKeysDict, CFSTR("AlphaChannelMode"), createAlphaChannelModeFromStruct);
  CFDictionarySetValue((CFMutableDictionaryRef)_sniffStructToKeysDict, CFSTR("SceneIllumination"), createSceneIlluminationFromStruct);
  v1 = (const CFDictionaryKeyCallBacks *)MEMORY[0x1E0C9B390];
  _fieldDetailKeysToStructDict = (uint64_t)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], 0);
  CFDictionarySetValue((CFMutableDictionaryRef)_fieldDetailKeysToStructDict, CFSTR("TemporalTopFirst"), (const void *)1);
  CFDictionarySetValue((CFMutableDictionaryRef)_fieldDetailKeysToStructDict, CFSTR("TemporalBottomFirst"), (const void *)6);
  CFDictionarySetValue((CFMutableDictionaryRef)_fieldDetailKeysToStructDict, CFSTR("SpatialFirstLineEarly"), (const void *)9);
  CFDictionarySetValue((CFMutableDictionaryRef)_fieldDetailKeysToStructDict, CFSTR("SpatialFirstLineLate"), (const void *)0xE);
  _yCbCrMatrixKeysToStructDict = (uint64_t)CFDictionaryCreateMutable(0, 0, v1, 0);
  CFDictionarySetValue((CFMutableDictionaryRef)_yCbCrMatrixKeysToStructDict, CFSTR("ITU_R_709_2"), (const void *)1);
  CFDictionarySetValue((CFMutableDictionaryRef)_yCbCrMatrixKeysToStructDict, CFSTR("ITU_R_601_4"), (const void *)6);
  CFDictionarySetValue((CFMutableDictionaryRef)_yCbCrMatrixKeysToStructDict, CFSTR("SMPTE_240M_1995"), (const void *)7);
  CFDictionarySetValue((CFMutableDictionaryRef)_yCbCrMatrixKeysToStructDict, CFSTR("DCI_P3"), (const void *)0xB);
  CFDictionarySetValue((CFMutableDictionaryRef)_yCbCrMatrixKeysToStructDict, CFSTR("P3_D65"), (const void *)0xC);
  CFDictionarySetValue((CFMutableDictionaryRef)_yCbCrMatrixKeysToStructDict, CFSTR("ITU_R_2020"), (const void *)9);
  CFDictionarySetValue((CFMutableDictionaryRef)_yCbCrMatrixKeysToStructDict, CFSTR("ITU_R_2100_ICtCp"), (const void *)0xE);
  CFDictionarySetValue((CFMutableDictionaryRef)_yCbCrMatrixKeysToStructDict, CFSTR("IPT"), (const void *)0xF8);
  CFDictionarySetValue((CFMutableDictionaryRef)_yCbCrMatrixKeysToStructDict, CFSTR("Identity"), (const void *)0xC8);
  _colorPrimariesKeysToStructDict = (uint64_t)CFDictionaryCreateMutable(0, 0, v1, 0);
  CFDictionarySetValue((CFMutableDictionaryRef)_colorPrimariesKeysToStructDict, CFSTR("ITU_R_709_2"), (const void *)1);
  CFDictionarySetValue((CFMutableDictionaryRef)_colorPrimariesKeysToStructDict, CFSTR("EBU_3213"), (const void *)5);
  CFDictionarySetValue((CFMutableDictionaryRef)_colorPrimariesKeysToStructDict, CFSTR("SMPTE_C"), (const void *)6);
  CFDictionarySetValue((CFMutableDictionaryRef)_colorPrimariesKeysToStructDict, CFSTR("DCI_P3"), (const void *)0xB);
  CFDictionarySetValue((CFMutableDictionaryRef)_colorPrimariesKeysToStructDict, CFSTR("P3_D65"), (const void *)0xC);
  CFDictionarySetValue((CFMutableDictionaryRef)_colorPrimariesKeysToStructDict, CFSTR("JEDEC_P22"), (const void *)0x16);
  CFDictionarySetValue((CFMutableDictionaryRef)_colorPrimariesKeysToStructDict, CFSTR("ITU_R_2020"), (const void *)9);
  _transferFunctionKeysToStructDict = (uint64_t)CFDictionaryCreateMutable(0, 0, v1, 0);
  CFDictionarySetValue((CFMutableDictionaryRef)_transferFunctionKeysToStructDict, CFSTR("ITU_R_709_2"), (const void *)1);
  CFDictionarySetValue((CFMutableDictionaryRef)_transferFunctionKeysToStructDict, CFSTR("ITU_R_2020"), (const void *)1);
  CFDictionarySetValue((CFMutableDictionaryRef)_transferFunctionKeysToStructDict, CFSTR("UseGamma"), (const void *)2);
  CFDictionarySetValue((CFMutableDictionaryRef)_transferFunctionKeysToStructDict, CFSTR("SMPTE_240M_1995"), (const void *)7);
  CFDictionarySetValue((CFMutableDictionaryRef)_transferFunctionKeysToStructDict, CFSTR("SMPTE_ST_2084_PQ"), (const void *)0x10);
  CFDictionarySetValue((CFMutableDictionaryRef)_transferFunctionKeysToStructDict, CFSTR("SMPTE_ST_428_1"), (const void *)0x11);
  CFDictionarySetValue((CFMutableDictionaryRef)_transferFunctionKeysToStructDict, CFSTR("ITU_R_2100_HLG"), (const void *)0x12);
  CFDictionarySetValue((CFMutableDictionaryRef)_transferFunctionKeysToStructDict, CFSTR("IEC_sRGB"), (const void *)0xD);
  CFDictionarySetValue((CFMutableDictionaryRef)_transferFunctionKeysToStructDict, CFSTR("sRGB"), (const void *)0xD);
  CFDictionarySetValue((CFMutableDictionaryRef)_transferFunctionKeysToStructDict, CFSTR("Linear"), (const void *)8);
  CFDictionarySetValue((CFMutableDictionaryRef)_transferFunctionKeysToStructDict, CFSTR("aYCC"), (const void *)0xFF);
  _chromaLocationKeysToStructDict = (uint64_t)CFDictionaryCreateMutable(0, 0, v1, 0);
  CFDictionarySetValue((CFMutableDictionaryRef)_chromaLocationKeysToStructDict, CFSTR("Left"), (const void *)1);
  CFDictionarySetValue((CFMutableDictionaryRef)_chromaLocationKeysToStructDict, CFSTR("Center"), (const void *)2);
  CFDictionarySetValue((CFMutableDictionaryRef)_chromaLocationKeysToStructDict, CFSTR("TopLeft"), (const void *)3);
  CFDictionarySetValue((CFMutableDictionaryRef)_chromaLocationKeysToStructDict, CFSTR("Top"), (const void *)4);
  CFDictionarySetValue((CFMutableDictionaryRef)_chromaLocationKeysToStructDict, CFSTR("BottomLeft"), (const void *)5);
  CFDictionarySetValue((CFMutableDictionaryRef)_chromaLocationKeysToStructDict, CFSTR("Bottom"), (const void *)6);
  CFDictionarySetValue((CFMutableDictionaryRef)_chromaLocationKeysToStructDict, CFSTR("DV 4:2:0"), (const void *)7);
  _chromaSubsamplingKeysToStructDict = (uint64_t)CFDictionaryCreateMutable(0, 0, v1, 0);
  CFDictionarySetValue((CFMutableDictionaryRef)_chromaSubsamplingKeysToStructDict, CFSTR("4:2:0"), (const void *)1);
  CFDictionarySetValue((CFMutableDictionaryRef)_chromaSubsamplingKeysToStructDict, CFSTR("4:2:2"), (const void *)2);
  CFDictionarySetValue((CFMutableDictionaryRef)_chromaSubsamplingKeysToStructDict, CFSTR("4:1:1"), (const void *)3);
  _premultipliedAlphaKeysToStructDict = (uint64_t)CFDictionaryCreateMutable(0, 0, v1, 0);
  CFDictionarySetValue((CFMutableDictionaryRef)_premultipliedAlphaKeysToStructDict, CFSTR("PremultipliedAlpha"), (const void *)2);
  CFDictionarySetValue((CFMutableDictionaryRef)_premultipliedAlphaKeysToStructDict, CFSTR("StraightAlpha"), (const void *)1);
  _unrecognizedCodePointDispatchQueue = (uint64_t)dispatch_queue_create("com.apple.iosurface.unrecognized-code-points", 0);
  v2 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v3 = (const CFDictionaryValueCallBacks *)MEMORY[0x1E0C9B3A0];
  _stringsForUnrecognizedYCbCrMatrixCodePointsDict = (uint64_t)CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0, MEMORY[0x1E0C9B3A0]);
  _stringsForUnrecognizedColorPrimariesCodePointsDict = (uint64_t)CFDictionaryCreateMutable(v2, 0, 0, v3);
  result = CFDictionaryCreateMutable(v2, 0, 0, v3);
  _stringsForUnrecognizedTransferFunctionCodePointsDict = (uint64_t)result;
  return result;
}

IOSurfaceRef IOSurfaceLookupFromXPCObject(xpc_object_t xobj)
{
  uint64_t right;

  if (xobj && MEMORY[0x1A85A6ECC]() == MEMORY[0x1E0C81338] && (right = xpc_mach_send_get_right(), (_DWORD)right))
    return (IOSurfaceRef)-[IOSurface initWithMachPort:]([IOSurface alloc], "initWithMachPort:", right);
  else
    return 0;
}

xpc_object_t IOSurfaceCreateXPCObject(IOSurfaceRef aSurface)
{
  mach_port_name_t MachPort;
  mach_port_name_t v2;
  void *v3;

  if (!aSurface)
    return 0;
  MachPort = IOSurfaceClientCreateMachPort(*((_QWORD *)aSurface + 1));
  if (!MachPort)
    return 0;
  v2 = MachPort;
  v3 = (void *)xpc_mach_send_create();
  mach_port_deallocate(*MEMORY[0x1E0C83DA0], v2);
  return v3;
}

void IOSurfaceLog(char *a1, ...)
{
  size_t v1;
  mach_port_t v2;
  char *__s[3];
  va_list va;

  va_start(va, a1);
  __s[2] = *(char **)MEMORY[0x1E0C80C00];
  __s[0] = 0;
  va_copy((va_list)&__s[1], va);
  vasprintf(__s, a1, va);
  if (__s[0])
  {
    v1 = strlen(__s[0]) + 1;
    v2 = _ioSurfaceConnectInternal(0);
    IOConnectCallMethod(v2, 0x13u, 0, 0, __s[0], v1, 0, 0, 0, 0);
    free(__s[0]);
  }
}

uint64_t IOSurfaceClientDisallowForever()
{
  uint64_t result;

  result = _ioSurfaceConnectInternal(1);
  if ((_DWORD)result)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      IOSurfaceClientDisallowForever_cold_1();
    abort();
  }
  return result;
}

_DWORD *IOSurfaceClientRetain(_DWORD *a1)
{
  if (a1)
  {
    pthread_mutex_lock(&_iosCacheMutex);
    ++*a1;
    pthread_mutex_unlock(&_iosCacheMutex);
  }
  return a1;
}

uint64_t _IOSurfaceClientGetUnadjustedBaseAddress(uint64_t a1)
{
  return *(_QWORD *)(a1 + 112);
}

uint64_t _IOSurfaceClientGetBufferOffset(uint64_t a1)
{
  return *(_QWORD *)(a1 + 176);
}

uint64_t IOSurfaceClientGetSeed(uint64_t a1)
{
  return *(unsigned int *)(*(_QWORD *)(a1 + 120) + 12);
}

uint64_t IOSurfaceClientGetElementHeightOfPlane(uint64_t a1, unsigned int a2)
{
  unsigned __int8 *v2;

  if (*(_DWORD *)(a1 + 200) <= a2)
  {
    if (a2)
      return 0;
    v2 = (unsigned __int8 *)(a1 + 211);
  }
  else
  {
    v2 = (unsigned __int8 *)(a1 + 152 * a2 + 299);
  }
  return *v2;
}

uint64_t IOSurfaceClientFlushProcessorCaches(uint64_t a1)
{
  uint64_t result;

  result = IOSurfaceClientLock(a1, 1u, 0);
  if (!(_DWORD)result)
  {
    sys_dcache_flush(*(void **)(a1 + 112), *(_QWORD *)(a1 + 192));
    return IOSurfaceClientUnlock(a1, 1u, 0);
  }
  return result;
}

BOOL IOSurfaceClientNeedsBindAccel(uint64_t a1, int a2, int a3)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 120);
  return *(_WORD *)(v3 + 8) && (*(unsigned __int16 *)(v3 + 8) != a2 || *(unsigned __int16 *)(v3 + 10) != a3);
}

uint64_t IOSurfaceClientCopyDataValueBytes(uint64_t a1, const __CFString *a2, _BYTE *a3, size_t *a4)
{
  uint64_t v4;
  const __CFData *ExternalRepresentation;
  const __CFData *v9;
  size_t Length;
  _DWORD *v11;
  const UInt8 *BytePtr;
  mach_port_t v13;
  uint64_t v14;
  size_t v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v4 = 3758097090;
  if (a2 && a3 && a4)
  {
    if (*a4)
    {
      if (*(_DWORD *)(*(_QWORD *)(a1 + 120) + 40))
      {
        v16[0] = *a4;
        ExternalRepresentation = CFStringCreateExternalRepresentation(0, a2, 0x8000100u, 0);
        v4 = 3758097136;
        if (ExternalRepresentation)
        {
          v9 = ExternalRepresentation;
          Length = CFDataGetLength(ExternalRepresentation);
          v11 = malloc_type_malloc(Length + 13, 0x4C29E673uLL);
          *a3 = 0;
          *v11 = *(_DWORD *)(a1 + 136);
          BytePtr = CFDataGetBytePtr(v9);
          memcpy(v11 + 3, BytePtr, Length);
          *((_BYTE *)v11 + Length + 12) = 0;
          v13 = _ioSurfaceConnectInternal(0);
          v14 = IOConnectCallMethod(v13, 0x1Au, 0, 0, v11, Length + 13, 0, 0, a3, v16);
          v4 = v14;
          if ((_DWORD)v14 && (_DWORD)v14 != -536870181)
            fprintf((FILE *)*MEMORY[0x1E0C80C10], "IOSurfaceClientGetValue getValueMethod kernel call failed %08x\n", v14);
          else
            *a4 = v16[0];
          free(v11);
          CFRelease(v9);
        }
      }
      else
      {
        return 3758097136;
      }
    }
    else
    {
      return 0;
    }
  }
  return v4;
}

uint64_t IOSurfaceClientSetCoreVideoBridgedKeys(const __CFArray *a1)
{
  const __CFData *v2;
  const __CFData *v3;
  unint64_t Length;
  size_t v5;
  size_t v6;
  char *v7;
  const UInt8 *BytePtr;
  mach_port_t v9;
  kern_return_t v10;

  pthread_mutex_lock(&_iosCoreVideoBridgedKeysMutex);
  if (_iosBridgedCoreVideoKeys)
    CFRelease((CFTypeRef)_iosBridgedCoreVideoKeys);
  _iosBridgedCoreVideoKeys = (uint64_t)CFArrayCreateCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a1);
  v2 = IOCFSerialize(a1, 1uLL);
  if (v2)
  {
    v3 = v2;
    Length = CFDataGetLength(v2);
    if (Length >= 0xFFFFFFFFFFFFFFF4)
      abort();
    v5 = Length;
    v6 = (Length + 12);
    v7 = (char *)malloc_type_malloc(v6, 0xBB959A7uLL);
    BytePtr = CFDataGetBytePtr(v3);
    memcpy(v7 + 12, BytePtr, v5);
    v9 = _ioSurfaceConnectInternal(0);
    v10 = IOConnectCallMethod(v9, 0x36u, 0, 0, v7, v6, 0, 0, 0, 0);
    if (v10)
      fprintf((FILE *)*MEMORY[0x1E0C80C10], "kIOSurfaceMethodSetCoreVideoBridgedKeys failed: %08x\n", v10);
    CFRelease(v3);
    free(v7);
  }
  return pthread_mutex_unlock(&_iosCoreVideoBridgedKeysMutex);
}

uint64_t IOSurfaceClientRemoveCoreVideoBridgedValues(uint64_t a1)
{
  pthread_mutex_t *v2;
  io_connect_t v3;
  kern_return_t v4;
  int v5;
  int v6;
  const __CFDictionary *v7;
  const __CFAllocator *v8;
  CFMutableDictionaryRef MutableCopy;
  const __CFArray *v10;
  const void *v11;
  int v13;
  uint64_t v14;
  CFRange v15;

  v14 = *MEMORY[0x1E0C80C00];
  v13 = 0;
  v2 = (pthread_mutex_t *)(a1 + 40);
  pthread_mutex_lock((pthread_mutex_t *)(a1 + 40));
  v3 = _ioSurfaceConnectInternal(0);
  v4 = IOConnectTrap2(v3, 8u, *(unsigned int *)(a1 + 136), (uintptr_t)&v13);
  if (v4)
    fprintf((FILE *)*MEMORY[0x1E0C80C10], "kIOSurfaceTrapRemoveCoreVideoBridgedValues failed: %08x\n", v4);
  v5 = *(_DWORD *)(a1 + 32);
  if (v5)
  {
    v6 = (v5 | 1) + 2;
    if (v13 == v6)
    {
      *(_DWORD *)(a1 + 32) = v6;
      pthread_mutex_lock(&_iosCoreVideoBridgedKeysMutex);
      v7 = *(const __CFDictionary **)(a1 + 16);
      if (v7 && _iosBridgedCoreVideoKeys)
      {
        v8 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
        MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, v7);
        v10 = (const __CFArray *)_iosBridgedCoreVideoKeys;
        v15.length = CFArrayGetCount((CFArrayRef)_iosBridgedCoreVideoKeys);
        v15.location = 0;
        CFArrayApplyFunction(v10, v15, (CFArrayApplierFunction)removeEachValueInDictionary, MutableCopy);
        v11 = *(const void **)(a1 + 16);
        if (v11)
          CFRelease(v11);
        *(_QWORD *)(a1 + 16) = CFDictionaryCreateCopy(v8, MutableCopy);
        CFRelease(MutableCopy);
      }
      pthread_mutex_unlock(&_iosCoreVideoBridgedKeysMutex);
    }
  }
  return pthread_mutex_unlock(v2);
}

void removeEachValueInDictionary(void *key, CFMutableDictionaryRef theDict)
{
  CFDictionaryRemoveValue(theDict, key);
}

void removeAllButNameAndCreation(const void *a1, uint64_t a2, __CFDictionary *a3)
{
  if (a1 && !CFEqual(a1, CFSTR("IOSurfaceName")) && !CFEqual(a1, CFSTR("CreationProperties")))
    CFDictionaryRemoveValue(a3, a1);
}

uint64_t IOSurfaceClientSetTiled(uint64_t a1, unsigned int a2)
{
  mach_port_t v2;
  uint64_t input[3];

  input[2] = *MEMORY[0x1E0C80C00];
  input[0] = *(unsigned int *)(a1 + 136);
  input[1] = a2;
  v2 = _ioSurfaceConnectInternal(0);
  return IOConnectCallMethod(v2, 0x16u, input, 2u, 0, 0, 0, 0, 0, 0);
}

uint64_t IOSurfaceClientGetTileFormat(uint64_t a1)
{
  mach_port_t v1;
  uint32_t outputCnt;
  uint64_t output;
  uint64_t input[2];

  input[1] = *MEMORY[0x1E0C80C00];
  output = 0;
  input[0] = *(unsigned int *)(a1 + 136);
  outputCnt = 1;
  v1 = _ioSurfaceConnectInternal(0);
  if (IOConnectCallMethod(v1, 0x19u, input, 1u, 0, 0, &output, &outputCnt, 0, 0))
    return 0;
  else
    return output;
}

unsigned int *IOSurfaceClientWrapClientImage(int a1, int a2, int a3, int a4, int a5, uint64_t a6)
{
  int v6;
  int v7;
  mach_port_t v8;
  unsigned int *v9;
  char *v10;
  uintptr_t v11;
  io_connect_t v12;
  size_t v14;
  __int128 outputStruct;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
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
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint64_t inputStruct;
  int v48;
  int v49;
  int v50;
  int v51;
  int v52;
  int v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v14 = 3176;
  if (a3 > 1380401728)
  {
    if (a3 <= 1395864161)
    {
      if (a3 != 1380401729)
      {
        if (a3 == 1380410945)
        {
          v7 = 16;
          goto LABEL_25;
        }
        if (a3 == 1380411457)
        {
          v7 = 8;
          goto LABEL_25;
        }
        goto LABEL_31;
      }
    }
    else
    {
      if (a3 > 1395996212)
      {
        if (a3 == 1395996213)
          goto LABEL_24;
        v6 = 1932866865;
        goto LABEL_23;
      }
      if (a3 != 1395864162)
      {
        v6 = 1395995957;
        goto LABEL_23;
      }
    }
LABEL_18:
    v7 = 4;
    goto LABEL_25;
  }
  if (a3 > 1278555444)
  {
    if (a3 <= 1279340599)
    {
      if (a3 != 1278555445)
      {
        v6 = 1278555701;
        goto LABEL_23;
      }
LABEL_24:
      v7 = 2;
      goto LABEL_25;
    }
    if (a3 == 1279340600)
      goto LABEL_24;
    v6 = 1279342648;
LABEL_23:
    if (a3 == v6)
      goto LABEL_24;
    goto LABEL_31;
  }
  if (a3 == 875836468 || a3 == 892679473)
    goto LABEL_24;
  if (a3 == 1111970369)
    goto LABEL_18;
LABEL_31:
  v7 = 1;
LABEL_25:
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  outputStruct = 0u;
  v16 = 0u;
  inputStruct = a6;
  v48 = a1;
  v49 = a2;
  v50 = a3;
  v51 = v7;
  v52 = a4;
  v53 = a5;
  v8 = _ioSurfaceConnectInternal(0);
  v9 = 0;
  if (!IOConnectCallMethod(v8, 6u, 0, 0, &inputStruct, 0x20uLL, 0, 0, &outputStruct, &v14))
  {
    v10 = _ioSurfaceClientCreateWithLockResult((unsigned int *)&outputStruct);
    if (v10)
    {
      v9 = (unsigned int *)v10;
      pthread_mutex_lock(&_iosCacheMutex);
      _ioSurfaceAddClientRef(v9);
      pthread_mutex_unlock(&_iosCacheMutex);
    }
    else
    {
      v11 = DWORD2(v16);
      v12 = _ioSurfaceConnectInternal(0);
      IOConnectTrap1(v12, 5u, v11);
      return 0;
    }
  }
  return v9;
}

unsigned int *IOSurfaceClientWrapClientMemory(uint64_t a1, uint64_t a2)
{
  mach_port_t v2;
  unsigned int *v3;
  char *v4;
  uintptr_t v5;
  io_connect_t v6;
  size_t v8;
  uint64_t input[2];
  __int128 outputStruct;
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
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
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
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v17 = 0u;
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  outputStruct = 0u;
  v8 = 3176;
  input[0] = a1;
  input[1] = a2;
  v2 = _ioSurfaceConnectInternal(0);
  v3 = 0;
  if (!IOConnectCallMethod(v2, 7u, input, 2u, 0, 0, 0, 0, &outputStruct, &v8))
  {
    v4 = _ioSurfaceClientCreateWithLockResult((unsigned int *)&outputStruct);
    if (v4)
    {
      v3 = (unsigned int *)v4;
      pthread_mutex_lock(&_iosCacheMutex);
      _ioSurfaceAddClientRef(v3);
      pthread_mutex_unlock(&_iosCacheMutex);
    }
    else
    {
      v5 = DWORD2(v11);
      v6 = _ioSurfaceConnectInternal(0);
      IOConnectTrap1(v6, 5u, v5);
      return 0;
    }
  }
  return v3;
}

uint64_t IOSurfaceClientSetSurfaceNotify(mach_port_t a1, uint64_t a2, unint64_t a3)
{
  mach_port_t v4;
  _QWORD inputStruct[3];
  uint64_t reference[2];
  __int128 v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  reference[0] = 0;
  inputStruct[1] = a3;
  inputStruct[2] = 0;
  inputStruct[0] = a2;
  reference[1] = a2;
  v8 = a3;
  v4 = _ioSurfaceConnectInternal(0);
  return IOConnectCallAsyncMethod(v4, 0x11u, a1, reference, 3u, 0, 0, inputStruct, 0x18uLL, 0, 0, 0, 0);
}

uint64_t IOSurfaceClientRemoveSurfaceNotify(uint64_t a1)
{
  mach_port_t v1;
  _QWORD inputStruct[4];

  inputStruct[3] = *MEMORY[0x1E0C80C00];
  inputStruct[0] = 0;
  inputStruct[1] = a1;
  inputStruct[2] = 0;
  v1 = _ioSurfaceConnectInternal(0);
  return IOConnectCallMethod(v1, 0x12u, 0, 0, inputStruct, 0x18uLL, 0, 0, 0, 0);
}

uint64_t IOSurfaceClientGetUseCount(uint64_t a1)
{
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (*(_BYTE *)(a1 + 221))
  {
    snprintf(crashMessage, 0x100uLL, "IOSurfaceGetUseCount: error: Attempt to query use count on an IOSurface (%p) created with kIOSurfaceProhibitUseCount.", (const void *)a1);
    qword_1EE788F88 = (uint64_t)crashMessage;
    v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
    if (v2)
      IOSurfaceClientIncrementUseCountForCategory_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    abort();
  }
  return (HIDWORD(*(_QWORD *)(a1 + 8)) + *(_QWORD *)(a1 + 8));
}

BOOL IOSurfaceClientIsInUseForCategory(uint64_t a1, unsigned int a2)
{
  uint64_t v4;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  if (a2 >= 2)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("category out of range"));
  if (*(_BYTE *)(a1 + 221))
  {
    snprintf(crashMessage, 0x100uLL, "IOSurfaceIsInUseForCategory: error: Attempt to query use count on an IOSurface (%p) created with kIOSurfaceProhibitUseCount.", (const void *)a1);
    qword_1EE788F88 = (uint64_t)crashMessage;
    v6 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
    if (v6)
      IOSurfaceClientIncrementUseCountForCategory_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);
    abort();
  }
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 120) + 24);
  if (a2)
    LODWORD(v4) = HIDWORD(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 24));
  return (_DWORD)v4 != 0;
}

BOOL IOSurfaceClientIsInUseForAnyOtherCategory(uint64_t a1, unsigned int a2)
{
  uint64_t v4;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  if (a2 >= 2)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("category out of range"));
  if (*(_BYTE *)(a1 + 221))
  {
    snprintf(crashMessage, 0x100uLL, "IOSurfaceIsInUseForAnyOtherCategory: error: Attempt to query use count on an IOSurface (%p) created with kIOSurfaceProhibitUseCount.", (const void *)a1);
    qword_1EE788F88 = (uint64_t)crashMessage;
    v6 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
    if (v6)
      IOSurfaceClientIncrementUseCountForCategory_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);
    abort();
  }
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 120) + 24);
  if (a2 != 1)
    LODWORD(v4) = HIDWORD(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 24));
  return (_DWORD)v4 != 0;
}

uint64_t IOSurfaceClientSignalEvent(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4)
{
  mach_port_t v4;
  uint64_t input[5];

  input[4] = *MEMORY[0x1E0C80C00];
  input[0] = *(unsigned int *)(a1 + 136);
  input[1] = a4;
  input[2] = a2;
  input[3] = a3;
  v4 = _ioSurfaceConnectInternal(0);
  return IOConnectCallMethod(v4, 0x2Au, input, 4u, 0, 0, 0, 0, 0, 0);
}

uint64_t IOSurfaceClientSetTimestamp(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t result;
  CFArrayRef v7;
  CFArrayRef v8;
  const __CFData *v9;
  size_t Length;
  _QWORD *v11;
  const UInt8 *BytePtr;
  mach_port_t v13;
  void *values[3];

  values[2] = *(void **)MEMORY[0x1E0C80C00];
  result = 3758097090;
  if (a2 && a3)
  {
    values[0] = a2;
    values[1] = a3;
    v7 = CFArrayCreate(0, (const void **)values, 2, MEMORY[0x1E0C9B378]);
    if (v7)
    {
      v8 = v7;
      v9 = IOCFSerialize(v7, 1uLL);
      CFRelease(v8);
      if (v9)
      {
        Length = CFDataGetLength(v9);
        v11 = malloc_type_malloc(Length + 16, 0x5B68EF5uLL);
        *(_DWORD *)v11 = *(_DWORD *)(a1 + 136);
        v11[1] = a4;
        BytePtr = CFDataGetBytePtr(v9);
        memcpy(v11 + 2, BytePtr, Length);
        v13 = _ioSurfaceConnectInternal(0);
        IOConnectCallMethod(v13, 0x18u, 0, 0, v11, Length + 16, 0, 0, 0, 0);
        free(v11);
        CFRelease(v9);
      }
      return 0;
    }
    else
    {
      return 3758097084;
    }
  }
  return result;
}

BOOL IOSurfaceClientSupportsProtectionOptions(uint64_t a1, uint64_t a2)
{
  return (a2 & ~*(_QWORD *)(a1 + 240)) == 0;
}

BOOL IOSurfaceClientIsDisplayable(uint64_t a1)
{
  return *(_BYTE *)(*(_QWORD *)(a1 + 120) + 45) != 0;
}

BOOL IOSurfaceClientIsSysMemOnly(uint64_t a1)
{
  return *(_BYTE *)(*(_QWORD *)(a1 + 120) + 46) != 0;
}

uint64_t IOSurfaceClientGetNumberOfComponentsOfPlane(uint64_t a1, unint64_t a2)
{
  if (a2 && *(unsigned int *)(a1 + 200) <= a2)
    return 0;
  else
    return *(unsigned __int8 *)(a1 + 152 * a2 + 300);
}

uint64_t IOSurfaceClientGetNameOfComponentOfPlane(uint64_t a1, unint64_t a2, unint64_t a3)
{
  if (a2 && *(unsigned int *)(a1 + 200) <= a2 || *(unsigned __int8 *)(a1 + 152 * a2 + 300) <= a3)
    return 0;
  else
    return *(unsigned __int8 *)(a1 + 152 * a2 + a3 + 312);
}

uint64_t IOSurfaceClientGetTypeOfComponentOfPlane(uint64_t a1, unint64_t a2, unint64_t a3)
{
  if (a2 && *(unsigned int *)(a1 + 200) <= a2 || *(unsigned __int8 *)(a1 + 152 * a2 + 300) <= a3)
    return 0;
  else
    return *(unsigned __int8 *)(a1 + 152 * a2 + a3 + 316);
}

uint64_t IOSurfaceClientGetRangeOfComponentOfPlane(uint64_t a1, unint64_t a2, unint64_t a3)
{
  if (a2 && *(unsigned int *)(a1 + 200) <= a2 || *(unsigned __int8 *)(a1 + 152 * a2 + 300) <= a3)
    return 0;
  else
    return *(unsigned __int8 *)(a1 + 152 * a2 + a3 + 320);
}

uint64_t IOSurfaceClientGetBitDepthOfComponentOfPlane(uint64_t a1, unint64_t a2, unint64_t a3)
{
  if (a2 && *(unsigned int *)(a1 + 200) <= a2 || *(unsigned __int8 *)(a1 + 152 * a2 + 300) <= a3)
    return 0;
  else
    return *(unsigned __int8 *)(a1 + 152 * a2 + a3 + 304);
}

uint64_t IOSurfaceClientGetBitOffsetOfComponentOfPlane(uint64_t a1, unint64_t a2, unint64_t a3)
{
  if (a2 && *(unsigned int *)(a1 + 200) <= a2 || *(unsigned __int8 *)(a1 + 152 * a2 + 300) <= a3)
    return 0;
  else
    return *(unsigned __int8 *)(a1 + 152 * a2 + a3 + 308);
}

uint64_t IOSurfaceClientGetSubsampling(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 220);
}

uint64_t IOSurfaceClientGetBytesPerCompressedTileHeaderOfPlane(uint64_t a1, unsigned int a2)
{
  if (a2 && *(_DWORD *)(a1 + 200) <= a2)
    return 0;
  else
    return *(unsigned int *)(a1 + 152 * a2 + 340);
}

uint64_t IOSurfaceClientGetHorizontalPixelOffsetWithinCompressedTileArrayOfPlane(uint64_t a1, unsigned int a2)
{
  if (a2 && *(_DWORD *)(a1 + 200) <= a2)
    return 0;
  else
    return *(unsigned __int16 *)(a1 + 152 * a2 + 360);
}

uint64_t IOSurfaceClientGetVerticalPixelOffsetWithinCompressedTileArrayOfPlane(uint64_t a1, unsigned int a2)
{
  if (a2 && *(_DWORD *)(a1 + 200) <= a2)
    return 0;
  else
    return *(unsigned __int16 *)(a1 + 152 * a2 + 362);
}

uint64_t IOSurfaceClientGetBytesPerRowOfTileDataOfPlane(uint64_t a1, unsigned int a2)
{
  if (a2 && *(_DWORD *)(a1 + 200) <= a2)
    return 0;
  else
    return *(unsigned int *)(a1 + 152 * a2 + 372);
}

uint64_t IOSurfaceClientGetHTPCPredictionSelectorOfPlane(uint64_t a1, unsigned int a2)
{
  if (a2 && *(_DWORD *)(a1 + 200) <= a2)
    return 0;
  else
    return *(unsigned __int8 *)(a1 + 152 * a2 + 357);
}

uint64_t IOSurfaceClientGetHTPCVerticalHeaderGroupingModeOfPlane(uint64_t a1, unsigned int a2)
{
  if (a2 && *(_DWORD *)(a1 + 200) <= a2)
    return 0;
  else
    return *(unsigned __int8 *)(a1 + 152 * a2 + 358);
}

uint64_t IOSurfaceClientGetCompressedTileDataRegionMemoryUsedOfPlane(uint64_t a1, unsigned int a2, _QWORD *a3)
{
  uint64_t result;

  result = 3758097090;
  if (a2 <= 4 && *(_DWORD *)(a1 + 200) > a2)
  {
    result = 0;
    *a3 = *(unsigned int *)(*(_QWORD *)(a1 + 120) + 4 * a2 + 164);
  }
  return result;
}

uint64_t IOSurfaceClientGetBaseAddressOfCompressedTileHeaderRegionOfSliceAndPlane(uint64_t a1, unsigned int a2, unsigned int a3)
{
  if (a3 && *(_DWORD *)(a1 + 200) <= a3 || a2 && *(_DWORD *)(a1 + 228) <= a2)
    return 0;
  else
    return *(_QWORD *)(a1 + 112)
         + *(unsigned int *)(a1 + 112 + 152 * a3 + 220)
         + *(_DWORD *)(a1 + 112 + 152 * a3 + 268) * a2;
}

uint64_t IOSurfaceClientGetBaseAddressOfCompressedTileDataRegionOfSliceAndPlane(uint64_t a1, unsigned int a2, unsigned int a3)
{
  if (a3 && *(_DWORD *)(a1 + 200) <= a3 || a2 && *(_DWORD *)(a1 + 228) <= a2)
    return 0;
  else
    return *(_QWORD *)(a1 + 112)
         + *(unsigned int *)(a1 + 112 + 152 * a3 + 224)
         + *(_DWORD *)(a1 + 112 + 152 * a3 + 264) * a2;
}

uint64_t IOSurfaceClientGetExtendedPixelsOfPlane(uint64_t result, unsigned int a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6)
{
  unsigned int *v6;

  if (!a2 || *(_DWORD *)(result + 200) > a2)
  {
    v6 = (unsigned int *)(result + 152 * a2);
    *a3 = v6[98];
    *a4 = v6[96];
    *a5 = v6[99];
    *a6 = v6[97];
  }
  return result;
}

uint64_t IOSurfaceClientSetIndexedTimestamp(uint64_t result, uint64_t a2, uint64_t a3)
{
  mach_port_t v3;
  uint64_t input[4];

  input[3] = *MEMORY[0x1E0C80C00];
  if (a2 <= 4)
  {
    if (byte_1ECDA8150)
    {
      *(_QWORD *)(*(_QWORD *)(result + 128) + 8 * a2) = a3;
    }
    else
    {
      input[0] = *(unsigned int *)(result + 136);
      input[1] = a2;
      input[2] = a3;
      v3 = _ioSurfaceConnectInternal(0);
      return IOConnectCallMethod(v3, 0x21u, input, 3u, 0, 0, 0, 0, 0, 0);
    }
  }
  return result;
}

uint64_t IOSurfaceClientGetRegistryID(uint64_t a1)
{
  return **(_QWORD **)(a1 + 120);
}

uint64_t IOSurfaceClientGetTraceID(uint64_t a1)
{
  return *(_QWORD *)(a1 + 232);
}

uint64_t IOSurfaceClientSetDataProperty(uint64_t a1, unsigned int a2, size_t a3, const void *a4)
{
  uint64_t result;
  uint64_t v8;
  mach_port_t v9;
  uint64_t input[3];

  input[2] = *MEMORY[0x1E0C80C00];
  result = 3758097090;
  v8 = *(_QWORD *)(a1 + 120);
  input[0] = *(unsigned int *)(a1 + 136);
  input[1] = a2;
  if ((!a3 || a4) && a2 <= 3 && a3 <= 0x400)
  {
    if (a3 || a4 || ((*(unsigned __int8 *)(v8 + 47) >> a2) & 1) != 0)
    {
      v9 = _ioSurfaceConnectInternal(0);
      return IOConnectCallMethod(v9, 0x32u, input, 2u, a4, a3, 0, 0, 0, 0);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

BOOL IOSurfaceClientIsMetalSharedTexture(uint64_t a1)
{
  return *(_BYTE *)(a1 + 222) != 0;
}

uint64_t IOSurfaceClientGetWiringAssertionCount(uint64_t a1)
{
  return *(unsigned int *)(*(_QWORD *)(a1 + 120) + 36);
}

void serializeReplacementArrayValues(uint64_t a1, __CFArray *a2)
{
  const void *v3;

  v3 = (const void *)serializeReplacementIOKitTypeRef(a1);
  CFArrayAppendValue(a2, v3);
  CFRelease(v3);
}

void serializeReplacementSetValues(uint64_t a1, __CFSet *a2)
{
  const void *v3;

  v3 = (const void *)serializeReplacementIOKitTypeRef(a1);
  CFSetAddValue(a2, v3);
  CFRelease(v3);
}

void unserializeReplacementSetValues(uint64_t a1, __CFSet *a2)
{
  const void *v3;

  v3 = (const void *)unserializeReplacementIOKitTypeRef(a1, 0);
  CFSetAddValue(a2, v3);
  CFRelease(v3);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

uint64_t IOSurfaceAcceleratorGetTypeID()
{
  uint64_t (*v0)(void);

  v0 = (uint64_t (*)(void))off_1ECDA7F28;
  if (!off_1ECDA7F28)
  {
    pthread_once(&_iosaInitStubs_once, (void (*)(void))_iosaLookupStubs);
    v0 = (uint64_t (*)(void))off_1ECDA7F28;
    if (!off_1ECDA7F28)
      abort();
  }
  return v0();
}

uint64_t IOSurfaceAcceleratorGetServiceObject(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t (*v6)(uint64_t, uint64_t, uint64_t);

  v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))off_1ECDA7F38;
  if (!off_1ECDA7F38)
  {
    pthread_once(&_iosaInitStubs_once, (void (*)(void))_iosaLookupStubs);
    v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))off_1ECDA7F38;
    if (!off_1ECDA7F38)
      abort();
  }
  return v6(a1, a2, a3);
}

uint64_t IOSurfaceAcceleratorCreate(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t (*v6)(uint64_t, uint64_t, uint64_t);

  v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))off_1ECDA7F48;
  if (!off_1ECDA7F48)
  {
    pthread_once(&_iosaInitStubs_once, (void (*)(void))_iosaLookupStubs);
    v6 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))off_1ECDA7F48;
    if (!off_1ECDA7F48)
      abort();
  }
  return v6(a1, a2, a3);
}

uint64_t IOSurfaceAcceleratorGetID(uint64_t a1, uint64_t a2)
{
  uint64_t (*v4)(uint64_t, uint64_t);

  v4 = (uint64_t (*)(uint64_t, uint64_t))off_1ECDA7F58;
  if (!off_1ECDA7F58)
  {
    pthread_once(&_iosaInitStubs_once, (void (*)(void))_iosaLookupStubs);
    v4 = (uint64_t (*)(uint64_t, uint64_t))off_1ECDA7F58;
    if (!off_1ECDA7F58)
      abort();
  }
  return v4(a1, a2);
}

uint64_t IOSurfaceAcceleratorGetRunLoopSource(uint64_t a1)
{
  uint64_t (*v2)(uint64_t);

  v2 = (uint64_t (*)(uint64_t))off_1ECDA7F68;
  if (!off_1ECDA7F68)
  {
    pthread_once(&_iosaInitStubs_once, (void (*)(void))_iosaLookupStubs);
    v2 = (uint64_t (*)(uint64_t))off_1ECDA7F68;
    if (!off_1ECDA7F68)
      abort();
  }
  return v2(a1);
}

uint64_t IOSurfaceAcceleratorConfigurePerformanceStats(uint64_t a1, uint64_t a2)
{
  uint64_t (*v4)(uint64_t, uint64_t);

  v4 = (uint64_t (*)(uint64_t, uint64_t))off_1ECDA7F78;
  if (!off_1ECDA7F78)
  {
    pthread_once(&_iosaInitStubs_once, (void (*)(void))_iosaLookupStubs);
    v4 = (uint64_t (*)(uint64_t, uint64_t))off_1ECDA7F78;
    if (!off_1ECDA7F78)
      abort();
  }
  return v4(a1, a2);
}

uint64_t IOSurfaceAcceleratorGetStatistics(uint64_t a1)
{
  uint64_t (*v2)(uint64_t);

  v2 = (uint64_t (*)(uint64_t))off_1ECDA7F88;
  if (!off_1ECDA7F88)
  {
    pthread_once(&_iosaInitStubs_once, (void (*)(void))_iosaLookupStubs);
    v2 = (uint64_t (*)(uint64_t))off_1ECDA7F88;
    if (!off_1ECDA7F88)
      abort();
  }
  return v2(a1);
}

uint64_t IOSurfaceAcceleratorTransformSurface(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t (*v16)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v16 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))off_1ECDA7F98;
  if (!off_1ECDA7F98)
  {
    pthread_once(&_iosaInitStubs_once, (void (*)(void))_iosaLookupStubs);
    v16 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))off_1ECDA7F98;
    if (!off_1ECDA7F98)
      abort();
  }
  return v16(a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t IOSurfaceAcceleratorTransferSurface(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t (*v14)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v14 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))off_1ECDA7FA8;
  if (!off_1ECDA7FA8)
  {
    pthread_once(&_iosaInitStubs_once, (void (*)(void))_iosaLookupStubs);
    v14 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))off_1ECDA7FA8;
    if (!off_1ECDA7FA8)
      abort();
  }
  return v14(a1, a2, a3, a4, a5, a6, a7);
}

uint64_t IOSurfaceAcceleratorAbortTransfers(uint64_t a1)
{
  uint64_t (*v2)(uint64_t);

  v2 = (uint64_t (*)(uint64_t))off_1ECDA7FB8;
  if (!off_1ECDA7FB8)
  {
    pthread_once(&_iosaInitStubs_once, (void (*)(void))_iosaLookupStubs);
    v2 = (uint64_t (*)(uint64_t))off_1ECDA7FB8;
    if (!off_1ECDA7FB8)
      abort();
  }
  return v2(a1);
}

uint64_t IOSurfaceAcceleratorTransferSurfaceWithSwap(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t (*v17)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v17 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))off_1ECDA7FE8;
  if (!off_1ECDA7FE8)
  {
    pthread_once(&_iosaInitStubs_once, (void (*)(void))_iosaLookupStubs);
    v17 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))off_1ECDA7FE8;
    if (!off_1ECDA7FE8)
      abort();
  }
  return v17(a1, a2, a3, a4, a5, a6, a7, a8, a9);
}

uint64_t IOSurfaceAcceleratorConditionalTransferSurfaceWithSwap(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t (*v14)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v14 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))off_1ECDA7FF8;
  if (!off_1ECDA7FF8)
  {
    pthread_once(&_iosaInitStubs_once, (void (*)(void))_iosaLookupStubs);
    v14 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))off_1ECDA7FF8;
    if (!off_1ECDA7FF8)
      abort();
  }
  return v14(a1, a2, a3, a4, a5, a6, a7);
}

uint64_t IOSurfaceAcceleratorBlitSurface(uint64_t a1, uint64_t a2, __int128 *a3, uint64_t a4, __int128 *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  uint64_t (*v17)(uint64_t, uint64_t, __int128 *, uint64_t, __int128 *, uint64_t, uint64_t, uint64_t, uint64_t);
  __int128 v19;
  uint64_t v20;
  __int128 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v17 = (uint64_t (*)(uint64_t, uint64_t, __int128 *, uint64_t, __int128 *, uint64_t, uint64_t, uint64_t, uint64_t))off_1ECDA8008;
  if (!off_1ECDA8008)
  {
    pthread_once(&_iosaInitStubs_once, (void (*)(void))_iosaLookupStubs);
    v17 = (uint64_t (*)(uint64_t, uint64_t, __int128 *, uint64_t, __int128 *, uint64_t, uint64_t, uint64_t, uint64_t))off_1ECDA8008;
    if (!off_1ECDA8008)
      abort();
  }
  v21 = *a3;
  v22 = *((_QWORD *)a3 + 2);
  v19 = *a5;
  v20 = *((_QWORD *)a5 + 2);
  return v17(a1, a2, &v21, a4, &v19, a6, a7, a8, a9);
}

uint64_t IOSurfaceAcceleratorBlitSurfaceWithSwap(uint64_t a1, uint64_t a2, __int128 *a3, uint64_t a4, __int128 *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, int a11)
{
  uint64_t (*v19)(uint64_t, uint64_t, __int128 *, uint64_t, __int128 *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, int);
  __int128 v21;
  uint64_t v22;
  __int128 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v19 = (uint64_t (*)(uint64_t, uint64_t, __int128 *, uint64_t, __int128 *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, int))off_1ECDA8018;
  if (!off_1ECDA8018)
  {
    pthread_once(&_iosaInitStubs_once, (void (*)(void))_iosaLookupStubs);
    v19 = (uint64_t (*)(uint64_t, uint64_t, __int128 *, uint64_t, __int128 *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, int))off_1ECDA8018;
    if (!off_1ECDA8018)
      abort();
  }
  v23 = *a3;
  v24 = *((_QWORD *)a3 + 2);
  v21 = *a5;
  v22 = *((_QWORD *)a5 + 2);
  return v19(a1, a2, &v23, a4, &v21, a6, a7, a8, a9, a10, a11);
}

uint64_t IOSurfaceAcceleratorAbortCaptures(uint64_t a1)
{
  uint64_t (*v2)(uint64_t);

  v2 = (uint64_t (*)(uint64_t))off_1ECDA8028;
  if (!off_1ECDA8028)
  {
    pthread_once(&_iosaInitStubs_once, (void (*)(void))_iosaLookupStubs);
    v2 = (uint64_t (*)(uint64_t))off_1ECDA8028;
    if (!off_1ECDA8028)
      abort();
  }
  return v2(a1);
}

uint64_t IOSurfaceAcceleratorCaptureSurface(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t (*v10)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))off_1ECDA8038;
  if (!off_1ECDA8038)
  {
    pthread_once(&_iosaInitStubs_once, (void (*)(void))_iosaLookupStubs);
    v10 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))off_1ECDA8038;
    if (!off_1ECDA8038)
      abort();
  }
  return v10(a1, a2, a3, a4, a5);
}

uint64_t IOSurfaceAcceleratorSetFilterCoefficients(uint64_t a1, uint64_t a2)
{
  uint64_t (*v4)(uint64_t, uint64_t);

  v4 = (uint64_t (*)(uint64_t, uint64_t))off_1ECDA7FC8;
  if (!off_1ECDA7FC8)
  {
    pthread_once(&_iosaInitStubs_once, (void (*)(void))_iosaLookupStubs);
    v4 = (uint64_t (*)(uint64_t, uint64_t))off_1ECDA7FC8;
    if (!off_1ECDA7FC8)
      abort();
  }
  return v4(a1, a2);
}

uint64_t IOSurfaceAcceleratorSetCustomFilter(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t (*v16)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v16 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))off_1ECDA7FD8;
  if (!off_1ECDA7FD8)
  {
    pthread_once(&_iosaInitStubs_once, (void (*)(void))_iosaLookupStubs);
    v16 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))off_1ECDA7FD8;
    if (!off_1ECDA7FD8)
      abort();
  }
  return v16(a1, a2, a3, a4, a5, a6, a7, a8);
}

char *_iosaLookupStubs()
{
  void *v0;
  void *v1;
  uint64_t v2;
  FILE **v3;
  char *result;
  FILE *v5;
  char *v6;
  FILE *v7;
  char *v8;

  v0 = dlopen("/System/Library/PrivateFrameworks/IOSurfaceAccelerator.framework/IOSurfaceAccelerator", 1);
  if (v0)
  {
    v1 = v0;
    v2 = 0;
    v3 = (FILE **)MEMORY[0x1E0C80C10];
    do
    {
      result = (char *)dlsym(v1, (&iosa_Stubs)[v2]);
      (&iosa_Stubs)[v2 + 1] = result;
      if (!result)
      {
        v5 = *v3;
        v6 = dlerror();
        result = (char *)fprintf(v5, "%s, Line=%d, Error=%s\n", "_iosaLookupStubs", 174, v6);
      }
      v2 += 2;
    }
    while (v2 != 36);
  }
  else
  {
    v7 = (FILE *)*MEMORY[0x1E0C80C10];
    v8 = dlerror();
    return (char *)fprintf(v7, "%s, Line=%d, Error=%s\n", "_iosaLookupStubs", 160, v8);
  }
  return result;
}

uint64_t IOSurfaceSharedEventGetTypeID()
{
  return objc_opt_self();
}

IOSurfaceSharedEvent *IOSurfaceSharedEventCreate()
{
  return objc_alloc_init(IOSurfaceSharedEvent);
}

IOSurfaceSharedEvent *IOSurfaceSharedEventCreateWithMachPort(uint64_t a1)
{
  return -[IOSurfaceSharedEvent initWithMachPort:]([IOSurfaceSharedEvent alloc], "initWithMachPort:", a1);
}

uint64_t IOSurfaceSharedEventNotifyEventListener(void *a1, void *a2, unsigned int a3, uint64_t a4, void *aBlock)
{
  void *v9;
  id v10;
  id v11;
  mach_port_t v12;
  uint64_t v13;
  uint64_t input[6];

  input[5] = *MEMORY[0x1E0C80C00];
  v9 = _Block_copy(aBlock);
  input[0] = a3;
  input[1] = (uint64_t)a1;
  input[2] = (uint64_t)a2;
  input[3] = (uint64_t)v9;
  input[4] = a4;
  v10 = a1;
  v11 = a2;
  if (_iosEventBlockOnce != -1)
    dispatch_once(&_iosEventBlockOnce, &__block_literal_global);
  pthread_mutex_lock(&_iosEventBlockMutex);
  CFArrayAppendValue((CFMutableArrayRef)_iosEventBlockArray, v9);
  pthread_mutex_unlock(&_iosEventBlockMutex);
  v12 = _ioSurfaceConnect();
  v13 = IOConnectCallMethod(v12, 0x27u, input, 5u, 0, 0, 0, 0, 0, 0);
  if ((_DWORD)v13)
  {

    _iosRemoveEventBlock(v9);
  }
  return v13;
}

uint64_t IOSurfaceSharedEventRemoveEventListener(uint64_t a1)
{
  mach_port_t v1;
  uint64_t input[2];

  input[1] = *MEMORY[0x1E0C80C00];
  input[0] = a1;
  v1 = _ioSurfaceConnect();
  return IOConnectCallMethod(v1, 0x29u, input, 1u, 0, 0, 0, 0, 0, 0);
}

void _ioSurfaceEventNotificationCallback2(void *a1, int a2, _QWORD *a3)
{
  void (**v3)(_QWORD, _QWORD, _QWORD);
  void *v5;

  if (a2)
    _ioSurfaceEventNotificationCallback2_cold_2();
  v3 = (void (**)(_QWORD, _QWORD, _QWORD))*a3;
  if (!*a3)
    _ioSurfaceEventNotificationCallback2_cold_1();
  v5 = (void *)a3[1];
  ((void (**)(_QWORD, void *, _QWORD))v3)[2](*a3, v5, a3[2]);

  _iosRemoveEventBlock(v3);
  _Block_release(v3);
}

uint64_t _iosRemoveEventBlock(const void *a1)
{
  const __CFArray *v2;
  CFIndex FirstIndexOfValue;
  CFRange v5;

  pthread_mutex_lock(&_iosEventBlockMutex);
  v2 = (const __CFArray *)_iosEventBlockArray;
  v5.length = CFArrayGetCount((CFArrayRef)_iosEventBlockArray);
  v5.location = 0;
  FirstIndexOfValue = CFArrayGetFirstIndexOfValue(v2, v5, a1);
  if (FirstIndexOfValue != -1)
    CFArrayRemoveValueAtIndex((CFMutableArrayRef)_iosEventBlockArray, FirstIndexOfValue);
  return pthread_mutex_unlock(&_iosEventBlockMutex);
}

uint64_t IOSurfaceSignalEvent(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return IOSurfaceClientSignalEvent(*(_QWORD *)(a1 + 8), objc_msgSend(a2, "eventPort"), a3, a4);
}

CFMutableArrayRef ___iosAddEventBlock_block_invoke()
{
  CFMutableArrayRef result;

  result = CFArrayCreateMutable(0, 0, 0);
  _iosEventBlockArray = (uint64_t)result;
  return result;
}

CFNumberRef createFieldCountFromStruct(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 56))
    return CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberSInt8Type, (const void *)(a1 + 56));
  else
    return 0;
}

__CFString *createFieldDetailFromStruct(uint64_t a1)
{
  __CFString *result;
  int v3;
  __CFString **v4;

  result = 0;
  v3 = *(unsigned __int8 *)(a1 + 57);
  if (v3 > 8)
  {
    if (v3 == 9)
    {
      v4 = kIOSurfaceFieldDetail_SpatialFirstLineEarly;
    }
    else
    {
      if (v3 != 14)
        return result;
      v4 = kIOSurfaceFieldDetail_SpatialFirstLineLate;
    }
  }
  else if (v3 == 1)
  {
    v4 = kIOSurfaceFieldDetail_TemporalTopFirst;
  }
  else
  {
    if (v3 != 6)
      return result;
    v4 = kIOSurfaceFieldDetail_TemporalBottomFirst;
  }
  return *v4;
}

__CFString *createChromaSubsamplingFromStruct(uint64_t a1)
{
  int v1;
  __CFString **v2;

  v1 = *(unsigned __int8 *)(a1 + 63);
  switch(v1)
  {
    case 3:
      v2 = kIOSurfaceChromaSubsampling_411;
      return *v2;
    case 2:
      v2 = kIOSurfaceChromaSubsampling_422;
      return *v2;
    case 1:
      v2 = kIOSurfaceChromaSubsampling_420;
      return *v2;
  }
  return 0;
}

CFDataRef createMasteringDisplayColorVolumeFromStruct(uint64_t a1)
{
  __int16 v1;
  UInt8 v2;
  int v3;
  unsigned int v4;
  UInt8 v6[4];
  __int16 v7;
  __int16 v8;
  __int16 v9;
  __int16 v10;
  __int16 v11;
  __int16 v12;
  unsigned int v13;
  unsigned int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v1 = *(_WORD *)(a1 + 64);
  if (v1 || *(_WORD *)(a1 + 66))
  {
    v2 = *(_WORD *)(a1 + 66);
    v3 = HIBYTE(*(unsigned __int16 *)(a1 + 66));
  }
  else
  {
    if (!*(_WORD *)(a1 + 68)
      && !*(_WORD *)(a1 + 70)
      && !*(_WORD *)(a1 + 72)
      && !*(_WORD *)(a1 + 74)
      && !*(_WORD *)(a1 + 76)
      && !*(_WORD *)(a1 + 78)
      && !*(_DWORD *)(a1 + 80))
    {
      return 0;
    }
    v2 = 0;
    LOBYTE(v3) = 0;
  }
  v6[0] = HIBYTE(v1);
  v6[1] = v1;
  v6[2] = v3;
  v6[3] = v2;
  v7 = bswap32(*(unsigned __int16 *)(a1 + 68)) >> 16;
  v8 = bswap32(*(unsigned __int16 *)(a1 + 70)) >> 16;
  v9 = bswap32(*(unsigned __int16 *)(a1 + 72)) >> 16;
  v10 = bswap32(*(unsigned __int16 *)(a1 + 74)) >> 16;
  v11 = bswap32(*(unsigned __int16 *)(a1 + 76)) >> 16;
  v12 = bswap32(*(unsigned __int16 *)(a1 + 78)) >> 16;
  v4 = bswap32(*(_DWORD *)(a1 + 84));
  v13 = bswap32(*(_DWORD *)(a1 + 80));
  v14 = v4;
  return CFDataCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v6, 24);
}

CFDataRef createContentLightLevelInfoFromStruct(uint64_t a1)
{
  __int16 v1;
  __int16 v2;
  UInt8 bytes[4];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v1 = *(_WORD *)(a1 + 88);
  v2 = *(_WORD *)(a1 + 90);
  if (!v1 && !*(_WORD *)(a1 + 90))
    return 0;
  bytes[0] = HIBYTE(v1);
  bytes[1] = v1;
  bytes[2] = HIBYTE(v2);
  bytes[3] = v2;
  return CFDataCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], bytes, 4);
}

__CFString *createAlphaChannelModeFromStruct(uint64_t a1)
{
  int v1;
  __CFString **v2;

  v1 = *(unsigned __int8 *)(a1 + 100);
  if (v1 == 1)
  {
    v2 = kIOSurfaceAlphaChannelMode_StraightAlpha;
    return *v2;
  }
  if (v1 == 2)
  {
    v2 = kIOSurfaceAlphaChannelMode_PremultipliedAlpha;
    return *v2;
  }
  return 0;
}

CFNumberRef createSceneIlluminationFromStruct(uint64_t a1)
{
  uint64_t v1;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v1 = *(unsigned int *)(a1 + 112);
  v3[0] = v1;
  if (!(_DWORD)v1)
    return 0;
  if ((_DWORD)v1 == 1)
    v3[0] = 0;
  return CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberSInt64Type, v3);
}

const __CFDictionary *sniffCleanApertureKeyToStruct(const __CFDictionary *result, uint64_t a2)
{
  const __CFDictionary *v3;
  CFTypeID v4;
  unsigned int v5;
  unsigned int v6;
  unsigned int v7;
  double v8;
  double v9;
  double v10;
  double v11[2];

  v11[1] = *(double *)MEMORY[0x1E0C80C00];
  if (!result)
  {
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
    goto LABEL_9;
  }
  v3 = result;
  v4 = CFGetTypeID(result);
  result = (const __CFDictionary *)CFDictionaryGetTypeID();
  if ((const __CFDictionary *)v4 == result)
  {
    v10 = 0.0;
    v11[0] = 0.0;
    v8 = 0.0;
    v9 = 0.0;
    result = getDoubleFromDict(v3, CFSTR("Width"), v11);
    if ((_DWORD)result)
    {
      result = getDoubleFromDict(v3, CFSTR("Height"), &v10);
      if ((_DWORD)result)
      {
        result = getDoubleFromDict(v3, CFSTR("HorizontalOffset"), &v9);
        if ((_DWORD)result)
        {
          result = getDoubleFromDict(v3, CFSTR("VerticalOffset"), &v8);
          if ((_DWORD)result)
          {
            v5 = llround(v10 * 16.0);
            *(_DWORD *)a2 = llround(v11[0] * 16.0);
            *(_DWORD *)(a2 + 4) = 16;
            v6 = llround(v9 * 16.0);
            *(_DWORD *)(a2 + 8) = v5;
            *(_DWORD *)(a2 + 12) = 16;
            v7 = llround(v8 * 16.0);
            *(_DWORD *)(a2 + 16) = v6;
            *(_DWORD *)(a2 + 20) = 16;
            *(_DWORD *)(a2 + 24) = v7;
            *(_DWORD *)(a2 + 28) = 16;
LABEL_9:
            *(_QWORD *)(a2 + 120) |= 1uLL;
          }
        }
      }
    }
  }
  return result;
}

const __CFDictionary *sniffPixelAspectRatioKeyToStruct(const __CFDictionary *result, uint64_t a2)
{
  const __CFDictionary *v3;
  CFTypeID v4;
  unsigned int v5;
  double v6;
  double v7[2];

  v7[1] = *(double *)MEMORY[0x1E0C80C00];
  if (!result)
  {
    *(_QWORD *)(a2 + 32) = 0;
    *(_QWORD *)(a2 + 40) = 0;
    goto LABEL_7;
  }
  v3 = result;
  v4 = CFGetTypeID(result);
  result = (const __CFDictionary *)CFDictionaryGetTypeID();
  if ((const __CFDictionary *)v4 == result)
  {
    v6 = 0.0;
    v7[0] = 0.0;
    result = getDoubleFromDict(v3, CFSTR("HorizontalSpacing"), v7);
    if ((_DWORD)result)
    {
      result = getDoubleFromDict(v3, CFSTR("VerticalSpacing"), &v6);
      if ((_DWORD)result)
      {
        v5 = llround(v6 * 16.0);
        *(_DWORD *)(a2 + 32) = llround(v7[0] * 16.0);
        *(_DWORD *)(a2 + 36) = 16;
        *(_DWORD *)(a2 + 40) = v5;
        *(_DWORD *)(a2 + 44) = 16;
LABEL_7:
        *(_QWORD *)(a2 + 120) |= 2uLL;
      }
    }
  }
  return result;
}

CFTypeID sniffGammaLevelKeyToStruct(CFTypeID result, uint64_t a2)
{
  const __CFNumber *v3;
  CFTypeID v4;
  double v5[2];

  v5[1] = *(double *)MEMORY[0x1E0C80C00];
  if (!result)
  {
    *(_QWORD *)(a2 + 48) = 0;
    goto LABEL_6;
  }
  v3 = (const __CFNumber *)result;
  v4 = CFGetTypeID((CFTypeRef)result);
  result = CFNumberGetTypeID();
  if (v4 == result)
  {
    v5[0] = 0.0;
    result = CFNumberGetValue(v3, kCFNumberDoubleType, v5);
    if ((_DWORD)result)
    {
      *(_DWORD *)(a2 + 48) = llround(v5[0] * 268435456.0);
      *(_DWORD *)(a2 + 52) = 0x10000000;
LABEL_6:
      *(_QWORD *)(a2 + 120) |= 4uLL;
    }
  }
  return result;
}

CFTypeID sniffFieldCountKeyToStruct(CFTypeID result, uint64_t a2)
{
  const __CFNumber *v3;
  CFTypeID v4;
  char v5;
  char valuePtr;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  valuePtr = 0;
  if (!result)
  {
    v5 = 0;
    goto LABEL_6;
  }
  v3 = (const __CFNumber *)result;
  v4 = CFGetTypeID((CFTypeRef)result);
  result = CFNumberGetTypeID();
  if (v4 == result)
  {
    result = CFNumberGetValue(v3, kCFNumberSInt8Type, &valuePtr);
    if ((_DWORD)result)
    {
      v5 = valuePtr;
LABEL_6:
      *(_BYTE *)(a2 + 56) = v5;
      *(_QWORD *)(a2 + 120) |= 8uLL;
    }
  }
  return result;
}

CFTypeID sniffFieldDetailKeyToStruct(CFTypeID result, uint64_t a2)
{
  const void *v3;
  CFTypeID v4;
  char v5;
  const void *v6[2];

  v6[1] = *(const void **)MEMORY[0x1E0C80C00];
  if (!result)
  {
    v5 = 0;
    goto LABEL_6;
  }
  v3 = (const void *)result;
  v4 = CFGetTypeID((CFTypeRef)result);
  result = CFStringGetTypeID();
  if (v4 == result)
  {
    v6[0] = 0;
    result = CFDictionaryGetValueIfPresent((CFDictionaryRef)_fieldDetailKeysToStructDict, v3, v6);
    if ((_DWORD)result)
    {
      v5 = (char)v6[0];
LABEL_6:
      *(_BYTE *)(a2 + 57) = v5;
      *(_QWORD *)(a2 + 120) |= 0x10uLL;
    }
  }
  return result;
}

void sniffYCbCrMatrixKeyToStruct(const __CFString *a1, uint64_t a2)
{
  CFTypeID v4;
  CFTypeID v5;
  CFIndex Length;
  const __CFString *v7;
  const __CFString *v8;
  const void *v9[2];
  CFRange v10;

  v9[1] = *(const void **)MEMORY[0x1E0C80C00];
  if (!a1)
  {
    *(_BYTE *)(a2 + 58) = 0;
    goto LABEL_10;
  }
  v9[0] = 0;
  v4 = CFGetTypeID(a1);
  if (v4 == CFStringGetTypeID() && CFDictionaryGetValueIfPresent((CFDictionaryRef)_yCbCrMatrixKeysToStructDict, a1, v9))
  {
    *(_BYTE *)(a2 + 58) = v9[0];
LABEL_10:
    *(_QWORD *)(a2 + 120) |= 0x20uLL;
    return;
  }
  v5 = CFGetTypeID(a1);
  if (v5 == CFStringGetTypeID() && CFStringHasPrefix(a1, CFSTR("YCbCrMatrix#")))
  {
    Length = CFStringGetLength(a1);
    v10.location = CFStringGetLength(CFSTR("YCbCrMatrix#"));
    v10.length = Length - v10.location;
    v7 = CFStringCreateWithSubstring((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a1, v10);
    if (v7)
    {
      v8 = v7;
      *(_BYTE *)(a2 + 58) = CFStringGetIntValue(v7);
      *(_QWORD *)(a2 + 120) |= 0x20uLL;
      CFRelease(v8);
    }
  }
}

void sniffTransferFunctionKeyToStruct(const __CFString *a1, uint64_t a2)
{
  CFTypeID v4;
  CFIndex Length;
  const __CFString *v6;
  const __CFString *v7;
  const void *v8[2];
  CFRange v9;

  v8[1] = *(const void **)MEMORY[0x1E0C80C00];
  if (!a1)
  {
    *(_BYTE *)(a2 + 60) = 0;
    goto LABEL_9;
  }
  v8[0] = 0;
  v4 = CFGetTypeID(a1);
  if (v4 == CFStringGetTypeID()
    && CFDictionaryGetValueIfPresent((CFDictionaryRef)_transferFunctionKeysToStructDict, a1, v8))
  {
    *(_BYTE *)(a2 + 60) = v8[0];
LABEL_9:
    *(_QWORD *)(a2 + 120) |= 0x80uLL;
    return;
  }
  if (CFStringHasPrefix(a1, CFSTR("TransferFunction#")))
  {
    Length = CFStringGetLength(a1);
    v9.location = CFStringGetLength(CFSTR("TransferFunction#"));
    v9.length = Length - v9.location;
    v6 = CFStringCreateWithSubstring((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a1, v9);
    if (v6)
    {
      v7 = v6;
      *(_BYTE *)(a2 + 60) = CFStringGetIntValue(v6);
      *(_QWORD *)(a2 + 120) |= 0x80uLL;
      CFRelease(v7);
    }
  }
}

CFTypeID sniffChromaLocationTopKeyToStruct(CFTypeID result, uint64_t a2)
{
  const void *v3;
  CFTypeID v4;
  char v5;
  const void *v6[2];

  v6[1] = *(const void **)MEMORY[0x1E0C80C00];
  if (!result)
  {
    v5 = 0;
    goto LABEL_6;
  }
  v3 = (const void *)result;
  v4 = CFGetTypeID((CFTypeRef)result);
  result = CFStringGetTypeID();
  if (v4 == result)
  {
    v6[0] = 0;
    result = CFDictionaryGetValueIfPresent((CFDictionaryRef)_chromaLocationKeysToStructDict, v3, v6);
    if ((_DWORD)result)
    {
      v5 = (char)v6[0];
LABEL_6:
      *(_BYTE *)(a2 + 61) = v5;
      *(_QWORD *)(a2 + 120) |= 0x100uLL;
    }
  }
  return result;
}

CFTypeID sniffChromaLocationBottomKeyToStruct(CFTypeID result, uint64_t a2)
{
  const void *v3;
  CFTypeID v4;
  char v5;
  const void *v6[2];

  v6[1] = *(const void **)MEMORY[0x1E0C80C00];
  if (!result)
  {
    v5 = 0;
    goto LABEL_6;
  }
  v3 = (const void *)result;
  v4 = CFGetTypeID((CFTypeRef)result);
  result = CFStringGetTypeID();
  if (v4 == result)
  {
    v6[0] = 0;
    result = CFDictionaryGetValueIfPresent((CFDictionaryRef)_chromaLocationKeysToStructDict, v3, v6);
    if ((_DWORD)result)
    {
      v5 = (char)v6[0];
LABEL_6:
      *(_BYTE *)(a2 + 62) = v5;
      *(_QWORD *)(a2 + 120) |= 0x200uLL;
    }
  }
  return result;
}

CFTypeID sniffChromaSubsamplingKeyToStruct(CFTypeID result, uint64_t a2)
{
  const void *v3;
  CFTypeID v4;
  char v5;
  const void *v6[2];

  v6[1] = *(const void **)MEMORY[0x1E0C80C00];
  if (!result)
  {
    v5 = 0;
    goto LABEL_6;
  }
  v3 = (const void *)result;
  v4 = CFGetTypeID((CFTypeRef)result);
  result = CFStringGetTypeID();
  if (v4 == result)
  {
    v6[0] = 0;
    result = CFDictionaryGetValueIfPresent((CFDictionaryRef)_chromaSubsamplingKeysToStructDict, v3, v6);
    if ((_DWORD)result)
    {
      v5 = (char)v6[0];
LABEL_6:
      *(_BYTE *)(a2 + 63) = v5;
      *(_QWORD *)(a2 + 120) |= 0x400uLL;
    }
  }
  return result;
}

CFTypeID sniffEDRFactorKeyToStruct(CFTypeID result, uint64_t a2)
{
  const __CFNumber *v3;
  CFTypeID v4;
  double v5[2];

  v5[1] = *(double *)MEMORY[0x1E0C80C00];
  if (!result)
  {
    *(_DWORD *)(a2 + 92) = 0;
    *(_DWORD *)(a2 + 96) = 0;
    goto LABEL_6;
  }
  v3 = (const __CFNumber *)result;
  v4 = CFGetTypeID((CFTypeRef)result);
  result = CFNumberGetTypeID();
  if (v4 == result)
  {
    v5[0] = 0.0;
    result = CFNumberGetValue(v3, kCFNumberDoubleType, v5);
    if ((_DWORD)result)
    {
      *(_DWORD *)(a2 + 92) = llround(v5[0] * 1048576.0);
      *(_DWORD *)(a2 + 96) = 0x100000;
LABEL_6:
      *(_QWORD *)(a2 + 120) |= 0x2000uLL;
    }
  }
  return result;
}

uint64_t sniffMasteringDisplayColorVolumeKeyToStruct(const void *a1, uint64_t a2)
{
  const void *v3;
  CFTypeID TypeID;
  __int16 v5;
  __int16 v6;
  __int16 v7;
  __int16 v8;
  __int16 v9;
  __int16 v10;
  __int16 v11;
  int v12;
  __int16 v13;
  __int16 v14;
  __int16 v15;
  __int16 v16;
  __int16 v17;
  __int16 v18;
  int v19;
  int v20;
  int v21;
  int v22;
  uint64_t result;
  int v24;
  unsigned int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  CFRange v30;

  v3 = a1;
  v29 = *MEMORY[0x1E0C80C00];
  v26 = 0;
  v27 = 0;
  v28 = 0;
  if (!a1)
  {
    v22 = 0;
    v21 = 0;
    v20 = 0;
    v19 = 0;
    v18 = 0;
    v17 = 0;
    v16 = 0;
    v15 = 0;
    v14 = 0;
    v13 = 0;
    v12 = 0;
    v11 = 0;
    v10 = 0;
    v9 = 0;
    v8 = 0;
    v7 = 0;
    v6 = 0;
    goto LABEL_7;
  }
  TypeID = CFDataGetTypeID();
  if (TypeID != CFGetTypeID(v3) || CFDataGetLength((CFDataRef)v3) != 24)
  {
    v22 = 0;
    v21 = 0;
    v20 = 0;
    v19 = 0;
    v18 = 0;
    v17 = 0;
    v16 = 0;
    v15 = 0;
    v14 = 0;
    v13 = 0;
    LODWORD(a1) = 0;
    v12 = 0;
    v11 = 0;
    v10 = 0;
    v9 = 0;
    v8 = 0;
    v7 = 0;
    v6 = 0;
    LOWORD(v3) = 0;
LABEL_7:
    v5 = 0;
    goto LABEL_8;
  }
  v30.location = 0;
  v30.length = 24;
  CFDataGetBytes((CFDataRef)v3, v30, (UInt8 *)&v26);
  v5 = v26;
  LOWORD(v3) = BYTE1(v26);
  v6 = BYTE2(v26);
  v7 = BYTE3(v26);
  v8 = BYTE4(v26);
  v9 = BYTE5(v26);
  v10 = BYTE6(v26);
  v11 = HIBYTE(v26);
  v12 = v27;
  LODWORD(a1) = BYTE1(v27);
  v13 = BYTE2(v27);
  v14 = BYTE3(v27);
  v15 = BYTE4(v27);
  v16 = BYTE5(v27);
  v17 = BYTE6(v27);
  v18 = HIBYTE(v27);
  v19 = v28 << 24;
  v20 = BYTE1(v28) << 16;
  v21 = BYTE2(v28) << 8;
  v22 = BYTE3(v28);
LABEL_8:
  *(_WORD *)(a2 + 64) = (unsigned __int16)v3 | (v5 << 8);
  *(_WORD *)(a2 + 66) = v7 | (v6 << 8);
  *(_WORD *)(a2 + 68) = v9 | (v8 << 8);
  *(_WORD *)(a2 + 70) = v11 | (v10 << 8);
  result = a1 | (v12 << 8);
  *(_WORD *)(a2 + 72) = result;
  *(_WORD *)(a2 + 74) = v14 | (v13 << 8);
  *(_WORD *)(a2 + 76) = v16 | (v15 << 8);
  *(_WORD *)(a2 + 78) = v18 | (v17 << 8);
  v24 = v20 | v19 | v21 | v22;
  v25 = bswap32(HIDWORD(v28));
  *(_DWORD *)(a2 + 80) = v24;
  *(_DWORD *)(a2 + 84) = v25;
  *(_QWORD *)(a2 + 120) |= 0x800uLL;
  return result;
}

void sniffContentLightLevelInfoKeyToStruct(const __CFData *a1, uint64_t a2)
{
  CFTypeID TypeID;
  __int16 v5;
  __int16 v6;
  __int16 v7;
  __int16 v8;
  UInt8 buffer[4];
  uint64_t v10;
  CFRange v11;

  v10 = *MEMORY[0x1E0C80C00];
  *(_DWORD *)buffer = 0;
  if (a1 && (TypeID = CFDataGetTypeID(), TypeID == CFGetTypeID(a1)) && CFDataGetLength(a1) == 4)
  {
    v11.location = 0;
    v11.length = 4;
    CFDataGetBytes(a1, v11, buffer);
    v5 = buffer[0];
    v6 = buffer[1];
    v7 = buffer[2];
    v8 = buffer[3];
  }
  else
  {
    v8 = 0;
    v7 = 0;
    v6 = 0;
    v5 = 0;
  }
  *(_WORD *)(a2 + 88) = v6 | (v5 << 8);
  *(_WORD *)(a2 + 90) = v8 | (v7 << 8);
  *(_QWORD *)(a2 + 120) |= 0x1000uLL;
}

CFTypeID sniffAlphaChannelModeKeyToStruct(CFTypeID result, uint64_t a2)
{
  const void *v3;
  CFTypeID v4;
  char v5;
  const void *v6[2];

  v6[1] = *(const void **)MEMORY[0x1E0C80C00];
  if (!result)
  {
    v5 = 0;
    goto LABEL_6;
  }
  v3 = (const void *)result;
  v4 = CFGetTypeID((CFTypeRef)result);
  result = CFStringGetTypeID();
  if (v4 == result)
  {
    v6[0] = 0;
    result = CFDictionaryGetValueIfPresent((CFDictionaryRef)_premultipliedAlphaKeysToStructDict, v3, v6);
    if ((_DWORD)result)
    {
      v5 = (char)v6[0];
LABEL_6:
      *(_BYTE *)(a2 + 100) = v5;
      *(_QWORD *)(a2 + 120) |= 0x4000uLL;
    }
  }
  return result;
}

CFTypeID sniffSceneIlluminationKeyToStruct(CFTypeID result, uint64_t a2)
{
  const __CFNumber *v3;
  CFTypeID v4;
  int v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v6[0] = 0;
  if (!result)
  {
    v5 = 0;
LABEL_9:
    *(_DWORD *)(a2 + 112) = v5;
    *(_QWORD *)(a2 + 120) |= 0x10000uLL;
    return result;
  }
  v3 = (const __CFNumber *)result;
  v4 = CFGetTypeID((CFTypeRef)result);
  result = CFNumberGetTypeID();
  if (v4 == result)
  {
    result = CFNumberGetValue(v3, kCFNumberSInt64Type, v6);
    if ((_DWORD)result)
    {
      v5 = v6[0];
      if (!HIDWORD(v6[0]))
      {
        if (v6[0] <= 1uLL)
          v5 = 1;
        goto LABEL_9;
      }
    }
  }
  return result;
}

const __CFNumber *getDoubleFromDict(const __CFDictionary *a1, const void *a2, void *a3)
{
  const __CFNumber *result;
  const __CFNumber *v5;
  CFTypeID v6;

  result = (const __CFNumber *)CFDictionaryGetValue(a1, a2);
  if (result)
  {
    v5 = result;
    v6 = CFGetTypeID(result);
    if (v6 == CFNumberGetTypeID())
      return (const __CFNumber *)(CFNumberGetValue(v5, kCFNumberDoubleType, a3) != 0);
    else
      return 0;
  }
  return result;
}

void _dispatchUnrecognizedCodePointString(uint64_t *a1)
{
  uint64_t v2;
  const void *v3;
  const __CFDictionary *v4;
  const void *Value;

  v2 = *a1;
  v3 = (const void *)*((int *)a1 + 2);
  v4 = (const __CFDictionary *)a1[2];
  Value = CFDictionaryGetValue(v4, v3);
  if (!Value)
  {
    Value = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, CFSTR("%@%d"), v2, v3);
    if (Value)
    {
      CFDictionarySetValue(v4, v3, Value);
      CFRelease(Value);
    }
  }
  a1[3] = (uint64_t)Value;
}

uint64_t IOSurfaceWiringAssertionGetTypeID()
{
  return objc_opt_self();
}

uint64_t IOSurfaceCreateMachPortWithOptions(uint64_t a1, uint64_t a2)
{
  if (!a1 || (a2 & 1) != 0)
    return 0;
  else
    return IOSurfaceClientCreateMachPortWithOptions(*(_QWORD *)(a1 + 8), a2);
}

uint64_t IOSurfaceGetTileFormat(uint64_t result)
{
  if (result)
    return IOSurfaceClientGetTileFormat(*(_QWORD *)(result + 8));
  return result;
}

uint32_t IOSurfaceGetSeed(IOSurfaceRef buffer)
{
  if (buffer)
    LODWORD(buffer) = IOSurfaceClientGetSeed(*((_QWORD *)buffer + 1));
  return buffer;
}

uint64_t IOSurfaceLockPlane(uint64_t a1, uint64_t a2, unsigned int a3, _DWORD *a4)
{
  if (a1)
    return IOSurfaceClientLock(*(_QWORD *)(a1 + 8), a3, a4);
  else
    return 3758097090;
}

uint64_t IOSurfaceUnlockPlane(uint64_t a1, uint64_t a2, unsigned int a3, _DWORD *a4)
{
  if (a1)
    return IOSurfaceClientUnlock(*(_QWORD *)(a1 + 8), a3, a4);
  else
    return 3758097090;
}

size_t IOSurfaceGetElementHeightOfPlane(size_t buffer, size_t planeIndex)
{
  if (buffer)
    return IOSurfaceClientGetElementHeightOfPlane(*(_QWORD *)(buffer + 8), planeIndex);
  return buffer;
}

uint64_t IOSurfaceGetSeedOfPlane(uint64_t result)
{
  if (result)
    return IOSurfaceClientGetSeed(*(_QWORD *)(result + 8));
  return result;
}

uint64_t IOSurfaceFlushProcessorCaches(uint64_t result)
{
  if (result)
    return IOSurfaceClientFlushProcessorCaches(*(_QWORD *)(result + 8));
  return result;
}

uint64_t IOSurfaceBindAccelOnPlane(uint64_t a1, unsigned int a2, unsigned int a3)
{
  if (a1)
    return IOSurfaceClientBindAccel(*(_QWORD *)(a1 + 8), a2, a3);
  else
    return 3758097090;
}

BOOL IOSurfaceNeedsBindAccel(_BOOL8 result, int a2, int a3)
{
  if (result)
    return IOSurfaceClientNeedsBindAccel(*(_QWORD *)(result + 8), a2, a3);
  return result;
}

BOOL IOSurfaceNeedsBindAccelOnPlane(_BOOL8 result, int a2, int a3)
{
  if (result)
    return IOSurfaceClientNeedsBindAccel(*(_QWORD *)(result + 8), a2, a3);
  return result;
}

uint64_t IOSurfaceCopyDataValueBytes(uint64_t result, const __CFString *a2, _BYTE *a3, size_t *a4)
{
  if (result)
    return IOSurfaceClientCopyDataValueBytes(*(_QWORD *)(result + 8), a2, a3, a4);
  return result;
}

const __CFArray *IOSurfaceSetCoreVideoBridgedKeys(const __CFArray *result)
{
  const __CFArray *v1;
  CFTypeID v2;

  if (result)
  {
    v1 = result;
    v2 = CFGetTypeID(result);
    result = (const __CFArray *)CFArrayGetTypeID();
    if ((const __CFArray *)v2 == result)
      return (const __CFArray *)IOSurfaceClientSetCoreVideoBridgedKeys(v1);
  }
  return result;
}

uint64_t IOSurfaceRemoveCoreVideoBridgedValues(uint64_t result)
{
  if (result)
    return IOSurfaceClientRemoveCoreVideoBridgedValues(*(_QWORD *)(result + 8));
  return result;
}

int32_t IOSurfaceGetUseCount(IOSurfaceRef buffer)
{
  if (buffer)
    LODWORD(buffer) = IOSurfaceClientGetUseCount(*((_QWORD *)buffer + 1));
  return (int)buffer;
}

uint64_t IOSurfaceGetNumberOfUseCountCategories()
{
  return 2;
}

uint64_t IOSurfaceIncrementUseCountForCategory(uint64_t result, unsigned int a2)
{
  if (result)
    return IOSurfaceClientIncrementUseCountForCategory(*(_QWORD *)(result + 8), a2);
  return result;
}

uint64_t IOSurfaceDecrementUseCountForCategory(uint64_t result, unsigned int a2)
{
  if (result)
    return IOSurfaceClientDecrementUseCountForCategory(*(_QWORD *)(result + 8), a2);
  return result;
}

BOOL IOSurfaceIsInUseForCategory(_BOOL8 result, unsigned int a2)
{
  if (result)
    return IOSurfaceClientIsInUseForCategory(*(_QWORD *)(result + 8), a2);
  return result;
}

BOOL IOSurfaceIsInUseForAnyOtherCategory(_BOOL8 result, unsigned int a2)
{
  if (result)
    return IOSurfaceClientIsInUseForAnyOtherCategory(*(_QWORD *)(result + 8), a2);
  return result;
}

IOSurface *IOSurfaceWrapClientImage(int a1, int a2, int a3, int a4, int a5, uint64_t a6)
{
  IOSurface *result;
  IOSurface *v7;

  result = (IOSurface *)IOSurfaceClientWrapClientImage(a1, a2, a3, a4, a5, a6);
  if (result)
  {
    v7 = result;
    result = -[IOSurface initWithClientBuffer:]([IOSurface alloc], "initWithClientBuffer:", result);
    if (!result)
    {
      IOSurfaceClientRelease(v7);
      return 0;
    }
  }
  return result;
}

IOSurface *IOSurfaceWrapClientMemory(uint64_t a1, uint64_t a2)
{
  IOSurface *result;
  IOSurface *v3;

  result = (IOSurface *)IOSurfaceClientWrapClientMemory(a1, a2);
  if (result)
  {
    v3 = result;
    result = -[IOSurface initWithClientBuffer:]([IOSurface alloc], "initWithClientBuffer:", result);
    if (!result)
    {
      IOSurfaceClientRelease(v3);
      return 0;
    }
  }
  return result;
}

uint64_t IOSurfaceSetTiled(uint64_t a1, unsigned int a2)
{
  if (a1)
    return IOSurfaceClientSetTiled(*(_QWORD *)(a1 + 8), a2);
  else
    return 3758097090;
}

uint64_t IOSurfaceGetBitsPerBlock(uint64_t result)
{
  if (result)
    return 8 * IOSurfaceClientGetBytesPerElement(*(_QWORD *)(result + 8));
  return result;
}

uint64_t IOSurfaceGetBitsPerBlockOfPlane(uint64_t result, unsigned int a2)
{
  if (result)
    return 8 * IOSurfaceClientGetBytesPerElementOfPlane(*(_QWORD *)(result + 8), a2);
  return result;
}

uint64_t IOSurfaceGetBlockWidthOfPlane(uint64_t result, unsigned int a2)
{
  if (result)
    return IOSurfaceClientGetElementWidthOfPlane(*(_QWORD *)(result + 8), a2);
  return result;
}

uint64_t IOSurfaceGetBlockHeightOfPlane(uint64_t result, unsigned int a2)
{
  if (result)
    return IOSurfaceClientGetElementHeightOfPlane(*(_QWORD *)(result + 8), a2);
  return result;
}

uint64_t IOSurfaceSetTimestamp(uint64_t result, void *a2, void *a3, uint64_t a4)
{
  if (result)
    return IOSurfaceClientSetTimestamp(*(_QWORD *)(result + 8), a2, a3, a4);
  return result;
}

uint64_t IOSurfaceSetBulkAttachments(uint64_t a1, uint64_t a2, unint64_t a3, int a4)
{
  if (a1)
    return IOSurfaceClientSetBulkAttachments(*(_QWORD *)(a1 + 8), a2, a3, a4);
  else
    return 3758097090;
}

uint64_t IOSurfacePrefetchPages(uint64_t a1)
{
  if (a1)
    return IOSurfaceClientPrefetchPages(*(_QWORD *)(a1 + 8));
  else
    return 3758097090;
}

BOOL IOSurfaceSupportsProtectionOptions(_BOOL8 result, uint64_t a2)
{
  if (result)
    return IOSurfaceClientSupportsProtectionOptions(*(_QWORD *)(result + 8), a2);
  return result;
}

BOOL IOSurfaceIsDisplayable(_BOOL8 result)
{
  if (result)
    return IOSurfaceClientIsDisplayable(*(_QWORD *)(result + 8));
  return result;
}

BOOL IOSurfaceIsSysMemOnly(_BOOL8 result)
{
  if (result)
    return IOSurfaceClientIsSysMemOnly(*(_QWORD *)(result + 8));
  return result;
}

size_t IOSurfaceGetNumberOfComponentsOfPlane(size_t buffer, size_t planeIndex)
{
  if (buffer)
    return IOSurfaceClientGetNumberOfComponentsOfPlane(*(_QWORD *)(buffer + 8), planeIndex);
  return buffer;
}

IOSurfaceComponentName IOSurfaceGetNameOfComponentOfPlane(IOSurfaceRef buffer, size_t planeIndex, size_t componentIndex)
{
  if (buffer)
    LODWORD(buffer) = IOSurfaceClientGetNameOfComponentOfPlane(*((_QWORD *)buffer + 1), planeIndex, componentIndex);
  return (int)buffer;
}

IOSurfaceComponentType IOSurfaceGetTypeOfComponentOfPlane(IOSurfaceRef buffer, size_t planeIndex, size_t componentIndex)
{
  if (buffer)
    LODWORD(buffer) = IOSurfaceClientGetTypeOfComponentOfPlane(*((_QWORD *)buffer + 1), planeIndex, componentIndex);
  return (int)buffer;
}

IOSurfaceComponentRange IOSurfaceGetRangeOfComponentOfPlane(IOSurfaceRef buffer, size_t planeIndex, size_t componentIndex)
{
  if (buffer)
    LODWORD(buffer) = IOSurfaceClientGetRangeOfComponentOfPlane(*((_QWORD *)buffer + 1), planeIndex, componentIndex);
  return (int)buffer;
}

size_t IOSurfaceGetBitDepthOfComponentOfPlane(size_t buffer, size_t planeIndex, size_t componentIndex)
{
  if (buffer)
    return IOSurfaceClientGetBitDepthOfComponentOfPlane(*(_QWORD *)(buffer + 8), planeIndex, componentIndex);
  return buffer;
}

size_t IOSurfaceGetBitOffsetOfComponentOfPlane(size_t buffer, size_t planeIndex, size_t componentIndex)
{
  if (buffer)
    return IOSurfaceClientGetBitOffsetOfComponentOfPlane(*(_QWORD *)(buffer + 8), planeIndex, componentIndex);
  return buffer;
}

IOSurfaceSubsampling IOSurfaceGetSubsampling(IOSurfaceRef buffer)
{
  if (buffer)
    LODWORD(buffer) = IOSurfaceClientGetSubsampling(*((_QWORD *)buffer + 1));
  return (int)buffer;
}

uint64_t IOSurfaceGetBytesPerCompressedTileHeaderOfPlane(uint64_t result, unsigned int a2)
{
  if (result)
    return IOSurfaceClientGetBytesPerCompressedTileHeaderOfPlane(*(_QWORD *)(result + 8), a2);
  return result;
}

uint64_t IOSurfaceGetHorizontalPixelOffsetWithinCompressedTileArrayOfPlane(uint64_t result, unsigned int a2)
{
  if (result)
    return IOSurfaceClientGetHorizontalPixelOffsetWithinCompressedTileArrayOfPlane(*(_QWORD *)(result + 8), a2);
  return result;
}

uint64_t IOSurfaceGetVerticalPixelOffsetWithinCompressedTileArrayOfPlane(uint64_t result, unsigned int a2)
{
  if (result)
    return IOSurfaceClientGetVerticalPixelOffsetWithinCompressedTileArrayOfPlane(*(_QWORD *)(result + 8), a2);
  return result;
}

uint64_t IOSurfaceGetBytesPerRowOfTileDataOfPlane(uint64_t result, unsigned int a2)
{
  if (result)
    return IOSurfaceClientGetBytesPerRowOfTileDataOfPlane(*(_QWORD *)(result + 8), a2);
  return result;
}

uint64_t IOSurfaceGetHTPCPredictionSelectorOfPlane(uint64_t result, unsigned int a2)
{
  if (result)
    return IOSurfaceClientGetHTPCPredictionSelectorOfPlane(*(_QWORD *)(result + 8), a2);
  return result;
}

uint64_t IOSurfaceGetHTPCVerticalHeaderGroupingModeOfPlane(uint64_t result, unsigned int a2)
{
  if (result)
    return IOSurfaceClientGetHTPCVerticalHeaderGroupingModeOfPlane(*(_QWORD *)(result + 8), a2);
  return result;
}

uint64_t IOSurfaceGetCompressedTileDataRegionMemoryUsedOfPlane(uint64_t result, unsigned int a2)
{
  _QWORD v2[2];

  v2[1] = *MEMORY[0x1E0C80C00];
  v2[0] = 0;
  if (result)
  {
    IOSurfaceClientGetCompressedTileDataRegionMemoryUsedOfPlane(*(_QWORD *)(result + 8), a2, v2);
    return v2[0];
  }
  return result;
}

uint64_t IOSurfaceGetBaseAddressOfCompressedTileHeaderRegionOfSliceAndPlane(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (result)
    return IOSurfaceClientGetBaseAddressOfCompressedTileHeaderRegionOfSliceAndPlane(*(_QWORD *)(result + 8), a2, a3);
  return result;
}

uint64_t IOSurfaceGetBaseAddressOfCompressedTileDataRegionOfSliceAndPlane(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (result)
    return IOSurfaceClientGetBaseAddressOfCompressedTileDataRegionOfSliceAndPlane(*(_QWORD *)(result + 8), a2, a3);
  return result;
}

uint64_t IOSurfaceGetExtendedPixelsOfPlane(uint64_t result, unsigned int a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v12 = 0;
  v13[0] = 0;
  v10 = 0;
  v11 = 0;
  if (result)
    result = IOSurfaceClientGetExtendedPixelsOfPlane(*(_QWORD *)(result + 8), a2, v13, &v12, &v11, &v10);
  if (a3)
    *a3 = v13[0];
  if (a4)
    *a4 = v12;
  if (a5)
    *a5 = v11;
  if (a6)
    *a6 = v10;
  return result;
}

uint64_t IOSurfaceSetIndexedTimestamp(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (result)
    return IOSurfaceClientSetIndexedTimestamp(*(_QWORD *)(result + 8), a2, a3);
  return result;
}

uint64_t IOSurfaceGetRegistryID(uint64_t result)
{
  if (result)
    return IOSurfaceClientGetRegistryID(*(_QWORD *)(result + 8));
  return result;
}

uint64_t IOSurfaceGetTraceID(uint64_t result)
{
  if (result)
    return IOSurfaceClientGetTraceID(*(_QWORD *)(result + 8));
  return result;
}

uint64_t IOSurfaceSetDataProperty(uint64_t a1, unsigned int a2, size_t a3, const void *a4)
{
  if (a1)
    return IOSurfaceClientSetDataProperty(*(_QWORD *)(a1 + 8), a2, a3, a4);
  else
    return 3758097090;
}

BOOL IOSurfaceIsMetalSharedTexture(_BOOL8 result)
{
  if (result)
    return IOSurfaceClientIsMetalSharedTexture(*(_QWORD *)(result + 8));
  return result;
}

uint64_t IOSurfaceGetWiringAssertionCount(uint64_t result)
{
  if (result)
    return IOSurfaceClientGetWiringAssertionCount(*(_QWORD *)(result + 8));
  return result;
}

void sub_1A4CEA008(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A4CEA2D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A4CEAC2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t _IOSurfaceRemoteMethodInitialize(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  char *v4;
  int v5;
  NSObject *v6;
  xpc_object_t v7;

  v3 = a3;
  _ioSurfaceConnect();
  v4 = (char *)malloc_type_calloc(1uLL, 0x28uLL, 0x10000400A747E1EuLL);
  *(_DWORD *)v4 = 1;
  *(_QWORD *)(v4 + 4) = ioSurfaceLimits;
  v5 = qword_1ECDA8148;
  *(int32x2_t *)(v4 + 12) = vmovn_s64(*(int64x2_t *)&qword_1ECDA8138);
  *((_DWORD *)v4 + 5) = v5;
  *((_DWORD *)v4 + 6) = 1;
  *((_QWORD *)v4 + 4) = 1;
  v6 = dispatch_data_create(v4, 0x28uLL, 0, (dispatch_block_t)*MEMORY[0x1E0C80CE0]);
  v7 = xpc_data_create_with_dispatch_data(v6);
  xpc_dictionary_set_value(v3, "Limits", v7);
  xpc_dictionary_set_uint64(v3, "ProtocolVersion", 1uLL);

  return 0;
}

uint64_t _IOSurfaceRemoteMethodGetDebugInfo(void *a1, uint64_t a2, void *a3)
{
  id v4;
  xpc_object_t v5;
  xpc_object_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  xpc_object_t v15;
  xpc_object_t v16;
  xpc_object_t xdict;
  _BYTE v19[128];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a1;
  xdict = a3;
  v5 = xpc_array_create(0, 0);
  v6 = xpc_array_create(0, 0);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(v4, "surfaceStates");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v21;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v11);
        objc_msgSend(v4, "surfaceStates");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        v15 = xpc_uint64_create(objc_msgSend(v12, "unsignedIntegerValue"));
        xpc_array_append_value(v5, v15);

        v16 = xpc_uint64_create(objc_msgSend(v14, "debugRefCount"));
        xpc_array_append_value(v6, v16);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v19, 16);
    }
    while (v9);
  }

  xpc_dictionary_set_value(xdict, "DebugSurfaceIDList", v5);
  xpc_dictionary_set_value(xdict, "DebugSurfaceRefCount", v6);

  return 0;
}

uint64_t _IOSurfaceRemoteMethodClientCreate(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  unsigned int uint64;
  unsigned int *v9;
  unsigned int v10;
  mach_port_name_t v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  void *UnadjustedBaseAddress;
  size_t AllocSize;
  xpc_object_t v17;
  int ID;
  CFTypeRef v20;
  void *v21;
  size_t v22;
  __CFDictionary *MutableCopy;
  void *Value;
  unint64_t v25;
  uint64_t v26;
  void *v27[2];

  v27[1] = *(void **)MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  v7 = a3;
  v27[0] = 0;
  uint64 = xpc_dictionary_get_uint64(v6, "LookupID");
  if (uint64)
  {
    v9 = IOSurfaceClientLookup(uint64);
  }
  else
  {
    v10 = xpc_dictionary_copy_mach_send();
    if (v10 - 1 > 0xFFFFFFFD)
    {
      v13 = 3758097090;
      v20 = _ioSurfaceDeserializedFromXPCDictionaryWithKey(v6, "PropertiesDictionary");
      if (!v20)
        goto LABEL_8;
      v21 = (void *)v20;
      xpc_dictionary_get_value(v6, "ClientProvidedShmem");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
          _IOSurfaceRemoteMethodClientCreate_cold_3(v5);
        v22 = xpc_shmem_map(v14, v27);
        if (!v22)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
            _IOSurfaceRemoteMethodClientCreate_cold_1(v5);
          CFRelease(v21);
          v13 = 3758097085;
          goto LABEL_7;
        }
        v12 = v22;
        MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, (CFDictionaryRef)v21);
        CFDictionarySetValue(MutableCopy, CFSTR("IOSurfaceAddress"), (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", v27[0]));
        CFRelease(v21);
        Value = (void *)CFDictionaryGetValue(MutableCopy, CFSTR("IOSurfaceAllocSize"));
        if (Value)
        {
          v25 = objc_msgSend(Value, "unsignedIntegerValue");
          if (v25 > v12)
          {
            v26 = v25;
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
              _IOSurfaceRemoteMethodClientCreate_cold_2(v12, v26);
          }
        }
      }
      else if (CFDictionaryGetValueIfPresent((CFDictionaryRef)v21, CFSTR("IOSurfaceAddress"), 0))
      {
        MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, (CFDictionaryRef)v21);
        CFDictionaryRemoveValue(MutableCopy, CFSTR("IOSurfaceAddress"));
        CFRelease(v21);
        v12 = 0;
      }
      else
      {
        v12 = 0;
        MutableCopy = (__CFDictionary *)v21;
      }
      v9 = IOSurfaceClientCreate(MutableCopy);
      CFRelease(MutableCopy);

      if (!v9)
        goto LABEL_8;
LABEL_6:
      xpc_dictionary_get_value(v6, "ExtraData");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_addSurface:mappedAddress:mappedSize:extraData:", v9, v27[0], v12, v14);
      UnadjustedBaseAddress = (void *)_IOSurfaceClientGetUnadjustedBaseAddress((uint64_t)v9);
      AllocSize = IOSurfaceClientGetAllocSize((uint64_t)v9);
      v17 = xpc_shmem_create(UnadjustedBaseAddress, AllocSize);
      xpc_dictionary_set_value(v7, "MemoryObject", v17);
      ID = IOSurfaceClientGetID((uint64_t)v9);
      _ioSurfaceAddClientState((uint64_t)v9, ID, v7);

      v13 = 0;
LABEL_7:

      goto LABEL_8;
    }
    v11 = v10;
    v9 = IOSurfaceClientLookupFromMachPort(v10);
    mach_port_deallocate(*MEMORY[0x1E0C83DA0], v11);
  }
  v12 = 0;
  v13 = 3758097136;
  if (v9)
    goto LABEL_6;
LABEL_8:

  return v13;
}

uint64_t _IOSurfaceRemoteMethodClientLock(int a1, uint64_t a2, xpc_object_t xdict)
{
  unsigned int uint64;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  uint64 = xpc_dictionary_get_uint64(xdict, "Options");
  v6 = 0;
  return IOSurfaceClientLock(a2, uint64, &v6);
}

uint64_t _IOSurfaceRemoteMethodClientUnlock(int a1, uint64_t a2, xpc_object_t xdict)
{
  unsigned int uint64;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  uint64 = xpc_dictionary_get_uint64(xdict, "Options");
  v6 = 0;
  return IOSurfaceClientUnlock(a2, uint64, &v6);
}

uint64_t _IOSurfaceRemoteMethodClientGetPlaneState(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v6;
  id v7;
  unsigned int uint64;
  _WORD *v9;
  _WORD *v10;
  int v11;
  int v12;
  int v13;
  unsigned __int8 NumberOfComponentsOfPlane;
  uint64_t v15;
  unint64_t v16;
  _BYTE *v17;
  NSObject *v18;
  xpc_object_t v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v6 = 3758097085;
  v7 = a4;
  uint64 = xpc_dictionary_get_uint64(a3, "PlaneIndex");
  if (IOSurfaceClientGetPlaneCount(a2) >= uint64)
  {
    v9 = malloc_type_calloc(1uLL, 0x48uLL, 0x1000040773C5DECuLL);
    if (v9)
    {
      v10 = v9;
      *v9 = 0;
      v9[1] = uint64;
      *((_DWORD *)v9 + 1) = IOSurfaceClientGetWidthOfPlane(a2, uint64);
      *((_DWORD *)v10 + 2) = IOSurfaceClientGetHeightOfPlane(a2, uint64);
      *((_DWORD *)v10 + 3) = IOSurfaceClientGetOffsetOfPlane(a2, uint64);
      *((_DWORD *)v10 + 4) = IOSurfaceClientGetBytesPerRowOfPlane(a2, uint64);
      *((_DWORD *)v10 + 5) = IOSurfaceClientGetSizeOfPlane(a2, uint64);
      v10[20] = IOSurfaceClientGetBytesPerElementOfPlane(a2, uint64);
      *((_BYTE *)v10 + 42) = IOSurfaceClientGetElementWidthOfPlane(a2, uint64);
      *((_BYTE *)v10 + 43) = IOSurfaceClientGetElementHeightOfPlane(a2, uint64);
      v23 = 0;
      v24[0] = 0;
      v21 = 0;
      v22 = 0;
      IOSurfaceClientGetExtendedPixelsOfPlane(a2, uint64, v24, &v23, &v22, &v21);
      v11 = v23;
      v12 = v22;
      *((_DWORD *)v10 + 8) = v24[0];
      *((_DWORD *)v10 + 9) = v12;
      v13 = v21;
      *((_DWORD *)v10 + 6) = v11;
      *((_DWORD *)v10 + 7) = v13;
      NumberOfComponentsOfPlane = IOSurfaceClientGetNumberOfComponentsOfPlane(a2, uint64);
      *((_BYTE *)v10 + 44) = NumberOfComponentsOfPlane;
      v15 = NumberOfComponentsOfPlane;
      if (NumberOfComponentsOfPlane)
      {
        v16 = 0;
        do
        {
          v17 = (char *)v10 + v16;
          *((_BYTE *)v10 + v16 + 45) = IOSurfaceClientGetBitDepthOfComponentOfPlane(a2, uint64, v16);
          v17[49] = IOSurfaceClientGetBitOffsetOfComponentOfPlane(a2, uint64, v16);
          v17[53] = IOSurfaceClientGetNameOfComponentOfPlane(a2, uint64, v16);
          v17[57] = IOSurfaceClientGetTypeOfComponentOfPlane(a2, uint64, v16);
          v17[61] = IOSurfaceClientGetRangeOfComponentOfPlane(a2, uint64, v16++);
        }
        while (v15 != v16);
      }
      v18 = dispatch_data_create(v10, 0x48uLL, 0, (dispatch_block_t)*MEMORY[0x1E0C80CE0]);
      v19 = xpc_data_create_with_dispatch_data(v18);
      xpc_dictionary_set_value(v7, "PlaneState", v19);

      v6 = 0;
    }
  }
  else
  {
    v6 = 3758097090;
  }

  return v6;
}

uint64_t _IOSurfaceRemoteMethodClientBindAccel(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  unsigned int uint64;
  unsigned int v6;

  v4 = a3;
  uint64 = xpc_dictionary_get_uint64(v4, "AcceleratorID");
  v6 = xpc_dictionary_get_uint64(v4, "AcceleratorField");

  return IOSurfaceClientBindAccel(a2, uint64, v6);
}

uint64_t _IOSurfaceRemoteMethodClientNeedsBindAccel(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  int uint64;
  int v9;
  BOOL v10;

  v6 = a4;
  v7 = a3;
  uint64 = xpc_dictionary_get_uint64(v7, "AcceleratorID");
  v9 = xpc_dictionary_get_uint64(v7, "AcceleratorField");

  v10 = IOSurfaceClientNeedsBindAccel(a2, uint64, v9);
  xpc_dictionary_set_BOOL(v6, "NeedsBindAccelerator", v10);

  return 0;
}

uint64_t _IOSurfaceRemoteMethodClientSetValue(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  const __CFDictionary *v5;
  const __CFDictionary *v6;
  const __CFDictionary *Value;
  void *v8;
  const __CFDictionary *v9;

  v4 = 3758097090;
  v5 = (const __CFDictionary *)_ioSurfaceDeserializedFromXPCDictionaryWithKey(a3, "PropertiesDictionary");
  if (v5)
  {
    v6 = v5;
    if (CFDictionaryGetValue(v5, CFSTR("isSetValues")))
    {
      Value = (const __CFDictionary *)CFDictionaryGetValue(v6, CFSTR("value"));
      v8 = 0;
    }
    else
    {
      v8 = (void *)CFDictionaryGetValue(v6, CFSTR("key"));
      v9 = (const __CFDictionary *)CFDictionaryGetValue(v6, CFSTR("value"));
      if (!v8)
      {
LABEL_7:
        CFRelease(v6);
        return v4;
      }
      Value = v9;
    }
    IOSurfaceClientSetValue(a2, v8, Value);
    v4 = 0;
    goto LABEL_7;
  }
  return v4;
}

uint64_t _IOSurfaceRemoteMethodClientCopyAllValues(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  const __CFDictionary *v6;

  v5 = a4;
  v6 = IOSurfaceClientCopyAllValues(a2);
  if (!v6)
    v6 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  _ioSurfaceSerializeToXPCDictionaryWithKey(v5, "PropertiesDictionary", v6);
  CFRelease(v6);

  return 0;
}

uint64_t _IOSurfaceRemoteMethodClientRemoveValue(int a1, uint64_t a2, xpc_object_t xdict)
{
  uint64_t v4;
  const char *string;
  __CFString *v6;
  __CFString *v7;

  v4 = 3758097090;
  string = xpc_dictionary_get_string(xdict, "PropertyKey");
  if (string)
  {
    v6 = (__CFString *)CFStringCreateWithCStringNoCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], string, 0x8000100u, (CFAllocatorRef)*MEMORY[0x1E0C9AE20]);
    if (v6)
    {
      v7 = v6;
      IOSurfaceClientRemoveValue(a2, v6);
      CFRelease(v7);
      return 0;
    }
  }
  return v4;
}

uint64_t _IOSurfaceRemoteMethodClientRemoveAllValues(int a1, uint64_t a2)
{
  IOSurfaceClientRemoveValue(a2, 0);
  return 0;
}

uint64_t _IOSurfaceRemoteMethodClientSetPurgeable(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  unsigned int uint64;
  uint64_t v8;
  _DWORD value[3];

  *(_QWORD *)&value[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  uint64 = xpc_dictionary_get_uint64(a3, "NewState");
  value[0] = 0;
  v8 = IOSurfaceClientSetPurgeable(a2, uint64, value);
  xpc_dictionary_set_uint64(v6, "OldState", value[0]);

  return v8;
}

uint64_t _IOSurfaceRemoteMethodClientCreateMachPort(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  mach_port_name_t MachPort;
  mach_port_name_t v7;

  v5 = a4;
  MachPort = IOSurfaceClientCreateMachPort(a2);
  if (MachPort - 1 <= 0xFFFFFFFD)
  {
    v7 = MachPort;
    xpc_dictionary_set_mach_send();
    mach_port_mod_refs(*MEMORY[0x1E0C83DA0], v7, 0, -1);
  }

  return 0;
}

uint64_t _IOSurfaceRemoteMethodClientIncrementUseCount(uint64_t a1, uint64_t a2)
{
  IOSurfaceClientIncrementUseCount(a2);
  return 0;
}

uint64_t _IOSurfaceRemoteMethodClientDecrementUseCount(uint64_t a1, uint64_t a2)
{
  IOSurfaceClientDecrementUseCount(a2);
  return 0;
}

uint64_t _IOSurfaceRemoteMethodClientIsInUse(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  BOOL v6;

  v5 = a4;
  v6 = IOSurfaceClientIsInUse(a2);
  xpc_dictionary_set_BOOL(v5, "IsInUse", v6);

  return 0;
}

uint64_t _IOSurfaceRemoteMethodClientCopyDataValueBytes(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v6;
  id v7;
  id v8;
  uint64_t uint64;
  size_t v10;
  const char *string;
  CFStringRef v12;
  const __CFString *v13;
  _BYTE *v14;
  const void *v15;
  NSObject *v16;
  xpc_object_t v17;
  size_t size[2];

  size[1] = *MEMORY[0x1E0C80C00];
  v6 = 3758097085;
  v7 = a3;
  v8 = a4;
  uint64 = xpc_dictionary_get_uint64(v7, "BufferSize");
  if (uint64 <= 0xA00000)
  {
    v10 = uint64;
    string = xpc_dictionary_get_string(v7, "PropertyKey");
    if (string
      && (v12 = CFStringCreateWithCStringNoCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], string, 0x8000100u, (CFAllocatorRef)*MEMORY[0x1E0C9AE20])) != 0)
    {
      v13 = v12;
      v14 = malloc_type_calloc(1uLL, v10, 0x6FECE025uLL);
      if (v14)
      {
        v15 = v14;
        size[0] = v10;
        v6 = IOSurfaceClientCopyDataValueBytes(a2, v13, v14, size);
        CFRelease(v13);
        if ((_DWORD)v6 == -536870181)
        {
          xpc_dictionary_set_uint64(v8, "BufferSize", size[0]);
          goto LABEL_11;
        }
        if (!(_DWORD)v6)
        {
          v16 = dispatch_data_create(v15, size[0], 0, (dispatch_block_t)*MEMORY[0x1E0C80CE0]);
          v17 = xpc_data_create_with_dispatch_data(v16);
          xpc_dictionary_set_value(v8, "Buffer", v17);

LABEL_11:
          v6 = 0;
        }
      }
      else
      {
        CFRelease(v13);
      }
    }
    else
    {
      v6 = 3758097090;
    }
  }

  return v6;
}

uint64_t _IOSurfaceRemoteMethodClientSignalEvent(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  uint64_t uint64;
  uint64_t v6;
  unsigned int v7;
  uint64_t v8;

  v4 = a3;
  uint64 = xpc_dictionary_get_uint64(v4, "EventValue");
  v6 = xpc_dictionary_get_uint64(v4, "EventOperation");
  v7 = xpc_dictionary_copy_mach_send();

  v8 = IOSurfaceClientSignalEvent(a2, v7, uint64, v6);
  mach_port_mod_refs(*MEMORY[0x1E0C83DA0], v7, 0, -1);
  return v8;
}

uint64_t _IOSurfaceRemoteMethodClientSetBulkAttachments(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  _OWORD v6[7];
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7 = 0;
  memset(v6, 0, sizeof(v6));
  v5 = 0;
  _ioSurfaceDeserializeBulkAttachmentsFromXPCDictionary(a3, (uint64_t)v6, &v5);
  return IOSurfaceClientSetBulkAttachments(a2, (uint64_t)v6, 0x74uLL, v5);
}

uint64_t _IOSurfaceRemoteMethodClientGetBulkAttachments(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  uint64_t BulkAttachments;
  size_t v8;
  _OWORD __dst[7];
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v10 = 0;
  memset(__dst, 0, sizeof(__dst));
  v8 = 116;
  v5 = a4;
  BulkAttachments = IOSurfaceClientGetBulkAttachments(a2, __dst, &v8);
  _ioSurfaceSerializeBulkAttachmentsToXPCDictionary(v5, (uint64_t)__dst, -1);

  return BulkAttachments;
}

uint64_t _IOSurfaceRemoteMethodClientIncrementUseCountForCategory(int a1, uint64_t a2, xpc_object_t xdict)
{
  unsigned int uint64;

  uint64 = xpc_dictionary_get_uint64(xdict, "Category");
  IOSurfaceClientIncrementUseCountForCategory(a2, uint64);
  return 0;
}

uint64_t _IOSurfaceRemoteMethodClientDecrementUseCountForCategory(int a1, uint64_t a2, xpc_object_t xdict)
{
  unsigned int uint64;

  uint64 = xpc_dictionary_get_uint64(xdict, "Category");
  IOSurfaceClientDecrementUseCountForCategory(a2, uint64);
  return 0;
}

uint64_t _IOSurfaceRemoteMethodClientIsInUseForCategory(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  unsigned int uint64;
  BOOL v8;

  v6 = a4;
  uint64 = xpc_dictionary_get_uint64(a3, "Category");
  v8 = IOSurfaceClientIsInUseForCategory(a2, uint64);
  xpc_dictionary_set_BOOL(v6, "IsInUse", v8);

  return 0;
}

uint64_t _IOSurfaceRemoteMethodClientIsInUseForAnyOtherCategory(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  unsigned int uint64;
  BOOL v8;

  v6 = a4;
  uint64 = xpc_dictionary_get_uint64(a3, "Category");
  v8 = IOSurfaceClientIsInUseForAnyOtherCategory(a2, uint64);
  xpc_dictionary_set_BOOL(v6, "IsInUse", v8);

  return 0;
}

uint64_t _IOSurfaceRemoteMethodClientGetYCbCrMatrix(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5;
  _DWORD value[3];

  *(_QWORD *)&value[1] = *MEMORY[0x1E0C80C00];
  value[0] = 0;
  v5 = a4;
  IOSurfaceClientGetYCbCrMatrix(a2, value);
  xpc_dictionary_set_uint64(v5, "YCbCrMatrixIndex", value[0]);

  return 0;
}

void _ioSurfaceAddClientState(uint64_t a1, int a2, void *a3)
{
  id v5;
  char *v6;
  char v7;
  char v8;
  xpc_object_t v9;
  NSObject *v10;

  v5 = a3;
  v6 = (char *)malloc_type_calloc(1uLL, 0x48uLL, 0x1000040883E98BCuLL);
  *(_DWORD *)v6 = 0;
  *((_DWORD *)v6 + 1) = a2;
  *((_DWORD *)v6 + 2) = IOSurfaceClientGetAllocSize(a1);
  *((_DWORD *)v6 + 6) = _IOSurfaceClientGetBufferOffset(a1);
  *((_DWORD *)v6 + 3) = IOSurfaceClientGetWidth(a1);
  *((_DWORD *)v6 + 4) = IOSurfaceClientGetHeight(a1);
  *((_DWORD *)v6 + 5) = IOSurfaceClientGetBytesPerRow(a1);
  *((_DWORD *)v6 + 7) = IOSurfaceClientGetPixelFormat(a1);
  *((_DWORD *)v6 + 8) = IOSurfaceClientGetCacheMode(a1);
  *((_DWORD *)v6 + 9) = IOSurfaceClientGetPlaneCount(a1);
  *((_DWORD *)v6 + 10) = IOSurfaceClientGetBytesPerElement(a1);
  *((_DWORD *)v6 + 11) = IOSurfaceClientGetElementWidth(a1);
  *((_DWORD *)v6 + 12) = IOSurfaceClientGetElementHeight(a1);
  *((_DWORD *)v6 + 13) = IOSurfaceClientGetSeed(a1);
  *((_DWORD *)v6 + 14) = IOSurfaceClientGetSubsampling(a1);
  v6[60] = v6[60] & 0xFE | (IOSurfaceClientAllowsPixelSizeCasting(a1) != 0);
  if (IOSurfaceClientIsSysMemOnly(a1))
    v7 = 2;
  else
    v7 = 0;
  v6[60] = v6[60] & 0xFD | v7;
  if (IOSurfaceClientIsDisplayable(a1))
    v8 = 4;
  else
    v8 = 0;
  v6[60] = v6[60] & 0xFB | v8;
  *(_QWORD *)(v6 + 61) = IOSurfaceClientGetTraceID(a1);
  v6[60] = v6[60] & 0xF7 | (8 * (IOSurfaceClientGetProhibitUseCount(a1) != 0));
  v10 = dispatch_data_create(v6, 0x48uLL, 0, (dispatch_block_t)*MEMORY[0x1E0C80CE0]);
  v9 = xpc_data_create_with_dispatch_data(v10);
  xpc_dictionary_set_value(v5, "SurfaceState", v9);

}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_3_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xEu);
}

uint64_t OUTLINED_FUNCTION_6(void *a1, const char *a2)
{
  return objc_msgSend(a1, "pid");
}

id _copyDescriptions(void *a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  _IOSurfaceDebugDescription *v13;
  CFStringRef v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = objc_msgSend(a1, "count");
  if (v3)
  {
    v4 = v3;
    for (i = 0; i != v4; ++i)
    {
      v6 = (void *)objc_msgSend(a1, "objectAtIndex:", i, 0, v16);
      v7 = (void *)IOCFUnserializeWithSize((const char *)objc_msgSend(v6, "bytes"), objc_msgSend(v6, "length"), 0, 0, &v15);
      v8 = (void *)objc_msgSend(v7, "objectForKey:", CFSTR("BasicInfo"));
      v9 = 0;
      if (objc_msgSend(v8, "length") == 120)
        v9 = objc_msgSend(v8, "bytes");
      v10 = (void *)objc_msgSend(v7, "objectForKey:", CFSTR("Layout"));
      if (objc_msgSend(v10, "length") == 48)
        v11 = objc_msgSend(v10, "bytes");
      else
        v11 = 0;
      v12 = objc_msgSend(v7, "objectForKey:", CFSTR("IOSurfaceName"));
      if (v9 && v11)
      {
        v13 = -[_IOSurfaceDebugDescription initWithBasicInfo:layoutInfo:name:]([_IOSurfaceDebugDescription alloc], "initWithBasicInfo:layoutInfo:name:", v9, v11, v12);
        objc_msgSend(v2, "addObject:", v13);

      }
    }
  }
  return v2;
}

uint64_t IOSurfaceNotifierGetTypeID()
{
  uint64_t result;

  result = kIOSurfaceNotifierID;
  if (!kIOSurfaceNotifierID)
  {
    pthread_once(&IOSurfaceNotifierGetTypeID_once, (void (*)(void))ioSurfaceNotifierClassInitialize);
    return kIOSurfaceNotifierID;
  }
  return result;
}

uint64_t ioSurfaceNotifierClassInitialize()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  kIOSurfaceNotifierID = result;
  return result;
}

void IOSurfaceNotifierSetDispatchQueue(uint64_t a1, NSObject *a2)
{
  NSObject *v4;
  dispatch_queue_t current_queue;

  if (a2)
  {
    IONotificationPortSetDispatchQueue(*(IONotificationPortRef *)(a1 + 16), a2);
    *(_QWORD *)(a1 + 32) = a2;
  }
  else
  {
    v4 = *(NSObject **)(a1 + 32);
    current_queue = dispatch_get_current_queue();
    if (current_queue && current_queue == v4)
      IONotificationPortSetDispatchQueue(*(IONotificationPortRef *)(a1 + 16), 0);
    else
      dispatch_sync_f(v4, (void *)a1, (dispatch_function_t)tearDownCallback);
    *(_QWORD *)(a1 + 32) = 0;
  }
}

void tearDownCallback(uint64_t a1)
{
  IONotificationPortSetDispatchQueue(*(IONotificationPortRef *)(a1 + 16), 0);
}

unint64_t IOSurfaceNotifierCreate(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t Instance;
  IONotificationPort *v6;
  mach_port_t MachPort;
  int v8;

  if (!kIOSurfaceNotifierID)
    pthread_once(&IOSurfaceNotifierGetTypeID_once, (void (*)(void))ioSurfaceNotifierClassInitialize);
  Instance = _CFRuntimeCreateInstance();
  *(_QWORD *)(Instance + 24) = a1;
  *(_QWORD *)(Instance + 40) = a3;
  v6 = IONotificationPortCreate(*MEMORY[0x1E0CBBAA8]);
  *(_QWORD *)(Instance + 16) = v6;
  if (v6)
  {
    MachPort = IONotificationPortGetMachPort(v6);
    v8 = IOSurfaceClientSetSurfaceNotify(MachPort, (uint64_t)IOSurfaceNotifierNotifyFunc, Instance);
    if (!v8)
    {
      *(_BYTE *)(Instance + 48) = 1;
      return Instance;
    }
    fprintf((FILE *)*MEMORY[0x1E0C80C10], "IOSurfaceClientSetSurfaceNotify failed %08x\n", v8);
  }
  CFRelease((CFTypeRef)Instance);
  return 0;
}

uint64_t IOSurfaceNotifierNotifyFunc(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD, _QWORD))(a1 + 24))(*(_QWORD *)(a1 + 40), a4, 0, 0);
}

uint64_t IOSurfaceNotifierInvalidate(uint64_t result)
{
  uint64_t v1;

  if (*(_BYTE *)(result + 48))
  {
    v1 = result;
    result = IOSurfaceClientRemoveSurfaceNotify(result);
    *(_BYTE *)(v1 + 48) = 0;
  }
  return result;
}

void ioSurfaceNotifierFinalize(uint64_t a1)
{
  IONotificationPort *v2;

  if (*(_BYTE *)(a1 + 48))
    IOSurfaceClientRemoveSurfaceNotify(a1);
  v2 = *(IONotificationPort **)(a1 + 16);
  if (v2)
  {
    if (!*(_QWORD *)(a1 + 32)
      || (IONotificationPortSetDispatchQueue(v2, 0), (v2 = *(IONotificationPort **)(a1 + 16)) != 0))
    {
      IONotificationPortDestroy(v2);
    }
  }
}

CFStringRef ioSurfaceNotifierCopyFormatDescription(_QWORD *a1, const __CFDictionary *a2)
{
  CFIndex v4;

  v4 = CFGetRetainCount(a1);
  return CFStringCreateWithFormat(0, a2, CFSTR("<IOSurfaceNotifier %p refcnt=%d notificationPort=%p callback=%p, refcon=%p>"), a1, v4, a1[2], a1[3], a1[5]);
}

uint64_t ioSurfaceNotifierCopyDebugDescription()
{
  return 0;
}

void _ioSurfaceSerializeToXPCDictionaryWithKey(void *a1, const char *a2, const void *a3)
{
  id v5;
  const __CFData *v6;
  const UInt8 *BytePtr;
  size_t Length;
  NSObject *v9;
  xpc_object_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD destructor[6];

  destructor[5] = *MEMORY[0x1E0C80C00];
  v5 = a1;
  if (v5)
  {
    if (a2)
      goto LABEL_3;
LABEL_6:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _ioSurfaceSerializeToXPCDictionaryWithKey(__strong xpc_object_t _Nonnull, const char * _Nonnull, CFTypeRef _Nonnull)");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, CFSTR("IOSurfaceRemoteProtocol.m"), 82, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("key"));

    if (a3)
      goto LABEL_4;
LABEL_7:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _ioSurfaceSerializeToXPCDictionaryWithKey(__strong xpc_object_t _Nonnull, const char * _Nonnull, CFTypeRef _Nonnull)");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, CFSTR("IOSurfaceRemoteProtocol.m"), 83, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("object"));

    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _ioSurfaceSerializeToXPCDictionaryWithKey(__strong xpc_object_t _Nonnull, const char * _Nonnull, CFTypeRef _Nonnull)");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, CFSTR("IOSurfaceRemoteProtocol.m"), 81, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dict"));

  if (!a2)
    goto LABEL_6;
LABEL_3:
  if (!a3)
    goto LABEL_7;
LABEL_4:
  v6 = IOCFSerialize(a3, 1uLL);
  BytePtr = CFDataGetBytePtr(v6);
  Length = CFDataGetLength(v6);
  destructor[0] = MEMORY[0x1E0C809B0];
  destructor[1] = 3221225472;
  destructor[2] = ___ioSurfaceSerializeToXPCDictionaryWithKey_block_invoke;
  destructor[3] = &__block_descriptor_40_e5_v8__0l;
  destructor[4] = v6;
  v9 = dispatch_data_create(BytePtr, Length, 0, destructor);
  v10 = xpc_data_create_with_dispatch_data(v9);
  xpc_dictionary_set_value(v5, a2, v10);

}

void ___ioSurfaceSerializeToXPCDictionaryWithKey_block_invoke(uint64_t a1)
{
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

CFTypeRef _ioSurfaceDeserializedFromXPCDictionaryWithKey(void *a1, const char *a2)
{
  id v3;
  const char *data;
  CFTypeRef v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  CFStringRef errorString;
  size_t length[2];

  length[1] = *MEMORY[0x1E0C80C00];
  v3 = a1;
  if (v3)
  {
    if (a2)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CFTypeRef  _Nullable _ioSurfaceDeserializedFromXPCDictionaryWithKey(__strong xpc_object_t _Nonnull, const char * _Nonnull)");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("IOSurfaceRemoteProtocol.m"), 96, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dict"));

    if (a2)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CFTypeRef  _Nullable _ioSurfaceDeserializedFromXPCDictionaryWithKey(__strong xpc_object_t _Nonnull, const char * _Nonnull)");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("IOSurfaceRemoteProtocol.m"), 97, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("key"));

LABEL_3:
  length[0] = 0;
  data = (const char *)xpc_dictionary_get_data(v3, a2, length);
  if (data)
  {
    errorString = 0;
    v5 = IOCFUnserializeBinary(data, length[0], (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, &errorString);
    if (!v5)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        _ioSurfaceDeserializedFromXPCDictionaryWithKey_cold_1((uint64_t)a2, (uint64_t *)&errorString);
      CFRelease(errorString);
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void _ioSurfaceSerializeBulkAttachmentsToXPCDictionary(void *a1, uint64_t a2, __int16 a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  const char *v8;
  __int128 v9;
  uint64_t v10;
  _BYTE v11[32];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = v5;
  if ((a3 & 1) != 0)
  {
    v10 = 0;
    v9 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)v11 = *(_OWORD *)a2;
    *(_OWORD *)&v11[16] = v9;
    xpc_dictionary_set_data(v5, "CleanAperture", &v10, 0x28uLL);
    if ((a3 & 2) == 0)
    {
LABEL_3:
      if ((a3 & 0x800) == 0)
        goto LABEL_4;
      goto LABEL_21;
    }
  }
  else if ((a3 & 2) == 0)
  {
    goto LABEL_3;
  }
  v10 = 0;
  *(_OWORD *)v11 = *(_OWORD *)(a2 + 32);
  xpc_dictionary_set_data(v6, "PixelAspectRatio", &v10, 0x18uLL);
  if ((a3 & 0x800) == 0)
  {
LABEL_4:
    if ((a3 & 4) == 0)
      goto LABEL_5;
    goto LABEL_22;
  }
LABEL_21:
  v10 = 0;
  *(_QWORD *)v11 = *(_QWORD *)(a2 + 80);
  *(_OWORD *)&v11[8] = *(_OWORD *)(a2 + 64);
  xpc_dictionary_set_data(v6, "MasteringDisplayColorVolume", &v10, 0x20uLL);
  if ((a3 & 4) == 0)
  {
LABEL_5:
    if ((a3 & 0x2000) == 0)
      goto LABEL_6;
    goto LABEL_23;
  }
LABEL_22:
  v10 = *(_QWORD *)(a2 + 48);
  xpc_dictionary_set_data(v6, "GammaLevel", &v10, 8uLL);
  if ((a3 & 0x2000) == 0)
  {
LABEL_6:
    if ((a3 & 0x1000) == 0)
      goto LABEL_7;
    goto LABEL_24;
  }
LABEL_23:
  v10 = *(_QWORD *)(a2 + 92);
  xpc_dictionary_set_data(v6, "EDRFactor", &v10, 8uLL);
  if ((a3 & 0x1000) == 0)
  {
LABEL_7:
    if ((a3 & 8) == 0)
      goto LABEL_8;
    goto LABEL_25;
  }
LABEL_24:
  v10 = 0;
  HIDWORD(v10) = *(_DWORD *)(a2 + 88);
  xpc_dictionary_set_data(v6, "ContentLightLevelInfo", &v10, 8uLL);
  if ((a3 & 8) == 0)
  {
LABEL_8:
    if ((a3 & 0x10) == 0)
      goto LABEL_9;
    goto LABEL_26;
  }
LABEL_25:
  xpc_dictionary_set_uint64(v6, "FieldCount", *(unsigned __int8 *)(a2 + 56));
  if ((a3 & 0x10) == 0)
  {
LABEL_9:
    if ((a3 & 0x20) == 0)
      goto LABEL_10;
    goto LABEL_27;
  }
LABEL_26:
  xpc_dictionary_set_uint64(v6, "FieldDetail", *(unsigned __int8 *)(a2 + 57));
  if ((a3 & 0x20) == 0)
  {
LABEL_10:
    if ((a3 & 0x40) == 0)
      goto LABEL_11;
    goto LABEL_28;
  }
LABEL_27:
  xpc_dictionary_set_uint64(v6, "YCbCrMatrixIndex", *(unsigned __int8 *)(a2 + 58));
  if ((a3 & 0x40) == 0)
  {
LABEL_11:
    if ((a3 & 0x80) == 0)
      goto LABEL_12;
    goto LABEL_29;
  }
LABEL_28:
  xpc_dictionary_set_uint64(v6, "ColorPrimariesIndex", *(unsigned __int8 *)(a2 + 59));
  if ((a3 & 0x80) == 0)
  {
LABEL_12:
    if ((a3 & 0x100) == 0)
      goto LABEL_13;
    goto LABEL_30;
  }
LABEL_29:
  xpc_dictionary_set_uint64(v6, "TransferFunctionIndex", *(unsigned __int8 *)(a2 + 60));
  if ((a3 & 0x100) == 0)
  {
LABEL_13:
    if ((a3 & 0x200) == 0)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_30:
  xpc_dictionary_set_uint64(v6, "ChromaLocationTopField", *(unsigned __int8 *)(a2 + 61));
  if ((a3 & 0x200) != 0)
LABEL_14:
    xpc_dictionary_set_uint64(v6, "ChromaLocationBottomField", *(unsigned __int8 *)(a2 + 62));
LABEL_15:
  if ((a3 & 0x4400) != 0)
  {
    if ((a3 & 0x400) != 0)
    {
      v7 = *(_BYTE *)(a2 + 63) & 0xF;
      if ((a3 & 0x4000) != 0)
        goto LABEL_18;
    }
    else
    {
      v7 = 0;
      if ((a3 & 0x4000) != 0)
      {
LABEL_18:
        xpc_dictionary_set_uint64(v6, "ChromaSubsampling", v7 | (16 * *(unsigned __int8 *)(a2 + 100)) | 0x80);
        v7 = *(unsigned __int8 *)(a2 + 100);
        v8 = "PremultipliedAlpha";
LABEL_34:
        xpc_dictionary_set_uint64(v6, v8, v7);
        goto LABEL_35;
      }
    }
    v8 = "ChromaSubsampling";
    goto LABEL_34;
  }
LABEL_35:

}

void _ioSurfaceDeserializeBulkAttachmentsFromXPCDictionary(void *a1, uint64_t a2, uint64_t *a3)
{
  id v4;
  uint64_t v5;
  __int128 v6;
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
  void *v19;
  void *v20;
  unsigned int value;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  __int128 v33;
  _OWORD v34[3];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v4 = a1;
  memset(v34, 0, 40);
  v5 = 0;
  if (_ioSurfaceCopyStructFromKey(v4, "CleanAperture", v34, 0x28uLL))
  {
    v6 = *(_OWORD *)((char *)&v34[1] + 8);
    *(_OWORD *)a2 = *(_OWORD *)((char *)v34 + 8);
    *(_OWORD *)(a2 + 16) = v6;
    v5 = 1;
  }
  v32 = 0;
  v33 = 0uLL;
  if (_ioSurfaceCopyStructFromKey(v4, "PixelAspectRatio", &v32, 0x18uLL))
  {
    v5 |= 2uLL;
    *(_OWORD *)(a2 + 32) = v33;
  }
  v30 = 0u;
  v31 = 0u;
  if (_ioSurfaceCopyStructFromKey(v4, "MasteringDisplayColorVolume", &v30, 0x20uLL))
  {
    v5 |= 0x800uLL;
    *(_QWORD *)(a2 + 80) = *((_QWORD *)&v30 + 1);
    *(_OWORD *)(a2 + 64) = v31;
  }
  v29 = 0;
  if (_ioSurfaceCopyStructFromKey(v4, "GammaLevel", &v29, 8uLL))
  {
    v5 |= 4uLL;
    *(_QWORD *)(a2 + 48) = v29;
  }
  v28 = 0;
  if (_ioSurfaceCopyStructFromKey(v4, "EDRFactor", &v28, 8uLL))
  {
    v5 |= 0x2000uLL;
    *(_QWORD *)(a2 + 92) = v28;
  }
  v27 = 0;
  if (_ioSurfaceCopyStructFromKey(v4, "ContentLightLevelInfo", &v27, 8uLL))
  {
    v5 |= 0x1000uLL;
    *(_DWORD *)(a2 + 88) = HIDWORD(v27);
  }
  xpc_dictionary_get_value(v4, "FieldCount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v7;
  if (v7)
  {
    v5 |= 8uLL;
    *(_BYTE *)(a2 + 56) = xpc_uint64_get_value(v7);
  }
  xpc_dictionary_get_value(v4, "FieldDetail");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v8;
  if (v8)
  {
    v5 |= 0x10uLL;
    *(_BYTE *)(a2 + 57) = xpc_uint64_get_value(v8);
  }
  xpc_dictionary_get_value(v4, "YCbCrMatrixIndex");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    v5 |= 0x20uLL;
    *(_BYTE *)(a2 + 58) = xpc_uint64_get_value(v9);
  }
  xpc_dictionary_get_value(v4, "ColorPrimariesIndex");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    v5 |= 0x40uLL;
    *(_BYTE *)(a2 + 59) = xpc_uint64_get_value(v11);
  }
  xpc_dictionary_get_value(v4, "TransferFunctionIndex");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    v5 |= 0x80uLL;
    *(_BYTE *)(a2 + 60) = xpc_uint64_get_value(v13);
  }
  xpc_dictionary_get_value(v4, "ChromaLocationTopField");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    v5 |= 0x100uLL;
    *(_BYTE *)(a2 + 61) = xpc_uint64_get_value(v15);
  }
  xpc_dictionary_get_value(v4, "ChromaLocationBottomField");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v17)
  {
    v5 |= 0x200uLL;
    *(_BYTE *)(a2 + 62) = xpc_uint64_get_value(v17);
  }
  xpc_dictionary_get_value(v4, "ChromaSubsampling");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v19)
  {
    value = xpc_uint64_get_value(v19);
    if ((value & 0xF) != 0)
    {
      v5 |= 0x400uLL;
      *(_BYTE *)(a2 + 63) = value & 0xF;
    }
    if ((value & 0x80) != 0)
    {
      v5 |= 0x4000uLL;
      *(_BYTE *)(a2 + 100) = (value >> 4) & 0xF7;
    }
  }
  xpc_dictionary_get_value(v4, "PremultipliedAlpha");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v22;
  if (v22)
  {
    v5 |= 0x4000uLL;
    *(_BYTE *)(a2 + 100) = xpc_uint64_get_value(v22);
  }
  if (a3)
    *a3 = v5;

}

BOOL _ioSurfaceCopyStructFromKey(void *a1, const char *a2, void *a3, size_t a4)
{
  void *v6;
  _BOOL8 v7;

  xpc_dictionary_get_value(a1, a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    bzero(a3, a4);
    v7 = xpc_data_get_bytes(v6, a3, 0, a4) == a4;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void ___ioSurfaceConnectInternal_block_invoke_cold_1()
{
  __assert_rtn("_iosConnectInitalize", "/Library/Caches/com.apple.xbs/Sources/IOSurface/IOSurfaceUser/IOSurfaceClient.m", 534, "_iosConnectInitalize() unable to locate IOSurface kernel service");
}

void ___ioSurfaceConnectInternal_block_invoke_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1A4CDD000, MEMORY[0x1E0C81028], a3, "IOSurface.framework versus IOSurface.kext version mismatch", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3();
}

void ___ioSurfaceConnectInternal_block_invoke_cold_3(char *a1)
{
  __assert_rtn("_iosConnectInitalize", "/Library/Caches/com.apple.xbs/Sources/IOSurface/IOSurfaceUser/IOSurfaceClient.m", 498, a1);
}

void ___ioSurfaceConnectInternal_block_invoke_cold_4(char *a1)
{
  __assert_rtn("_iosConnectInitalize", "/Library/Caches/com.apple.xbs/Sources/IOSurface/IOSurfaceUser/IOSurfaceClient.m", 488, a1);
}

void IOSurfaceClientDisallowForever_cold_1()
{
  uint8_t v0[8];
  uint64_t v1;

  v1 = *MEMORY[0x1E0C80C00];
  *(_WORD *)v0 = 0;
  _os_log_fault_impl(&dword_1A4CDD000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "IOSurfaceDisallowForever() invoked too late, connection to IOSurface.kext already established", v0, 2u);
  OUTLINED_FUNCTION_3();
}

void IOSurfaceClientCreateChild_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_1A4CDD000, MEMORY[0x1E0C81028], a3, "IOSurface creation failed. IOSurface service not present", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3();
}

void IOSurfaceClientCreateChild_cold_2()
{
  const char *v0;
  _DWORD v1[2];
  __int16 v2;
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v0 = "";
  if (_iosConnectReturn == -536870174)
    v0 = " (likely sandbox violation)";
  v1[0] = 67109378;
  v1[1] = _iosConnectReturn;
  v2 = 2080;
  v3 = v0;
  _os_log_error_impl(&dword_1A4CDD000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "IOSurface creation failed. IOSurface open failed: %08x %s", (uint8_t *)v1, 0x12u);
  OUTLINED_FUNCTION_1();
}

void IOSurfaceClientCreateChild_cold_3(int a1, int a2, uint64_t a3)
{
  const char *v3;
  _DWORD v4[2];
  __int16 v5;
  int v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = "";
  v4[0] = 67109890;
  v5 = 1024;
  v4[1] = a1;
  v6 = a2;
  if (a1 == -536870210)
    v3 = " (likely per client IOSurface limit of 16384 reached)";
  v7 = 2112;
  v8 = a3;
  v9 = 2080;
  v10 = v3;
  _os_log_error_impl(&dword_1A4CDD000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "IOSurface creation failed: %08x parentID: %08x properties: %@%s", (uint8_t *)v4, 0x22u);
}

void IOSurfaceClientRelease_cold_1(int a1)
{
  _DWORD v1[2];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v1[0] = 67109120;
  v1[1] = a1;
  _os_log_error_impl(&dword_1A4CDD000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "IOSurfaceClientInvalidate failed: %08x", (uint8_t *)v1, 8u);
  OUTLINED_FUNCTION_3();
}

void IOSurfaceClientIncrementUseCountForCategory_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1A4CDD000, MEMORY[0x1E0C81028], a3, "%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void IOSurfaceSharedEventAddEventListener_cold_1()
{
  __assert_rtn("IOSurfaceSharedEventAddEventListener", "IOSurfaceSharedEvent.m", 347, "wakePort");
}

void _ioSurfaceEventNotificationCallback2_cold_1()
{
  __assert_rtn("_ioSurfaceEventNotificationCallback2", "IOSurfaceSharedEvent.m", 326, "block");
}

void _ioSurfaceEventNotificationCallback2_cold_2()
{
  __assert_rtn("_ioSurfaceEventNotificationCallback2", "IOSurfaceSharedEvent.m", 315, "result == kIOReturnSuccess");
}

void _IOSurfaceRemoteMethodClientCreate_cold_1(void *a1)
{
  uint8_t v1[8];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "pid");
  OUTLINED_FUNCTION_5();
  _os_log_fault_impl(&dword_1A4CDD000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Failed to map client shared memory object from pid %d", v1, 8u);
  OUTLINED_FUNCTION_3();
}

void _IOSurfaceRemoteMethodClientCreate_cold_2(uint64_t a1, uint64_t a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 134218240;
  v3 = a1;
  v4 = 2048;
  v5 = a2;
  _os_log_fault_impl(&dword_1A4CDD000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "IOSurface client memory mapping is %lu bytes but client claims allocation size of %lu bytes", (uint8_t *)&v2, 0x16u);
}

void _IOSurfaceRemoteMethodClientCreate_cold_3(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  objc_msgSend(a1, "pid");
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_0(&dword_1A4CDD000, MEMORY[0x1E0C81028], v1, "Client is providing a shmem for its own mapping, pid %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void _ioSurfaceDeserializedFromXPCDictionaryWithKey_cold_1(uint64_t a1, uint64_t *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = *a2;
  v3 = 136446466;
  v4 = a1;
  v5 = 2112;
  v6 = v2;
  _os_log_error_impl(&dword_1A4CDD000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "IOSurface Deserialization failure for key %{public}s: %@", (uint8_t *)&v3, 0x16u);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x1E0C97CF8](theArray, value);
}

void CFArrayApplyFunction(CFArrayRef theArray, CFRange range, CFArrayApplierFunction applier, void *context)
{
  MEMORY[0x1E0C97D00](theArray, range.location, range.length, applier, context);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x1E0C97D20](allocator, values, numValues, callBacks);
}

CFArrayRef CFArrayCreateCopy(CFAllocatorRef allocator, CFArrayRef theArray)
{
  return (CFArrayRef)MEMORY[0x1E0C97D30](allocator, theArray);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1E0C97D38](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1E0C97D60](theArray);
}

CFIndex CFArrayGetFirstIndexOfValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x1E0C97D78](theArray, range.location, range.length, value);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x1E0C97D90]();
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
  MEMORY[0x1E0C97DC0](theArray, idx);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x1E0C983A0](allocator, bytes, length);
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

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x1E0C98418]();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98500](theDict, key, value);
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
  MEMORY[0x1E0C98508](theDict, applier, context);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x1E0C98530](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFDictionaryRef CFDictionaryCreateCopy(CFAllocatorRef allocator, CFDictionaryRef theDict)
{
  return (CFDictionaryRef)MEMORY[0x1E0C98538](allocator, theDict);
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

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x1E0C985C8](theDict, key, value);
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

CFNumberType CFNumberGetType(CFNumberRef number)
{
  return MEMORY[0x1E0C989A8](number);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1E0C989B8]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1E0C989C0](number, theType, valuePtr);
}

Boolean CFNumberIsFloatType(CFNumberRef number)
{
  return MEMORY[0x1E0C989D0](number);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
  MEMORY[0x1E0C98D70](theSet, value);
}

void CFSetApplyFunction(CFSetRef theSet, CFSetApplierFunction applier, void *context)
{
  MEMORY[0x1E0C98D78](theSet, applier, context);
}

CFSetRef CFSetCreateCopy(CFAllocatorRef allocator, CFSetRef theSet)
{
  return (CFSetRef)MEMORY[0x1E0C98D90](allocator, theSet);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x1E0C98D98](allocator, capacity, callBacks);
}

CFIndex CFSetGetCount(CFSetRef theSet)
{
  return MEMORY[0x1E0C98DA8](theSet);
}

CFTypeID CFSetGetTypeID(void)
{
  return MEMORY[0x1E0C98DB8]();
}

const void *__cdecl CFSetGetValue(CFSetRef theSet, const void *value)
{
  return (const void *)MEMORY[0x1E0C98DC0](theSet, value);
}

void CFSetRemoveValue(CFMutableSetRef theSet, const void *value)
{
  MEMORY[0x1E0C98DE0](theSet, value);
}

CFDataRef CFStringCreateExternalRepresentation(CFAllocatorRef alloc, CFStringRef theString, CFStringEncoding encoding, UInt8 lossByte)
{
  return (CFDataRef)MEMORY[0x1E0C98F80](alloc, theString, *(_QWORD *)&encoding, lossByte);
}

CFStringRef CFStringCreateWithCStringNoCopy(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x1E0C98FE0](alloc, cStr, *(_QWORD *)&encoding, contentsDeallocator);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1E0C99018](alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return (CFStringRef)MEMORY[0x1E0C99030](alloc, str, range.location, range.length);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1E0C990A0](theString, *(_QWORD *)&encoding);
}

SInt32 CFStringGetIntValue(CFStringRef str)
{
  return MEMORY[0x1E0C990F0](str);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1E0C99100](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1E0C99170]();
}

Boolean CFStringHasPrefix(CFStringRef theString, CFStringRef prefix)
{
  return MEMORY[0x1E0C99180](theString, prefix);
}

CFDataRef IOCFSerialize(CFTypeRef object, CFOptionFlags options)
{
  return (CFDataRef)MEMORY[0x1E0CBAD30](object, options);
}

CFTypeRef IOCFUnserializeBinary(const char *buffer, size_t bufferSize, CFAllocatorRef allocator, CFOptionFlags options, CFStringRef *errorString)
{
  return (CFTypeRef)MEMORY[0x1E0CBAD40](buffer, bufferSize, allocator, options, errorString);
}

CFTypeRef IOCFUnserializeWithSize(const char *buffer, size_t bufferSize, CFAllocatorRef allocator, CFOptionFlags options, CFStringRef *errorString)
{
  return (CFTypeRef)MEMORY[0x1E0CBAD48](buffer, bufferSize, allocator, options, errorString);
}

kern_return_t IOConnectCallAsyncMethod(mach_port_t connection, uint32_t selector, mach_port_t wake_port, uint64_t *reference, uint32_t referenceCnt, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x1E0CBAD68](*(_QWORD *)&connection, *(_QWORD *)&selector, *(_QWORD *)&wake_port, reference, *(_QWORD *)&referenceCnt, input, *(_QWORD *)&inputCnt, inputStruct);
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x1E0CBAD80](*(_QWORD *)&connection, *(_QWORD *)&selector, input, *(_QWORD *)&inputCnt, inputStruct, inputStructCnt, output, outputCnt);
}

kern_return_t IOConnectTrap1(io_connect_t connect, uint32_t index, uintptr_t p1)
{
  return MEMORY[0x1E0CBADC8](*(_QWORD *)&connect, *(_QWORD *)&index, p1);
}

kern_return_t IOConnectTrap2(io_connect_t connect, uint32_t index, uintptr_t p1, uintptr_t p2)
{
  return MEMORY[0x1E0CBADD0](*(_QWORD *)&connect, *(_QWORD *)&index, p1, p2);
}

kern_return_t IOConnectTrap3(io_connect_t connect, uint32_t index, uintptr_t p1, uintptr_t p2, uintptr_t p3)
{
  return MEMORY[0x1E0CBADD8](*(_QWORD *)&connect, *(_QWORD *)&index, p1, p2, p3);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x1E0CBB668](*(_QWORD *)&iterator);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return (IONotificationPortRef)MEMORY[0x1E0CBB698](*(_QWORD *)&mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
  MEMORY[0x1E0CBB6A0](notify);
}

mach_port_t IONotificationPortGetMachPort(IONotificationPortRef notify)
{
  return MEMORY[0x1E0CBB6A8](notify);
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
  MEMORY[0x1E0CBB6B8](notify, queue);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x1E0CBB6F0](*(_QWORD *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x1E0CBB900](*(_QWORD *)&entry, key, allocator, *(_QWORD *)&options);
}

kern_return_t IORegistryEntryCreateIterator(io_registry_entry_t entry, const io_name_t plane, IOOptionBits options, io_iterator_t *iterator)
{
  return MEMORY[0x1E0CBB910](*(_QWORD *)&entry, plane, *(_QWORD *)&options, iterator);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x1E0CBB9D0](*(_QWORD *)&connect);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return MEMORY[0x1E0CBB9F0](*(_QWORD *)&mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceNameMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0CBBA08](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x1E0CBBA10](*(_QWORD *)&service, *(_QWORD *)&owningTask, *(_QWORD *)&type, connect);
}

uint64_t NSLocalizedFileSizeDescription()
{
  return MEMORY[0x1E0CB2D70]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
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

uint64_t _NSMethodExceptionProem()
{
  return MEMORY[0x1E0CB3C38]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x1E0C80B50](*(_QWORD *)&a1, a2);
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1E0C80B68]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

void abort(void)
{
  MEMORY[0x1E0C813A8]();
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x1E0C81608](a1, a2);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_data_t dispatch_data_create(const void *buffer, size_t size, dispatch_queue_t queue, dispatch_block_t destructor)
{
  return (dispatch_data_t)MEMORY[0x1E0C82CB0](buffer, size, queue, destructor);
}

dispatch_queue_t dispatch_get_current_queue(void)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82CF8]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E38](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x1E0C82E98](object);
}

void dispatch_retain(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA8](object);
}

void dispatch_sync_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
  MEMORY[0x1E0C82FA0](queue, context, work);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1E0C83038]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1E0C83040](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

uint64_t dyld_image_path_containing_address()
{
  return MEMORY[0x1E0C83100]();
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x1E0C83478](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1E0C83C50]();
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x1E0C83CF8](*(_QWORD *)&task, *(_QWORD *)&name);
}

kern_return_t mach_port_mod_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return MEMORY[0x1E0C83D58](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&right, *(_QWORD *)&delta);
}

kern_return_t mach_vm_deallocate(vm_map_t target, mach_vm_address_t address, mach_vm_size_t size)
{
  return MEMORY[0x1E0C83DD0](*(_QWORD *)&target, address, size);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl malloc_type_valloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F18](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1E0C84220](a1, a2);
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

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E18](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x1E0C84E20](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E28](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E38](a1);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x1E0C84E68](a1, a2);
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x1E0C85438](*(_QWORD *)&a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1E0C85440](__str, __size, __format);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

void sys_dcache_flush(void *start, size_t len)
{
  MEMORY[0x1E0C85760](start, len);
}

int vasprintf(char **a1, const char *a2, va_list a3)
{
  return MEMORY[0x1E0C85A58](a1, a2, a3);
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
  MEMORY[0x1E0C85DE0](xarray, value);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C85E00](objects, count);
}

void xpc_connection_activate(xpc_connection_t connection)
{
  MEMORY[0x1E0C85F50](connection);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
  MEMORY[0x1E0C85F68](connection);
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return MEMORY[0x1E0C86008](connection);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
  MEMORY[0x1E0C86030](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x1E0C86080](connection, handler);
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
  MEMORY[0x1E0C860C8](connection, targetq);
}

xpc_object_t xpc_data_create_with_dispatch_data(dispatch_data_t ddata)
{
  return (xpc_object_t)MEMORY[0x1E0C86188](ddata);
}

size_t xpc_data_get_bytes(xpc_object_t xdata, void *buffer, size_t off, size_t length)
{
  return MEMORY[0x1E0C86190](xdata, buffer, off, length);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x1E0C861F0](xdict, applier);
}

uint64_t xpc_dictionary_copy_mach_send()
{
  return MEMORY[0x1E0C86200]();
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x1E0C86228](original);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x1E0C86278](xdict, key, length);
}

xpc_connection_t xpc_dictionary_get_remote_connection(xpc_object_t xdict)
{
  return (xpc_connection_t)MEMORY[0x1E0C862B0](xdict);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1E0C862C8](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C862D0](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1E0C862E0](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x1E0C86310](xdict, key, value);
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
  MEMORY[0x1E0C86330](xdict, key, bytes, length);
}

uint64_t xpc_dictionary_set_mach_send()
{
  return MEMORY[0x1E0C86378]();
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  MEMORY[0x1E0C86398](xdict, key, value);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
  MEMORY[0x1E0C863B8](xdict, key, value);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1E0C86520](object);
}

uint64_t xpc_mach_send_create()
{
  return MEMORY[0x1E0C865E0]();
}

uint64_t xpc_mach_send_get_right()
{
  return MEMORY[0x1E0C865F0]();
}

void xpc_release(xpc_object_t object)
{
  MEMORY[0x1E0C86658](object);
}

xpc_object_t xpc_shmem_create(void *region, size_t length)
{
  return (xpc_object_t)MEMORY[0x1E0C866F0](region, length);
}

size_t xpc_shmem_map(xpc_object_t xshmem, void **region)
{
  return MEMORY[0x1E0C86700](xshmem, region);
}

xpc_object_t xpc_uint64_create(uint64_t value)
{
  return (xpc_object_t)MEMORY[0x1E0C867B0](value);
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return MEMORY[0x1E0C867B8](xuint);
}

