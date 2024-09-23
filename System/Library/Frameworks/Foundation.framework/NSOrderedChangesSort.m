@implementation NSOrderedChangesSort

uint64_t ___NSOrderedChangesSort_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(**(id **)(a1 + 40), "objectAtIndex:", *(_QWORD *)(a1 + 48) + a2), objc_msgSend(**(id **)(a1 + 40), "objectAtIndex:", *(_QWORD *)(a1 + 48) + a3));
}

@end
