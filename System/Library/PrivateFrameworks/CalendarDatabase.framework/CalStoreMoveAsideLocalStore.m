@implementation CalStoreMoveAsideLocalStore

uint64_t ___CalStoreMoveAsideLocalStore_block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  BOOL v5;
  const os_unfair_lock *Context;
  uint64_t **v7;
  uint64_t **v8;
  uint64_t v9;
  const os_unfair_lock *v10;
  int v11;
  uint64_t v12;
  const os_unfair_lock *v13;
  BOOL v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  uint8_t buf[4];
  _DWORD v20[7];

  *(_QWORD *)&v20[5] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithValidatedFormat:validFormatSpecifiers:error:", a2, CFSTR("%i%i"), 0, *(unsigned int *)(a1 + 40), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 32);
  if (CDBLockingAssertionsEnabled)
    v5 = v4 == 0;
  else
    v5 = 1;
  if (!v5)
  {
    if (*(_QWORD *)v4)
    {
      if (*(_QWORD *)(*(_QWORD *)v4 + 104))
      {
        Context = (const os_unfair_lock *)CPRecordStoreGetContext();
        if (Context)
          os_unfair_lock_assert_owner(Context + 20);
      }
    }
  }
  v7 = (uint64_t **)CPSqliteConnectionStatementForSQL();
  if (v7)
  {
    v8 = v7;
    if (CDBLockingAssertionsEnabled)
    {
      if (*v7)
      {
        v9 = **v7;
        if (v9)
        {
          if (*(_QWORD *)(v9 + 104))
          {
            v10 = (const os_unfair_lock *)CPRecordStoreGetContext();
            if (v10)
              os_unfair_lock_assert_owner(v10 + 20);
          }
        }
      }
    }
    v11 = CPSqliteStatementPerform();
    if (CDBLockingAssertionsEnabled)
    {
      if (*v8)
      {
        v12 = **v8;
        if (v12)
        {
          if (*(_QWORD *)(v12 + 104))
          {
            v13 = (const os_unfair_lock *)CPRecordStoreGetContext();
            if (v13)
              os_unfair_lock_assert_owner(v13 + 20);
          }
        }
      }
    }
    CPSqliteStatementReset();
    if (v11)
      v14 = v11 == 101;
    else
      v14 = 1;
    v15 = v14;
    if (v11)
    {
      if (v11 != 101)
      {
        v16 = CDBLogHandle;
        if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109378;
          v20[0] = v11;
          LOWORD(v20[1]) = 2114;
          *(_QWORD *)((char *)&v20[1] + 2) = v3;
          _os_log_impl(&dword_1A5CCB000, v16, OS_LOG_TYPE_ERROR, "Unexpected result %i for sql \"%{public}@\", buf, 0x12u);
        }
      }
    }
  }
  else
  {
    v17 = CDBLogHandle;
    if (os_log_type_enabled((os_log_t)CDBLogHandle, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)v20 = v3;
      _os_log_impl(&dword_1A5CCB000, v17, OS_LOG_TYPE_ERROR, "Couldn't get statement for sql \"%{public}@\", buf, 0xCu);
    }
    v15 = 0;
  }

  return v15;
}

@end
