@implementation APSRealTimeAllocatorGetDefault

void __APSRealTimeAllocatorGetDefault_block_invoke()
{
  MEMORY[0x1CAA42B10]();
  if (!*MEMORY[0x1E0DDB4F0])
  {
    __break(1u);
LABEL_7:
    dispatch_once(&rtReleaser_getInstance(void)::sRTReleaserOnce, &__block_literal_global_5);
    return;
  }
  APSCaulkMemoryResourceAllocatorCreate(*MEMORY[0x1E0DDB4F0], 0, (CFAllocatorRef *)&APSRealTimeAllocatorGetDefault::sRTAllocator);
  if (APSSettingsGetIntWithOverrideAndDefault(CFSTR("debugRTAllocator"), 0, 0))
    APSDebugAllocatorCreate((const void *)APSRealTimeAllocatorGetDefault::sRTAllocator, CFSTR("APSRealTimeAllocator"), (CFAllocatorRef *)&APSRealTimeAllocatorGetDefault::sRTAllocator);
  if (rtReleaser_getInstance(void)::sRTReleaserOnce != -1)
    goto LABEL_7;
}

@end
