@implementation APAdvertiserCopyNANWifiStats

uint64_t __APAdvertiserCopyNANWifiStats_block_invoke(uint64_t result)
{
  uint64_t v1;

  if (*(_QWORD *)(*(_QWORD *)(result + 48) + 160))
  {
    v1 = result;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = 1;
    CFRetain(*(CFTypeRef *)(result + 56));
    dispatch_retain(*(dispatch_object_t *)(v1 + 32));
    return BonjourAdvertiserGenerateStatisticsNAN();
  }
  return result;
}

void __APAdvertiserCopyNANWifiStats_block_invoke_2(uint64_t a1)
{
  const void *v2;

  if (NSErrorToOSStatus())
  {
    CFArrayAppendInt64();
  }
  else if (APTNANDataSessionStatisticsReportCopyDictionary())
  {
    APSLogErrorAt();
  }
  else
  {
    CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 40), 0);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  dispatch_release(*(dispatch_object_t *)(a1 + 32));
  v2 = *(const void **)(a1 + 40);
  if (v2)
    CFRelease(v2);
}

@end
