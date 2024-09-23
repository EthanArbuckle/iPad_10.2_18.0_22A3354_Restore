@implementation SWCoreFrameworkBundle

void __SWCoreFrameworkBundle_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.SharedWithYouCore"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)SWCoreFrameworkBundle_sBundle;
  SWCoreFrameworkBundle_sBundle = v0;

}

@end
