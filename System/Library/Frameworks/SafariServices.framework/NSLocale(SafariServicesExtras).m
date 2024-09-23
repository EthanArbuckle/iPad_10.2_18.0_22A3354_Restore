@implementation NSLocale(SafariServicesExtras)

+ (BOOL)_sf_isRTL
{
  void *v0;
  _BOOL8 v1;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "userInterfaceLayoutDirection") == 1;

  return v1;
}

@end
