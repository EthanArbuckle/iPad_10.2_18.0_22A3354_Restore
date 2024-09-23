@implementation CFBasicHashGetCount

uint64_t __CFBasicHashGetCount_block_invoke(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) += *(_QWORD *)(a2 + 40);
  return 1;
}

@end
