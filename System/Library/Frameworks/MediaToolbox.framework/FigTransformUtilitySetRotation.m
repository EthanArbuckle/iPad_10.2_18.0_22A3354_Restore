@implementation FigTransformUtilitySetRotation

void __FigTransformUtilitySetRotation_block_invoke(uint64_t a1)
{
  int v1;
  uint64_t v2;
  const void *v4;

  v1 = *(_DWORD *)(a1 + 40);
  v2 = *(_QWORD *)(a1 + 32);
  if (v1 != *(_DWORD *)(v2 + 32))
  {
    v4 = *(const void **)(v2 + 88);
    if (v4)
    {
      CFRelease(v4);
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88) = 0;
      v1 = *(_DWORD *)(a1 + 40);
      v2 = *(_QWORD *)(a1 + 32);
    }
    *(_DWORD *)(v2 + 32) = v1;
  }
}

@end
