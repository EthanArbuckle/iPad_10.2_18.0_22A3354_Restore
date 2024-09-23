@implementation CalDatabaseSetDefaultCalendarForEntityType

uint64_t __CalDatabaseSetDefaultCalendarForEntityType_block_invoke(uint64_t a1)
{
  uint64_t v2;
  BOOL v3;
  int v4;
  const os_unfair_lock *Context;
  uint64_t v6;
  BOOL v7;
  const os_unfair_lock *v8;
  uint64_t v9;
  BOOL v10;
  const os_unfair_lock *v11;
  const os_unfair_lock *v12;
  uint64_t v13;
  BOOL v14;
  const os_unfair_lock *v15;
  uint64_t v16;
  BOOL v17;
  const os_unfair_lock *v18;

  v2 = *(_QWORD *)(a1 + 48);
  if (CDBLockingAssertionsEnabled)
    v3 = v2 == 0;
  else
    v3 = 1;
  v4 = !v3;
  if (*(_QWORD *)(a1 + 40))
  {
    if (v4)
    {
      if (*(_QWORD *)v2)
      {
        if (*(_QWORD *)(*(_QWORD *)v2 + 104))
        {
          Context = (const os_unfair_lock *)CPRecordStoreGetContext();
          if (Context)
            os_unfair_lock_assert_owner(Context + 20);
        }
      }
    }
    CPSqliteConnectionSetValueForProperty();
    v6 = *(_QWORD *)(a1 + 48);
    if (CDBLockingAssertionsEnabled)
      v7 = v6 == 0;
    else
      v7 = 1;
    if (!v7)
    {
      if (*(_QWORD *)v6)
      {
        if (*(_QWORD *)(*(_QWORD *)v6 + 104))
        {
          v8 = (const os_unfair_lock *)CPRecordStoreGetContext();
          if (v8)
            os_unfair_lock_assert_owner(v8 + 20);
        }
      }
    }
    _CalCalendarGetStoreId(*(_QWORD *)(a1 + 40));
    CPSqliteConnectionSetIntegerForProperty();
    v9 = *(_QWORD *)(a1 + 48);
    if (CDBLockingAssertionsEnabled)
      v10 = v9 == 0;
    else
      v10 = 1;
    if (!v10)
    {
      if (*(_QWORD *)v9)
      {
        if (*(_QWORD *)(*(_QWORD *)v9 + 104))
        {
          v11 = (const os_unfair_lock *)CPRecordStoreGetContext();
          if (v11)
            os_unfair_lock_assert_owner(v11 + 20);
        }
      }
    }
    _CalCalendarGetTitle(*(_QWORD *)(a1 + 40));
  }
  else
  {
    if (v4)
    {
      if (*(_QWORD *)v2)
      {
        if (*(_QWORD *)(*(_QWORD *)v2 + 104))
        {
          v12 = (const os_unfair_lock *)CPRecordStoreGetContext();
          if (v12)
            os_unfair_lock_assert_owner(v12 + 20);
        }
      }
    }
    CPSqliteConnectionSetValueForProperty();
    v13 = *(_QWORD *)(a1 + 48);
    if (CDBLockingAssertionsEnabled)
      v14 = v13 == 0;
    else
      v14 = 1;
    if (!v14)
    {
      if (*(_QWORD *)v13)
      {
        if (*(_QWORD *)(*(_QWORD *)v13 + 104))
        {
          v15 = (const os_unfair_lock *)CPRecordStoreGetContext();
          if (v15)
            os_unfair_lock_assert_owner(v15 + 20);
        }
      }
    }
    CPSqliteConnectionSetValueForProperty();
    v16 = *(_QWORD *)(a1 + 48);
    if (CDBLockingAssertionsEnabled)
      v17 = v16 == 0;
    else
      v17 = 1;
    if (!v17)
    {
      if (*(_QWORD *)v16)
      {
        if (*(_QWORD *)(*(_QWORD *)v16 + 104))
        {
          v18 = (const os_unfair_lock *)CPRecordStoreGetContext();
          if (v18)
            os_unfair_lock_assert_owner(v18 + 20);
        }
      }
    }
  }
  return CPSqliteConnectionSetValueForProperty();
}

@end
