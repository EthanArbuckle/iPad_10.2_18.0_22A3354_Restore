@implementation SWFrameworkBundle

void __SWFrameworkBundle_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.SharedWithYou"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)SWFrameworkBundle_sBundle;
  SWFrameworkBundle_sBundle = v0;

}

@end
