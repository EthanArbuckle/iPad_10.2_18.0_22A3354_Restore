@implementation CADeviceSupportsHWGainMap

uint64_t __CADeviceSupportsHWGainMap_block_invoke()
{
  uint64_t result;
  uint64_t i;
  uint64_t v2;
  char v3;
  mach_port_t v4;
  const __CFDictionary *v5;
  io_object_t v6;
  const __CFData *CFProperty;
  const __CFData *v8;
  mach_port_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  result = MGGetProductType();
  for (i = 0; i != 6; ++i)
  {
    if (_ZZZ25CADeviceSupportsHWGainMapEUb1_E7devices[i] == result)
    {
      CADeviceSupportsHWGainMap::supports_gain_map = 1;
      return result;
    }
  }
  v2 = 0;
  v3 = CADeviceSupportsHWGainMap::supports_gain_map;
  do
    v3 |= _ZZZ25CADeviceSupportsHWGainMapEUb1_E13crete_devices[v2++] == result;
  while (v2 != 4);
  CADeviceSupportsHWGainMap::supports_gain_map = v3;
  if (v3)
  {
    CADeviceSupportsHWGainMap::supports_gain_map = 0;
    v9 = 0;
    MEMORY[0x186DBCEF8](0, &v9);
    v4 = v9;
    v5 = IOServiceNameMatching("arm-io");
    result = IOServiceGetMatchingService(v4, v5);
    if ((_DWORD)result)
    {
      v6 = result;
      CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(result, CFSTR("chip-revision"), (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
      if (CFProperty)
      {
        v8 = CFProperty;
        CADeviceSupportsHWGainMap::supports_gain_map = *CFDataGetBytePtr(CFProperty) > 0xFu;
        CFRelease(v8);
      }
      return IOObjectRelease(v6);
    }
  }
  return result;
}

@end
