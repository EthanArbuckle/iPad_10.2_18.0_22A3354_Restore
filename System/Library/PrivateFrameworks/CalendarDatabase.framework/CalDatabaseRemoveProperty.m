@implementation CalDatabaseRemoveProperty

uint64_t __CalDatabaseRemoveProperty_block_invoke(uint64_t a1)
{
  BOOL v1;
  const os_unfair_lock *Context;

  if (CDBLockingAssertionsEnabled)
    v1 = *(_QWORD *)(a1 + 32) == 0;
  else
    v1 = 1;
  if (!v1)
  {
    Context = (const os_unfair_lock *)CPRecordStoreGetContext();
    if (Context)
      os_unfair_lock_assert_owner(Context + 20);
  }
  return CPRecordStoreRemoveProperty();
}

@end
