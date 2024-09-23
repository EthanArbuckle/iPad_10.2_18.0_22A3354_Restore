@implementation FVDUtilsH264DecoderSupports444

void __FVDUtilsH264DecoderSupports444_block_invoke()
{
  uint64_t v0;
  mach_port_t v1;
  const __CFDictionary *v2;
  uint64_t MatchingService;
  io_object_t v4;
  BOOL v5;
  BOOL v6;
  unsigned int v7;
  char v8[16];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v7 = 16;
  if (isAppleVirtualDevice_once != -1)
    dispatch_once(&isAppleVirtualDevice_once, &__block_literal_global_45);
  if (isAppleVirtualDevice_result)
  {
    FVDUtilsH264DecoderSupports444_result = 1;
  }
  else
  {
    v0 = 0;
    v1 = *MEMORY[0x1E0CBBAA8];
    while (1)
    {
      v2 = IOServiceMatching(FVDUtilsH264DecoderSupports444_drivers[v0]);
      MatchingService = IOServiceGetMatchingService(v1, v2);
      if ((_DWORD)MatchingService)
        break;
      if (++v0 == 3)
        return;
    }
    v4 = MatchingService;
    if (MEMORY[0x19402FD2C](MatchingService, "H264DecoderCanDo444", v8, &v7))
      v5 = 1;
    else
      v5 = v7 == 0;
    v6 = !v5 && strncasecmp(v8, "Yes", v7) == 0;
    FVDUtilsH264DecoderSupports444_result = v6;
    IOObjectRelease(v4);
  }
}

@end
