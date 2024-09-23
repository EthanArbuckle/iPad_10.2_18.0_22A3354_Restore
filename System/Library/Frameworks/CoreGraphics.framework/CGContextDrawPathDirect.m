@implementation CGContextDrawPathDirect

uint64_t __CGContextDrawPathDirect_block_invoke(uint64_t a1, CFTypeRef cf)
{
  return CGContextDelegateDrawPathDirect(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96), *(unsigned int *)(a1 + 48), cf, *(_QWORD *)(a1 + 40));
}

@end
