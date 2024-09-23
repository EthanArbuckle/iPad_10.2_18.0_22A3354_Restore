@implementation FigNetworkInterfaceReporterCopyPhysicalStatistics

void __FigNetworkInterfaceReporterCopyPhysicalStatistics_block_invoke(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 320) + 32);
  if (v1)
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 40), CFSTR("freq"), v1);
}

@end
