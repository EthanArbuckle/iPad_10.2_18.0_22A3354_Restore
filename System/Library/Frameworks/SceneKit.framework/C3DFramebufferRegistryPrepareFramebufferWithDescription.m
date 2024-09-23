@implementation C3DFramebufferRegistryPrepareFramebufferWithDescription

uint64_t __C3DFramebufferRegistryPrepareFramebufferWithDescription_block_invoke(uint64_t result, uint64_t a2)
{
  unsigned int v2;

  *(_DWORD *)(a2 + 80) = *(_DWORD *)(*(_QWORD *)(result + 32) + 64);
  v2 = *(_DWORD *)(a2 + 76);
  if (v2 <= 0x7FFFFFFD)
    *(_DWORD *)(a2 + 76) = v2 + 1;
  return result;
}

@end
