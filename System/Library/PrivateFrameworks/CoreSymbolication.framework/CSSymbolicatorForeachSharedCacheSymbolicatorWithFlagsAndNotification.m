@implementation CSSymbolicatorForeachSharedCacheSymbolicatorWithFlagsAndNotification

unsigned int *__CSSymbolicatorForeachSharedCacheSymbolicatorWithFlagsAndNotification_block_invoke(uint64_t a1, uint64_t a2, const UUID *a3, uint64_t **a4)
{
  unsigned int *SymbolicatorFromSharedCacheSymbolOwners;
  uint64_t v6;
  uint64_t v7;
  unsigned int *result;
  uint64_t v9;

  SymbolicatorFromSharedCacheSymbolOwners = (unsigned int *)_createSymbolicatorFromSharedCacheSymbolOwners(*(unsigned int *)(a1 + 56), *(_QWORD *)(a1 + 32), a2, a3, a4);
  v7 = v6;
  result = (unsigned int *)CSIsNull((char)SymbolicatorFromSharedCacheSymbolOwners, v6);
  if ((result & 1) == 0)
  {
    v9 = *(_QWORD *)(a1 + 40);
    if (v9)
      (*(void (**)(uint64_t, unsigned int *, uint64_t))(v9 + 16))(v9, SymbolicatorFromSharedCacheSymbolOwners, v7);
    result = CSRelease(SymbolicatorFromSharedCacheSymbolOwners, v7);
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  }
  return result;
}

@end
