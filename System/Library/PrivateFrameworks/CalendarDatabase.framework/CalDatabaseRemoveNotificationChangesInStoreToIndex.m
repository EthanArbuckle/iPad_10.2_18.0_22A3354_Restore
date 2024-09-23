@implementation CalDatabaseRemoveNotificationChangesInStoreToIndex

uint64_t __CalDatabaseRemoveNotificationChangesInStoreToIndex_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = _CalDatabaseRemoveNotificationChangesInStoreToIndex(*(const void **)(a1 + 40), 0xFFFFFFFFLL, *(_QWORD *)(a1 + 48));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
