@implementation NSStringFromBLSAssertingObject

void __NSStringFromBLSAssertingObject_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "descriptor");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(void **)(a1 + 40);
  objc_msgSend(v9, "explanation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "appendObject:withName:", v3, CFSTR("explanation"));

  v5 = *(void **)(a1 + 40);
  objc_msgSend(v9, "attributes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v5, "appendInteger:withName:", objc_msgSend(v6, "count"), CFSTR("attributes"));

  v8 = (id)objc_msgSend(*(id *)(a1 + 40), "appendBool:withName:", objc_msgSend(*(id *)(a1 + 32), "isAcquired"), CFSTR("isAcquired"));
}

@end
