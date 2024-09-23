@implementation C3DFramebufferRegistryReleaseFramebuffer

void __C3DFramebufferRegistryReleaseFramebuffer_block_invoke(uint64_t a1, uint64_t a2)
{
  int v2;

  v2 = *(_DWORD *)(a2 + 76);
  if ((v2 - 1) <= 0x7FFFFFFC)
    *(_DWORD *)(a2 + 76) = --v2;
  if (!v2)
  {
    if (*(_QWORD *)(a2 + 48))
      _removeReference(*(_QWORD *)(a1 + 32), a2);
  }
}

@end
