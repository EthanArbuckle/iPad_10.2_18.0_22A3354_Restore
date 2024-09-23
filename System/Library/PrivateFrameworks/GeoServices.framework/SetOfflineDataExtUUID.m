@implementation SetOfflineDataExtUUID

uint64_t __SetOfflineDataExtUUID_block_invoke(_QWORD *a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v13;
  id obj;

  v4 = (void *)a1[4];
  v5 = a1[7];
  v6 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v6 + 40);
  v7 = objc_msgSend(v4, "bindInt64Parameter:toValue:inStatement:error:", "@rowid", v5, a2, &obj);
  objc_storeStrong((id *)(v6 + 40), obj);
  if (!v7)
    return 0;
  v8 = (void *)a1[4];
  v9 = a1[5];
  v10 = *(_QWORD *)(a1[6] + 8);
  v13 = *(id *)(v10 + 40);
  v11 = objc_msgSend(v8, "bindUUIDParameter:toValue:inStatement:error:", "@ext_uuid", v9, a2, &v13);
  objc_storeStrong((id *)(v10 + 40), v13);
  return v11;
}

@end
