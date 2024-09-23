@implementation APTNANDataSessionCreateStatisticsReport

void __APTNANDataSessionCreateStatisticsReport_block_invoke(uint64_t a1, const void *a2)
{
  const void *v4;

  if (NSErrorToOSStatus())
    CFArrayAppendInt64();
  else
    CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 40), a2);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  dispatch_release(*(dispatch_object_t *)(a1 + 32));
  v4 = *(const void **)(a1 + 40);
  if (v4)
    CFRelease(v4);
}

@end
