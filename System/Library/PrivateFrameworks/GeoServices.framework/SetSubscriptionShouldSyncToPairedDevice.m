@implementation SetSubscriptionShouldSyncToPairedDevice

uint64_t __SetSubscriptionShouldSyncToPairedDevice_block_invoke(uint64_t a1, uint64_t a2)
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
  uint64_t v15;
  id v17;
  id v18;
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
  v9 = *(_QWORD *)(a1 + 40);
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v18 = *(id *)(v10 + 40);
  v11 = objc_msgSend(v8, "bindUUIDParameter:toValue:inStatement:error:", "@device_id", v9, a2, &v18);
  objc_storeStrong((id *)(v10 + 40), v18);
  if (!v11)
    return 0;
  v12 = *(void **)(a1 + 32);
  v13 = *(unsigned __int8 *)(a1 + 64);
  v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v17 = *(id *)(v14 + 40);
  v15 = objc_msgSend(v12, "bindIntParameter:toValue:inStatement:error:", "@should_sync", v13, a2, &v17);
  objc_storeStrong((id *)(v14 + 40), v17);
  return v15;
}

@end
