@implementation AKAlertImageURLProvider

+ (id)url
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AuthKitUI"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLForResource:withExtension:", CFSTR("appleaccount_mono_icon-60-dark"), CFSTR("png"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
