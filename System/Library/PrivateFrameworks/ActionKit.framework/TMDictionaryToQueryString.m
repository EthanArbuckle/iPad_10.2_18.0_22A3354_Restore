@implementation TMDictionaryToQueryString

void __TMDictionaryToQueryString_block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v4 = *(void **)(a1 + 32);
  v5 = (void *)MEMORY[0x24BDD17C8];
  v6 = a3;
  TMURLEncode(a2);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  TMURLEncode(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@=%@"), v9, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v8);

}

@end
