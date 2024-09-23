@implementation CalDatabaseRemoveCalendarItemChangesInCalendarToIndex

uint64_t __CalDatabaseRemoveCalendarItemChangesInCalendarToIndex_block_invoke(uint64_t a1)
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
  result = CPRecordStoreDeleteChangesForClassToIndexWhereWithBindBlock();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

uint64_t __CalDatabaseRemoveCalendarItemChangesInCalendarToIndex_block_invoke_2(uint64_t a1, uint64_t a2, int a3)
{
  int v4;
  sqlite3_stmt *v5;
  int ID;

  v4 = a3 + 1;
  sqlite3_bind_int(*(sqlite3_stmt **)(a2 + 8), a3, *(_DWORD *)(a1 + 40));
  v5 = *(sqlite3_stmt **)(a2 + 8);
  ID = CPRecordGetID();
  return sqlite3_bind_int(v5, v4, ID);
}

@end
