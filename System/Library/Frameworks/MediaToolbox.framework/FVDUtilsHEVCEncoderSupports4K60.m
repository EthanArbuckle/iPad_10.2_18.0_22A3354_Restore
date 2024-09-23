@implementation FVDUtilsHEVCEncoderSupports4K60

void __FVDUtilsHEVCEncoderSupports4K60_block_invoke()
{
  mach_port_t v0;
  const __CFDictionary *v1;
  uint64_t MatchingService;
  io_object_t v3;
  BOOL v4;
  BOOL v5;
  unsigned int v6;
  char v7[16];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v6 = 16;
  if (isAppleVirtualDevice_once != -1)
    dispatch_once(&isAppleVirtualDevice_once, &__block_literal_global_45);
  if (isAppleVirtualDevice_result)
  {
    FVDUtilsHEVCEncoderSupports4K60_result = 1;
  }
  else
  {
    v0 = *MEMORY[0x1E0CBBAA8];
    v1 = IOServiceMatching("AppleAVE2Driver");
    MatchingService = IOServiceGetMatchingService(v0, v1);
    if ((_DWORD)MatchingService)
    {
      v3 = MatchingService;
      if (MEMORY[0x19402FD2C](MatchingService, "HEVCEncoderCanDo4k60", v7, &v6))
        v4 = 1;
      else
        v4 = v6 == 0;
      v5 = !v4 && strncasecmp(v7, "Yes", v6) == 0;
      FVDUtilsHEVCEncoderSupports4K60_result = v5;
      IOObjectRelease(v3);
    }
  }
}

@end
