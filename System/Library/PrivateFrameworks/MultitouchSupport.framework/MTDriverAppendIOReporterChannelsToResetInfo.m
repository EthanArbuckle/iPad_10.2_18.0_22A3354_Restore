@implementation MTDriverAppendIOReporterChannelsToResetInfo

uint64_t ___MTDriverAppendIOReporterChannelsToResetInfo_block_invoke(uint64_t a1)
{
  const void *ChannelName;
  CFNumberRef v3;
  CFNumberRef v4;
  uint64_t valuePtr;

  ChannelName = (const void *)IOReportChannelGetChannelName();
  valuePtr = IOReportSimpleGetIntegerValue();
  v3 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberIntType, &valuePtr);
  if (v3)
  {
    v4 = v3;
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 32), ChannelName, v3);
    CFRelease(v4);
  }
  return 0;
}

@end
