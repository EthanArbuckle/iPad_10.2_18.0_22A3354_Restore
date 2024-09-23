@implementation LNArrayValueType

id __42__LNArrayValueType_CATSupport__cat_value___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "memberValueType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cat_value:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
