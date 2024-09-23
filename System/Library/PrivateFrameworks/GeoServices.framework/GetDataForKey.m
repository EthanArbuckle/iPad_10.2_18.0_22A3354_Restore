@implementation GetDataForKey

uint64_t __GetDataForKey_block_invoke(uint64_t a1, sqlite3_stmt *a2)
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
  void *v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  id v27;
  id v29;
  id v30;
  id v31;
  id v32;
  id obj;

  v4 = *(void **)(a1 + 32);
  v5 = *(unsigned int *)(a1 + 56);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v6 + 40);
  v7 = objc_msgSend(v4, "bindIntParameter:toValue:inStatement:error:", "@tiles_key_a", v5, a2, &obj);
  objc_storeStrong((id *)(v6 + 40), obj);
  if (!v7)
    return 0;
  v8 = *(void **)(a1 + 32);
  v9 = *(unsigned int *)(a1 + 60);
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v32 = *(id *)(v10 + 40);
  v11 = objc_msgSend(v8, "bindIntParameter:toValue:inStatement:error:", "@tiles_key_b", v9, a2, &v32);
  objc_storeStrong((id *)(v10 + 40), v32);
  if (!v11)
    return 0;
  v12 = *(void **)(a1 + 32);
  v13 = *(unsigned int *)(a1 + 64);
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v31 = *(id *)(v14 + 40);
  v15 = objc_msgSend(v12, "bindIntParameter:toValue:inStatement:error:", "@tiles_key_c", v13, a2, &v31);
  objc_storeStrong((id *)(v14 + 40), v31);
  if (!v15)
    return 0;
  v16 = *(void **)(a1 + 32);
  v17 = *(unsigned int *)(a1 + 68);
  v18 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v30 = *(id *)(v18 + 40);
  v19 = objc_msgSend(v16, "bindIntParameter:toValue:inStatement:error:", "@tiles_key_d", v17, a2, &v30);
  objc_storeStrong((id *)(v18 + 40), v30);
  if (!v19)
    return 0;
  v20 = sqlite3_step(a2);
  if ((_DWORD)v20 == 100)
  {
    while (1)
    {
      objc_msgSend(*(id *)(a1 + 32), "intForColumn:inStatment:", 0, a2);
      objc_msgSend(*(id *)(a1 + 32), "int64ForColumn:inStatment:", 1, a2);
      objc_msgSend(*(id *)(a1 + 32), "blobForColumn:inStatment:", 2, a2);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "UUIDForColumn:inStatment:", 3, a2);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "stringForColumn:inStatment:", 4, a2);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "intForColumn:inStatment:", 5, a2);
      objc_msgSend(*(id *)(a1 + 32), "intForColumn:inStatment:", 6, a2);
      if (((*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))() & 1) == 0)
        break;
      v20 = sqlite3_step(a2);

      if ((_DWORD)v20 != 100)
        goto LABEL_8;
    }

    v24 = 1;
    goto LABEL_12;
  }
LABEL_8:
  if ((_DWORD)v20 != 101)
  {
    v25 = *(void **)(a1 + 32);
    v26 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v29 = *(id *)(v26 + 40);
    objc_msgSend(v25, "reportSQLiteErrorCode:method:error:", v20, CFSTR("step"), &v29);
    v27 = v29;
    v24 = 0;
    v21 = *(void **)(v26 + 40);
    *(_QWORD *)(v26 + 40) = v27;
LABEL_12:

    return v24;
  }
  return 1;
}

@end
