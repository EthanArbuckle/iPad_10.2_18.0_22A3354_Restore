@implementation FetchSubscriptionForPK

uint64_t __FetchSubscriptionForPK_block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  char v14;
  void *v16;
  uint64_t v17;
  id v18;
  id obj;

  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 56);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v6 + 40);
  v7 = objc_msgSend(v4, "bindInt64Parameter:toValue:inStatement:error:", "@rowid", v5, a2, &obj);
  objc_storeStrong((id *)(v6 + 40), obj);
  if (v7)
  {
    v8 = sqlite3_step(a2);
    do
    {
      if ((_DWORD)v8 != 100)
        break;
      objc_msgSend(*(id *)(a1 + 32), "int64ForColumn:inStatment:", 0, a2);
      objc_msgSend(*(id *)(a1 + 32), "stringForColumn:inStatment:", 1, a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "stringForColumn:inStatment:", 2, a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "int64ForColumn:inStatment:", 3, a2);
      objc_msgSend(*(id *)(a1 + 32), "int64ForColumn:inStatment:", 4, a2);
      objc_msgSend(*(id *)(a1 + 32), "int64ForColumn:inStatment:", 5, a2);
      objc_msgSend(*(id *)(a1 + 32), "blobForColumn:inStatment:", 6, a2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "stringForColumn:inStatment:", 7, a2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (*(uint64_t (**)(_QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40));
      v14 = v13;
      v8 = v13 ? sqlite3_step(a2) : 101;

    }
    while ((v14 & 1) != 0);
    if ((_DWORD)v8 == 101)
      return 1;
    v16 = *(void **)(a1 + 32);
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v18 = *(id *)(v17 + 40);
    objc_msgSend(v16, "reportSQLiteErrorCode:method:error:", v8, CFSTR("step"), &v18);
    objc_storeStrong((id *)(v17 + 40), v18);
  }
  return 0;
}

@end
