@implementation FPCrossDeviceItemIDExtendedForReceivingApplication

intptr_t __FPCrossDeviceItemIDExtendedForReceivingApplication_block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

@end
