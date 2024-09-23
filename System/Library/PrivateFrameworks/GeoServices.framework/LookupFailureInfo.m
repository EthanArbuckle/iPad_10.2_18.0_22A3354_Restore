@implementation LookupFailureInfo

uint64_t __LookupFailureInfo_block_invoke(uint64_t a1, sqlite3_stmt *a2)
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
  uint64_t v21;
  void *v22;
  uint64_t v23;
  id v25;
  id v26;
  id v27;
  id v28;
  id obj;

  v4 = *(void **)(a1 + 32);
  v5 = *(unsigned int *)(a1 + 56);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v6 + 40);
  v7 = objc_msgSend(v4, "bindIntParameter:toValue:inStatement:error:", "@key_a", v5, a2, &obj);
  objc_storeStrong((id *)(v6 + 40), obj);
  if (!v7)
    return 0;
  v8 = *(void **)(a1 + 32);
  v9 = *(unsigned int *)(a1 + 60);
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v28 = *(id *)(v10 + 40);
  v11 = objc_msgSend(v8, "bindIntParameter:toValue:inStatement:error:", "@key_b", v9, a2, &v28);
  objc_storeStrong((id *)(v10 + 40), v28);
  if (!v11)
    return 0;
  v12 = *(void **)(a1 + 32);
  v13 = *(unsigned int *)(a1 + 64);
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v27 = *(id *)(v14 + 40);
  v15 = objc_msgSend(v12, "bindIntParameter:toValue:inStatement:error:", "@key_c", v13, a2, &v27);
  objc_storeStrong((id *)(v14 + 40), v27);
  if (!v15)
    return 0;
  v16 = *(void **)(a1 + 32);
  v17 = *(unsigned int *)(a1 + 68);
  v18 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v26 = *(id *)(v18 + 40);
  v19 = objc_msgSend(v16, "bindIntParameter:toValue:inStatement:error:", "@key_d", v17, a2, &v26);
  objc_storeStrong((id *)(v18 + 40), v26);
  if (!v19)
    return 0;
  v20 = sqlite3_step(a2);
  v21 = 1;
  while ((_DWORD)v20 == 100)
  {
    objc_msgSend(*(id *)(a1 + 32), "intForColumn:inStatment:", 0, a2);
    objc_msgSend(*(id *)(a1 + 32), "int64ForColumn:inStatment:", 1, a2);
    if (!(*(unsigned int (**)(void))(*(_QWORD *)(a1 + 40) + 16))())
      return v21;
    v20 = sqlite3_step(a2);
  }
  if ((_DWORD)v20 != 101)
  {
    v22 = *(void **)(a1 + 32);
    v23 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v25 = *(id *)(v23 + 40);
    objc_msgSend(v22, "reportSQLiteErrorCode:method:error:", v20, CFSTR("step"), &v25);
    objc_storeStrong((id *)(v23 + 40), v25);
    return 0;
  }
  return 1;
}

@end
