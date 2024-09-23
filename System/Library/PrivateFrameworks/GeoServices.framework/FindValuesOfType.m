@implementation FindValuesOfType

uint64_t __FindValuesOfType_block_invoke(uint64_t a1, sqlite3_stmt *a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v22;
  id obj;

  v4 = *(void **)(a1 + 32);
  v5 = *(unsigned int *)(a1 + 56);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v6 + 40);
  v7 = objc_msgSend(v4, "bindIntParameter:toValue:inStatement:error:", "@type", v5, a2, &obj);
  objc_storeStrong((id *)(v6 + 40), obj);
  if (!v7)
    return 0;
  v8 = sqlite3_step(a2);
  while ((_DWORD)v8 == 100)
  {
    objc_msgSend(*(id *)(a1 + 32), "int64ForColumn:inStatment:", 0, a2);
    objc_msgSend(*(id *)(a1 + 32), "intForColumn:inStatment:", 1, a2);
    objc_msgSend(*(id *)(a1 + 32), "stringForColumn:inStatment:", 2, a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "stringForColumn:inStatment:", 3, a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "stringForColumn:inStatment:", 4, a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "int64ForColumn:inStatment:", 5, a2);
    objc_msgSend(*(id *)(a1 + 32), "stringForColumn:inStatment:", 6, a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    externalFileBaseURL(*(void **)(a1 + 32));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "URLByAppendingPathComponent:", v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {

      v17 = 0;
      goto LABEL_11;
    }
    objc_msgSend(*(id *)(a1 + 32), "stringForColumn:inStatment:", 7, a2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v10;
    if (((*(uint64_t (**)(_QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40)) & 1) == 0)
    {

      v17 = 1;
      goto LABEL_11;
    }
    v8 = sqlite3_step(a2);

  }
  if ((_DWORD)v8 == 101)
    return 1;
  v18 = *(void **)(a1 + 32);
  v19 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v22 = *(id *)(v19 + 40);
  objc_msgSend(v18, "reportSQLiteErrorCode:method:error:", v8, CFSTR("step"), &v22);
  v20 = v22;
  v17 = 0;
  v9 = *(void **)(v19 + 40);
  *(_QWORD *)(v19 + 40) = v20;
LABEL_11:

  return v17;
}

@end
