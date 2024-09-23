@implementation HMMediaSystem

uint64_t __64__HMMediaSystem_HRERecommendableObjectProtocol__hre_actionTypes__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hre_actionTypes");
}

id __64__HMMediaSystem_HRERecommendableObjectProtocol__hre_primaryType__block_invoke()
{
  if (_block_invoke_4_na_once_token_379 != -1)
    dispatch_once(&_block_invoke_4_na_once_token_379, &__block_literal_global_100);
  return (id)_block_invoke_4_na_once_object_379;
}

void __64__HMMediaSystem_HRERecommendableObjectProtocol__hre_primaryType__block_invoke_2()
{
  uint64_t v0;
  void *v1;

  HREMediaProfileContainerType();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_block_invoke_4_na_once_object_379;
  _block_invoke_4_na_once_object_379 = v0;

}

id __66__HMMediaSystem_HRERecommendableObjectProtocol__hre_matchingTypes__block_invoke(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __66__HMMediaSystem_HRERecommendableObjectProtocol__hre_matchingTypes__block_invoke_2;
  block[3] = &unk_24F216BA0;
  block[4] = *(_QWORD *)(a1 + 32);
  if (_block_invoke_5_na_once_token_380 != -1)
    dispatch_once(&_block_invoke_5_na_once_token_380, block);
  return (id)_block_invoke_5_na_once_object_380;
}

void __66__HMMediaSystem_HRERecommendableObjectProtocol__hre_matchingTypes__block_invoke_2(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v1 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(*(id *)(a1 + 32), "hre_primaryType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setWithArray:", v3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)_block_invoke_5_na_once_object_380;
  _block_invoke_5_na_once_object_380 = v4;

}

id __68__HMMediaSystem_HRERecommendableObjectProtocol__hre_characteristics__block_invoke()
{
  if (_block_invoke_6_na_once_token_381 != -1)
    dispatch_once(&_block_invoke_6_na_once_token_381, &__block_literal_global_102);
  return (id)_block_invoke_6_na_once_object_381;
}

void __68__HMMediaSystem_HRERecommendableObjectProtocol__hre_characteristics__block_invoke_2()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", MEMORY[0x24BDBD1A8]);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_block_invoke_6_na_once_object_381;
  _block_invoke_6_na_once_object_381 = v0;

}

uint64_t __62__HMMediaSystem_HRERecommendableObjectProtocol__hre_isVisible__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hre_isVisible");

  return v3;
}

@end
