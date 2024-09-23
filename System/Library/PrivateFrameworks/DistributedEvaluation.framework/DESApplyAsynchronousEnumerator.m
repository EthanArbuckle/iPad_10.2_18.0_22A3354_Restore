@implementation DESApplyAsynchronousEnumerator

uint64_t __DESApplyAsynchronousEnumerator_block_invoke(uint64_t a1)
{
  return DESApplyAsynchronousEnumerator(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

@end
