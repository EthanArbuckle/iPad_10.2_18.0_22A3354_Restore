@implementation NUAbstractStorage

void __45___NUAbstractStorage_fillBufferWithPattern4___block_invoke(uint64_t a1, void *a2)
{
  memset_pattern4((void *)objc_msgSend(a2, "mutableBytes"), (const void *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

@end
