@implementation CADeviceSupportsFilmGrainScaling

uint64_t __CADeviceSupportsFilmGrainScaling_block_invoke()
{
  uint64_t result;
  mach_port_t v1;
  const __CFDictionary *v2;
  io_object_t v3;
  const __CFData *CFProperty;
  const __CFData *v5;
  CFTypeID v6;
  UInt8 buffer[4];
  uint64_t v8;
  CFRange v9;

  v8 = *MEMORY[0x1E0C80C00];
  if (CADeviceSupportsFilmGrain::once[0] != -1)
    dispatch_once(CADeviceSupportsFilmGrain::once, &__block_literal_global_126);
  CADeviceSupportsFilmGrainScaling::supports_film_grain_scaling = CADeviceSupportsFilmGrain::has_capability;
  result = MGGetSInt64Answer();
  if (result == 33058)
  {
    *(_DWORD *)buffer = 0;
    v1 = *MEMORY[0x1E0CBBAA8];
    v2 = IOServiceNameMatching("arm-io");
    result = IOServiceGetMatchingService(v1, v2);
    if (!(_DWORD)result)
      goto LABEL_10;
    v3 = result;
    CFProperty = (const __CFData *)IORegistryEntryCreateCFProperty(result, CFSTR("chip-revision"), (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
    if (CFProperty)
    {
      v5 = CFProperty;
      v6 = CFGetTypeID(CFProperty);
      if (v6 == CFDataGetTypeID())
      {
        v9.location = 0;
        v9.length = 4;
        CFDataGetBytes(v5, v9, buffer);
      }
      CFRelease(v5);
    }
    result = IOObjectRelease(v3);
    if (!*(_DWORD *)buffer)
LABEL_10:
      CADeviceSupportsFilmGrainScaling::supports_film_grain_scaling = 0;
  }
  return result;
}

@end
