@implementation NSBundle

void __56__NSBundle_IconServicesAdditions____IS__frameworkBundle__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.IconServices"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)__IS__frameworkBundle_frameworkBundle;
  __IS__frameworkBundle_frameworkBundle = v0;

}

void __62__NSBundle_IconServicesAdditions____IS__iconsetResourceBundle__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", CFSTR("/System/Library/CoreServices/IconsetResources.bundle"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithURL:", v2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)__IS__iconsetResourceBundle_resourceBundle;
  __IS__iconsetResourceBundle_resourceBundle = v0;

}

@end
