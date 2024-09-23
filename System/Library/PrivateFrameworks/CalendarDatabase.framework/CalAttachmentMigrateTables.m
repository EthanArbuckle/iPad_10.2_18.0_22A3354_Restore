@implementation CalAttachmentMigrateTables

uint64_t __CalAttachmentMigrateTables_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t **v8;
  BOOL v9;
  uint64_t v10;
  const os_unfair_lock *Context;
  uint64_t v12;
  uint64_t **v13;
  uint64_t v14;
  const os_unfair_lock *v15;
  uint64_t v16;

  v5 = a3;
  if (*(int *)(a1 + 40) <= 16008 && objc_msgSend(a2, "isEqualToString:", CFSTR("file_id")))
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("UUID"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (!v6)
      goto LABEL_23;
    sqlite3_bind_text(*(sqlite3_stmt **)(*(_QWORD *)(a1 + 32) + 8), 1, (const char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String"), -1, 0);
    v8 = *(uint64_t ***)(a1 + 32);
    if (CDBLockingAssertionsEnabled)
      v9 = v8 == 0;
    else
      v9 = 1;
    if (!v9)
    {
      if (*v8)
      {
        v10 = **v8;
        if (v10)
        {
          if (*(_QWORD *)(v10 + 104))
          {
            Context = (const os_unfair_lock *)CPRecordStoreGetContext();
            if (Context)
              os_unfair_lock_assert_owner(Context + 20);
          }
        }
      }
    }
    v12 = CPSqliteStatementInteger64Result();
    v13 = *(uint64_t ***)(a1 + 32);
    if (CDBLockingAssertionsEnabled)
    {
      if (v13)
      {
        if (*v13)
        {
          v14 = **v13;
          if (v14)
          {
            if (*(_QWORD *)(v14 + 104))
            {
              v15 = (const os_unfair_lock *)CPRecordStoreGetContext();
              if (v15)
                os_unfair_lock_assert_owner(v15 + 20);
            }
          }
        }
      }
    }
    CPSqliteStatementReset();
    if (v12)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v12);
      v16 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
LABEL_23:
      v16 = 0;
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

@end
