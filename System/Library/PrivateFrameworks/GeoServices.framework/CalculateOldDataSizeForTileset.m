@implementation CalculateOldDataSizeForTileset

uint64_t __CalculateOldDataSizeForTileset_block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v17;
  id v18;
  id obj;

  v4 = *(void **)(a1 + 32);
  v5 = *(unsigned int *)(a1 + 64);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v6 + 40);
  v7 = objc_msgSend(v4, "bindIntParameter:toValue:inStatement:error:", "@tileset", v5, a2, &obj);
  objc_storeStrong((id *)(v6 + 40), obj);
  if (!v7)
    return 0;
  v8 = *(void **)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 56);
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v18 = *(id *)(v10 + 40);
  v11 = objc_msgSend(v8, "bindInt64Parameter:toValue:inStatement:error:", "@insert_timestamp", v9, a2, &v18);
  objc_storeStrong((id *)(v10 + 40), v18);
  if (!v11)
    return 0;
  v12 = sqlite3_step(a2);
  v13 = 1;
  while ((_DWORD)v12 == 100)
  {
    objc_msgSend(*(id *)(a1 + 32), "int64ForColumn:inStatment:", 0, a2);
    objc_msgSend(*(id *)(a1 + 32), "intForColumn:inStatment:", 1, a2);
    objc_msgSend(*(id *)(a1 + 32), "intForColumn:inStatment:", 2, a2);
    if (!(*(unsigned int (**)(void))(*(_QWORD *)(a1 + 40) + 16))())
      return v13;
    v12 = sqlite3_step(a2);
  }
  if ((_DWORD)v12 != 101)
  {
    v14 = *(void **)(a1 + 32);
    v15 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v17 = *(id *)(v15 + 40);
    objc_msgSend(v14, "reportSQLiteErrorCode:method:error:", v12, CFSTR("step"), &v17);
    objc_storeStrong((id *)(v15 + 40), v17);
    return 0;
  }
  return 1;
}

@end
