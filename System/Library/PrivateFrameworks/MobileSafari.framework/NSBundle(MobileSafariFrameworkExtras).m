@implementation NSBundle(MobileSafariFrameworkExtras)

+ (uint64_t)sf_mobileSafariFrameworkBundle
{
  return objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
}

+ (uint64_t)safari_isWebSheetApplicationBundle
{
  void *v0;
  void *v1;
  uint64_t v2;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.WebSheet"));

  return v2;
}

+ (uint64_t)safari_isSafariViewServiceBundle
{
  if (safari_isSafariViewServiceBundle_onceToken != -1)
    dispatch_once(&safari_isSafariViewServiceBundle_onceToken, &__block_literal_global_36);
  return safari_isSafariViewServiceBundle_isSafariViewService;
}

@end
