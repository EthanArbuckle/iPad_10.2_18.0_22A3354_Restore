@implementation NSSet(FrontBoardServices)

- (id)fbs_singleLineDescriptionOfBSActions
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "allObjects");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "bs_map:", &__block_literal_global_18);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "componentsJoinedByString:", CFSTR(", "));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
