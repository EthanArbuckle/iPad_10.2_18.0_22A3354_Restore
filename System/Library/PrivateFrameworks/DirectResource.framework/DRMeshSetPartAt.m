@implementation DRMeshSetPartAt

__n128 __DRMeshSetPartAt_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  __n128 result;

  v2 = a2 + 96 * *(_QWORD *)(a1 + 64);
  *(_QWORD *)v2 = *(_QWORD *)(a1 + 72);
  *(_OWORD *)(v2 + 8) = *(_OWORD *)(a1 + 80);
  *(_QWORD *)(v2 + 24) = *(_QWORD *)(a1 + 96);
  *(_OWORD *)(v2 + 48) = *(_OWORD *)(a1 + 32);
  result = *(__n128 *)(a1 + 48);
  *(__n128 *)(v2 + 64) = result;
  return result;
}

@end
