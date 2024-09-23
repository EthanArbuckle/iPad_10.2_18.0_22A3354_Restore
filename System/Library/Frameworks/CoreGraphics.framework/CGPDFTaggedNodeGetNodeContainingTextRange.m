@implementation CGPDFTaggedNodeGetNodeContainingTextRange

uint64_t __CGPDFTaggedNodeGetNodeContainingTextRange_block_invoke(_QWORD *a1, uint64_t a2)
{
  uint64_t NodeContainingTextRange;

  NodeContainingTextRange = CGPDFTaggedNodeGetNodeContainingTextRange(a2, a1[5], a1[6]);
  if (NodeContainingTextRange)
    *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = NodeContainingTextRange;
  return 1;
}

@end
