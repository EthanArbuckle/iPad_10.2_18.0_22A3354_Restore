@implementation DMTErrorWithCodeAndUserInfo

void __DMTErrorWithCodeAndUserInfo_block_invoke()
{
  uint64_t v0;
  void *v1;

  DMTBundle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)DMTErrorWithCodeAndUserInfo_bundle;
  DMTErrorWithCodeAndUserInfo_bundle = v0;

}

void __DMTErrorWithCodeAndUserInfo_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v7);

}

@end
