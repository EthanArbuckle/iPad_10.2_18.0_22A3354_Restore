@implementation HMServiceGroup(HFAdditions)

- (uint64_t)hf_isSupported
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "services");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "na_all:", &__block_literal_global_44);

  return v2;
}

- (uint64_t)hf_areAllServicesInSameRoom
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  _QWORD v9[4];
  id v10;

  objc_msgSend(a1, "services");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hf_parentRoom");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "services");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __58__HMServiceGroup_HFAdditions__hf_areAllServicesInSameRoom__block_invoke;
  v9[3] = &unk_1EA7283A0;
  v10 = v4;
  v6 = v4;
  v7 = objc_msgSend(v5, "na_all:", v9);

  return v7;
}

- (id)hf_serviceDescriptor
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v1 = (void *)MEMORY[0x1E0CB3550];
  objc_msgSend(a1, "services");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_map:", &__block_literal_global_2_6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "na_mostCommonObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
