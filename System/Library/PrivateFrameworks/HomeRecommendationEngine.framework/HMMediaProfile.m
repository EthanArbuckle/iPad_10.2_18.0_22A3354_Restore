@implementation HMMediaProfile

id __65__HMMediaProfile_HRERecommendableObjectProtocol__hre_primaryType__block_invoke()
{
  if (_block_invoke_na_once_token_376_1 != -1)
    dispatch_once(&_block_invoke_na_once_token_376_1, &__block_literal_global_93);
  return (id)_block_invoke_na_once_object_376_1;
}

void __65__HMMediaProfile_HRERecommendableObjectProtocol__hre_primaryType__block_invoke_2()
{
  uint64_t v0;
  void *v1;

  HREMediaProfileContainerType();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_block_invoke_na_once_object_376_1;
  _block_invoke_na_once_object_376_1 = v0;

}

id __67__HMMediaProfile_HRERecommendableObjectProtocol__hre_matchingTypes__block_invoke(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __67__HMMediaProfile_HRERecommendableObjectProtocol__hre_matchingTypes__block_invoke_2;
  block[3] = &unk_24F216BA0;
  block[4] = *(_QWORD *)(a1 + 32);
  if (_block_invoke_2_na_once_token_377_1 != -1)
    dispatch_once(&_block_invoke_2_na_once_token_377_1, block);
  return (id)_block_invoke_2_na_once_object_377_1;
}

void __67__HMMediaProfile_HRERecommendableObjectProtocol__hre_matchingTypes__block_invoke_2(uint64_t a1)
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
  v5 = (void *)_block_invoke_2_na_once_object_377_1;
  _block_invoke_2_na_once_object_377_1 = v4;

}

id __69__HMMediaProfile_HRERecommendableObjectProtocol__hre_characteristics__block_invoke()
{
  if (_block_invoke_3_na_once_token_378 != -1)
    dispatch_once(&_block_invoke_3_na_once_token_378, &__block_literal_global_95);
  return (id)_block_invoke_3_na_once_object_378;
}

void __69__HMMediaProfile_HRERecommendableObjectProtocol__hre_characteristics__block_invoke_2()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", MEMORY[0x24BDBD1A8]);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_block_invoke_3_na_once_object_378;
  _block_invoke_3_na_once_object_378 = v0;

}

@end
