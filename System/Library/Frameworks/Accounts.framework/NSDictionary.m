@implementation NSDictionary

void __39__NSDictionary_Accounts__ac_mapValues___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v6;
  uint64_t v7;
  void (*v8)(uint64_t, id, uint64_t, uint64_t);
  id v9;
  id v10;

  v6 = *(void **)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v8 = *(void (**)(uint64_t, id, uint64_t, uint64_t))(v7 + 16);
  v9 = a2;
  v8(v7, v9, a3, a4);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKey:", v10, v9);

}

void __47__NSDictionary_Accounts__ac_mapValuesNullable___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v3, v4);

}

@end
