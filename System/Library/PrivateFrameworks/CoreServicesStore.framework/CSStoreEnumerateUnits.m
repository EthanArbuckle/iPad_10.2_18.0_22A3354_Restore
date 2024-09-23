@implementation CSStoreEnumerateUnits

uint64_t ___CSStoreEnumerateUnits_block_invoke(uint64_t a1, uint64_t a2, BOOL *a3)
{
  uint64_t result;
  char v5;

  v5 = 0;
  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  *a3 = v5 != 0;
  return result;
}

@end
