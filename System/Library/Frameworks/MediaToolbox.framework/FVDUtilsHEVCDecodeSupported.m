@implementation FVDUtilsHEVCDecodeSupported

void __FVDUtilsHEVCDecodeSupported_block_invoke()
{
  uint64_t v0;
  char v1;
  mach_port_t v2;
  char v3;
  const __CFDictionary *v4;
  uint64_t MatchingService;
  io_object_t v6;
  BOOL v7;
  BOOL v8;
  unsigned int v9;
  char v10[16];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (isAppleVirtualDevice_once != -1)
    dispatch_once(&isAppleVirtualDevice_once, &__block_literal_global_45);
  if (isAppleVirtualDevice_result)
  {
    FVDUtilsHEVCDecodeSupported_result = 1;
  }
  else
  {
    v0 = 0;
    v1 = 1;
    v2 = *MEMORY[0x1E0CBBAA8];
    do
    {
      v3 = v1;
      v9 = 16;
      v4 = IOServiceMatching(FVDUtilsHEVCDecodeSupported_drivers[v0]);
      MatchingService = IOServiceGetMatchingService(v2, v4);
      if ((_DWORD)MatchingService)
      {
        v6 = MatchingService;
        v7 = MEMORY[0x19402FD2C](MatchingService, "HEVCSupported", v10, &v9) || v9 == 0;
        v8 = !v7 && strncasecmp(v10, "Yes", v9) == 0;
        FVDUtilsHEVCDecodeSupported_result = v8;
        IOObjectRelease(v6);
        if (FVDUtilsHEVCDecodeSupported_result)
          break;
      }
      v1 = 0;
      v0 = 1;
    }
    while ((v3 & 1) != 0);
  }
}

@end
