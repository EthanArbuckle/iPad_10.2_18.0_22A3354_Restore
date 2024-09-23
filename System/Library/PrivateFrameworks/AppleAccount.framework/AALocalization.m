@implementation AALocalization

+ (id)appleAccountBrandName
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AppleAccount"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(CFSTR("APPLE_ID"), "containsString:", CFSTR("REBRAND")) & 1) != 0
    || (_os_feature_enabled_impl() & 1) == 0)
  {
    objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("APPLE_ID"), 0, CFSTR("Localizable"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(CFSTR("APPLE_ID"), "stringByAppendingString:", CFSTR("_REBRAND"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "localizedStringForKey:value:table:", v3, 0, CFSTR("Localizable"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

@end
