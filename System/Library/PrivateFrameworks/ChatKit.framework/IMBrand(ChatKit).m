@implementation IMBrand(ChatKit)

- (id)primaryBrandColor
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "brand");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "primaryBrandColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)secondaryBrandColor
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "brand");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "secondaryBrandColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)makeBrandPlacecardForIMBrand:()ChatKit
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = makeBrandPlacecardForIMBrand__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&makeBrandPlacecardForIMBrand__onceToken, &__block_literal_global_78);
  v5 = (void *)makeBrandPlacecardForIMBrand__BSBrandClass;
  objc_msgSend(v4, "brand");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "makeBrandPlacecardForBrand:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end
