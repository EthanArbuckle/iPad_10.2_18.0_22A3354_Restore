@implementation TermTrieWalkFatParallel

uint64_t ___TermTrieWalkFatParallel_block_invoke(uint64_t a1)
{
  return term_fat_level_iterate_helper(*(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned int **)(a1 + 64), *(unsigned __int8 *)(a1 + 80));
}

@end
