@implementation GEOConfigKeyGetExpiry

void ___GEOConfigKeyGetExpiry_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  id obj;

  v5 = a2;
  _GEOConfigProxy();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "configExpiryForOptions:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = *(_QWORD *)(a1 + 40);
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v10 = *(void **)(v9 + 40);
  v11 = *(_QWORD *)(v8 + 8);
  v12 = *(id *)(v11 + 40);
  obj = v10;
  objc_msgSend(v7, "getConfigKeyExpiry:date:osVersion:", v5, &obj, &v12);

  objc_storeStrong((id *)(v9 + 40), obj);
  objc_storeStrong((id *)(v11 + 40), v12);

}

@end
