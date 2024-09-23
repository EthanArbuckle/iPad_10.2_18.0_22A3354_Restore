@implementation BSBrand(BusinessServicesUI)

+ (id)makeBrandPlacecardForBrand:()BusinessServicesUI
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BE0FFB8];
  objc_msgSend(a3, "shim");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "wrapperFor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[_BSUIBrandPlacecardViewControllerObjcShim makeBrandPlacecardViewControllerWithBrandObjcShimOpaqueWrapper:](_BSUIBrandPlacecardViewControllerObjcShim, "makeBrandPlacecardViewControllerWithBrandObjcShimOpaqueWrapper:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)hoursConfig
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x24BE0FFB8];
  objc_msgSend(a1, "shim");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "wrapperFor:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[_BSUIBrandPlacecardViewControllerObjcShim hoursConfigurationFor:](_BSUIBrandPlacecardViewControllerObjcShim, "hoursConfigurationFor:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)primaryBrandColor
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc(MEMORY[0x24BEBD4B8]);
  objc_msgSend(a1, "_primaryBrandColorHexString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithHexString:", v3);

  return v4;
}

- (id)secondaryBrandColor
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc(MEMORY[0x24BEBD4B8]);
  objc_msgSend(a1, "_secondaryBrandColorHexString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithHexString:", v3);

  return v4;
}

@end
