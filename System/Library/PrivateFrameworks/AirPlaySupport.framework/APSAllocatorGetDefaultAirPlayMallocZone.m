@implementation APSAllocatorGetDefaultAirPlayMallocZone

void __APSAllocatorGetDefaultAirPlayMallocZone_block_invoke()
{
  APSAllocatorGetDefaultAirPlayMallocZone_mallocZone = (uint64_t)malloc_create_zone(0, 0);
  malloc_set_zone_name((malloc_zone_t *)APSAllocatorGetDefaultAirPlayMallocZone_mallocZone, "AirPlay");
}

@end
