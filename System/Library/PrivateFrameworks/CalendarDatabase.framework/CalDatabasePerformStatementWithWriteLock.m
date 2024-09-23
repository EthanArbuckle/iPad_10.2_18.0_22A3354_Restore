@implementation CalDatabasePerformStatementWithWriteLock

uint64_t ___CalDatabasePerformStatementWithWriteLock_block_invoke(uint64_t a1)
{
  uint64_t **v2;
  BOOL v3;
  uint64_t v4;
  const os_unfair_lock *Context;
  uint64_t result;

  v2 = *(uint64_t ***)(a1 + 40);
  if (CDBLockingAssertionsEnabled)
    v3 = v2 == 0;
  else
    v3 = 1;
  if (!v3)
  {
    if (*v2)
    {
      v4 = **v2;
      if (v4)
      {
        if (*(_QWORD *)(v4 + 104))
        {
          Context = (const os_unfair_lock *)CPRecordStoreGetContext();
          if (Context)
            os_unfair_lock_assert_owner(Context + 20);
        }
      }
    }
  }
  result = CPSqliteStatementPerform();
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  return result;
}

@end
