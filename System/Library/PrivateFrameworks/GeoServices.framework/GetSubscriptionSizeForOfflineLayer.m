@implementation GetSubscriptionSizeForOfflineLayer

uint64_t __GetSubscriptionSizeForOfflineLayer_block_invoke(uint64_t a1, sqlite3_stmt *a2)
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
  void *v18;
  uint64_t v19;
  id v21;
  id v22;
  id v23;
  id obj;

  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 56);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v6 + 40);
  v7 = objc_msgSend(v4, "bindInt64Parameter:toValue:inStatement:error:", "@subscription_pk", v5, a2, &obj);
  objc_storeStrong((id *)(v6 + 40), obj);
  if (!v7)
    return 0;
  v8 = *(void **)(a1 + 32);
  v9 = *(unsigned int *)(a1 + 72);
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v23 = *(id *)(v10 + 40);
  v11 = objc_msgSend(v8, "bindIntParameter:toValue:inStatement:error:", "@layer", v9, a2, &v23);
  objc_storeStrong((id *)(v10 + 40), v23);
  if (!v11)
    return 0;
  v12 = *(void **)(a1 + 32);
  v13 = *(_QWORD *)(a1 + 64);
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v22 = *(id *)(v14 + 40);
  v15 = objc_msgSend(v12, "bindInt64Parameter:toValue:inStatement:error:", "@version", v13, a2, &v22);
  objc_storeStrong((id *)(v14 + 40), v22);
  if (!v15)
    return 0;
  v16 = sqlite3_step(a2);
  v17 = 1;
  while ((_DWORD)v16 == 100)
  {
    objc_msgSend(*(id *)(a1 + 32), "int64ForColumn:inStatment:", 0, a2);
    objc_msgSend(*(id *)(a1 + 32), "intForColumn:inStatment:", 1, a2);
    if (!(*(unsigned int (**)(void))(*(_QWORD *)(a1 + 40) + 16))())
      return v17;
    v16 = sqlite3_step(a2);
  }
  if ((_DWORD)v16 != 101)
  {
    v18 = *(void **)(a1 + 32);
    v19 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v21 = *(id *)(v19 + 40);
    objc_msgSend(v18, "reportSQLiteErrorCode:method:error:", v16, CFSTR("step"), &v21);
    objc_storeStrong((id *)(v19 + 40), v21);
    return 0;
  }
  return 1;
}

@end
