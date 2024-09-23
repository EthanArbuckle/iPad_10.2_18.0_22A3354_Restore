@implementation ClearSubscriptionDataStatesNotMatchingVersions

uint64_t __ClearSubscriptionDataStatesNotMatchingVersions_block_invoke(uint64_t a1, uint64_t a2)
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
  uint64_t v19;
  id v21;
  id v22;
  id v23;
  id obj;

  v4 = *(unsigned int *)(a1 + 64);
  v5 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v6 + 40);
  v7 = objc_msgSend(v5, "bindIntParameter:toValue:inStatement:error:", "@data_type", v4, a2, &obj);
  objc_storeStrong((id *)(v6 + 40), obj);
  if (!v7)
    return 0;
  v8 = *(unsigned int *)(a1 + 68);
  v9 = *(void **)(a1 + 32);
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v23 = *(id *)(v10 + 40);
  v11 = objc_msgSend(v9, "bindIntParameter:toValue:inStatement:error:", "@data_subtype", v8, a2, &v23);
  objc_storeStrong((id *)(v10 + 40), v23);
  if (!v11)
    return 0;
  v12 = *(_QWORD *)(a1 + 48);
  v13 = *(void **)(a1 + 32);
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v22 = *(id *)(v14 + 40);
  v15 = objc_msgSend(v13, "bindInt64Parameter:toValue:inStatement:error:", "@versionA", v12, a2, &v22);
  objc_storeStrong((id *)(v14 + 40), v22);
  if (!v15)
    return 0;
  v16 = *(_QWORD *)(a1 + 56);
  v17 = *(void **)(a1 + 32);
  v18 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v21 = *(id *)(v18 + 40);
  v19 = objc_msgSend(v17, "bindInt64Parameter:toValue:inStatement:error:", "@versionB", v16, a2, &v21);
  objc_storeStrong((id *)(v18 + 40), v21);
  return v19;
}

@end
