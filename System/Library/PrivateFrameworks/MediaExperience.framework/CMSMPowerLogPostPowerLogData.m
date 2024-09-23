@implementation CMSMPowerLogPostPowerLogData

void __CMSMPowerLogPostPowerLogData_block_invoke(uint64_t a1)
{
  const void *v2;
  const void *v3;

  PLLogRegisteredEvent();
  v2 = *(const void **)(a1 + 32);
  if (v2)
    CFRelease(v2);
  v3 = *(const void **)(a1 + 40);
  if (v3)
    CFRelease(v3);
}

@end
