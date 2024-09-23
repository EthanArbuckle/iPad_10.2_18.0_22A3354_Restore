@implementation APSenderStatsCollectorGetShared

uint64_t __APSenderStatsCollectorGetShared_block_invoke()
{
  const __CFAllocator *v0;
  uint64_t Instance;
  uint64_t v2;
  uint64_t result;

  v0 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  if (APSenderStatsCollectorGetTypeID_once != -1)
    dispatch_once(&APSenderStatsCollectorGetTypeID_once, &__block_literal_global_8);
  Instance = _CFRuntimeCreateInstance();
  v2 = Instance;
  if (Instance)
  {
    *(_QWORD *)(Instance + 112) = 0;
    *(_OWORD *)(Instance + 80) = 0u;
    *(_OWORD *)(Instance + 96) = 0u;
    *(_OWORD *)(Instance + 48) = 0u;
    *(_OWORD *)(Instance + 64) = 0u;
    *(_OWORD *)(Instance + 16) = 0u;
    *(_OWORD *)(Instance + 32) = 0u;
    *(_QWORD *)(Instance + 16) = dispatch_queue_create("APSenderStatsCollectorQueue", 0);
    *(_QWORD *)(v2 + 24) = CFDictionaryCreateMutable(v0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    *(_QWORD *)(v2 + 32) = NanosecondsToUpTicks();
    *(_QWORD *)(v2 + 48) = NanosecondsToUpTicks();
    *(double *)(v2 + 64) = (double)(unint64_t)UpTicksPerSecond();
    *(_OWORD *)(v2 + 72) = xmmword_1C964DA30;
    *(_BYTE *)(v2 + 88) = 0;
    *(_BYTE *)(v2 + 112) = 1;
    result = IsAppleInternalBuild();
    *(_BYTE *)(v2 + 112) = result;
  }
  else
  {
    result = APSLogErrorAt();
  }
  APSenderStatsCollectorGetShared_collector = v2;
  return result;
}

@end
