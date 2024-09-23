@implementation FindValuesBetweenOfType

uint64_t __FindValuesBetweenOfType_block_invoke(uint64_t a1, sqlite3_stmt *a2)
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
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  id v28;
  id v30;
  id v31;
  id v32;
  id obj;

  v4 = *(void **)(a1 + 32);
  v5 = *(unsigned int *)(a1 + 72);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v6 + 40);
  v7 = objc_msgSend(v4, "bindIntParameter:toValue:inStatement:error:", "@type", v5, a2, &obj);
  objc_storeStrong((id *)(v6 + 40), obj);
  if (!v7)
    return 0;
  v8 = *(void **)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 56);
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v32 = *(id *)(v10 + 40);
  v11 = objc_msgSend(v8, "bindInt64Parameter:toValue:inStatement:error:", "@begin", v9, a2, &v32);
  objc_storeStrong((id *)(v10 + 40), v32);
  if (!v11)
    return 0;
  v12 = *(void **)(a1 + 32);
  v13 = *(_QWORD *)(a1 + 64);
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v31 = *(id *)(v14 + 40);
  v15 = objc_msgSend(v12, "bindInt64Parameter:toValue:inStatement:error:", "@end", v13, a2, &v31);
  objc_storeStrong((id *)(v14 + 40), v31);
  if (!v15)
    return 0;
  v16 = sqlite3_step(a2);
  while ((_DWORD)v16 == 100)
  {
    objc_msgSend(*(id *)(a1 + 32), "int64ForColumn:inStatment:", 0, a2);
    objc_msgSend(*(id *)(a1 + 32), "intForColumn:inStatment:", 1, a2);
    objc_msgSend(*(id *)(a1 + 32), "stringForColumn:inStatment:", 2, a2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "stringForColumn:inStatment:", 3, a2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "stringForColumn:inStatment:", 4, a2);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "int64ForColumn:inStatment:", 5, a2);
    objc_msgSend(*(id *)(a1 + 32), "stringForColumn:inStatment:", 6, a2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    externalFileBaseURL(*(void **)(a1 + 32));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "URLByAppendingPathComponent:", v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v22)
    {

      v25 = 0;
      goto LABEL_13;
    }
    objc_msgSend(*(id *)(a1 + 32), "stringForColumn:inStatment:", 7, a2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v18;
    if (((*(uint64_t (**)(_QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40)) & 1) == 0)
    {

      v25 = 1;
      goto LABEL_13;
    }
    v16 = sqlite3_step(a2);

  }
  if ((_DWORD)v16 == 101)
    return 1;
  v26 = *(void **)(a1 + 32);
  v27 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v30 = *(id *)(v27 + 40);
  objc_msgSend(v26, "reportSQLiteErrorCode:method:error:", v16, CFSTR("step"), &v30);
  v28 = v30;
  v25 = 0;
  v17 = *(void **)(v27 + 40);
  *(_QWORD *)(v27 + 40) = v28;
LABEL_13:

  return v25;
}

@end
