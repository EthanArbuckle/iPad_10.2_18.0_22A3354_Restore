@implementation JSONValueToUserInfoValue

void ___JSONValueToUserInfoValue_block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  id v5;
  id v6;

  v4 = *(void **)(a1 + 32);
  v5 = a2;
  _JSONValueToUserInfoValue(a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forKey:", v6, v5);

}

@end
