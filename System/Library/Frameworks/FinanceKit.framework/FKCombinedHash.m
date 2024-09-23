@implementation FKCombinedHash

uint64_t __FKCombinedHash_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t result;

  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  result = objc_msgSend(a2, "hash");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result - v3 + 32 * v3;
  return result;
}

@end
