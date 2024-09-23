@implementation KeyValueStringFromDictionary

uint64_t ___KeyValueStringFromDictionary_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

void ___KeyValueStringFromDictionary_block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x24BDD17C8];
  v3 = *(void **)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v5 = a2;
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@=%@"), v5, v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "addObject:", v6);
}

@end
