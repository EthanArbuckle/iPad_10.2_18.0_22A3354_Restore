@implementation BKSHIDServicesRequestProximityDetectionMode

void __BKSHIDServicesRequestProximityDetectionMode_block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setDigitizerEnabled:", 1);
  objc_msgSend(v3, "setProximityDetectionMode:", *(unsigned int *)(a1 + 32));

}

@end
