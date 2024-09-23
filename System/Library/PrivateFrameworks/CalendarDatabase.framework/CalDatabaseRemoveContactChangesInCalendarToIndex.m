@implementation CalDatabaseRemoveContactChangesInCalendarToIndex

uint64_t __CalDatabaseRemoveContactChangesInCalendarToIndex_block_invoke(uint64_t a1)
{
  uint64_t RecordStore;
  BOOL v3;
  const os_unfair_lock *Context;
  uint64_t result;

  RecordStore = _CalDatabaseGetRecordStore(*(_QWORD *)(a1 + 40));
  if (CDBLockingAssertionsEnabled)
    v3 = RecordStore == 0;
  else
    v3 = 1;
  if (!v3)
  {
    Context = (const os_unfair_lock *)CPRecordStoreGetContext();
    if (Context)
      os_unfair_lock_assert_owner(Context + 20);
  }
  result = CPRecordStoreDeleteChangesForClassToIndexWhere();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
