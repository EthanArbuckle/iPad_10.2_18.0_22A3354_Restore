@implementation RemoveAllSubscriptionsForDataType

uint64_t __RemoveAllSubscriptionsForDataType_block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  char v18;
  void *v20;
  uint64_t v21;
  id v22;
  id obj;

  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 56);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v6 + 40);
  v7 = objc_msgSend(v4, "bindInt64Parameter:toValue:inStatement:error:", "@data_types", v5, a2, &obj);
  objc_storeStrong((id *)(v6 + 40), obj);
  if (v7)
  {
    v8 = sqlite3_step(a2);
    do
    {
      if ((_DWORD)v8 != 100)
        break;
      v9 = objc_msgSend(*(id *)(a1 + 32), "int64ForColumn:inStatment:", 0, a2);
      objc_msgSend(*(id *)(a1 + 32), "stringForColumn:inStatment:", 1, a2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "stringForColumn:inStatment:", 2, a2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(*(id *)(a1 + 32), "int64ForColumn:inStatment:", 3, a2);
      v13 = objc_msgSend(*(id *)(a1 + 32), "int64ForColumn:inStatment:", 4, a2);
      v14 = objc_msgSend(*(id *)(a1 + 32), "int64ForColumn:inStatment:", 5, a2);
      objc_msgSend(*(id *)(a1 + 32), "blobForColumn:inStatment:", 6, a2);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "stringForColumn:inStatment:", 7, a2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (*(uint64_t (**)(_QWORD, uint64_t, void *, void *, uint64_t, uint64_t, uint64_t, void *, void *, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v9, v10, v11, v12, v13, v14, v15, v16, objc_msgSend(*(id *)(a1 + 32), "int64ForColumn:inStatment:", 8, a2));
      v18 = v17;
      v8 = v17 ? sqlite3_step(a2) : 101;

    }
    while ((v18 & 1) != 0);
    if ((_DWORD)v8 == 101)
      return 1;
    v20 = *(void **)(a1 + 32);
    v21 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v22 = *(id *)(v21 + 40);
    objc_msgSend(v20, "reportSQLiteErrorCode:method:error:", v8, CFSTR("step"), &v22);
    objc_storeStrong((id *)(v21 + 40), v22);
  }
  return 0;
}

@end
