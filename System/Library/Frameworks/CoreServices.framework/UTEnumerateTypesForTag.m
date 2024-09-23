@implementation UTEnumerateTypesForTag

uint64_t ___UTEnumerateTypesForTag_block_invoke(uint64_t result, uint64_t a2, int a3)
{
  uint64_t v3;

  if ((a3 & 3) == 0 && (a3 & 0xFFFFFFFC) != 0)
  {
    v3 = result;
    result = CSStoreGetUnit();
    if (result)
      return (*(uint64_t (**)(void))(*(_QWORD *)(v3 + 40) + 16))();
  }
  return result;
}

@end
