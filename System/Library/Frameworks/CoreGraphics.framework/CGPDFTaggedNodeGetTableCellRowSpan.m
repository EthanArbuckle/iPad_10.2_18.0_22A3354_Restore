@implementation CGPDFTaggedNodeGetTableCellRowSpan

uint64_t __CGPDFTaggedNodeGetTableCellRowSpan_block_invoke(uint64_t a1, uint64_t a2)
{
  return CountRowElements(a2, *(_QWORD *)(a1 + 40), (_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24)) ^ 1;
}

@end
