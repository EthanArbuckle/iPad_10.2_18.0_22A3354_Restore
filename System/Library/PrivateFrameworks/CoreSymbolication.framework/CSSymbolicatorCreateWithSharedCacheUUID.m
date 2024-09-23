@implementation CSSymbolicatorCreateWithSharedCacheUUID

uint64_t __CSSymbolicatorCreateWithSharedCacheUUID_block_invoke(uint64_t a1, uint64_t a2, const UUID *a3, uint64_t **a4)
{
  uint64_t result;
  uint64_t v6;
  uint64_t v7;

  result = _createSymbolicatorFromSharedCacheSymbolOwners(*(unsigned int *)(a1 + 40), 0, a2, a3, a4);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  *(_QWORD *)(v6 + 40) = result;
  *(_QWORD *)(v6 + 48) = v7;
  return result;
}

@end
