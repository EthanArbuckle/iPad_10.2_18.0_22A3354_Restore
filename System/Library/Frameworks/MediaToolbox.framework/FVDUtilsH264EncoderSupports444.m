@implementation FVDUtilsH264EncoderSupports444

void __FVDUtilsH264EncoderSupports444_block_invoke()
{
  uint64_t v0;
  mach_port_t v1;
  char i;
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
  v9 = 16;
  if (isAppleVirtualDevice_once != -1)
    dispatch_once(&isAppleVirtualDevice_once, &__block_literal_global_45);
  if (isAppleVirtualDevice_result)
  {
    FVDUtilsH264EncoderSupports444_result = 1;
  }
  else
  {
    v0 = 0;
    v1 = *MEMORY[0x1E0CBBAA8];
    for (i = 1; ; i = 0)
    {
      v3 = i;
      v4 = IOServiceMatching(FVDUtilsH264EncoderSupports444_drivers[v0]);
      MatchingService = IOServiceGetMatchingService(v1, v4);
      if ((_DWORD)MatchingService)
        break;
      v0 = 1;
      if ((v3 & 1) == 0)
        return;
    }
    v6 = MatchingService;
    if (MEMORY[0x19402FD2C](MatchingService, "H264EncoderCanDo444", v10, &v9))
      v7 = 1;
    else
      v7 = v9 == 0;
    v8 = !v7 && strncasecmp(v10, "Yes", v9) == 0;
    FVDUtilsH264EncoderSupports444_result = v8;
    IOObjectRelease(v6);
  }
}

@end
