@implementation CMScreenSetMirroringMode

uint64_t __CMScreenSetMirroringMode_block_invoke(uint64_t a1)
{
  return softLinkBKSDisplayServicesSetCloneMirroringMode(*(unsigned int *)(a1 + 32));
}

@end
