@implementation CATransaction

void __64__CATransaction_BaseBoardUI__bs_performAfterSynchronizedCommit___block_invoke(uint64_t a1)
{
  dispatch_async(MEMORY[0x1E0C80D38], *(dispatch_block_t *)(a1 + 32));
}

void __52__CATransaction_BaseBoardUI__bs_performAfterCommit___block_invoke(uint64_t a1)
{
  dispatch_async(MEMORY[0x1E0C80D38], *(dispatch_block_t *)(a1 + 32));
}

@end
