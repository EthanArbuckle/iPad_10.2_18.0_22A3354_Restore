@implementation FetchExpiredSubscriptions

BOOL __FetchExpiredSubscriptions_block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  char v10;
  void *v11;
  uint64_t v12;
  id obj;

  v4 = sqlite3_step(a2);
  do
  {
    if ((_DWORD)v4 != 100)
      break;
    objc_msgSend(*(id *)(a1 + 32), "stringForColumn:inStatment:", 0, a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "stringForColumn:inStatment:", 1, a2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "int64ForColumn:inStatment:", 2, a2);
    objc_msgSend(*(id *)(a1 + 32), "int64ForColumn:inStatment:", 3, a2);
    objc_msgSend(*(id *)(a1 + 32), "blobForColumn:inStatment:", 4, a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "stringForColumn:inStatment:", 5, a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "intForColumn:inStatment:", 6, a2);
    v9 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    v10 = v9;
    v4 = v9 ? sqlite3_step(a2) : 101;

  }
  while ((v10 & 1) != 0);
  if ((_DWORD)v4 != 101)
  {
    v11 = *(void **)(a1 + 32);
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    obj = *(id *)(v12 + 40);
    objc_msgSend(v11, "reportSQLiteErrorCode:method:error:", v4, CFSTR("step"), &obj);
    objc_storeStrong((id *)(v12 + 40), obj);
  }
  return (_DWORD)v4 == 101;
}

@end
