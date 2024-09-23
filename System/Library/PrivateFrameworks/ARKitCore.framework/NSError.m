@implementation NSError

id __43__NSError_ARAdditions__initWithDictionary___block_invoke(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x1E0CB35C8];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithDictionary:", v3);

  return v4;
}

void __42__NSError_ARAdditions__encodeToDictionary__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a2;
  v5 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "encodeToDictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v9);

  }
  else
  {
    v7 = *MEMORY[0x1E0CB2F70];
    if (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0CB2F70]))
    {
      objc_msgSend(v5, "ar_map:", &__block_literal_global_8_2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v8, v7);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v9);
    }
  }

}

uint64_t __42__NSError_ARAdditions__encodeToDictionary__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "encodeToDictionary");
}

@end
