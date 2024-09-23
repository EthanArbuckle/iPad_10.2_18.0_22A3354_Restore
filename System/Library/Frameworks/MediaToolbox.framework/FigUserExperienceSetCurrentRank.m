@implementation FigUserExperienceSetCurrentRank

void __FigUserExperienceSetCurrentRank_block_invoke(uint64_t a1)
{
  int v1;
  _DWORD *v2;

  v1 = *(_DWORD *)(a1 + 40);
  v2 = *(_DWORD **)(a1 + 32);
  v2[16] = v1;
  CFRelease(v2);
}

@end
