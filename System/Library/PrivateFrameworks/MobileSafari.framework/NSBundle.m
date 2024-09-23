@implementation NSBundle

void __73__NSBundle_MobileSafariFrameworkExtras__safari_isSafariViewServiceBundle__block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "bundleIdentifier");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  safari_isSafariViewServiceBundle_isSafariViewService = objc_msgSend(v0, "isEqualToString:", CFSTR("com.apple.SafariViewService"));

}

@end
