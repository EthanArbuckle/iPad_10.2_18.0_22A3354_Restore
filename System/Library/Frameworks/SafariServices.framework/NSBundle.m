@implementation NSBundle

void __58__NSBundle_SafariServicesExtras___sf_safariServicesBundle__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.SafariServices"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_sf_safariServicesBundle_bundle;
  _sf_safariServicesBundle_bundle = v0;

}

@end
