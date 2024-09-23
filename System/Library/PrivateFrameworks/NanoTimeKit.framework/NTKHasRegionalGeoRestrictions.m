@implementation NTKHasRegionalGeoRestrictions

void __NTKHasRegionalGeoRestrictions_block_invoke()
{
  void *v0;
  uint64_t v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "localeIdentifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "rangeOfString:", CFSTR("_CN"));
  NTKHasRegionalGeoRestrictions_geoRestricted = v1 != 0;

}

@end
