@implementation MarkForDeletionExternalDataForOfflineDataNotMatchingVersions

uint64_t __MarkForDeletionExternalDataForOfflineDataNotMatchingVersions_block_invoke(uint64_t a1, uint64_t a2)
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
  uint64_t v15;
  id v17;
  id v18;
  id obj;

  v4 = *(unsigned int *)(a1 + 64);
  v5 = *(void **)(a1 + 32);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v6 + 40);
  v7 = objc_msgSend(v5, "bindIntParameter:toValue:inStatement:error:", "@layer", v4, a2, &obj);
  objc_storeStrong((id *)(v6 + 40), obj);
  if (!v7)
    return 0;
  v8 = *(_QWORD *)(a1 + 48);
  v9 = *(void **)(a1 + 32);
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v18 = *(id *)(v10 + 40);
  v11 = objc_msgSend(v9, "bindInt64Parameter:toValue:inStatement:error:", "@versionA", v8, a2, &v18);
  objc_storeStrong((id *)(v10 + 40), v18);
  if (!v11)
    return 0;
  v12 = *(_QWORD *)(a1 + 56);
  v13 = *(void **)(a1 + 32);
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v17 = *(id *)(v14 + 40);
  v15 = objc_msgSend(v13, "bindInt64Parameter:toValue:inStatement:error:", "@versionB", v12, a2, &v17);
  objc_storeStrong((id *)(v14 + 40), v17);
  return v15;
}

@end
