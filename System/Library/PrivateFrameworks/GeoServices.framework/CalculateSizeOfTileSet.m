@implementation CalculateSizeOfTileSet

uint64_t __CalculateSizeOfTileSet_block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v13;
  id obj;

  v4 = *(void **)(a1 + 32);
  v5 = *(unsigned int *)(a1 + 56);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v6 + 40);
  v7 = objc_msgSend(v4, "bindIntParameter:toValue:inStatement:error:", "@tileset", v5, a2, &obj);
  objc_storeStrong((id *)(v6 + 40), obj);
  if (!v7)
    return 0;
  v8 = sqlite3_step(a2);
  v9 = 1;
  while ((_DWORD)v8 == 100)
  {
    objc_msgSend(*(id *)(a1 + 32), "int64ForColumn:inStatment:", 0, a2);
    objc_msgSend(*(id *)(a1 + 32), "intForColumn:inStatment:", 1, a2);
    if (!(*(unsigned int (**)(void))(*(_QWORD *)(a1 + 40) + 16))())
      return v9;
    v8 = sqlite3_step(a2);
  }
  if ((_DWORD)v8 != 101)
  {
    v10 = *(void **)(a1 + 32);
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v13 = *(id *)(v11 + 40);
    objc_msgSend(v10, "reportSQLiteErrorCode:method:error:", v8, CFSTR("step"), &v13);
    objc_storeStrong((id *)(v11 + 40), v13);
    return 0;
  }
  return 1;
}

@end
