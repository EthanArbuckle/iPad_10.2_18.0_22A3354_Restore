@implementation InsertExpiredSubscription

uint64_t __InsertExpiredSubscription_block_invoke(uint64_t a1, uint64_t a2)
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
  int v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id obj;
  id v39;

  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v39 = *(id *)(v6 + 40);
  v7 = objc_msgSend(v4, "bindTextParameter:toValue:inStatement:error:", "@identifier", v5, a2, &v39);
  objc_storeStrong((id *)(v6 + 40), v39);
  if (!v7)
    return 0;
  v8 = *(void **)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 48);
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  obj = *(id *)(v10 + 40);
  v11 = objc_msgSend(v8, "bindTextParameter:toValue:inStatement:error:", "@originating_bundle_id", v9, a2, &obj);
  objc_storeStrong((id *)(v10 + 40), obj);
  if (!v11)
    return 0;
  v12 = *(void **)(a1 + 32);
  v13 = *(_QWORD *)(a1 + 80);
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v37 = *(id *)(v14 + 40);
  v15 = objc_msgSend(v12, "bindInt64Parameter:toValue:inStatement:error:", "@data_types", v13, a2, &v37);
  objc_storeStrong((id *)(v14 + 40), v37);
  if (!v15)
    return 0;
  v16 = *(void **)(a1 + 32);
  v17 = *(_QWORD *)(a1 + 88);
  v18 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v36 = *(id *)(v18 + 40);
  v19 = objc_msgSend(v16, "bindInt64Parameter:toValue:inStatement:error:", "@policy", v17, a2, &v36);
  objc_storeStrong((id *)(v18 + 40), v36);
  if (!v19)
    return 0;
  v20 = *(void **)(a1 + 32);
  v21 = *(_QWORD *)(a1 + 56);
  v22 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v35 = *(id *)(v22 + 40);
  v23 = objc_msgSend(v20, "bindBlobParameter:toValue:inStatement:error:", "@map_region", v21, a2, &v35);
  objc_storeStrong((id *)(v22 + 40), v35);
  if (!v23)
    return 0;
  v24 = *(void **)(a1 + 32);
  v25 = *(_QWORD *)(a1 + 64);
  v26 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v34 = *(id *)(v26 + 40);
  v27 = objc_msgSend(v24, "bindTextParameter:toValue:inStatement:error:", "@display_name", v25, a2, &v34);
  objc_storeStrong((id *)(v26 + 40), v34);
  if (!v27)
    return 0;
  v28 = *(void **)(a1 + 32);
  v29 = *(unsigned int *)(a1 + 96);
  v30 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v33 = *(id *)(v30 + 40);
  v31 = objc_msgSend(v28, "bindIntParameter:toValue:inStatement:error:", "@regulatory_region_id", v29, a2, &v33);
  objc_storeStrong((id *)(v30 + 40), v33);
  return v31;
}

@end
