@implementation CGPDFTaggedNodeGetNodeContainingPoint

uint64_t __CGPDFTaggedNodeGetNodeContainingPoint_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t NodeContainingPoint;

  NodeContainingPoint = CGPDFTaggedNodeGetNodeContainingPoint(a2, *(unsigned int *)(a1 + 64), *(unsigned __int8 *)(a1 + 68), *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56));
  if (NodeContainingPoint)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = NodeContainingPoint;
  return 1;
}

@end
