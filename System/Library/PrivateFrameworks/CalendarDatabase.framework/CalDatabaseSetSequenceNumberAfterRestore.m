@implementation CalDatabaseSetSequenceNumberAfterRestore

uint64_t ___CalDatabaseSetSequenceNumberAfterRestore_block_invoke(uint64_t a1)
{
  uint64_t v1;
  BOOL v2;
  const os_unfair_lock *Context;

  v1 = *(_QWORD *)(a1 + 32);
  if (CDBLockingAssertionsEnabled)
    v2 = v1 == 0;
  else
    v2 = 1;
  if (!v2)
  {
    if (*(_QWORD *)v1)
    {
      if (*(_QWORD *)(*(_QWORD *)v1 + 104))
      {
        Context = (const os_unfair_lock *)CPRecordStoreGetContext();
        if (Context)
          os_unfair_lock_assert_owner(Context + 20);
      }
    }
  }
  return CPSqliteConnectionSetIntegerForProperty();
}

@end
