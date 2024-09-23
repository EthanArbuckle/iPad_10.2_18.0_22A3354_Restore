@implementation IDSService(HMUAdditions)

- (id)hmu_homePods
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "devices");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "na_filter:", &__block_literal_global_5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)hmu_appleTVs
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "devices");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "na_filter:", &__block_literal_global_2_1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)hmu_accessories
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "devices");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "na_filter:", &__block_literal_global_3_0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
