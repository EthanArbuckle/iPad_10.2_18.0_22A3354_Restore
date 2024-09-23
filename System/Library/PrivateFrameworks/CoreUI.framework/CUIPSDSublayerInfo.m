@implementation CUIPSDSublayerInfo

uint64_t __53___CUIPSDSublayerInfo_newWithSublayerCount_indexSet___block_invoke(uint64_t result, int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(_QWORD *)(result + 40);
  v3 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  v4 = *(_QWORD *)(v3 + 24);
  *(_QWORD *)(v3 + 24) = v4 + 1;
  *(_DWORD *)(v2 + 4 * v4) = a2;
  return result;
}

@end
