@implementation CalDatabaseRemoveParticipantChangesInStoreToIndex

uint64_t ___CalDatabaseRemoveParticipantChangesInStoreToIndex_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = _CalDatabaseRemoveParticipantChangesInStoreToIndexInternal(*(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 56), *(_QWORD *)(a1 + 48));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
