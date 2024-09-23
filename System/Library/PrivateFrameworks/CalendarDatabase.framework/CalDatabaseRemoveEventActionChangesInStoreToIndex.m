@implementation CalDatabaseRemoveEventActionChangesInStoreToIndex

uint64_t __CalDatabaseRemoveEventActionChangesInStoreToIndex_block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = _CalDatabaseRemoveEventActionChangesInStoreToIndex(a1[5], a1[6]);
  *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = result;
  return result;
}

@end
