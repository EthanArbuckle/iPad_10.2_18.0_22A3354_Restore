@implementation NSArray

uint64_t __41__NSArray_AEAdditions__ae_firstMatching___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if ((_DWORD)result)
    *a4 = 1;
  return result;
}

@end
