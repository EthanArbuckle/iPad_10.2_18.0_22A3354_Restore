@implementation CADeviceHasBacklight

uint64_t __CADeviceHasBacklight_block_invoke()
{
  const CFDictionaryKeyCallBacks *v0;
  const CFDictionaryValueCallBacks *v1;
  const __CFDictionary *v2;
  uint64_t result;
  const __CFString *v4;
  void *keys;
  void *values[2];

  values[1] = *(void **)MEMORY[0x1E0C80C00];
  keys = CFSTR("backlight-control");
  v0 = (const CFDictionaryKeyCallBacks *)MEMORY[0x1E0C9B390];
  v1 = (const CFDictionaryValueCallBacks *)MEMORY[0x1E0C9B3A0];
  values[0] = CFDictionaryCreate(0, (const void **)&keys, MEMORY[0x1E0C9AE50], 1, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  v4 = CFSTR("IOPropertyMatch");
  v2 = CFDictionaryCreate(0, (const void **)&v4, (const void **)values, 1, v0, v1);
  CFRelease(values[0]);
  result = IOServiceGetMatchingService(*MEMORY[0x1E0CBBAA8], v2);
  if ((_DWORD)result)
  {
    CADeviceHasBacklight::has_backlight = 1;
    return IOObjectRelease(result);
  }
  return result;
}

@end
