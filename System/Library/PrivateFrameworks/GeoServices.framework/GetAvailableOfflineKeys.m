@implementation GetAvailableOfflineKeys

uint64_t __GetAvailableOfflineKeys_block_invoke(uint64_t a1, sqlite3_stmt *a2)
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
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  id v19;
  id v20;
  id obj;

  v4 = *(void **)(a1 + 32);
  v5 = *(unsigned int *)(a1 + 64);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v6 + 40);
  v7 = objc_msgSend(v4, "bindIntParameter:toValue:inStatement:error:", "@offline_data_layer", v5, a2, &obj);
  objc_storeStrong((id *)(v6 + 40), obj);
  if (!v7)
    return 0;
  v8 = *(void **)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 56);
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v20 = *(id *)(v10 + 40);
  v11 = objc_msgSend(v8, "bindInt64Parameter:toValue:inStatement:error:", "@offline_data_version", v9, a2, &v20);
  objc_storeStrong((id *)(v10 + 40), v20);
  if (!v11)
    return 0;
  v12 = sqlite3_step(a2);
  while ((_DWORD)v12 == 100)
  {
    objc_msgSend(*(id *)(a1 + 32), "blobForColumn:inStatment:", 0, a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!(*(unsigned int (**)(void))(*(_QWORD *)(a1 + 40) + 16))())
    {
      v14 = 1;
      goto LABEL_11;
    }
    v12 = sqlite3_step(a2);

  }
  if ((_DWORD)v12 == 101)
    return 1;
  v15 = *(void **)(a1 + 32);
  v16 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v19 = *(id *)(v16 + 40);
  objc_msgSend(v15, "reportSQLiteErrorCode:method:error:", v12, CFSTR("step"), &v19);
  v17 = v19;
  v14 = 0;
  v13 = *(void **)(v16 + 40);
  *(_QWORD *)(v16 + 40) = v17;
LABEL_11:

  return v14;
}

@end
