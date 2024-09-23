@implementation CalDatabaseGetChangedObjectIDsSinceSequenceNumberForClient

void ___CalDatabaseGetChangedObjectIDsSinceSequenceNumberForClient_block_invoke(uint64_t a1, uint64_t a2, int a3, int a4, void *a5)
{
  id v8;
  id *v9;
  id *v10;
  id v11;
  uint64_t RecordStore;
  BOOL v13;
  const os_unfair_lock *Context;

  v8 = a5;
  v9 = (id *)(a1 + 40);
  v10 = (id *)(a1 + 56);
  if (a4)
    v10 = (id *)(a1 + 48);
  if (a3 == 6)
    v10 = (id *)(a1 + 32);
  if (a3 != 26)
    v9 = v10;
  v11 = *v9;
  RecordStore = _CalDatabaseGetRecordStore(*(_QWORD *)(a1 + 88));
  if (CDBLockingAssertionsEnabled)
    v13 = RecordStore == 0;
  else
    v13 = 1;
  if (!v13)
  {
    Context = (const os_unfair_lock *)CPRecordStoreGetContext();
    if (Context)
      os_unfair_lock_assert_owner(Context + 20);
  }
  CPRecordStoreGetChangesForClassWithBindBlockAndProperties();

}

@end
