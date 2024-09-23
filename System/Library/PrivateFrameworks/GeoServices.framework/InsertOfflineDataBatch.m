@implementation InsertOfflineDataBatch

uint64_t __InsertOfflineDataBatch_block_invoke(uint64_t a1, uint64_t a2)
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
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v25;
  id v26;
  id v27;
  id v28;
  id obj;

  v4 = *(void **)(a1 + 32);
  v5 = *(unsigned int *)(a1 + 80);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  obj = *(id *)(v6 + 40);
  v7 = objc_msgSend(v4, "bindIntParameter:toValue:inStatement:error:", "@layer", v5, a2, &obj);
  objc_storeStrong((id *)(v6 + 40), obj);
  if (!v7)
    return 0;
  v8 = *(void **)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v28 = *(id *)(v10 + 40);
  v11 = objc_msgSend(v8, "bindBlobParameter:toValue:inStatement:error:", "@key", v9, a2, &v28);
  objc_storeStrong((id *)(v10 + 40), v28);
  if (!v11)
    return 0;
  v12 = *(void **)(a1 + 32);
  v13 = *(_QWORD *)(a1 + 64);
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v27 = *(id *)(v14 + 40);
  v15 = objc_msgSend(v12, "bindInt64Parameter:toValue:inStatement:error:", "@version", v13, a2, &v27);
  objc_storeStrong((id *)(v14 + 40), v27);
  if (!v15)
    return 0;
  v16 = *(void **)(a1 + 32);
  v17 = *(_QWORD *)(a1 + 48);
  v18 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v26 = *(id *)(v18 + 40);
  v19 = objc_msgSend(v16, "bindTextParameter:toValue:inStatement:error:", "@etag", v17, a2, &v26);
  objc_storeStrong((id *)(v18 + 40), v26);
  if (!v19)
    return 0;
  v20 = *(void **)(a1 + 32);
  v21 = *(_QWORD *)(a1 + 72);
  v22 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v25 = *(id *)(v22 + 40);
  v23 = objc_msgSend(v20, "bindInt64Parameter:toValue:inStatement:error:", "@data_pk", v21, a2, &v25);
  objc_storeStrong((id *)(v22 + 40), v25);
  return v23;
}

@end
