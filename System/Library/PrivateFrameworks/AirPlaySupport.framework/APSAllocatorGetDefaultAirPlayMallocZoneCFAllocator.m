@implementation APSAllocatorGetDefaultAirPlayMallocZoneCFAllocator

CFAllocatorRef __APSAllocatorGetDefaultAirPlayMallocZoneCFAllocator_block_invoke()
{
  CFAllocatorRef result;
  CFAllocatorContext context;

  if (APSAllocatorGetDefaultAirPlayMallocZone_once != -1)
    dispatch_once(&APSAllocatorGetDefaultAirPlayMallocZone_once, &__block_literal_global_2239);
  context.version = 0;
  context.info = (void *)APSAllocatorGetDefaultAirPlayMallocZone_mallocZone;
  memset(&context.retain, 0, 24);
  context.allocate = (CFAllocatorAllocateCallBack)APSAllocatorMallocZoneCFAllocate;
  context.reallocate = (CFAllocatorReallocateCallBack)APSAllocatorMallocZoneCFReallocate;
  context.deallocate = (CFAllocatorDeallocateCallBack)APSAllocatorMallocZoneCFDeallocate;
  context.preferredSize = 0;
  result = CFAllocatorCreate(0, &context);
  APSAllocatorGetDefaultAirPlayMallocZoneCFAllocator_allocator = (uint64_t)result;
  return result;
}

@end
