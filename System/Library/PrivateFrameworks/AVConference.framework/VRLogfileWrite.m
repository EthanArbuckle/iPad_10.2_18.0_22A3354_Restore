@implementation VRLogfileWrite

size_t __VRLogfileWrite_block_invoke(uint64_t a1)
{
  return fwrite(*(const void **)(a1 + 32), *(_QWORD *)(a1 + 40), 1uLL, **(FILE ***)(a1 + 48));
}

@end
