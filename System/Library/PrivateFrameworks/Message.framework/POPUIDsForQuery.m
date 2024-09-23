@implementation POPUIDsForQuery

uint64_t __POPUIDsForQuery_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  sqlite3_stmt *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;

  v3 = a2;
  objc_msgSend(v3, "preparedStatementForQueryString:", *(_QWORD *)(a1 + 32));
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = (sqlite3_stmt *)objc_msgSend(v4, "compiled");

  if (v5)
  {
    sqlite3_bind_text(v5, 1, (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "UTF8String"), -1, 0);
    while (sqlite3_step(v5) == 100)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", sqlite3_column_text(v5, 0));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      if (!v7)
      {
        v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v10 = *(void **)(v9 + 40);
        *(_QWORD *)(v9 + 40) = v8;

        v7 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      }
      objc_msgSend(v7, "addObject:", v6);

    }
    sqlite3_reset(v5);
    objc_msgSend(v3, "checkForConnectionErrorWithMessage:", CFSTR("loading UIDs to delete"));
  }

  return 1;
}

@end
