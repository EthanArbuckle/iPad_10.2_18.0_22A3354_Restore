@implementation NSObject

void __45__NSObject_AMSUIWeb___sanitizedServerObject___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  BOOL v8;
  id v9;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "_sanitizedServerObject:", a2);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_sanitizedServerObject:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    v8 = v7 == 0;
  else
    v8 = 1;
  if (!v8)
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v7, v9);

}

@end
