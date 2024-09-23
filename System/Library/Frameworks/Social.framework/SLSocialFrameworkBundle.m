@implementation SLSocialFrameworkBundle

void __SLSocialFrameworkBundle_block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  CPSystemRootDirectory();
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v0 = (void *)MEMORY[0x1E0CB34D0];
  objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("System/Library/Frameworks/Social.framework"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleWithPath:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)SLSocialFrameworkBundle_socialBundle;
  SLSocialFrameworkBundle_socialBundle = v2;

}

@end
