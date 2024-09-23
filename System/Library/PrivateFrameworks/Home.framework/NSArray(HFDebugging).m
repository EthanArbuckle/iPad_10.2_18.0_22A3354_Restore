@implementation NSArray(HFDebugging)

- (id)hf_prettyDescription
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "na_map:", &__block_literal_global_41);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)hf_prettyExpensiveDescription
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "na_map:", &__block_literal_global_10_2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)hf_prettyFullDescription
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "na_map:", &__block_literal_global_11_1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "description");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
