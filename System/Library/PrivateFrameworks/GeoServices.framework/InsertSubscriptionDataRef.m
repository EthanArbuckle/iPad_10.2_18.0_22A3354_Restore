@implementation InsertSubscriptionDataRef

uint64_t __InsertSubscriptionDataRef_block_invoke(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v13;
  id obj;

  v4 = a1[6];
  v5 = (void *)a1[4];
  v6 = *(_QWORD *)(a1[5] + 8);
  obj = *(id *)(v6 + 40);
  v7 = objc_msgSend(v5, "bindInt64Parameter:toValue:inStatement:error:", "@subscription_pk", v4, a2, &obj);
  objc_storeStrong((id *)(v6 + 40), obj);
  if (!v7)
    return 0;
  v8 = a1[7];
  v9 = (void *)a1[4];
  v10 = *(_QWORD *)(a1[5] + 8);
  v13 = *(id *)(v10 + 40);
  v11 = objc_msgSend(v9, "bindInt64Parameter:toValue:inStatement:error:", "@data_pk", v8, a2, &v13);
  objc_storeStrong((id *)(v10 + 40), v13);
  return v11;
}

@end
