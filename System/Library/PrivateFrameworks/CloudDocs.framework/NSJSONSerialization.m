@implementation NSJSONSerialization

uint64_t __51__NSJSONSerialization_BRAdditions___jsonifyObject___block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)_jsonifyObject__dateFormatter;
  _jsonifyObject__dateFormatter = (uint64_t)v0;

  return objc_msgSend((id)_jsonifyObject__dateFormatter, "setDateFormat:", CFSTR("yyyy-MM-dd'T'HH:mm:ss.SSSZ"));
}

void __51__NSJSONSerialization_BRAdditions___jsonifyObject___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  void *v5;
  id v6;
  id v7;

  v4 = *(void **)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  v6 = a2;
  objc_msgSend(v5, "_jsonifyObject:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", v7, v6);

}

void __51__NSJSONSerialization_BRAdditions___jsonifyObject___block_invoke_3(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_jsonifyObject:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

@end
