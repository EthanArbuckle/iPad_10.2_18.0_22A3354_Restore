@implementation CMSessionAddResource

uint64_t __CMSessionAddResource_block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    v3 = *(void **)(v2 + 16);
  else
    v3 = 0;
  result = MXCoreSessionAddResource(v3, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD **)(a1 + 64));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
