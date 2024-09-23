@implementation InsertOfflineDataBatchReference

uint64_t __InsertOfflineDataBatchReference_block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id obj;

  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v6 + 40);
  v7 = objc_msgSend(v5, "bindInt64Parameter:toValue:inStatement:error:", "@batch_pk", v4, a2, &obj);
  objc_storeStrong((id *)(v6 + 40), obj);
  if (!v7)
    return 0;
  v8 = *(_QWORD *)(a1 + 56);
  v9 = *(void **)(a1 + 32);
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v33 = *(id *)(v10 + 40);
  v11 = objc_msgSend(v9, "bindInt64Parameter:toValue:inStatement:error:", "@offline_data_pk", v8, a2, &v33);
  objc_storeStrong((id *)(v10 + 40), v33);
  if (!v11)
    return 0;
  v12 = *(_QWORD *)(a1 + 64);
  v13 = *(void **)(a1 + 32);
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v32 = *(id *)(v14 + 40);
  v15 = objc_msgSend(v13, "bindInt64Parameter:toValue:inStatement:error:", "@offset", v12, a2, &v32);
  objc_storeStrong((id *)(v14 + 40), v32);
  if (!v15)
    return 0;
  v16 = *(_QWORD *)(a1 + 72);
  v17 = *(void **)(a1 + 32);
  v18 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v31 = *(id *)(v18 + 40);
  v19 = objc_msgSend(v17, "bindInt64Parameter:toValue:inStatement:error:", "@size", v16, a2, &v31);
  objc_storeStrong((id *)(v18 + 40), v31);
  if (!v19)
    return 0;
  v20 = *(unsigned int *)(a1 + 88);
  v21 = *(void **)(a1 + 32);
  v22 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v30 = *(id *)(v22 + 40);
  v23 = objc_msgSend(v21, "bindIntParameter:toValue:inStatement:error:", "@layer", v20, a2, &v30);
  objc_storeStrong((id *)(v22 + 40), v30);
  if (!v23)
    return 0;
  v24 = *(_QWORD *)(a1 + 80);
  v25 = *(void **)(a1 + 32);
  v26 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v29 = *(id *)(v26 + 40);
  v27 = objc_msgSend(v25, "bindInt64Parameter:toValue:inStatement:error:", "@version", v24, a2, &v29);
  objc_storeStrong((id *)(v26 + 40), v29);
  return v27;
}

@end
