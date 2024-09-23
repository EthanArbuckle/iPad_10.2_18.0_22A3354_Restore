@implementation ReadRowWithID

uint64_t __ReadRowWithID_block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v16;
  id obj;

  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 56);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v6 + 40);
  v7 = objc_msgSend(v4, "bindInt64Parameter:toValue:inStatement:error:", "@rowid", v5, a2, &obj);
  objc_storeStrong((id *)(v6 + 40), obj);
  if (!v7)
    return 0;
  v8 = sqlite3_step(a2);
  while ((_DWORD)v8 == 100)
  {
    objc_msgSend(*(id *)(a1 + 32), "int64ForColumn:inStatment:", 0, a2);
    objc_msgSend(*(id *)(a1 + 32), "int64ForColumn:inStatment:", 1, a2);
    objc_msgSend(*(id *)(a1 + 32), "blobForColumn:inStatment:", 2, a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "blobForColumn:inStatment:", 3, a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "doubleForColumn:inStatment:", 4, a2);
    if (((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))() & 1) == 0)
    {

      v11 = 1;
      goto LABEL_10;
    }
    v8 = sqlite3_step(a2);

  }
  if ((_DWORD)v8 == 101)
    return 1;
  v12 = *(void **)(a1 + 32);
  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v16 = *(id *)(v13 + 40);
  objc_msgSend(v12, "reportSQLiteErrorCode:method:error:", v8, CFSTR("step"), &v16);
  v14 = v16;
  v11 = 0;
  v9 = *(void **)(v13 + 40);
  *(_QWORD *)(v13 + 40) = v14;
LABEL_10:

  return v11;
}

@end
