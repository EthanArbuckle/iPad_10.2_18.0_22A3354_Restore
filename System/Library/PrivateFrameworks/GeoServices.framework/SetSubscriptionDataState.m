@implementation SetSubscriptionDataState

uint64_t __SetSubscriptionDataState_block_invoke(uint64_t a1, uint64_t a2)
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
  int v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id obj;
  id v39;

  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v39 = *(id *)(v6 + 40);
  v7 = objc_msgSend(v5, "bindInt64Parameter:toValue:inStatement:error:", "@subscription_pk", v4, a2, &v39);
  objc_storeStrong((id *)(v6 + 40), v39);
  if (!v7)
    return 0;
  v8 = *(unsigned int *)(a1 + 72);
  v9 = *(void **)(a1 + 32);
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v10 + 40);
  v11 = objc_msgSend(v9, "bindIntParameter:toValue:inStatement:error:", "@data_type", v8, a2, &obj);
  objc_storeStrong((id *)(v10 + 40), obj);
  if (!v11)
    return 0;
  v12 = *(unsigned int *)(a1 + 76);
  v13 = *(void **)(a1 + 32);
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v37 = *(id *)(v14 + 40);
  v15 = objc_msgSend(v13, "bindIntParameter:toValue:inStatement:error:", "@data_subtype", v12, a2, &v37);
  objc_storeStrong((id *)(v14 + 40), v37);
  if (!v15)
    return 0;
  v16 = *(_QWORD *)(a1 + 56);
  v17 = *(void **)(a1 + 32);
  v18 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v36 = *(id *)(v18 + 40);
  v19 = objc_msgSend(v17, "bindInt64Parameter:toValue:inStatement:error:", "@version", v16, a2, &v36);
  objc_storeStrong((id *)(v18 + 40), v36);
  if (!v19)
    return 0;
  v20 = *(unsigned __int8 *)(a1 + 84);
  v21 = *(void **)(a1 + 32);
  v22 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v35 = *(id *)(v22 + 40);
  v23 = objc_msgSend(v21, "bindIntParameter:toValue:inStatement:error:", "@complete", v20, a2, &v35);
  objc_storeStrong((id *)(v22 + 40), v35);
  if (!v23)
    return 0;
  v24 = *(unsigned int *)(a1 + 80);
  v25 = *(void **)(a1 + 32);
  v26 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v34 = *(id *)(v26 + 40);
  v27 = objc_msgSend(v25, "bindIntParameter:toValue:inStatement:error:", "@data_count", v24, a2, &v34);
  objc_storeStrong((id *)(v26 + 40), v34);
  if (!v27)
    return 0;
  v28 = *(_QWORD *)(a1 + 64);
  v29 = *(void **)(a1 + 32);
  v30 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v33 = *(id *)(v30 + 40);
  v31 = objc_msgSend(v29, "bindInt64Parameter:toValue:inStatement:error:", "@data_size", v28, a2, &v33);
  objc_storeStrong((id *)(v30 + 40), v33);
  return v31;
}

@end
