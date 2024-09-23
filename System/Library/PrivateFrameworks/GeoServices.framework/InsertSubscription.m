@implementation InsertSubscription

uint64_t __InsertSubscription_block_invoke(_QWORD *a1, uint64_t a2)
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
  int v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id obj;
  id v44;

  v4 = (void *)a1[4];
  v5 = a1[5];
  v6 = *(_QWORD *)(a1[9] + 8);
  v44 = *(id *)(v6 + 40);
  v7 = objc_msgSend(v4, "bindTextParameter:toValue:inStatement:error:", "@identifier", v5, a2, &v44);
  objc_storeStrong((id *)(v6 + 40), v44);
  if (!v7)
    return 0;
  v8 = (void *)a1[4];
  v9 = a1[6];
  v10 = *(_QWORD *)(a1[9] + 8);
  obj = *(id *)(v10 + 40);
  v11 = objc_msgSend(v8, "bindTextParameter:toValue:inStatement:error:", "@originating_bundle_id", v9, a2, &obj);
  objc_storeStrong((id *)(v10 + 40), obj);
  if (!v11)
    return 0;
  v12 = (void *)a1[4];
  v13 = a1[10];
  v14 = *(_QWORD *)(a1[9] + 8);
  v42 = *(id *)(v14 + 40);
  v15 = objc_msgSend(v12, "bindInt64Parameter:toValue:inStatement:error:", "@data_types", v13, a2, &v42);
  objc_storeStrong((id *)(v14 + 40), v42);
  if (!v15)
    return 0;
  v16 = (void *)a1[4];
  v17 = a1[11];
  v18 = *(_QWORD *)(a1[9] + 8);
  v41 = *(id *)(v18 + 40);
  v19 = objc_msgSend(v16, "bindInt64Parameter:toValue:inStatement:error:", "@policy", v17, a2, &v41);
  objc_storeStrong((id *)(v18 + 40), v41);
  if (!v19)
    return 0;
  v20 = (void *)a1[4];
  v21 = a1[12];
  v22 = *(_QWORD *)(a1[9] + 8);
  v40 = *(id *)(v22 + 40);
  v23 = objc_msgSend(v20, "bindInt64Parameter:toValue:inStatement:error:", "@expiration_timestamp", v21, a2, &v40);
  objc_storeStrong((id *)(v22 + 40), v40);
  if (!v23)
    return 0;
  v24 = (void *)a1[4];
  v25 = a1[7];
  v26 = *(_QWORD *)(a1[9] + 8);
  v39 = *(id *)(v26 + 40);
  v27 = objc_msgSend(v24, "bindBlobParameter:toValue:inStatement:error:", "@map_region", v25, a2, &v39);
  objc_storeStrong((id *)(v26 + 40), v39);
  if (!v27)
    return 0;
  v28 = (void *)a1[4];
  v29 = a1[8];
  v30 = *(_QWORD *)(a1[9] + 8);
  v38 = *(id *)(v30 + 40);
  v31 = objc_msgSend(v28, "bindTextParameter:toValue:inStatement:error:", "@display_name", v29, a2, &v38);
  objc_storeStrong((id *)(v30 + 40), v38);
  if (!v31)
    return 0;
  v32 = (void *)a1[4];
  v33 = a1[13];
  v34 = *(_QWORD *)(a1[9] + 8);
  v37 = *(id *)(v34 + 40);
  v35 = objc_msgSend(v32, "bindInt64Parameter:toValue:inStatement:error:", "@insert_timestamp", v33, a2, &v37);
  objc_storeStrong((id *)(v34 + 40), v37);
  return v35;
}

@end
