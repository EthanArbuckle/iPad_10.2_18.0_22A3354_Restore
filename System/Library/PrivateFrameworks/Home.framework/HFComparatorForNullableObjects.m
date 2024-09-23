@implementation HFComparatorForNullableObjects

uint64_t __HFComparatorForNullableObjects_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  v3 = (a2 | a3) != 0;
  if (a2 && (v3 = -1, a3))
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  else
    return v3;
}

@end
