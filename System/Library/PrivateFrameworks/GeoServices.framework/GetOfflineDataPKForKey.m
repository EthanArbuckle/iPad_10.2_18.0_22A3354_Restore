@implementation GetOfflineDataPKForKey

uint64_t __GetOfflineDataPKForKey_block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  void *v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  id obj;

  v4 = *(void **)(a1 + 32);
  v5 = *(unsigned int *)(a1 + 72);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  obj = *(id *)(v6 + 40);
  v7 = objc_msgSend(v4, "bindIntParameter:toValue:inStatement:error:", "@layer", v5, a2, &obj);
  objc_storeStrong((id *)(v6 + 40), obj);
  if (v7)
  {
    v8 = *(void **)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 64);
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v23 = *(id *)(v10 + 40);
    v11 = objc_msgSend(v8, "bindInt64Parameter:toValue:inStatement:error:", "@version", v9, a2, &v23);
    objc_storeStrong((id *)(v10 + 40), v23);
    if (v11)
    {
      v12 = *(void **)(a1 + 32);
      v13 = *(_QWORD *)(a1 + 40);
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v22 = *(id *)(v14 + 40);
      v15 = objc_msgSend(v12, "bindBlobParameter:toValue:inStatement:error:", "@key", v13, a2, &v22);
      objc_storeStrong((id *)(v14 + 40), v22);
      if (v15)
      {
        while (1)
        {
          v16 = sqlite3_step(a2);
          v17 = v16;
          if ((_DWORD)v16 != 100)
            break;
          objc_msgSend(*(id *)(a1 + 32), "int64ForColumn:inStatment:", 0, a2);
          if (!(*(unsigned int (**)(void))(*(_QWORD *)(a1 + 48) + 16))())
            return 1;
        }
        if ((_DWORD)v16 == 101)
          return 1;
        v19 = *(void **)(a1 + 32);
        v20 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        v21 = *(id *)(v20 + 40);
        objc_msgSend(v19, "reportSQLiteErrorCode:method:error:", v17, CFSTR("step"), &v21);
        objc_storeStrong((id *)(v20 + 40), v21);
      }
    }
  }
  return 0;
}

@end
