@implementation HMSetupAccessoryDescription

uint64_t __51__HMSetupAccessoryDescription_HFAdditions__hf_home__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "homeUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

uint64_t __66__HMSetupAccessoryDescription_HFAdditions__hf_isLaunchedByHomeApp__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", a2);
}

@end
