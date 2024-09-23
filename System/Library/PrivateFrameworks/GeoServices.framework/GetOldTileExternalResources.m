@implementation GetOldTileExternalResources

uint64_t __GetOldTileExternalResources_block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v15;
  id obj;

  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 56);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v6 + 40);
  v7 = objc_msgSend(v4, "bindInt64Parameter:toValue:inStatement:error:", "@insert_timestamp", v5, a2, &obj);
  objc_storeStrong((id *)(v6 + 40), obj);
  if (!v7)
    return 0;
  v8 = sqlite3_step(a2);
  while ((_DWORD)v8 == 100)
  {
    objc_msgSend(*(id *)(a1 + 32), "UUIDForColumn:inStatment:", 0, a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!(*(unsigned int (**)(void))(*(_QWORD *)(a1 + 40) + 16))())
    {
      v10 = 1;
      goto LABEL_10;
    }
    v8 = sqlite3_step(a2);

  }
  if ((_DWORD)v8 == 101)
    return 1;
  v11 = *(void **)(a1 + 32);
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v15 = *(id *)(v12 + 40);
  objc_msgSend(v11, "reportSQLiteErrorCode:method:error:", v8, CFSTR("step"), &v15);
  v13 = v15;
  v10 = 0;
  v9 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v13;
LABEL_10:

  return v10;
}

@end
