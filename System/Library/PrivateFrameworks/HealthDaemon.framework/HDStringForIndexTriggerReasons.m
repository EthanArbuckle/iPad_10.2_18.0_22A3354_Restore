@implementation HDStringForIndexTriggerReasons

id __HDStringForIndexTriggerReasons_block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v2, "stringWithFormat:", CFSTR("(%@, %ld)"), v4, objc_msgSend(v3, "countForObject:", v4));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
