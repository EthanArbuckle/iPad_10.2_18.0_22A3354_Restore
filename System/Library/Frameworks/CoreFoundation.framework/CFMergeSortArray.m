@implementation CFMergeSortArray

uint64_t __CFMergeSortArray_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD))(a1 + 32))(*(_QWORD *)(a1 + 40) + *(_QWORD *)(a1 + 48) * a2, *(_QWORD *)(a1 + 40) + *(_QWORD *)(a1 + 48) * a3, *(_QWORD *)(a1 + 56));
}

@end
