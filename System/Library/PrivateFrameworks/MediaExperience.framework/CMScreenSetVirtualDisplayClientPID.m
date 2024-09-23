@implementation CMScreenSetVirtualDisplayClientPID

uint64_t __CMScreenSetVirtualDisplayClientPID_block_invoke(uint64_t a1)
{
  return softLinkBKSDisplayServicesSetVirtualDisplayClientPID(*(unsigned int *)(a1 + 32));
}

@end
