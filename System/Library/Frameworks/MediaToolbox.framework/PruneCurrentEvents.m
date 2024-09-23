@implementation PruneCurrentEvents

void __fpic_PruneCurrentEvents_block_invoke(uint64_t a1)
{
  fpic_PruneCurrentEventsToQueue(*(const void **)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 56));
}

@end
