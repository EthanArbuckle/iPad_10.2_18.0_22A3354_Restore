@implementation CGContextDrawPath

uint64_t __CGContextDrawPath_block_invoke(uint64_t a1, CFTypeRef cf)
{
  return CGContextDelegateDrawPath(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96), *(unsigned int *)(a1 + 40), cf);
}

@end
