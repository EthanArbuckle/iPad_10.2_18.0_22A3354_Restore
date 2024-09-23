@implementation FindValuesBetween

uint64_t __FindValuesBetween_block_invoke(uint64_t a1, sqlite3_stmt *a2)
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
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  id v24;
  id v26;
  id v27;
  id obj;

  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 56);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v6 + 40);
  v7 = objc_msgSend(v4, "bindInt64Parameter:toValue:inStatement:error:", "@begin", v5, a2, &obj);
  objc_storeStrong((id *)(v6 + 40), obj);
  if (!v7)
    return 0;
  v8 = *(void **)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 64);
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v27 = *(id *)(v10 + 40);
  v11 = objc_msgSend(v8, "bindInt64Parameter:toValue:inStatement:error:", "@end", v9, a2, &v27);
  objc_storeStrong((id *)(v10 + 40), v27);
  if (!v11)
    return 0;
  v12 = sqlite3_step(a2);
  while ((_DWORD)v12 == 100)
  {
    objc_msgSend(*(id *)(a1 + 32), "int64ForColumn:inStatment:", 0, a2);
    objc_msgSend(*(id *)(a1 + 32), "intForColumn:inStatment:", 1, a2);
    objc_msgSend(*(id *)(a1 + 32), "stringForColumn:inStatment:", 2, a2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "stringForColumn:inStatment:", 3, a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "stringForColumn:inStatment:", 4, a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "int64ForColumn:inStatment:", 5, a2);
    objc_msgSend(*(id *)(a1 + 32), "stringForColumn:inStatment:", 6, a2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    externalFileBaseURL(*(void **)(a1 + 32));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "URLByAppendingPathComponent:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
    {

      v21 = 0;
      goto LABEL_12;
    }
    objc_msgSend(*(id *)(a1 + 32), "stringForColumn:inStatment:", 7, a2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v14;
    if (((*(uint64_t (**)(_QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40)) & 1) == 0)
    {

      v21 = 1;
      goto LABEL_12;
    }
    v12 = sqlite3_step(a2);

  }
  if ((_DWORD)v12 == 101)
    return 1;
  v22 = *(void **)(a1 + 32);
  v23 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v26 = *(id *)(v23 + 40);
  objc_msgSend(v22, "reportSQLiteErrorCode:method:error:", v12, CFSTR("step"), &v26);
  v24 = v26;
  v21 = 0;
  v13 = *(void **)(v23 + 40);
  *(_QWORD *)(v23 + 40) = v24;
LABEL_12:

  return v21;
}

@end
