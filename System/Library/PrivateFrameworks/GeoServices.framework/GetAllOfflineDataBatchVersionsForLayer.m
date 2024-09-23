@implementation GetAllOfflineDataBatchVersionsForLayer

uint64_t __GetAllOfflineDataBatchVersionsForLayer_block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  void *v11;
  uint64_t v12;
  id v13;
  id obj;

  v4 = *(void **)(a1 + 32);
  v5 = *(unsigned int *)(a1 + 56);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v6 + 40);
  v7 = objc_msgSend(v4, "bindIntParameter:toValue:inStatement:error:", "@layer", v5, a2, &obj);
  objc_storeStrong((id *)(v6 + 40), obj);
  if (v7)
  {
    while (1)
    {
      v8 = sqlite3_step(a2);
      v9 = v8;
      if ((_DWORD)v8 != 100)
        break;
      objc_msgSend(*(id *)(a1 + 32), "int64ForColumn:inStatment:", 0, a2);
      if (!(*(unsigned int (**)(void))(*(_QWORD *)(a1 + 40) + 16))())
        return 1;
    }
    if ((_DWORD)v8 == 101)
      return 1;
    v11 = *(void **)(a1 + 32);
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v13 = *(id *)(v12 + 40);
    objc_msgSend(v11, "reportSQLiteErrorCode:method:error:", v9, CFSTR("step"), &v13);
    objc_storeStrong((id *)(v12 + 40), v13);
  }
  return 0;
}

@end
